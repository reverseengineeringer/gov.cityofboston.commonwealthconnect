package net.sqlcipher;

import android.content.ContentResolver;
import android.database.CharArrayBuffer;
import android.database.ContentObservable;
import android.database.ContentObserver;
import android.database.CrossProcessCursor;
import android.database.DataSetObservable;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

public abstract class AbstractCursor
  implements CrossProcessCursor, Cursor
{
  private static final String TAG = "Cursor";
  protected boolean mClosed = false;
  ContentObservable mContentObservable = new ContentObservable();
  protected ContentResolver mContentResolver;
  protected Long mCurrentRowID = null;
  DataSetObservable mDataSetObservable = new DataSetObservable();
  private Uri mNotifyUri;
  protected int mPos = -1;
  protected int mRowIdColumnIndex = -1;
  private ContentObserver mSelfObserver;
  private final Object mSelfObserverLock = new Object();
  private boolean mSelfObserverRegistered;
  protected HashMap<Long, Map<String, Object>> mUpdatedRows = new HashMap();
  
  public void abortUpdates()
  {
    synchronized (mUpdatedRows)
    {
      mUpdatedRows.clear();
      return;
    }
  }
  
  protected void checkPosition()
  {
    if ((-1 == mPos) || (getCount() == mPos)) {
      throw new CursorIndexOutOfBoundsException(mPos, getCount());
    }
  }
  
  public void close()
  {
    mClosed = true;
    mContentObservable.unregisterAll();
    deactivateInternal();
  }
  
  public boolean commitUpdates()
  {
    return commitUpdates(null);
  }
  
  public boolean commitUpdates(Map<? extends Long, ? extends Map<String, Object>> paramMap)
  {
    return false;
  }
  
  public void copyStringToBuffer(int paramInt, CharArrayBuffer paramCharArrayBuffer)
  {
    String str = getString(paramInt);
    if (str != null)
    {
      char[] arrayOfChar = data;
      if ((arrayOfChar == null) || (arrayOfChar.length < str.length())) {
        data = str.toCharArray();
      }
      for (;;)
      {
        sizeCopied = str.length();
        return;
        str.getChars(0, str.length(), arrayOfChar, 0);
      }
    }
    sizeCopied = 0;
  }
  
  public void deactivate()
  {
    deactivateInternal();
  }
  
  public void deactivateInternal()
  {
    if (mSelfObserver != null)
    {
      mContentResolver.unregisterContentObserver(mSelfObserver);
      mSelfObserverRegistered = false;
    }
    mDataSetObservable.notifyInvalidated();
  }
  
  public boolean deleteRow()
  {
    return false;
  }
  
  public void fillWindow(int paramInt, android.database.CursorWindow paramCursorWindow)
  {
    if ((paramInt < 0) || (paramInt >= getCount())) {
      return;
    }
    paramCursorWindow.acquireReference();
    int i;
    for (;;)
    {
      try
      {
        i = mPos;
        mPos = (paramInt - 1);
        paramCursorWindow.clear();
        paramCursorWindow.setStartPosition(paramInt);
        int j = getColumnCount();
        paramCursorWindow.setNumColumns(j);
        if ((!moveToNext()) || (!paramCursorWindow.allocRow())) {
          break;
        }
        paramInt = 0;
        if (paramInt >= j) {
          continue;
        }
        String str = getString(paramInt);
        if (str != null)
        {
          if (paramCursorWindow.putString(str, mPos, paramInt)) {
            break label141;
          }
          paramCursorWindow.freeLastRow();
        }
      }
      catch (IllegalStateException localIllegalStateException)
      {
        return;
        if (!paramCursorWindow.putNull(mPos, paramInt))
        {
          paramCursorWindow.freeLastRow();
          continue;
        }
      }
      finally
      {
        paramCursorWindow.releaseReference();
      }
      label141:
      paramInt += 1;
    }
    mPos = i;
    paramCursorWindow.releaseReference();
  }
  
  protected void finalize()
  {
    if ((mSelfObserver != null) && (mSelfObserverRegistered == true)) {
      mContentResolver.unregisterContentObserver(mSelfObserver);
    }
  }
  
  public byte[] getBlob(int paramInt)
  {
    throw new UnsupportedOperationException("getBlob is not supported");
  }
  
  public int getColumnCount()
  {
    return getColumnNames().length;
  }
  
  public int getColumnIndex(String paramString)
  {
    int i = paramString.lastIndexOf('.');
    Object localObject = paramString;
    if (i != -1)
    {
      localObject = new Exception();
      Log.e("Cursor", "requesting column name with table name -- " + paramString, (Throwable)localObject);
      localObject = paramString.substring(i + 1);
    }
    paramString = getColumnNames();
    int j = paramString.length;
    i = 0;
    while (i < j)
    {
      if (paramString[i].equalsIgnoreCase((String)localObject)) {
        return i;
      }
      i += 1;
    }
    return -1;
  }
  
  public int getColumnIndexOrThrow(String paramString)
  {
    int i = getColumnIndex(paramString);
    if (i < 0) {
      throw new IllegalArgumentException("column '" + paramString + "' does not exist");
    }
    return i;
  }
  
  public String getColumnName(int paramInt)
  {
    return getColumnNames()[paramInt];
  }
  
  public abstract String[] getColumnNames();
  
  public abstract int getCount();
  
  protected DataSetObservable getDataSetObservable()
  {
    return mDataSetObservable;
  }
  
  public abstract double getDouble(int paramInt);
  
  public Bundle getExtras()
  {
    return Bundle.EMPTY;
  }
  
  public abstract float getFloat(int paramInt);
  
  public abstract int getInt(int paramInt);
  
  public abstract long getLong(int paramInt);
  
  public Uri getNotificationUri()
  {
    return mNotifyUri;
  }
  
  public final int getPosition()
  {
    return mPos;
  }
  
  public abstract short getShort(int paramInt);
  
  public abstract String getString(int paramInt);
  
  public abstract int getType(int paramInt);
  
  protected Object getUpdatedField(int paramInt)
  {
    return ((Map)mUpdatedRows.get(mCurrentRowID)).get(getColumnNames()[paramInt]);
  }
  
  public boolean getWantsAllOnMoveCalls()
  {
    return false;
  }
  
  public CursorWindow getWindow()
  {
    return null;
  }
  
  public boolean hasUpdates()
  {
    for (;;)
    {
      synchronized (mUpdatedRows)
      {
        if (mUpdatedRows.size() > 0)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  public final boolean isAfterLast()
  {
    if (getCount() == 0) {}
    while (mPos == getCount()) {
      return true;
    }
    return false;
  }
  
  public final boolean isBeforeFirst()
  {
    if (getCount() == 0) {}
    while (mPos == -1) {
      return true;
    }
    return false;
  }
  
  public boolean isClosed()
  {
    return mClosed;
  }
  
  protected boolean isFieldUpdated(int paramInt)
  {
    if ((mRowIdColumnIndex != -1) && (mUpdatedRows.size() > 0))
    {
      Map localMap = (Map)mUpdatedRows.get(mCurrentRowID);
      if ((localMap != null) && (localMap.containsKey(getColumnNames()[paramInt]))) {
        return true;
      }
    }
    return false;
  }
  
  public final boolean isFirst()
  {
    return (mPos == 0) && (getCount() != 0);
  }
  
  public final boolean isLast()
  {
    int i = getCount();
    return (mPos == i - 1) && (i != 0);
  }
  
  public abstract boolean isNull(int paramInt);
  
  public final boolean move(int paramInt)
  {
    return moveToPosition(mPos + paramInt);
  }
  
  public final boolean moveToFirst()
  {
    return moveToPosition(0);
  }
  
  public final boolean moveToLast()
  {
    return moveToPosition(getCount() - 1);
  }
  
  public final boolean moveToNext()
  {
    return moveToPosition(mPos + 1);
  }
  
  public final boolean moveToPosition(int paramInt)
  {
    boolean bool1 = false;
    int i = getCount();
    if (paramInt >= i) {
      mPos = i;
    }
    boolean bool2;
    do
    {
      return bool1;
      if (paramInt < 0)
      {
        mPos = -1;
        return false;
      }
      if (paramInt == mPos) {
        return true;
      }
      bool2 = onMove(mPos, paramInt);
      if (!bool2)
      {
        mPos = -1;
        return bool2;
      }
      mPos = paramInt;
      bool1 = bool2;
    } while (mRowIdColumnIndex == -1);
    mCurrentRowID = Long.valueOf(getLong(mRowIdColumnIndex));
    return bool2;
  }
  
  public final boolean moveToPrevious()
  {
    return moveToPosition(mPos - 1);
  }
  
  protected void notifyDataSetChange()
  {
    mDataSetObservable.notifyChanged();
  }
  
  protected void onChange(boolean paramBoolean)
  {
    synchronized (mSelfObserverLock)
    {
      mContentObservable.dispatchChange(paramBoolean);
      if ((mNotifyUri != null) && (paramBoolean)) {
        mContentResolver.notifyChange(mNotifyUri, mSelfObserver);
      }
      return;
    }
  }
  
  public boolean onMove(int paramInt1, int paramInt2)
  {
    return true;
  }
  
  public void registerContentObserver(ContentObserver paramContentObserver)
  {
    mContentObservable.registerObserver(paramContentObserver);
  }
  
  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    mDataSetObservable.registerObserver(paramDataSetObserver);
  }
  
  public boolean requery()
  {
    if ((mSelfObserver != null) && (!mSelfObserverRegistered))
    {
      mContentResolver.registerContentObserver(mNotifyUri, true, mSelfObserver);
      mSelfObserverRegistered = true;
    }
    mDataSetObservable.notifyChanged();
    return true;
  }
  
  public Bundle respond(Bundle paramBundle)
  {
    return Bundle.EMPTY;
  }
  
  public void setNotificationUri(ContentResolver paramContentResolver, Uri paramUri)
  {
    synchronized (mSelfObserverLock)
    {
      mNotifyUri = paramUri;
      mContentResolver = paramContentResolver;
      if (mSelfObserver != null) {
        mContentResolver.unregisterContentObserver(mSelfObserver);
      }
      mSelfObserver = new SelfContentObserver(this);
      mContentResolver.registerContentObserver(mNotifyUri, true, mSelfObserver);
      mSelfObserverRegistered = true;
      return;
    }
  }
  
  public boolean supportsUpdates()
  {
    return mRowIdColumnIndex != -1;
  }
  
  public void unregisterContentObserver(ContentObserver paramContentObserver)
  {
    if (!mClosed) {
      mContentObservable.unregisterObserver(paramContentObserver);
    }
  }
  
  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    mDataSetObservable.unregisterObserver(paramDataSetObserver);
  }
  
  public boolean update(int paramInt, Object paramObject)
  {
    if (!supportsUpdates()) {
      return false;
    }
    Long localLong = new Long(getLong(mRowIdColumnIndex));
    if (localLong == null) {
      throw new IllegalStateException("null rowid. mRowIdColumnIndex = " + mRowIdColumnIndex);
    }
    synchronized (mUpdatedRows)
    {
      Map localMap = (Map)mUpdatedRows.get(localLong);
      Object localObject = localMap;
      if (localMap == null)
      {
        localObject = new HashMap();
        mUpdatedRows.put(localLong, localObject);
      }
      ((Map)localObject).put(getColumnNames()[paramInt], paramObject);
      return true;
    }
  }
  
  public boolean updateBlob(int paramInt, byte[] paramArrayOfByte)
  {
    return update(paramInt, paramArrayOfByte);
  }
  
  public boolean updateDouble(int paramInt, double paramDouble)
  {
    return update(paramInt, Double.valueOf(paramDouble));
  }
  
  public boolean updateFloat(int paramInt, float paramFloat)
  {
    return update(paramInt, Float.valueOf(paramFloat));
  }
  
  public boolean updateInt(int paramInt1, int paramInt2)
  {
    return update(paramInt1, Integer.valueOf(paramInt2));
  }
  
  public boolean updateLong(int paramInt, long paramLong)
  {
    return update(paramInt, Long.valueOf(paramLong));
  }
  
  public boolean updateShort(int paramInt, short paramShort)
  {
    return update(paramInt, Short.valueOf(paramShort));
  }
  
  public boolean updateString(int paramInt, String paramString)
  {
    return update(paramInt, paramString);
  }
  
  public boolean updateToNull(int paramInt)
  {
    return update(paramInt, null);
  }
  
  protected static class SelfContentObserver
    extends ContentObserver
  {
    WeakReference<AbstractCursor> mCursor;
    
    public SelfContentObserver(AbstractCursor paramAbstractCursor)
    {
      super();
      mCursor = new WeakReference(paramAbstractCursor);
    }
    
    public boolean deliverSelfNotifications()
    {
      return false;
    }
    
    public void onChange(boolean paramBoolean)
    {
      AbstractCursor localAbstractCursor = (AbstractCursor)mCursor.get();
      if (localAbstractCursor != null) {
        localAbstractCursor.onChange(false);
      }
    }
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.AbstractCursor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */