package com.actionbarsherlock.widget;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.DataSetObservable;
import android.os.Handler;
import android.text.TextUtils;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

class ActivityChooserModel
  extends DataSetObservable
{
  private static final String ATTRIBUTE_ACTIVITY = "activity";
  private static final String ATTRIBUTE_TIME = "time";
  private static final String ATTRIBUTE_WEIGHT = "weight";
  private static final boolean DEBUG = false;
  private static final int DEFAULT_ACTIVITY_INFLATION = 5;
  private static final float DEFAULT_HISTORICAL_RECORD_WEIGHT = 1.0F;
  public static final String DEFAULT_HISTORY_FILE_NAME = "activity_choser_model_history.xml";
  public static final int DEFAULT_HISTORY_MAX_LENGTH = 50;
  private static final String HISTORY_FILE_EXTENSION = ".xml";
  private static final int INVALID_INDEX = -1;
  private static final String LOG_TAG = ActivityChooserModel.class.getSimpleName();
  private static final Executor SERIAL_EXECUTOR = Executors.newSingleThreadExecutor();
  private static final String TAG_HISTORICAL_RECORD = "historical-record";
  private static final String TAG_HISTORICAL_RECORDS = "historical-records";
  private static final Map<String, ActivityChooserModel> sDataModelRegistry;
  private static final Object sRegistryLock = new Object();
  private final List<ActivityResolveInfo> mActivites = new ArrayList();
  private OnChooseActivityListener mActivityChoserModelPolicy;
  private ActivitySorter mActivitySorter = new DefaultSorter(null);
  private boolean mCanReadHistoricalData = true;
  private final Context mContext;
  private final Handler mHandler = new Handler();
  private final List<HistoricalRecord> mHistoricalRecords = new ArrayList();
  private boolean mHistoricalRecordsChanged = true;
  private final String mHistoryFileName;
  private int mHistoryMaxSize = 50;
  private final Object mInstanceLock = new Object();
  private Intent mIntent;
  private boolean mReadShareHistoryCalled = false;
  
  static
  {
    sDataModelRegistry = new HashMap();
  }
  
  private ActivityChooserModel(Context paramContext, String paramString)
  {
    mContext = paramContext.getApplicationContext();
    if ((!TextUtils.isEmpty(paramString)) && (!paramString.endsWith(".xml")))
    {
      mHistoryFileName = (paramString + ".xml");
      return;
    }
    mHistoryFileName = paramString;
  }
  
  private boolean addHisoricalRecord(HistoricalRecord paramHistoricalRecord)
  {
    synchronized (mInstanceLock)
    {
      boolean bool = mHistoricalRecords.add(paramHistoricalRecord);
      if (bool)
      {
        mHistoricalRecordsChanged = true;
        pruneExcessiveHistoricalRecordsLocked();
        persistHistoricalData();
        sortActivities();
      }
      return bool;
    }
  }
  
  public static ActivityChooserModel get(Context paramContext, String paramString)
  {
    synchronized (sRegistryLock)
    {
      ActivityChooserModel localActivityChooserModel2 = (ActivityChooserModel)sDataModelRegistry.get(paramString);
      ActivityChooserModel localActivityChooserModel1 = localActivityChooserModel2;
      if (localActivityChooserModel2 == null)
      {
        localActivityChooserModel1 = new ActivityChooserModel(paramContext, paramString);
        sDataModelRegistry.put(paramString, localActivityChooserModel1);
      }
      localActivityChooserModel1.readHistoricalData();
      return localActivityChooserModel1;
    }
  }
  
  private void loadActivitiesLocked()
  {
    mActivites.clear();
    if (mIntent != null)
    {
      List localList = mContext.getPackageManager().queryIntentActivities(mIntent, 0);
      int j = localList.size();
      int i = 0;
      while (i < j)
      {
        ResolveInfo localResolveInfo = (ResolveInfo)localList.get(i);
        mActivites.add(new ActivityResolveInfo(localResolveInfo));
        i += 1;
      }
      sortActivities();
      return;
    }
    notifyChanged();
  }
  
  private void persistHistoricalData()
  {
    synchronized (mInstanceLock)
    {
      if (!mReadShareHistoryCalled) {
        throw new IllegalStateException("No preceding call to #readHistoricalData");
      }
    }
    if (!mHistoricalRecordsChanged) {
      return;
    }
    mHistoricalRecordsChanged = false;
    mCanReadHistoricalData = true;
    if (!TextUtils.isEmpty(mHistoryFileName)) {
      SERIAL_EXECUTOR.execute(new HistoryPersister(null));
    }
  }
  
  private void pruneExcessiveHistoricalRecordsLocked()
  {
    List localList = mHistoricalRecords;
    int j = localList.size() - mHistoryMaxSize;
    if (j <= 0) {}
    for (;;)
    {
      return;
      mHistoricalRecordsChanged = true;
      int i = 0;
      while (i < j)
      {
        HistoricalRecord localHistoricalRecord = (HistoricalRecord)localList.remove(0);
        i += 1;
      }
    }
  }
  
  private void readHistoricalData()
  {
    synchronized (mInstanceLock)
    {
      if ((!mCanReadHistoricalData) || (!mHistoricalRecordsChanged)) {
        return;
      }
      mCanReadHistoricalData = false;
      mReadShareHistoryCalled = true;
      if (!TextUtils.isEmpty(mHistoryFileName)) {
        SERIAL_EXECUTOR.execute(new HistoryLoader(null));
      }
      return;
    }
  }
  
  private void sortActivities()
  {
    synchronized (mInstanceLock)
    {
      if ((mActivitySorter != null) && (!mActivites.isEmpty()))
      {
        mActivitySorter.sort(mIntent, mActivites, Collections.unmodifiableList(mHistoricalRecords));
        notifyChanged();
      }
      return;
    }
  }
  
  public Intent chooseActivity(int paramInt)
  {
    Object localObject = (ActivityResolveInfo)mActivites.get(paramInt);
    localObject = new ComponentName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);
    Intent localIntent1 = new Intent(mIntent);
    localIntent1.setComponent((ComponentName)localObject);
    if (mActivityChoserModelPolicy != null)
    {
      Intent localIntent2 = new Intent(localIntent1);
      if (mActivityChoserModelPolicy.onChooseActivity(this, localIntent2)) {
        return null;
      }
    }
    addHisoricalRecord(new HistoricalRecord((ComponentName)localObject, System.currentTimeMillis(), 1.0F));
    return localIntent1;
  }
  
  public ResolveInfo getActivity(int paramInt)
  {
    synchronized (mInstanceLock)
    {
      ResolveInfo localResolveInfo = mActivites.get(paramInt)).resolveInfo;
      return localResolveInfo;
    }
  }
  
  public int getActivityCount()
  {
    synchronized (mInstanceLock)
    {
      int i = mActivites.size();
      return i;
    }
  }
  
  public int getActivityIndex(ResolveInfo paramResolveInfo)
  {
    List localList = mActivites;
    int j = localList.size();
    int i = 0;
    while (i < j)
    {
      if (getresolveInfo == paramResolveInfo) {
        return i;
      }
      i += 1;
    }
    return -1;
  }
  
  public ResolveInfo getDefaultActivity()
  {
    synchronized (mInstanceLock)
    {
      if (!mActivites.isEmpty())
      {
        ResolveInfo localResolveInfo = mActivites.get(0)).resolveInfo;
        return localResolveInfo;
      }
      return null;
    }
  }
  
  public int getHistoryMaxSize()
  {
    synchronized (mInstanceLock)
    {
      int i = mHistoryMaxSize;
      return i;
    }
  }
  
  public int getHistorySize()
  {
    synchronized (mInstanceLock)
    {
      int i = mHistoricalRecords.size();
      return i;
    }
  }
  
  public Intent getIntent()
  {
    synchronized (mInstanceLock)
    {
      Intent localIntent = mIntent;
      return localIntent;
    }
  }
  
  public void setActivitySorter(ActivitySorter paramActivitySorter)
  {
    synchronized (mInstanceLock)
    {
      if (mActivitySorter == paramActivitySorter) {
        return;
      }
      mActivitySorter = paramActivitySorter;
      sortActivities();
      return;
    }
  }
  
  public void setDefaultActivity(int paramInt)
  {
    ActivityResolveInfo localActivityResolveInfo1 = (ActivityResolveInfo)mActivites.get(paramInt);
    ActivityResolveInfo localActivityResolveInfo2 = (ActivityResolveInfo)mActivites.get(0);
    if (localActivityResolveInfo2 != null) {}
    for (float f = weight - weight + 5.0F;; f = 1.0F)
    {
      addHisoricalRecord(new HistoricalRecord(new ComponentName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name), System.currentTimeMillis(), f));
      return;
    }
  }
  
  public void setHistoryMaxSize(int paramInt)
  {
    synchronized (mInstanceLock)
    {
      if (mHistoryMaxSize == paramInt) {
        return;
      }
      mHistoryMaxSize = paramInt;
      pruneExcessiveHistoricalRecordsLocked();
      sortActivities();
      return;
    }
  }
  
  public void setIntent(Intent paramIntent)
  {
    synchronized (mInstanceLock)
    {
      if (mIntent == paramIntent) {
        return;
      }
      mIntent = paramIntent;
      loadActivitiesLocked();
      return;
    }
  }
  
  public void setOnChooseActivityListener(OnChooseActivityListener paramOnChooseActivityListener)
  {
    mActivityChoserModelPolicy = paramOnChooseActivityListener;
  }
  
  public static abstract interface ActivityChooserModelClient
  {
    public abstract void setActivityChooserModel(ActivityChooserModel paramActivityChooserModel);
  }
  
  public final class ActivityResolveInfo
    implements Comparable<ActivityResolveInfo>
  {
    public final ResolveInfo resolveInfo;
    public float weight;
    
    public ActivityResolveInfo(ResolveInfo paramResolveInfo)
    {
      resolveInfo = paramResolveInfo;
    }
    
    public int compareTo(ActivityResolveInfo paramActivityResolveInfo)
    {
      return Float.floatToIntBits(weight) - Float.floatToIntBits(weight);
    }
    
    public boolean equals(Object paramObject)
    {
      if (this == paramObject) {}
      do
      {
        return true;
        if (paramObject == null) {
          return false;
        }
        if (getClass() != paramObject.getClass()) {
          return false;
        }
        paramObject = (ActivityResolveInfo)paramObject;
      } while (Float.floatToIntBits(weight) == Float.floatToIntBits(weight));
      return false;
    }
    
    public int hashCode()
    {
      return Float.floatToIntBits(weight) + 31;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("[");
      localStringBuilder.append("resolveInfo:").append(resolveInfo.toString());
      localStringBuilder.append("; weight:").append(new BigDecimal(weight));
      localStringBuilder.append("]");
      return localStringBuilder.toString();
    }
  }
  
  public static abstract interface ActivitySorter
  {
    public abstract void sort(Intent paramIntent, List<ActivityChooserModel.ActivityResolveInfo> paramList, List<ActivityChooserModel.HistoricalRecord> paramList1);
  }
  
  private final class DefaultSorter
    implements ActivityChooserModel.ActivitySorter
  {
    private static final float WEIGHT_DECAY_COEFFICIENT = 0.95F;
    private final Map<String, ActivityChooserModel.ActivityResolveInfo> mPackageNameToActivityMap = new HashMap();
    
    private DefaultSorter() {}
    
    public void sort(Intent paramIntent, List<ActivityChooserModel.ActivityResolveInfo> paramList, List<ActivityChooserModel.HistoricalRecord> paramList1)
    {
      paramIntent = mPackageNameToActivityMap;
      paramIntent.clear();
      int j = paramList.size();
      int i = 0;
      Object localObject;
      while (i < j)
      {
        localObject = (ActivityChooserModel.ActivityResolveInfo)paramList.get(i);
        weight = 0.0F;
        paramIntent.put(resolveInfo.activityInfo.packageName, localObject);
        i += 1;
      }
      i = paramList1.size();
      float f1 = 1.0F;
      i -= 1;
      while (i >= 0)
      {
        localObject = (ActivityChooserModel.HistoricalRecord)paramList1.get(i);
        ActivityChooserModel.ActivityResolveInfo localActivityResolveInfo = (ActivityChooserModel.ActivityResolveInfo)paramIntent.get(activity.getPackageName());
        float f2 = f1;
        if (localActivityResolveInfo != null)
        {
          weight += weight * f1;
          f2 = f1 * 0.95F;
        }
        i -= 1;
        f1 = f2;
      }
      Collections.sort(paramList);
    }
  }
  
  public static final class HistoricalRecord
  {
    public final ComponentName activity;
    public final long time;
    public final float weight;
    
    public HistoricalRecord(ComponentName paramComponentName, long paramLong, float paramFloat)
    {
      activity = paramComponentName;
      time = paramLong;
      weight = paramFloat;
    }
    
    public HistoricalRecord(String paramString, long paramLong, float paramFloat)
    {
      this(ComponentName.unflattenFromString(paramString), paramLong, paramFloat);
    }
    
    public boolean equals(Object paramObject)
    {
      if (this == paramObject) {}
      do
      {
        return true;
        if (paramObject == null) {
          return false;
        }
        if (getClass() != paramObject.getClass()) {
          return false;
        }
        paramObject = (HistoricalRecord)paramObject;
        if (activity == null)
        {
          if (activity != null) {
            return false;
          }
        }
        else if (!activity.equals(activity)) {
          return false;
        }
        if (time != time) {
          return false;
        }
      } while (Float.floatToIntBits(weight) == Float.floatToIntBits(weight));
      return false;
    }
    
    public int hashCode()
    {
      if (activity == null) {}
      for (int i = 0;; i = activity.hashCode()) {
        return ((i + 31) * 31 + (int)(time ^ time >>> 32)) * 31 + Float.floatToIntBits(weight);
      }
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("[");
      localStringBuilder.append("; activity:").append(activity);
      localStringBuilder.append("; time:").append(time);
      localStringBuilder.append("; weight:").append(new BigDecimal(weight));
      localStringBuilder.append("]");
      return localStringBuilder.toString();
    }
  }
  
  private final class HistoryLoader
    implements Runnable
  {
    private HistoryLoader() {}
    
    /* Error */
    public void run()
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   4: invokestatic 35	com/actionbarsherlock/widget/ActivityChooserModel:access$400	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/content/Context;
      //   7: aload_0
      //   8: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   11: invokestatic 39	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
      //   14: invokevirtual 45	android/content/Context:openFileInput	(Ljava/lang/String;)Ljava/io/FileInputStream;
      //   17: astore_2
      //   18: invokestatic 51	android/util/Xml:newPullParser	()Lorg/xmlpull/v1/XmlPullParser;
      //   21: astore_3
      //   22: aload_3
      //   23: aload_2
      //   24: aconst_null
      //   25: invokeinterface 57 3 0
      //   30: iconst_0
      //   31: istore_1
      //   32: iload_1
      //   33: iconst_1
      //   34: if_icmpeq +18 -> 52
      //   37: iload_1
      //   38: iconst_2
      //   39: if_icmpeq +13 -> 52
      //   42: aload_3
      //   43: invokeinterface 61 1 0
      //   48: istore_1
      //   49: goto -17 -> 32
      //   52: ldc 63
      //   54: aload_3
      //   55: invokeinterface 67 1 0
      //   60: invokevirtual 73	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   63: ifne +58 -> 121
      //   66: new 29	org/xmlpull/v1/XmlPullParserException
      //   69: dup
      //   70: ldc 75
      //   72: invokespecial 78	org/xmlpull/v1/XmlPullParserException:<init>	(Ljava/lang/String;)V
      //   75: athrow
      //   76: astore_3
      //   77: invokestatic 81	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
      //   80: new 83	java/lang/StringBuilder
      //   83: dup
      //   84: invokespecial 84	java/lang/StringBuilder:<init>	()V
      //   87: ldc 86
      //   89: invokevirtual 90	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   92: aload_0
      //   93: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   96: invokestatic 39	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
      //   99: invokevirtual 90	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   102: invokevirtual 93	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   105: aload_3
      //   106: invokestatic 99	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   109: pop
      //   110: aload_2
      //   111: ifnull +342 -> 453
      //   114: aload_2
      //   115: invokevirtual 104	java/io/FileInputStream:close	()V
      //   118: return
      //   119: astore_2
      //   120: return
      //   121: new 106	java/util/ArrayList
      //   124: dup
      //   125: invokespecial 107	java/util/ArrayList:<init>	()V
      //   128: astore 4
      //   130: aload_3
      //   131: invokeinterface 61 1 0
      //   136: istore_1
      //   137: iload_1
      //   138: iconst_1
      //   139: if_icmpne +73 -> 212
      //   142: aload_0
      //   143: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   146: invokestatic 111	com/actionbarsherlock/widget/ActivityChooserModel:access$500	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/Object;
      //   149: astore_3
      //   150: aload_3
      //   151: monitorenter
      //   152: new 113	java/util/LinkedHashSet
      //   155: dup
      //   156: aload 4
      //   158: invokespecial 116	java/util/LinkedHashSet:<init>	(Ljava/util/Collection;)V
      //   161: astore 4
      //   163: aload_0
      //   164: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   167: invokestatic 120	com/actionbarsherlock/widget/ActivityChooserModel:access$600	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/util/List;
      //   170: astore 5
      //   172: aload 5
      //   174: invokeinterface 125 1 0
      //   179: iconst_1
      //   180: isub
      //   181: istore_1
      //   182: iload_1
      //   183: iflt +170 -> 353
      //   186: aload 4
      //   188: aload 5
      //   190: iload_1
      //   191: invokeinterface 129 2 0
      //   196: checkcast 131	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord
      //   199: invokeinterface 136 2 0
      //   204: pop
      //   205: iload_1
      //   206: iconst_1
      //   207: isub
      //   208: istore_1
      //   209: goto -27 -> 182
      //   212: iload_1
      //   213: iconst_3
      //   214: if_icmpeq -84 -> 130
      //   217: iload_1
      //   218: iconst_4
      //   219: if_icmpeq -89 -> 130
      //   222: ldc -118
      //   224: aload_3
      //   225: invokeinterface 67 1 0
      //   230: invokevirtual 73	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   233: ifne +58 -> 291
      //   236: new 29	org/xmlpull/v1/XmlPullParserException
      //   239: dup
      //   240: ldc -116
      //   242: invokespecial 78	org/xmlpull/v1/XmlPullParserException:<init>	(Ljava/lang/String;)V
      //   245: athrow
      //   246: astore_3
      //   247: invokestatic 81	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
      //   250: new 83	java/lang/StringBuilder
      //   253: dup
      //   254: invokespecial 84	java/lang/StringBuilder:<init>	()V
      //   257: ldc 86
      //   259: invokevirtual 90	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   262: aload_0
      //   263: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   266: invokestatic 39	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
      //   269: invokevirtual 90	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   272: invokevirtual 93	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   275: aload_3
      //   276: invokestatic 99	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   279: pop
      //   280: aload_2
      //   281: ifnull +172 -> 453
      //   284: aload_2
      //   285: invokevirtual 104	java/io/FileInputStream:close	()V
      //   288: return
      //   289: astore_2
      //   290: return
      //   291: aload 4
      //   293: new 131	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord
      //   296: dup
      //   297: aload_3
      //   298: aconst_null
      //   299: ldc -114
      //   301: invokeinterface 146 3 0
      //   306: aload_3
      //   307: aconst_null
      //   308: ldc -108
      //   310: invokeinterface 146 3 0
      //   315: invokestatic 154	java/lang/Long:parseLong	(Ljava/lang/String;)J
      //   318: aload_3
      //   319: aconst_null
      //   320: ldc -100
      //   322: invokeinterface 146 3 0
      //   327: invokestatic 162	java/lang/Float:parseFloat	(Ljava/lang/String;)F
      //   330: invokespecial 165	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord:<init>	(Ljava/lang/String;JF)V
      //   333: invokeinterface 166 2 0
      //   338: pop
      //   339: goto -209 -> 130
      //   342: astore_3
      //   343: aload_2
      //   344: ifnull +7 -> 351
      //   347: aload_2
      //   348: invokevirtual 104	java/io/FileInputStream:close	()V
      //   351: aload_3
      //   352: athrow
      //   353: aload 5
      //   355: invokeinterface 125 1 0
      //   360: aload 4
      //   362: invokeinterface 167 1 0
      //   367: if_icmpne +16 -> 383
      //   370: aload_3
      //   371: monitorexit
      //   372: aload_2
      //   373: ifnull +80 -> 453
      //   376: aload_2
      //   377: invokevirtual 104	java/io/FileInputStream:close	()V
      //   380: return
      //   381: astore_2
      //   382: return
      //   383: aload 5
      //   385: invokeinterface 170 1 0
      //   390: aload 5
      //   392: aload 4
      //   394: invokeinterface 174 2 0
      //   399: pop
      //   400: aload_0
      //   401: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   404: iconst_1
      //   405: invokestatic 178	com/actionbarsherlock/widget/ActivityChooserModel:access$702	(Lcom/actionbarsherlock/widget/ActivityChooserModel;Z)Z
      //   408: pop
      //   409: aload_0
      //   410: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   413: invokestatic 182	com/actionbarsherlock/widget/ActivityChooserModel:access$1000	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/os/Handler;
      //   416: new 11	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader$1
      //   419: dup
      //   420: aload_0
      //   421: invokespecial 185	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader$1:<init>	(Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;)V
      //   424: invokevirtual 191	android/os/Handler:post	(Ljava/lang/Runnable;)Z
      //   427: pop
      //   428: aload_3
      //   429: monitorexit
      //   430: aload_2
      //   431: ifnull +22 -> 453
      //   434: aload_2
      //   435: invokevirtual 104	java/io/FileInputStream:close	()V
      //   438: return
      //   439: astore_2
      //   440: return
      //   441: astore 4
      //   443: aload_3
      //   444: monitorexit
      //   445: aload 4
      //   447: athrow
      //   448: astore_2
      //   449: goto -98 -> 351
      //   452: astore_2
      //   453: return
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	454	0	this	HistoryLoader
      //   31	189	1	i	int
      //   17	98	2	localFileInputStream	java.io.FileInputStream
      //   119	166	2	localIOException1	java.io.IOException
      //   289	88	2	localIOException2	java.io.IOException
      //   381	54	2	localIOException3	java.io.IOException
      //   439	1	2	localIOException4	java.io.IOException
      //   448	1	2	localIOException5	java.io.IOException
      //   452	1	2	localFileNotFoundException	java.io.FileNotFoundException
      //   21	34	3	localXmlPullParser	org.xmlpull.v1.XmlPullParser
      //   76	55	3	localXmlPullParserException	org.xmlpull.v1.XmlPullParserException
      //   246	73	3	localIOException6	java.io.IOException
      //   342	102	3	localObject2	Object
      //   128	265	4	localObject3	Object
      //   441	5	4	localObject4	Object
      //   170	221	5	localList	List
      // Exception table:
      //   from	to	target	type
      //   18	30	76	org/xmlpull/v1/XmlPullParserException
      //   42	49	76	org/xmlpull/v1/XmlPullParserException
      //   52	76	76	org/xmlpull/v1/XmlPullParserException
      //   121	130	76	org/xmlpull/v1/XmlPullParserException
      //   130	137	76	org/xmlpull/v1/XmlPullParserException
      //   142	152	76	org/xmlpull/v1/XmlPullParserException
      //   222	246	76	org/xmlpull/v1/XmlPullParserException
      //   291	339	76	org/xmlpull/v1/XmlPullParserException
      //   445	448	76	org/xmlpull/v1/XmlPullParserException
      //   114	118	119	java/io/IOException
      //   18	30	246	java/io/IOException
      //   42	49	246	java/io/IOException
      //   52	76	246	java/io/IOException
      //   121	130	246	java/io/IOException
      //   130	137	246	java/io/IOException
      //   142	152	246	java/io/IOException
      //   222	246	246	java/io/IOException
      //   291	339	246	java/io/IOException
      //   445	448	246	java/io/IOException
      //   284	288	289	java/io/IOException
      //   18	30	342	finally
      //   42	49	342	finally
      //   52	76	342	finally
      //   77	110	342	finally
      //   121	130	342	finally
      //   130	137	342	finally
      //   142	152	342	finally
      //   222	246	342	finally
      //   247	280	342	finally
      //   291	339	342	finally
      //   445	448	342	finally
      //   376	380	381	java/io/IOException
      //   434	438	439	java/io/IOException
      //   152	182	441	finally
      //   186	205	441	finally
      //   353	372	441	finally
      //   383	430	441	finally
      //   443	445	441	finally
      //   347	351	448	java/io/IOException
      //   0	18	452	java/io/FileNotFoundException
    }
  }
  
  private final class HistoryPersister
    implements Runnable
  {
    private HistoryPersister() {}
    
    /* Error */
    public void run()
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   4: invokestatic 35	com/actionbarsherlock/widget/ActivityChooserModel:access$500	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/Object;
      //   7: astore 4
      //   9: aload 4
      //   11: monitorenter
      //   12: new 37	java/util/ArrayList
      //   15: dup
      //   16: aload_0
      //   17: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   20: invokestatic 41	com/actionbarsherlock/widget/ActivityChooserModel:access$600	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/util/List;
      //   23: invokespecial 44	java/util/ArrayList:<init>	(Ljava/util/Collection;)V
      //   26: astore 5
      //   28: aload 4
      //   30: monitorexit
      //   31: aload_0
      //   32: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   35: invokestatic 48	com/actionbarsherlock/widget/ActivityChooserModel:access$400	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/content/Context;
      //   38: aload_0
      //   39: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   42: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
      //   45: iconst_0
      //   46: invokevirtual 58	android/content/Context:openFileOutput	(Ljava/lang/String;I)Ljava/io/FileOutputStream;
      //   49: astore_3
      //   50: invokestatic 64	android/util/Xml:newSerializer	()Lorg/xmlpull/v1/XmlSerializer;
      //   53: astore 4
      //   55: aload 4
      //   57: aload_3
      //   58: aconst_null
      //   59: invokeinterface 70 3 0
      //   64: aload 4
      //   66: ldc 72
      //   68: iconst_1
      //   69: invokestatic 78	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   72: invokeinterface 82 3 0
      //   77: aload 4
      //   79: aconst_null
      //   80: ldc 84
      //   82: invokeinterface 88 3 0
      //   87: pop
      //   88: aload 5
      //   90: invokeinterface 94 1 0
      //   95: istore_2
      //   96: iconst_0
      //   97: istore_1
      //   98: iload_1
      //   99: iload_2
      //   100: if_icmpge +143 -> 243
      //   103: aload 5
      //   105: iconst_0
      //   106: invokeinterface 98 2 0
      //   111: checkcast 100	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord
      //   114: astore 6
      //   116: aload 4
      //   118: aconst_null
      //   119: ldc 102
      //   121: invokeinterface 88 3 0
      //   126: pop
      //   127: aload 4
      //   129: aconst_null
      //   130: ldc 104
      //   132: aload 6
      //   134: getfield 107	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord:activity	Landroid/content/ComponentName;
      //   137: invokevirtual 113	android/content/ComponentName:flattenToString	()Ljava/lang/String;
      //   140: invokeinterface 117 4 0
      //   145: pop
      //   146: aload 4
      //   148: aconst_null
      //   149: ldc 119
      //   151: aload 6
      //   153: getfield 122	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord:time	J
      //   156: invokestatic 127	java/lang/String:valueOf	(J)Ljava/lang/String;
      //   159: invokeinterface 117 4 0
      //   164: pop
      //   165: aload 4
      //   167: aconst_null
      //   168: ldc -127
      //   170: aload 6
      //   172: getfield 132	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord:weight	F
      //   175: invokestatic 135	java/lang/String:valueOf	(F)Ljava/lang/String;
      //   178: invokeinterface 117 4 0
      //   183: pop
      //   184: aload 4
      //   186: aconst_null
      //   187: ldc 102
      //   189: invokeinterface 138 3 0
      //   194: pop
      //   195: iload_1
      //   196: iconst_1
      //   197: iadd
      //   198: istore_1
      //   199: goto -101 -> 98
      //   202: astore_3
      //   203: aload 4
      //   205: monitorexit
      //   206: aload_3
      //   207: athrow
      //   208: astore_3
      //   209: invokestatic 141	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
      //   212: new 143	java/lang/StringBuilder
      //   215: dup
      //   216: invokespecial 144	java/lang/StringBuilder:<init>	()V
      //   219: ldc -110
      //   221: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   224: aload_0
      //   225: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   228: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
      //   231: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   234: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   237: aload_3
      //   238: invokestatic 159	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   241: pop
      //   242: return
      //   243: aload 4
      //   245: aconst_null
      //   246: ldc 84
      //   248: invokeinterface 138 3 0
      //   253: pop
      //   254: aload 4
      //   256: invokeinterface 162 1 0
      //   261: aload_3
      //   262: ifnull -20 -> 242
      //   265: aload_3
      //   266: invokevirtual 167	java/io/FileOutputStream:close	()V
      //   269: return
      //   270: astore_3
      //   271: return
      //   272: astore 4
      //   274: invokestatic 141	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
      //   277: new 143	java/lang/StringBuilder
      //   280: dup
      //   281: invokespecial 144	java/lang/StringBuilder:<init>	()V
      //   284: ldc -110
      //   286: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   289: aload_0
      //   290: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   293: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
      //   296: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   299: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   302: aload 4
      //   304: invokestatic 159	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   307: pop
      //   308: aload_3
      //   309: ifnull -67 -> 242
      //   312: aload_3
      //   313: invokevirtual 167	java/io/FileOutputStream:close	()V
      //   316: return
      //   317: astore_3
      //   318: return
      //   319: astore 4
      //   321: invokestatic 141	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
      //   324: new 143	java/lang/StringBuilder
      //   327: dup
      //   328: invokespecial 144	java/lang/StringBuilder:<init>	()V
      //   331: ldc -110
      //   333: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   336: aload_0
      //   337: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   340: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
      //   343: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   346: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   349: aload 4
      //   351: invokestatic 159	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   354: pop
      //   355: aload_3
      //   356: ifnull -114 -> 242
      //   359: aload_3
      //   360: invokevirtual 167	java/io/FileOutputStream:close	()V
      //   363: return
      //   364: astore_3
      //   365: return
      //   366: astore 4
      //   368: invokestatic 141	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
      //   371: new 143	java/lang/StringBuilder
      //   374: dup
      //   375: invokespecial 144	java/lang/StringBuilder:<init>	()V
      //   378: ldc -110
      //   380: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   383: aload_0
      //   384: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
      //   387: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
      //   390: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   393: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   396: aload 4
      //   398: invokestatic 159	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   401: pop
      //   402: aload_3
      //   403: ifnull -161 -> 242
      //   406: aload_3
      //   407: invokevirtual 167	java/io/FileOutputStream:close	()V
      //   410: return
      //   411: astore_3
      //   412: return
      //   413: astore 4
      //   415: aload_3
      //   416: ifnull +7 -> 423
      //   419: aload_3
      //   420: invokevirtual 167	java/io/FileOutputStream:close	()V
      //   423: aload 4
      //   425: athrow
      //   426: astore_3
      //   427: goto -4 -> 423
      //   430: astore_3
      //   431: goto -228 -> 203
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	434	0	this	HistoryPersister
      //   97	102	1	i	int
      //   95	6	2	j	int
      //   49	9	3	localFileOutputStream	java.io.FileOutputStream
      //   202	5	3	localObject1	Object
      //   208	58	3	localFileNotFoundException	java.io.FileNotFoundException
      //   270	43	3	localIOException1	java.io.IOException
      //   317	43	3	localIOException2	java.io.IOException
      //   364	43	3	localIOException3	java.io.IOException
      //   411	9	3	localIOException4	java.io.IOException
      //   426	1	3	localIOException5	java.io.IOException
      //   430	1	3	localObject2	Object
      //   7	248	4	localObject3	Object
      //   272	31	4	localIllegalArgumentException	IllegalArgumentException
      //   319	31	4	localIllegalStateException	IllegalStateException
      //   366	31	4	localIOException6	java.io.IOException
      //   413	11	4	localObject4	Object
      //   26	78	5	localArrayList	ArrayList
      //   114	57	6	localHistoricalRecord	ActivityChooserModel.HistoricalRecord
      // Exception table:
      //   from	to	target	type
      //   12	28	202	finally
      //   203	206	202	finally
      //   31	50	208	java/io/FileNotFoundException
      //   265	269	270	java/io/IOException
      //   55	96	272	java/lang/IllegalArgumentException
      //   103	195	272	java/lang/IllegalArgumentException
      //   243	261	272	java/lang/IllegalArgumentException
      //   312	316	317	java/io/IOException
      //   55	96	319	java/lang/IllegalStateException
      //   103	195	319	java/lang/IllegalStateException
      //   243	261	319	java/lang/IllegalStateException
      //   359	363	364	java/io/IOException
      //   55	96	366	java/io/IOException
      //   103	195	366	java/io/IOException
      //   243	261	366	java/io/IOException
      //   406	410	411	java/io/IOException
      //   55	96	413	finally
      //   103	195	413	finally
      //   243	261	413	finally
      //   274	308	413	finally
      //   321	355	413	finally
      //   368	402	413	finally
      //   419	423	426	java/io/IOException
      //   28	31	430	finally
    }
  }
  
  public static abstract interface OnChooseActivityListener
  {
    public abstract boolean onChooseActivity(ActivityChooserModel paramActivityChooserModel, Intent paramIntent);
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.widget.ActivityChooserModel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */