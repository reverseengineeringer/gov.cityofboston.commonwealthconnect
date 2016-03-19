package com.actionbarsherlock.widget;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;
import com.actionbarsherlock.R.dimen;
import com.actionbarsherlock.R.id;
import com.actionbarsherlock.R.layout;
import com.actionbarsherlock.R.string;
import com.actionbarsherlock.R.styleable;
import com.actionbarsherlock.internal.widget.IcsLinearLayout;
import com.actionbarsherlock.internal.widget.IcsListPopupWindow;
import com.actionbarsherlock.view.ActionProvider;

class ActivityChooserView
  extends ViewGroup
  implements ActivityChooserModel.ActivityChooserModelClient
{
  private static final boolean IS_HONEYCOMB;
  private final IcsLinearLayout mActivityChooserContent;
  private final Drawable mActivityChooserContentBackground;
  private final ActivityChooserViewAdapter mAdapter;
  private final Callbacks mCallbacks;
  private final Context mContext;
  private int mDefaultActionButtonContentDescription;
  private final FrameLayout mDefaultActivityButton;
  private final ImageView mDefaultActivityButtonImage;
  private final FrameLayout mExpandActivityOverflowButton;
  private final ImageView mExpandActivityOverflowButtonImage;
  private int mInitialActivityCount = 4;
  private boolean mIsAttachedToWindow;
  private boolean mIsSelectingDefaultActivity;
  private final int mListPopupMaxWidth;
  private IcsListPopupWindow mListPopupWindow;
  private final DataSetObserver mModelDataSetOberver = new DataSetObserver()
  {
    public void onChanged()
    {
      super.onChanged();
      mAdapter.notifyDataSetChanged();
    }
    
    public void onInvalidated()
    {
      super.onInvalidated();
      mAdapter.notifyDataSetInvalidated();
    }
  };
  private PopupWindow.OnDismissListener mOnDismissListener;
  private final ViewTreeObserver.OnGlobalLayoutListener mOnGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener()
  {
    public void onGlobalLayout()
    {
      if (isShowingPopup())
      {
        if (isShown()) {
          break label31;
        }
        ActivityChooserView.this.getListPopupWindow().dismiss();
      }
      label31:
      do
      {
        return;
        ActivityChooserView.this.getListPopupWindow().show();
      } while (mProvider == null);
      mProvider.subUiVisibilityChanged(true);
    }
  };
  ActionProvider mProvider;
  
  static
  {
    if (Build.VERSION.SDK_INT >= 11) {}
    for (boolean bool = true;; bool = false)
    {
      IS_HONEYCOMB = bool;
      return;
    }
  }
  
  public ActivityChooserView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActivityChooserView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public ActivityChooserView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    mContext = paramContext;
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.SherlockActivityChooserView, paramInt, 0);
    mInitialActivityCount = paramAttributeSet.getInt(R.styleable.SherlockActivityChooserView_initialActivityCount, 4);
    Drawable localDrawable = paramAttributeSet.getDrawable(R.styleable.SherlockActivityChooserView_expandActivityOverflowButtonDrawable);
    paramAttributeSet.recycle();
    LayoutInflater.from(mContext).inflate(R.layout.abs__activity_chooser_view, this, true);
    mCallbacks = new Callbacks(null);
    mActivityChooserContent = ((IcsLinearLayout)findViewById(R.id.abs__activity_chooser_view_content));
    mActivityChooserContentBackground = mActivityChooserContent.getBackground();
    mDefaultActivityButton = ((FrameLayout)findViewById(R.id.abs__default_activity_button));
    mDefaultActivityButton.setOnClickListener(mCallbacks);
    mDefaultActivityButton.setOnLongClickListener(mCallbacks);
    mDefaultActivityButtonImage = ((ImageView)mDefaultActivityButton.findViewById(R.id.abs__image));
    mExpandActivityOverflowButton = ((FrameLayout)findViewById(R.id.abs__expand_activities_button));
    mExpandActivityOverflowButton.setOnClickListener(mCallbacks);
    mExpandActivityOverflowButtonImage = ((ImageView)mExpandActivityOverflowButton.findViewById(R.id.abs__image));
    mExpandActivityOverflowButtonImage.setImageDrawable(localDrawable);
    mAdapter = new ActivityChooserViewAdapter(null);
    mAdapter.registerDataSetObserver(new DataSetObserver()
    {
      public void onChanged()
      {
        super.onChanged();
        ActivityChooserView.this.updateAppearance();
      }
    });
    paramContext = paramContext.getResources();
    mListPopupMaxWidth = Math.max(getDisplayMetricswidthPixels / 2, paramContext.getDimensionPixelSize(R.dimen.abs__config_prefDialogWidth));
  }
  
  private IcsListPopupWindow getListPopupWindow()
  {
    if (mListPopupWindow == null)
    {
      mListPopupWindow = new IcsListPopupWindow(getContext());
      mListPopupWindow.setAdapter(mAdapter);
      mListPopupWindow.setAnchorView(this);
      mListPopupWindow.setModal(true);
      mListPopupWindow.setOnItemClickListener(mCallbacks);
      mListPopupWindow.setOnDismissListener(mCallbacks);
    }
    return mListPopupWindow;
  }
  
  private void showPopupUnchecked(int paramInt)
  {
    if (mAdapter.getDataModel() == null) {
      throw new IllegalStateException("No data model. Did you call #setDataModel?");
    }
    getViewTreeObserver().addOnGlobalLayoutListener(mOnGlobalLayoutListener);
    boolean bool;
    int i;
    label60:
    label92:
    IcsListPopupWindow localIcsListPopupWindow;
    if (mDefaultActivityButton.getVisibility() == 0)
    {
      bool = true;
      int j = mAdapter.getActivityCount();
      if (!bool) {
        break label192;
      }
      i = 1;
      if ((paramInt == Integer.MAX_VALUE) || (j <= paramInt + i)) {
        break label197;
      }
      mAdapter.setShowFooterView(true);
      mAdapter.setMaxActivityCount(paramInt - 1);
      localIcsListPopupWindow = getListPopupWindow();
      if (!localIcsListPopupWindow.isShowing())
      {
        if ((!mIsSelectingDefaultActivity) && (bool)) {
          break label216;
        }
        mAdapter.setShowDefaultActivity(true, bool);
      }
    }
    for (;;)
    {
      localIcsListPopupWindow.setContentWidth(Math.min(mAdapter.measureContentWidth(), mListPopupMaxWidth));
      localIcsListPopupWindow.show();
      if (mProvider != null) {
        mProvider.subUiVisibilityChanged(true);
      }
      localIcsListPopupWindow.getListView().setContentDescription(mContext.getString(R.string.abs__activitychooserview_choose_application));
      return;
      bool = false;
      break;
      label192:
      i = 0;
      break label60;
      label197:
      mAdapter.setShowFooterView(false);
      mAdapter.setMaxActivityCount(paramInt);
      break label92;
      label216:
      mAdapter.setShowDefaultActivity(false, false);
    }
  }
  
  private void updateAppearance()
  {
    if (mAdapter.getCount() > 0)
    {
      mExpandActivityOverflowButton.setEnabled(true);
      int i = mAdapter.getActivityCount();
      int j = mAdapter.getHistorySize();
      if ((i <= 0) || (j <= 0)) {
        break label164;
      }
      mDefaultActivityButton.setVisibility(0);
      Object localObject = mAdapter.getDefaultActivity();
      PackageManager localPackageManager = mContext.getPackageManager();
      mDefaultActivityButtonImage.setImageDrawable(((ResolveInfo)localObject).loadIcon(localPackageManager));
      if (mDefaultActionButtonContentDescription != 0)
      {
        localObject = ((ResolveInfo)localObject).loadLabel(localPackageManager);
        localObject = mContext.getString(mDefaultActionButtonContentDescription, new Object[] { localObject });
        mDefaultActivityButton.setContentDescription((CharSequence)localObject);
      }
      mAdapter.setShowDefaultActivity(false, false);
    }
    for (;;)
    {
      if (mDefaultActivityButton.getVisibility() != 0) {
        break label176;
      }
      mActivityChooserContent.setBackgroundDrawable(mActivityChooserContentBackground);
      return;
      mExpandActivityOverflowButton.setEnabled(false);
      break;
      label164:
      mDefaultActivityButton.setVisibility(8);
    }
    label176:
    mActivityChooserContent.setBackgroundDrawable(null);
    mActivityChooserContent.setPadding(0, 0, 0, 0);
  }
  
  public boolean dismissPopup()
  {
    if (isShowingPopup())
    {
      getListPopupWindow().dismiss();
      ViewTreeObserver localViewTreeObserver = getViewTreeObserver();
      if (localViewTreeObserver.isAlive()) {
        localViewTreeObserver.removeGlobalOnLayoutListener(mOnGlobalLayoutListener);
      }
    }
    return true;
  }
  
  public ActivityChooserModel getDataModel()
  {
    return mAdapter.getDataModel();
  }
  
  public boolean isShowingPopup()
  {
    return getListPopupWindow().isShowing();
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    ActivityChooserModel localActivityChooserModel = mAdapter.getDataModel();
    if (localActivityChooserModel != null) {}
    try
    {
      localActivityChooserModel.registerObserver(mModelDataSetOberver);
      mIsAttachedToWindow = true;
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      for (;;) {}
    }
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    Object localObject = mAdapter.getDataModel();
    if (localObject != null) {}
    try
    {
      ((ActivityChooserModel)localObject).unregisterObserver(mModelDataSetOberver);
      localObject = getViewTreeObserver();
      if (((ViewTreeObserver)localObject).isAlive()) {
        ((ViewTreeObserver)localObject).removeGlobalOnLayoutListener(mOnGlobalLayoutListener);
      }
      mIsAttachedToWindow = false;
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      for (;;) {}
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mActivityChooserContent.layout(0, 0, paramInt3 - paramInt1, paramInt4 - paramInt2);
    if (getListPopupWindow().isShowing())
    {
      showPopupUnchecked(mAdapter.getMaxActivityCount());
      return;
    }
    dismissPopup();
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    IcsLinearLayout localIcsLinearLayout = mActivityChooserContent;
    int i = paramInt2;
    if (mDefaultActivityButton.getVisibility() != 0) {
      i = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(paramInt2), 1073741824);
    }
    measureChild(localIcsLinearLayout, paramInt1, i);
    setMeasuredDimension(localIcsLinearLayout.getMeasuredWidth(), localIcsLinearLayout.getMeasuredHeight());
  }
  
  public void setActivityChooserModel(ActivityChooserModel paramActivityChooserModel)
  {
    mAdapter.setDataModel(paramActivityChooserModel);
    if (isShowingPopup())
    {
      dismissPopup();
      showPopup();
    }
  }
  
  public void setDefaultActionButtonContentDescription(int paramInt)
  {
    mDefaultActionButtonContentDescription = paramInt;
  }
  
  public void setExpandActivityOverflowButtonContentDescription(int paramInt)
  {
    String str = mContext.getString(paramInt);
    mExpandActivityOverflowButtonImage.setContentDescription(str);
  }
  
  public void setExpandActivityOverflowButtonDrawable(Drawable paramDrawable)
  {
    mExpandActivityOverflowButtonImage.setImageDrawable(paramDrawable);
  }
  
  public void setInitialActivityCount(int paramInt)
  {
    mInitialActivityCount = paramInt;
  }
  
  public void setOnDismissListener(PopupWindow.OnDismissListener paramOnDismissListener)
  {
    mOnDismissListener = paramOnDismissListener;
  }
  
  public void setProvider(ActionProvider paramActionProvider)
  {
    mProvider = paramActionProvider;
  }
  
  public boolean showPopup()
  {
    if ((isShowingPopup()) || (!mIsAttachedToWindow)) {
      return false;
    }
    mIsSelectingDefaultActivity = false;
    showPopupUnchecked(mInitialActivityCount);
    return true;
  }
  
  private class ActivityChooserViewAdapter
    extends BaseAdapter
  {
    private static final int ITEM_VIEW_TYPE_ACTIVITY = 0;
    private static final int ITEM_VIEW_TYPE_COUNT = 3;
    private static final int ITEM_VIEW_TYPE_FOOTER = 1;
    public static final int MAX_ACTIVITY_COUNT_DEFAULT = 4;
    public static final int MAX_ACTIVITY_COUNT_UNLIMITED = Integer.MAX_VALUE;
    private ActivityChooserModel mDataModel;
    private boolean mHighlightDefaultActivity;
    private int mMaxActivityCount = 4;
    private boolean mShowDefaultActivity = true;
    private boolean mShowFooterView;
    
    private ActivityChooserViewAdapter() {}
    
    public int getActivityCount()
    {
      return mDataModel.getActivityCount();
    }
    
    public int getCount()
    {
      int j = mDataModel.getActivityCount();
      int i = j;
      if (!mShowDefaultActivity)
      {
        i = j;
        if (mDataModel.getDefaultActivity() != null) {
          i = j - 1;
        }
      }
      j = Math.min(i, mMaxActivityCount);
      i = j;
      if (mShowFooterView) {
        i = j + 1;
      }
      return i;
    }
    
    public ActivityChooserModel getDataModel()
    {
      return mDataModel;
    }
    
    public ResolveInfo getDefaultActivity()
    {
      return mDataModel.getDefaultActivity();
    }
    
    public int getHistorySize()
    {
      return mDataModel.getHistorySize();
    }
    
    public Object getItem(int paramInt)
    {
      switch (getItemViewType(paramInt))
      {
      default: 
        throw new IllegalArgumentException();
      case 1: 
        return null;
      }
      int i = paramInt;
      if (!mShowDefaultActivity)
      {
        i = paramInt;
        if (mDataModel.getDefaultActivity() != null) {
          i = paramInt + 1;
        }
      }
      return mDataModel.getActivity(i);
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public int getItemViewType(int paramInt)
    {
      if ((mShowFooterView) && (paramInt == getCount() - 1)) {
        return 1;
      }
      return 0;
    }
    
    public int getMaxActivityCount()
    {
      return mMaxActivityCount;
    }
    
    public boolean getShowDefaultActivity()
    {
      return mShowDefaultActivity;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView;
      switch (getItemViewType(paramInt))
      {
      default: 
        throw new IllegalArgumentException();
      case 1: 
        if (paramView != null)
        {
          localView = paramView;
          if (paramView.getId() == 1) {}
        }
        else
        {
          localView = LayoutInflater.from(getContext()).inflate(R.layout.abs__activity_chooser_view_list_item, paramViewGroup, false);
          localView.setId(1);
          ((TextView)localView.findViewById(R.id.abs__title)).setText(mContext.getString(R.string.abs__activity_chooser_view_see_all));
        }
        return localView;
      }
      if (paramView != null)
      {
        localView = paramView;
        if (paramView.getId() == R.id.abs__list_item) {}
      }
      else
      {
        localView = LayoutInflater.from(getContext()).inflate(R.layout.abs__activity_chooser_view_list_item, paramViewGroup, false);
      }
      paramView = mContext.getPackageManager();
      paramViewGroup = (ImageView)localView.findViewById(R.id.abs__icon);
      ResolveInfo localResolveInfo = (ResolveInfo)getItem(paramInt);
      paramViewGroup.setImageDrawable(localResolveInfo.loadIcon(paramView));
      ((TextView)localView.findViewById(R.id.abs__title)).setText(localResolveInfo.loadLabel(paramView));
      if (ActivityChooserView.IS_HONEYCOMB)
      {
        if ((!mShowDefaultActivity) || (paramInt != 0) || (!mHighlightDefaultActivity)) {
          break label240;
        }
        ActivityChooserView.SetActivated.invoke(localView, true);
      }
      for (;;)
      {
        return localView;
        label240:
        ActivityChooserView.SetActivated.invoke(localView, false);
      }
    }
    
    public int getViewTypeCount()
    {
      return 3;
    }
    
    public int measureContentWidth()
    {
      int k = mMaxActivityCount;
      mMaxActivityCount = Integer.MAX_VALUE;
      int j = 0;
      View localView = null;
      int m = View.MeasureSpec.makeMeasureSpec(0, 0);
      int n = View.MeasureSpec.makeMeasureSpec(0, 0);
      int i1 = getCount();
      int i = 0;
      while (i < i1)
      {
        localView = getView(i, localView, null);
        localView.measure(m, n);
        j = Math.max(j, localView.getMeasuredWidth());
        i += 1;
      }
      mMaxActivityCount = k;
      return j;
    }
    
    public void setDataModel(ActivityChooserModel paramActivityChooserModel)
    {
      ActivityChooserModel localActivityChooserModel = mAdapter.getDataModel();
      if ((localActivityChooserModel != null) && (isShown())) {}
      try
      {
        localActivityChooserModel.unregisterObserver(mModelDataSetOberver);
        mDataModel = paramActivityChooserModel;
        if ((paramActivityChooserModel != null) && (isShown())) {}
        try
        {
          paramActivityChooserModel.registerObserver(mModelDataSetOberver);
          notifyDataSetChanged();
          return;
        }
        catch (IllegalStateException paramActivityChooserModel)
        {
          for (;;) {}
        }
      }
      catch (IllegalStateException localIllegalStateException)
      {
        for (;;) {}
      }
    }
    
    public void setMaxActivityCount(int paramInt)
    {
      if (mMaxActivityCount != paramInt)
      {
        mMaxActivityCount = paramInt;
        notifyDataSetChanged();
      }
    }
    
    public void setShowDefaultActivity(boolean paramBoolean1, boolean paramBoolean2)
    {
      if ((mShowDefaultActivity != paramBoolean1) || (mHighlightDefaultActivity != paramBoolean2))
      {
        mShowDefaultActivity = paramBoolean1;
        mHighlightDefaultActivity = paramBoolean2;
        notifyDataSetChanged();
      }
    }
    
    public void setShowFooterView(boolean paramBoolean)
    {
      if (mShowFooterView != paramBoolean)
      {
        mShowFooterView = paramBoolean;
        notifyDataSetChanged();
      }
    }
  }
  
  private class Callbacks
    implements AdapterView.OnItemClickListener, View.OnClickListener, View.OnLongClickListener, PopupWindow.OnDismissListener
  {
    private Callbacks() {}
    
    private void notifyOnDismissListener()
    {
      if (mOnDismissListener != null) {
        mOnDismissListener.onDismiss();
      }
    }
    
    public void onClick(View paramView)
    {
      if (paramView == mDefaultActivityButton)
      {
        dismissPopup();
        paramView = mAdapter.getDefaultActivity();
        int i = mAdapter.getDataModel().getActivityIndex(paramView);
        paramView = mAdapter.getDataModel().chooseActivity(i);
        if (paramView != null) {
          mContext.startActivity(paramView);
        }
        return;
      }
      if (paramView == mExpandActivityOverflowButton)
      {
        ActivityChooserView.access$602(ActivityChooserView.this, false);
        ActivityChooserView.this.showPopupUnchecked(mInitialActivityCount);
        return;
      }
      throw new IllegalArgumentException();
    }
    
    public void onDismiss()
    {
      notifyOnDismissListener();
      if (mProvider != null) {
        mProvider.subUiVisibilityChanged(false);
      }
    }
    
    public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
    {
      switch (((ActivityChooserView.ActivityChooserViewAdapter)paramAdapterView.getAdapter()).getItemViewType(paramInt))
      {
      default: 
        throw new IllegalArgumentException();
      case 1: 
        ActivityChooserView.this.showPopupUnchecked(Integer.MAX_VALUE);
      }
      do
      {
        return;
        dismissPopup();
        if (!mIsSelectingDefaultActivity) {
          break;
        }
      } while (paramInt <= 0);
      mAdapter.getDataModel().setDefaultActivity(paramInt);
      return;
      if (mAdapter.getShowDefaultActivity()) {}
      for (;;)
      {
        paramAdapterView = mAdapter.getDataModel().chooseActivity(paramInt);
        if (paramAdapterView == null) {
          break;
        }
        mContext.startActivity(paramAdapterView);
        return;
        paramInt += 1;
      }
    }
    
    public boolean onLongClick(View paramView)
    {
      if (paramView == mDefaultActivityButton)
      {
        if (mAdapter.getCount() > 0)
        {
          ActivityChooserView.access$602(ActivityChooserView.this, true);
          ActivityChooserView.this.showPopupUnchecked(mInitialActivityCount);
        }
        return true;
      }
      throw new IllegalArgumentException();
    }
  }
  
  private static class SetActivated
  {
    public static void invoke(View paramView, boolean paramBoolean)
    {
      paramView.setActivated(paramBoolean);
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.widget.ActivityChooserView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */