package net.simonvt.calendarview;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.AbsListView;
import android.widget.AbsListView.LayoutParams;
import android.widget.AbsListView.OnScrollListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

public class CalendarView
  extends FrameLayout
{
  private static final int ADJUSTMENT_SCROLL_DURATION = 500;
  private static final String DATE_FORMAT = "MM/dd/yyyy";
  private static final int DAYS_PER_WEEK = 7;
  private static final int DEFAULT_DATE_TEXT_SIZE = 14;
  private static final String DEFAULT_MAX_DATE = "01/01/2100";
  private static final String DEFAULT_MIN_DATE = "01/01/1900";
  private static final int DEFAULT_SHOWN_WEEK_COUNT = 6;
  private static final boolean DEFAULT_SHOW_WEEK_NUMBER = true;
  private static final int DEFAULT_WEEK_DAY_TEXT_APPEARANCE_RES_ID = -1;
  private static final int GOTO_SCROLL_DURATION = 1000;
  private static final String LOG_TAG = CalendarView.class.getSimpleName();
  private static final long MILLIS_IN_DAY = 86400000L;
  private static final long MILLIS_IN_WEEK = 604800000L;
  private static final int SCROLL_CHANGE_DELAY = 40;
  private static final int SCROLL_HYST_WEEKS = 2;
  private static final int UNSCALED_BOTTOM_BUFFER = 20;
  private static final int UNSCALED_LIST_SCROLL_TOP_OFFSET = 2;
  private static final int UNSCALED_SELECTED_DATE_VERTICAL_BAR_WIDTH = 6;
  private static final int UNSCALED_WEEK_MIN_VISIBLE_HEIGHT = 12;
  private static final int UNSCALED_WEEK_SEPARATOR_LINE_WIDTH = 1;
  private WeeksAdapter mAdapter;
  private int mBottomBuffer = 20;
  private Locale mCurrentLocale;
  private int mCurrentMonthDisplayed;
  private int mCurrentScrollState = 0;
  private final DateFormat mDateFormat = new SimpleDateFormat("MM/dd/yyyy");
  private int mDateTextAppearanceResId;
  private int mDateTextSize;
  private String[] mDayLabels;
  private ViewGroup mDayNamesHeader;
  private int mDaysPerWeek = 7;
  private Calendar mFirstDayOfMonth;
  private int mFirstDayOfWeek;
  private int mFocusedMonthDateColor;
  private float mFriction = 0.05F;
  private boolean mIsScrollingUp = false;
  private int mListScrollTopOffset = 2;
  private ListView mListView;
  private Calendar mMaxDate;
  private Calendar mMinDate;
  private TextView mMonthName;
  private OnDateChangeListener mOnDateChangeListener;
  private long mPreviousScrollPosition;
  private int mPreviousScrollState = 0;
  private ScrollStateRunnable mScrollStateChangedRunnable = new ScrollStateRunnable(null);
  private Drawable mSelectedDateVerticalBar;
  private final int mSelectedDateVerticalBarWidth;
  private int mSelectedWeekBackgroundColor;
  private boolean mShowWeekNumber;
  private int mShownWeekCount;
  private Calendar mTempDate;
  private int mUnfocusedMonthDateColor;
  private float mVelocityScale = 0.333F;
  private int mWeekDayTextAppearanceResId;
  private int mWeekMinVisibleHeight = 12;
  private int mWeekNumberColor;
  private int mWeekSeparatorLineColor;
  private final int mWeekSeperatorLineWidth;
  
  public CalendarView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public CalendarView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public CalendarView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, 0);
    setCurrentLocale(Locale.getDefault());
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.CalendarView, R.attr.calendarViewStyle, 0);
    mShowWeekNumber = paramAttributeSet.getBoolean(R.styleable.CalendarView_cv_showWeekNumber, true);
    mFirstDayOfWeek = paramAttributeSet.getInt(R.styleable.CalendarView_cv_firstDayOfWeek, Calendar.getInstance().getFirstDayOfWeek());
    Object localObject = paramAttributeSet.getString(R.styleable.CalendarView_cv_minDate);
    if ((TextUtils.isEmpty((CharSequence)localObject)) || (!parseDate((String)localObject, mMinDate))) {
      parseDate("01/01/1900", mMinDate);
    }
    localObject = paramAttributeSet.getString(R.styleable.CalendarView_cv_maxDate);
    if ((TextUtils.isEmpty((CharSequence)localObject)) || (!parseDate((String)localObject, mMaxDate))) {
      parseDate("01/01/2100", mMaxDate);
    }
    if (mMaxDate.before(mMinDate)) {
      throw new IllegalArgumentException("Max date cannot be before min date.");
    }
    mShownWeekCount = paramAttributeSet.getInt(R.styleable.CalendarView_cv_shownWeekCount, 6);
    mSelectedWeekBackgroundColor = paramAttributeSet.getColor(R.styleable.CalendarView_cv_selectedWeekBackgroundColor, 0);
    mFocusedMonthDateColor = paramAttributeSet.getColor(R.styleable.CalendarView_cv_focusedMonthDateColor, 0);
    mUnfocusedMonthDateColor = paramAttributeSet.getColor(R.styleable.CalendarView_cv_unfocusedMonthDateColor, 0);
    mWeekSeparatorLineColor = paramAttributeSet.getColor(R.styleable.CalendarView_cv_weekSeparatorLineColor, 0);
    mWeekNumberColor = paramAttributeSet.getColor(R.styleable.CalendarView_cv_weekNumberColor, 0);
    mSelectedDateVerticalBar = paramAttributeSet.getDrawable(R.styleable.CalendarView_cv_selectedDateVerticalBar);
    mDateTextAppearanceResId = paramAttributeSet.getResourceId(R.styleable.CalendarView_cv_dateTextAppearance, 16973894);
    updateDateTextSize();
    mWeekDayTextAppearanceResId = paramAttributeSet.getResourceId(R.styleable.CalendarView_cv_weekDayTextAppearance, -1);
    localObject = paramAttributeSet.getDrawable(R.styleable.CalendarView_cv_dividerHorizontal);
    paramAttributeSet.recycle();
    paramAttributeSet = getResources().getDisplayMetrics();
    mWeekMinVisibleHeight = ((int)TypedValue.applyDimension(1, 12.0F, paramAttributeSet));
    mListScrollTopOffset = ((int)TypedValue.applyDimension(1, 2.0F, paramAttributeSet));
    mBottomBuffer = ((int)TypedValue.applyDimension(1, 20.0F, paramAttributeSet));
    mSelectedDateVerticalBarWidth = ((int)TypedValue.applyDimension(1, 6.0F, paramAttributeSet));
    mWeekSeperatorLineWidth = ((int)TypedValue.applyDimension(1, 1.0F, paramAttributeSet));
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(R.layout.calendar_view, null, false);
    addView(paramContext);
    mListView = ((ListView)findViewById(16908298));
    mDayNamesHeader = ((ViewGroup)paramContext.findViewById(R.id.cv_day_names));
    mMonthName = ((TextView)paramContext.findViewById(R.id.cv_month_name));
    ((ImageView)findViewById(R.id.cv_divider)).setImageDrawable((Drawable)localObject);
    setUpHeader();
    setUpListView();
    setUpAdapter();
    mTempDate.setTimeInMillis(System.currentTimeMillis());
    if (mTempDate.before(mMinDate)) {
      goTo(mMinDate, false, true, true);
    }
    for (;;)
    {
      invalidate();
      return;
      if (mMaxDate.before(mTempDate)) {
        goTo(mMaxDate, false, true, true);
      } else {
        goTo(mTempDate, false, true, true);
      }
    }
  }
  
  private Calendar getCalendarForLocale(Calendar paramCalendar, Locale paramLocale)
  {
    if (paramCalendar == null) {
      return Calendar.getInstance(paramLocale);
    }
    long l = paramCalendar.getTimeInMillis();
    paramCalendar = Calendar.getInstance(paramLocale);
    paramCalendar.setTimeInMillis(l);
    return paramCalendar;
  }
  
  private int getWeeksSinceMinDate(Calendar paramCalendar)
  {
    if (paramCalendar.before(mMinDate)) {
      throw new IllegalArgumentException("fromDate: " + mMinDate.getTime() + " does not precede toDate: " + paramCalendar.getTime());
    }
    return (int)((paramCalendar.getTimeInMillis() + paramCalendar.getTimeZone().getOffset(paramCalendar.getTimeInMillis()) - (mMinDate.getTimeInMillis() + mMinDate.getTimeZone().getOffset(mMinDate.getTimeInMillis())) + (mMinDate.get(7) - mFirstDayOfWeek) * 86400000L) / 604800000L);
  }
  
  private void goTo(Calendar paramCalendar, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    if ((paramCalendar.before(mMinDate)) || (paramCalendar.after(mMaxDate))) {
      throw new IllegalArgumentException("Time not between " + mMinDate.getTime() + " and " + mMaxDate.getTime());
    }
    int j = mListView.getFirstVisiblePosition();
    View localView = mListView.getChildAt(0);
    int i = j;
    if (localView != null)
    {
      i = j;
      if (localView.getTop() < 0) {
        i = j + 1;
      }
    }
    int k = mShownWeekCount + i - 1;
    j = k;
    if (localView != null)
    {
      j = k;
      if (localView.getTop() > mBottomBuffer) {
        j = k - 1;
      }
    }
    if (paramBoolean2) {
      mAdapter.setSelectedDay(paramCalendar);
    }
    k = getWeeksSinceMinDate(paramCalendar);
    if ((k < i) || (k > j) || (paramBoolean3))
    {
      mFirstDayOfMonth.setTimeInMillis(paramCalendar.getTimeInMillis());
      mFirstDayOfMonth.set(5, 1);
      setMonthDisplayed(mFirstDayOfMonth);
      if (mFirstDayOfMonth.before(mMinDate))
      {
        i = 0;
        mPreviousScrollState = 2;
        if (!paramBoolean1) {
          break label282;
        }
        mListView.smoothScrollToPositionFromTop(i, mListScrollTopOffset, 1000);
      }
    }
    label282:
    while (!paramBoolean2)
    {
      for (;;)
      {
        return;
        i = getWeeksSinceMinDate(mFirstDayOfMonth);
      }
      mListView.setSelectionFromTop(i, mListScrollTopOffset);
      onScrollStateChanged(mListView, 0);
      return;
    }
    setMonthDisplayed(paramCalendar);
  }
  
  private void invalidateAllWeekViews()
  {
    int j = mListView.getChildCount();
    int i = 0;
    while (i < j)
    {
      mListView.getChildAt(i).invalidate();
      i += 1;
    }
  }
  
  private boolean isLayoutRtl()
  {
    return false;
  }
  
  private boolean isSameDate(Calendar paramCalendar1, Calendar paramCalendar2)
  {
    return (paramCalendar1.get(6) == paramCalendar2.get(6)) && (paramCalendar1.get(1) == paramCalendar2.get(1));
  }
  
  private void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    WeekView localWeekView = (WeekView)paramAbsListView.getChildAt(0);
    if (localWeekView == null) {
      return;
    }
    long l = paramAbsListView.getFirstVisiblePosition() * localWeekView.getHeight() - localWeekView.getBottom();
    if (l < mPreviousScrollPosition)
    {
      mIsScrollingUp = true;
      label50:
      if (localWeekView.getBottom() >= mWeekMinVisibleHeight) {
        break label191;
      }
      paramInt1 = 1;
      label64:
      if (!mIsScrollingUp) {
        break label196;
      }
      localWeekView = (WeekView)paramAbsListView.getChildAt(paramInt1 + 2);
      label83:
      if (!mIsScrollingUp) {
        break label213;
      }
      paramInt1 = localWeekView.getMonthOfFirstWeekDay();
      label96:
      if ((mCurrentMonthDisplayed != 11) || (paramInt1 != 0)) {
        break label222;
      }
      paramInt1 = 1;
      label111:
      if (((!mIsScrollingUp) && (paramInt1 > 0)) || ((mIsScrollingUp) && (paramInt1 < 0)))
      {
        paramAbsListView = localWeekView.getFirstDay();
        if (!mIsScrollingUp) {
          break label250;
        }
        paramAbsListView.add(5, -7);
      }
    }
    for (;;)
    {
      setMonthDisplayed(paramAbsListView);
      mPreviousScrollPosition = l;
      mPreviousScrollState = mCurrentScrollState;
      return;
      if (l <= mPreviousScrollPosition) {
        break;
      }
      mIsScrollingUp = false;
      break label50;
      label191:
      paramInt1 = 0;
      break label64;
      label196:
      if (paramInt1 == 0) {
        break label83;
      }
      localWeekView = (WeekView)paramAbsListView.getChildAt(paramInt1);
      break label83;
      label213:
      paramInt1 = localWeekView.getMonthOfLastWeekDay();
      break label96;
      label222:
      if ((mCurrentMonthDisplayed == 0) && (paramInt1 == 11))
      {
        paramInt1 = -1;
        break label111;
      }
      paramInt1 -= mCurrentMonthDisplayed;
      break label111;
      label250:
      paramAbsListView.add(5, 7);
    }
  }
  
  private void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    mScrollStateChangedRunnable.doScrollStateChange(paramAbsListView, paramInt);
  }
  
  private boolean parseDate(String paramString, Calendar paramCalendar)
  {
    try
    {
      paramCalendar.setTime(mDateFormat.parse(paramString));
      return true;
    }
    catch (ParseException paramCalendar)
    {
      Log.w(LOG_TAG, "Date: " + paramString + " not in format: " + "MM/dd/yyyy");
    }
    return false;
  }
  
  private void setCurrentLocale(Locale paramLocale)
  {
    if (paramLocale.equals(mCurrentLocale)) {
      return;
    }
    mCurrentLocale = paramLocale;
    mTempDate = getCalendarForLocale(mTempDate, paramLocale);
    mFirstDayOfMonth = getCalendarForLocale(mFirstDayOfMonth, paramLocale);
    mMinDate = getCalendarForLocale(mMinDate, paramLocale);
    mMaxDate = getCalendarForLocale(mMaxDate, paramLocale);
  }
  
  private void setMonthDisplayed(Calendar paramCalendar)
  {
    int i = paramCalendar.get(2);
    if (mCurrentMonthDisplayed != i)
    {
      mCurrentMonthDisplayed = i;
      mAdapter.setFocusMonth(mCurrentMonthDisplayed);
      long l = paramCalendar.getTimeInMillis();
      paramCalendar = DateUtils.formatDateRange(getContext(), l, l, 52);
      mMonthName.setText(paramCalendar);
      mMonthName.invalidate();
    }
  }
  
  private void setUpAdapter()
  {
    if (mAdapter == null)
    {
      mAdapter = new WeeksAdapter(getContext());
      mAdapter.registerDataSetObserver(new DataSetObserver()
      {
        public void onChanged()
        {
          if (mOnDateChangeListener != null)
          {
            Calendar localCalendar = mAdapter.getSelectedDay();
            mOnDateChangeListener.onSelectedDayChange(CalendarView.this, localCalendar.get(1), localCalendar.get(2), localCalendar.get(5));
          }
        }
      });
      mListView.setAdapter(mAdapter);
    }
    mAdapter.notifyDataSetChanged();
  }
  
  private void setUpHeader()
  {
    mDayLabels = new String[mDaysPerWeek];
    int i = mFirstDayOfWeek;
    int k = mFirstDayOfWeek;
    int m = mDaysPerWeek;
    int j;
    if (i < k + m)
    {
      if (i > 7) {}
      for (j = i - 7;; j = i)
      {
        mDayLabels[(i - mFirstDayOfWeek)] = DateUtils.getDayOfWeekString(j, 50);
        i += 1;
        break;
      }
    }
    TextView localTextView = (TextView)mDayNamesHeader.getChildAt(0);
    if (mShowWeekNumber)
    {
      localTextView.setVisibility(0);
      i = 1;
      j = mDayNamesHeader.getChildCount();
      label111:
      if (i >= j) {
        break label206;
      }
      localTextView = (TextView)mDayNamesHeader.getChildAt(i);
      if (mWeekDayTextAppearanceResId > -1) {
        localTextView.setTextAppearance(getContext(), mWeekDayTextAppearanceResId);
      }
      if (i >= mDaysPerWeek + 1) {
        break label196;
      }
      localTextView.setText(mDayLabels[(i - 1)]);
      localTextView.setVisibility(0);
    }
    for (;;)
    {
      i += 1;
      break label111;
      localTextView.setVisibility(8);
      break;
      label196:
      localTextView.setVisibility(8);
    }
    label206:
    mDayNamesHeader.invalidate();
  }
  
  private void setUpListView()
  {
    mListView.setDivider(null);
    mListView.setItemsCanFocus(true);
    mListView.setVerticalScrollBarEnabled(false);
    mListView.setOnScrollListener(new AbsListView.OnScrollListener()
    {
      public void onScroll(AbsListView paramAnonymousAbsListView, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        CalendarView.this.onScroll(paramAnonymousAbsListView, paramAnonymousInt1, paramAnonymousInt2, paramAnonymousInt3);
      }
      
      public void onScrollStateChanged(AbsListView paramAnonymousAbsListView, int paramAnonymousInt)
      {
        CalendarView.this.onScrollStateChanged(paramAnonymousAbsListView, paramAnonymousInt);
      }
    });
    if (Build.VERSION.SDK_INT >= 11)
    {
      mListView.setFriction(mFriction);
      mListView.setVelocityScale(mVelocityScale);
    }
  }
  
  private void updateDateTextSize()
  {
    TypedArray localTypedArray = getContext().obtainStyledAttributes(mDateTextAppearanceResId, R.styleable.TextAppearanceCompatStyleable);
    mDateTextSize = localTypedArray.getDimensionPixelSize(R.styleable.TextAppearanceCompatStyleable_android_textSize, 14);
    localTypedArray.recycle();
  }
  
  public long getDate()
  {
    return mAdapter.mSelectedDate.getTimeInMillis();
  }
  
  public int getDateTextAppearance()
  {
    return mDateTextAppearanceResId;
  }
  
  public int getFirstDayOfWeek()
  {
    return mFirstDayOfWeek;
  }
  
  public int getFocusedMonthDateColor()
  {
    return mFocusedMonthDateColor;
  }
  
  public long getMaxDate()
  {
    return mMaxDate.getTimeInMillis();
  }
  
  public long getMinDate()
  {
    return mMinDate.getTimeInMillis();
  }
  
  public Drawable getSelectedDateVerticalBar()
  {
    return mSelectedDateVerticalBar;
  }
  
  public int getSelectedWeekBackgroundColor()
  {
    return mSelectedWeekBackgroundColor;
  }
  
  public boolean getShowWeekNumber()
  {
    return mShowWeekNumber;
  }
  
  public int getShownWeekCount()
  {
    return mShownWeekCount;
  }
  
  public int getUnfocusedMonthDateColor()
  {
    return mFocusedMonthDateColor;
  }
  
  public int getWeekDayTextAppearance()
  {
    return mWeekDayTextAppearanceResId;
  }
  
  public int getWeekNumberColor()
  {
    return mWeekNumberColor;
  }
  
  public int getWeekSeparatorLineColor()
  {
    return mWeekSeparatorLineColor;
  }
  
  public boolean isEnabled()
  {
    return mListView.isEnabled();
  }
  
  protected void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    setCurrentLocale(locale);
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setClassName(CalendarView.class.getName());
  }
  
  public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    super.onInitializeAccessibilityNodeInfo(paramAccessibilityNodeInfo);
    paramAccessibilityNodeInfo.setClassName(CalendarView.class.getName());
  }
  
  public void setDate(long paramLong)
  {
    setDate(paramLong, false, false);
  }
  
  public void setDate(long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    mTempDate.setTimeInMillis(paramLong);
    if (isSameDate(mTempDate, mAdapter.mSelectedDate)) {
      return;
    }
    goTo(mTempDate, paramBoolean1, true, paramBoolean2);
  }
  
  public void setDateTextAppearance(int paramInt)
  {
    if (mDateTextAppearanceResId != paramInt)
    {
      mDateTextAppearanceResId = paramInt;
      updateDateTextSize();
      invalidateAllWeekViews();
    }
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    mListView.setEnabled(paramBoolean);
  }
  
  public void setFirstDayOfWeek(int paramInt)
  {
    if (mFirstDayOfWeek == paramInt) {
      return;
    }
    mFirstDayOfWeek = paramInt;
    mAdapter.init();
    mAdapter.notifyDataSetChanged();
    setUpHeader();
  }
  
  public void setFocusedMonthDateColor(int paramInt)
  {
    if (mFocusedMonthDateColor != paramInt)
    {
      mFocusedMonthDateColor = paramInt;
      int i = mListView.getChildCount();
      paramInt = 0;
      while (paramInt < i)
      {
        WeekView localWeekView = (WeekView)mListView.getChildAt(paramInt);
        if (mHasFocusedDay) {
          localWeekView.invalidate();
        }
        paramInt += 1;
      }
    }
  }
  
  public void setMaxDate(long paramLong)
  {
    mTempDate.setTimeInMillis(paramLong);
    if (isSameDate(mTempDate, mMaxDate)) {
      return;
    }
    mMaxDate.setTimeInMillis(paramLong);
    mAdapter.init();
    Calendar localCalendar = mAdapter.mSelectedDate;
    if (localCalendar.after(mMaxDate))
    {
      setDate(mMaxDate.getTimeInMillis());
      return;
    }
    goTo(localCalendar, false, true, false);
  }
  
  public void setMinDate(long paramLong)
  {
    mTempDate.setTimeInMillis(paramLong);
    if (isSameDate(mTempDate, mMinDate)) {
      return;
    }
    mMinDate.setTimeInMillis(paramLong);
    Calendar localCalendar = mAdapter.mSelectedDate;
    if (localCalendar.before(mMinDate)) {
      mAdapter.setSelectedDay(mMinDate);
    }
    mAdapter.init();
    if (localCalendar.before(mMinDate))
    {
      setDate(mTempDate.getTimeInMillis());
      return;
    }
    goTo(localCalendar, false, true, false);
  }
  
  public void setOnDateChangeListener(OnDateChangeListener paramOnDateChangeListener)
  {
    mOnDateChangeListener = paramOnDateChangeListener;
  }
  
  public void setSelectedDateVerticalBar(int paramInt)
  {
    setSelectedDateVerticalBar(getResources().getDrawable(paramInt));
  }
  
  public void setSelectedDateVerticalBar(Drawable paramDrawable)
  {
    if (mSelectedDateVerticalBar != paramDrawable)
    {
      mSelectedDateVerticalBar = paramDrawable;
      int j = mListView.getChildCount();
      int i = 0;
      while (i < j)
      {
        paramDrawable = (WeekView)mListView.getChildAt(i);
        if (mHasSelectedDay) {
          paramDrawable.invalidate();
        }
        i += 1;
      }
    }
  }
  
  public void setSelectedWeekBackgroundColor(int paramInt)
  {
    if (mSelectedWeekBackgroundColor != paramInt)
    {
      mSelectedWeekBackgroundColor = paramInt;
      int i = mListView.getChildCount();
      paramInt = 0;
      while (paramInt < i)
      {
        WeekView localWeekView = (WeekView)mListView.getChildAt(paramInt);
        if (mHasSelectedDay) {
          localWeekView.invalidate();
        }
        paramInt += 1;
      }
    }
  }
  
  public void setShowWeekNumber(boolean paramBoolean)
  {
    if (mShowWeekNumber == paramBoolean) {
      return;
    }
    mShowWeekNumber = paramBoolean;
    mAdapter.notifyDataSetChanged();
    setUpHeader();
  }
  
  public void setShownWeekCount(int paramInt)
  {
    if (mShownWeekCount != paramInt)
    {
      mShownWeekCount = paramInt;
      invalidate();
    }
  }
  
  public void setUnfocusedMonthDateColor(int paramInt)
  {
    if (mUnfocusedMonthDateColor != paramInt)
    {
      mUnfocusedMonthDateColor = paramInt;
      int i = mListView.getChildCount();
      paramInt = 0;
      while (paramInt < i)
      {
        WeekView localWeekView = (WeekView)mListView.getChildAt(paramInt);
        if (mHasUnfocusedDay) {
          localWeekView.invalidate();
        }
        paramInt += 1;
      }
    }
  }
  
  public void setWeekDayTextAppearance(int paramInt)
  {
    if (mWeekDayTextAppearanceResId != paramInt)
    {
      mWeekDayTextAppearanceResId = paramInt;
      setUpHeader();
    }
  }
  
  public void setWeekNumberColor(int paramInt)
  {
    if (mWeekNumberColor != paramInt)
    {
      mWeekNumberColor = paramInt;
      if (mShowWeekNumber) {
        invalidateAllWeekViews();
      }
    }
  }
  
  public void setWeekSeparatorLineColor(int paramInt)
  {
    if (mWeekSeparatorLineColor != paramInt)
    {
      mWeekSeparatorLineColor = paramInt;
      invalidateAllWeekViews();
    }
  }
  
  public static abstract interface OnDateChangeListener
  {
    public abstract void onSelectedDayChange(CalendarView paramCalendarView, int paramInt1, int paramInt2, int paramInt3);
  }
  
  private class ScrollStateRunnable
    implements Runnable
  {
    private int mNewState;
    private AbsListView mView;
    
    private ScrollStateRunnable() {}
    
    public void doScrollStateChange(AbsListView paramAbsListView, int paramInt)
    {
      mView = paramAbsListView;
      mNewState = paramInt;
      removeCallbacks(this);
      postDelayed(this, 40L);
    }
    
    public void run()
    {
      CalendarView.access$1002(CalendarView.this, mNewState);
      int i;
      if ((mNewState == 0) && (mPreviousScrollState != 0))
      {
        View localView = mView.getChildAt(0);
        if (localView == null) {
          return;
        }
        i = localView.getBottom() - mListScrollTopOffset;
        if (i > mListScrollTopOffset)
        {
          if (!mIsScrollingUp) {
            break label106;
          }
          mView.smoothScrollBy(i - localView.getHeight(), 500);
        }
      }
      for (;;)
      {
        CalendarView.access$1102(CalendarView.this, mNewState);
        return;
        label106:
        mView.smoothScrollBy(i, 500);
      }
    }
  }
  
  private class WeekView
    extends View
  {
    private String[] mDayNumbers;
    private final Paint mDrawPaint = new Paint();
    private Calendar mFirstDay;
    private boolean[] mFocusDay;
    private boolean mHasFocusedDay;
    private boolean mHasSelectedDay = false;
    private boolean mHasUnfocusedDay;
    private int mHeight;
    private int mLastWeekDayMonth = -1;
    private final Paint mMonthNumDrawPaint = new Paint();
    private int mMonthOfFirstWeekDay = -1;
    private int mNumCells;
    private int mSelectedDay = -1;
    private int mSelectedLeft = -1;
    private int mSelectedRight = -1;
    private final Rect mTempRect = new Rect();
    private int mWeek = -1;
    private int mWidth;
    
    public WeekView(Context paramContext)
    {
      super();
      initilaizePaints();
    }
    
    private void drawBackground(Canvas paramCanvas)
    {
      int i = 0;
      if (!mHasSelectedDay) {
        return;
      }
      mDrawPaint.setColor(mSelectedWeekBackgroundColor);
      mTempRect.top = mWeekSeperatorLineWidth;
      mTempRect.bottom = mHeight;
      boolean bool = CalendarView.this.isLayoutRtl();
      Rect localRect;
      if (bool)
      {
        mTempRect.left = 0;
        mTempRect.right = (mSelectedLeft - 2);
        paramCanvas.drawRect(mTempRect, mDrawPaint);
        if (!bool) {
          break label217;
        }
        mTempRect.left = (mSelectedRight + 3);
        localRect = mTempRect;
        if (!mShowWeekNumber) {
          break label209;
        }
        i = mWidth - mWidth / mNumCells;
      }
      label142:
      for (right = i;; mTempRect.right = mWidth)
      {
        paramCanvas.drawRect(mTempRect, mDrawPaint);
        return;
        localRect = mTempRect;
        if (mShowWeekNumber) {
          i = mWidth / mNumCells;
        }
        left = i;
        mTempRect.right = (mSelectedLeft - 2);
        break;
        label209:
        i = mWidth;
        break label142;
        label217:
        mTempRect.left = (mSelectedRight + 3);
      }
    }
    
    private void drawSelectedDateVerticalBars(Canvas paramCanvas)
    {
      if (!mHasSelectedDay) {
        return;
      }
      mSelectedDateVerticalBar.setBounds(mSelectedLeft - mSelectedDateVerticalBarWidth / 2, mWeekSeperatorLineWidth, mSelectedLeft + mSelectedDateVerticalBarWidth / 2, mHeight);
      mSelectedDateVerticalBar.draw(paramCanvas);
      mSelectedDateVerticalBar.setBounds(mSelectedRight - mSelectedDateVerticalBarWidth / 2, mWeekSeperatorLineWidth, mSelectedRight + mSelectedDateVerticalBarWidth / 2, mHeight);
      mSelectedDateVerticalBar.draw(paramCanvas);
    }
    
    private void drawWeekNumbersAndDates(Canvas paramCanvas)
    {
      float f = mDrawPaint.getTextSize();
      int k = (int)((mHeight + f) / 2.0F) - mWeekSeperatorLineWidth;
      int n = mNumCells;
      int m = n * 2;
      mDrawPaint.setTextAlign(Paint.Align.CENTER);
      mDrawPaint.setTextSize(mDateTextSize);
      int j = 0;
      int i = 0;
      Paint localPaint;
      if (CalendarView.this.isLayoutRtl())
      {
        if (i < n - 1)
        {
          localPaint = mMonthNumDrawPaint;
          if (mFocusDay[i] != 0) {}
          for (j = mFocusedMonthDateColor;; j = mUnfocusedMonthDateColor)
          {
            localPaint.setColor(j);
            j = (i * 2 + 1) * mWidth / m;
            paramCanvas.drawText(mDayNumbers[(n - 1 - i)], j, k, mMonthNumDrawPaint);
            i += 1;
            break;
          }
        }
        if (mShowWeekNumber)
        {
          mDrawPaint.setColor(mWeekNumberColor);
          i = mWidth;
          j = mWidth / m;
          paramCanvas.drawText(mDayNumbers[0], i - j, k, mDrawPaint);
        }
        return;
      }
      i = j;
      if (mShowWeekNumber)
      {
        mDrawPaint.setColor(mWeekNumberColor);
        i = mWidth / m;
        paramCanvas.drawText(mDayNumbers[0], i, k, mDrawPaint);
        i = 0 + 1;
      }
      label297:
      if (i < n)
      {
        localPaint = mMonthNumDrawPaint;
        if (mFocusDay[i] == 0) {
          break label376;
        }
      }
      label376:
      for (j = mFocusedMonthDateColor;; j = mUnfocusedMonthDateColor)
      {
        localPaint.setColor(j);
        j = (i * 2 + 1) * mWidth / m;
        paramCanvas.drawText(mDayNumbers[i], j, k, mMonthNumDrawPaint);
        i += 1;
        break label297;
        break;
      }
    }
    
    private void drawWeekSeparators(Canvas paramCanvas)
    {
      int j = mListView.getFirstVisiblePosition();
      int i = j;
      if (mListView.getChildAt(0).getTop() < 0) {
        i = j + 1;
      }
      if (i == mWeek) {
        return;
      }
      mDrawPaint.setColor(mWeekSeparatorLineColor);
      mDrawPaint.setStrokeWidth(mWeekSeperatorLineWidth);
      float f2;
      if (CalendarView.this.isLayoutRtl())
      {
        f2 = 0.0F;
        if (mShowWeekNumber) {}
        for (f1 = mWidth - mWidth / mNumCells;; f1 = mWidth)
        {
          paramCanvas.drawLine(f2, 0.0F, f1, 0.0F, mDrawPaint);
          return;
        }
      }
      if (mShowWeekNumber) {}
      for (float f1 = mWidth / mNumCells;; f1 = 0.0F)
      {
        float f3 = mWidth;
        f2 = f1;
        f1 = f3;
        break;
      }
    }
    
    private void initilaizePaints()
    {
      mDrawPaint.setFakeBoldText(false);
      mDrawPaint.setAntiAlias(true);
      mDrawPaint.setStyle(Paint.Style.FILL);
      mMonthNumDrawPaint.setFakeBoldText(true);
      mMonthNumDrawPaint.setAntiAlias(true);
      mMonthNumDrawPaint.setStyle(Paint.Style.FILL);
      mMonthNumDrawPaint.setTextAlign(Paint.Align.CENTER);
      mMonthNumDrawPaint.setTextSize(mDateTextSize);
    }
    
    private void updateSelectionPositions()
    {
      int j;
      if (mHasSelectedDay)
      {
        boolean bool = CalendarView.this.isLayoutRtl();
        j = mSelectedDay - mFirstDayOfWeek;
        int i = j;
        if (j < 0) {
          i = j + 7;
        }
        j = i;
        if (mShowWeekNumber)
        {
          j = i;
          if (!bool) {
            j = i + 1;
          }
        }
        if (!bool) {
          break label109;
        }
      }
      label109:
      for (mSelectedLeft = ((mDaysPerWeek - 1 - j) * mWidth / mNumCells);; mSelectedLeft = (mWidth * j / mNumCells))
      {
        mSelectedRight = (mSelectedLeft + mWidth / mNumCells);
        return;
      }
    }
    
    public boolean getDayFromLocation(float paramFloat, Calendar paramCalendar)
    {
      boolean bool = CalendarView.this.isLayoutRtl();
      if (bool)
      {
        j = 0;
        if (mShowWeekNumber) {}
        for (i = mWidth - mWidth / mNumCells; (paramFloat < j) || (paramFloat > i); i = mWidth)
        {
          paramCalendar.clear();
          return false;
        }
      }
      if (mShowWeekNumber) {}
      for (int j = mWidth / mNumCells;; j = 0)
      {
        i = mWidth;
        break;
      }
      j = (int)((paramFloat - j) * mDaysPerWeek / (i - j));
      int i = j;
      if (bool) {
        i = mDaysPerWeek - 1 - j;
      }
      paramCalendar.setTimeInMillis(mFirstDay.getTimeInMillis());
      paramCalendar.add(5, i);
      return true;
    }
    
    public Calendar getFirstDay()
    {
      return mFirstDay;
    }
    
    public int getMonthOfFirstWeekDay()
    {
      return mMonthOfFirstWeekDay;
    }
    
    public int getMonthOfLastWeekDay()
    {
      return mLastWeekDayMonth;
    }
    
    public void init(int paramInt1, int paramInt2, int paramInt3)
    {
      mSelectedDay = paramInt2;
      boolean bool;
      if (mSelectedDay != -1)
      {
        bool = true;
        mHasSelectedDay = bool;
        if (!mShowWeekNumber) {
          break label391;
        }
        paramInt2 = mDaysPerWeek + 1;
        label42:
        mNumCells = paramInt2;
        mWeek = paramInt1;
        mTempDate.setTimeInMillis(mMinDate.getTimeInMillis());
        mTempDate.add(3, mWeek);
        mTempDate.setFirstDayOfWeek(mFirstDayOfWeek);
        mDayNumbers = new String[mNumCells];
        mFocusDay = new boolean[mNumCells];
        paramInt1 = 0;
        if (mShowWeekNumber)
        {
          mDayNumbers[0] = String.format(Locale.getDefault(), "%d", new Object[] { Integer.valueOf(mTempDate.get(3)) });
          paramInt1 = 0 + 1;
        }
        paramInt2 = mFirstDayOfWeek;
        int i = mTempDate.get(7);
        mTempDate.add(5, paramInt2 - i);
        mFirstDay = ((Calendar)mTempDate.clone());
        mMonthOfFirstWeekDay = mTempDate.get(2);
        mHasUnfocusedDay = true;
        label251:
        if (paramInt1 >= mNumCells) {
          break label452;
        }
        if (mTempDate.get(2) != paramInt3) {
          break label402;
        }
        bool = true;
        label277:
        mFocusDay[paramInt1] = bool;
        mHasFocusedDay |= bool;
        int j = mHasUnfocusedDay;
        if (bool) {
          break label408;
        }
        paramInt2 = 1;
        label309:
        mHasUnfocusedDay = (paramInt2 & j);
        if ((!mTempDate.before(mMinDate)) && (!mTempDate.after(mMaxDate))) {
          break label413;
        }
        mDayNumbers[paramInt1] = "";
      }
      for (;;)
      {
        mTempDate.add(5, 1);
        paramInt1 += 1;
        break label251;
        bool = false;
        break;
        label391:
        paramInt2 = mDaysPerWeek;
        break label42;
        label402:
        bool = false;
        break label277;
        label408:
        paramInt2 = 0;
        break label309;
        label413:
        mDayNumbers[paramInt1] = String.format(Locale.getDefault(), "%d", new Object[] { Integer.valueOf(mTempDate.get(5)) });
      }
      label452:
      if (mTempDate.get(5) == 1) {
        mTempDate.add(5, -1);
      }
      mLastWeekDayMonth = mTempDate.get(2);
      updateSelectionPositions();
    }
    
    protected void onDraw(Canvas paramCanvas)
    {
      drawBackground(paramCanvas);
      drawWeekNumbersAndDates(paramCanvas);
      drawWeekSeparators(paramCanvas);
      drawSelectedDateVerticalBars(paramCanvas);
    }
    
    protected void onMeasure(int paramInt1, int paramInt2)
    {
      mHeight = ((mListView.getHeight() - mListView.getPaddingTop() - mListView.getPaddingBottom()) / mShownWeekCount);
      setMeasuredDimension(View.MeasureSpec.getSize(paramInt1), mHeight);
    }
    
    protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      mWidth = paramInt1;
      updateSelectionPositions();
    }
  }
  
  private class WeeksAdapter
    extends BaseAdapter
    implements View.OnTouchListener
  {
    private int mFocusedMonth;
    private GestureDetector mGestureDetector = new GestureDetector(getContext(), new CalendarGestureListener());
    private final Calendar mSelectedDate = Calendar.getInstance();
    private int mSelectedWeek;
    private int mTotalWeekCount;
    
    public WeeksAdapter(Context paramContext)
    {
      init();
    }
    
    private void init()
    {
      mSelectedWeek = CalendarView.this.getWeeksSinceMinDate(mSelectedDate);
      mTotalWeekCount = CalendarView.this.getWeeksSinceMinDate(mMaxDate);
      if ((mMinDate.get(7) != mFirstDayOfWeek) || (mMaxDate.get(7) != mFirstDayOfWeek)) {
        mTotalWeekCount += 1;
      }
    }
    
    private void onDateTapped(Calendar paramCalendar)
    {
      setSelectedDay(paramCalendar);
      CalendarView.this.setMonthDisplayed(paramCalendar);
    }
    
    public int getCount()
    {
      return mTotalWeekCount;
    }
    
    public Object getItem(int paramInt)
    {
      return null;
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public Calendar getSelectedDay()
    {
      return mSelectedDate;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (paramView != null)
      {
        paramView = (CalendarView.WeekView)paramView;
        if (mSelectedWeek != paramInt) {
          break label88;
        }
      }
      label88:
      for (int i = mSelectedDate.get(7);; i = -1)
      {
        paramView.init(paramInt, i, mFocusedMonth);
        return paramView;
        paramView = new CalendarView.WeekView(CalendarView.this, getContext());
        paramView.setLayoutParams(new AbsListView.LayoutParams(-2, -2));
        paramView.setClickable(true);
        paramView.setOnTouchListener(this);
        break;
      }
    }
    
    public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
    {
      if ((mListView.isEnabled()) && (mGestureDetector.onTouchEvent(paramMotionEvent)))
      {
        if (!((CalendarView.WeekView)paramView).getDayFromLocation(paramMotionEvent.getX(), mTempDate)) {}
        while ((mTempDate.before(mMinDate)) || (mTempDate.after(mMaxDate))) {
          return true;
        }
        onDateTapped(mTempDate);
        return true;
      }
      return false;
    }
    
    public void setFocusMonth(int paramInt)
    {
      if (mFocusedMonth == paramInt) {
        return;
      }
      mFocusedMonth = paramInt;
      notifyDataSetChanged();
    }
    
    public void setSelectedDay(Calendar paramCalendar)
    {
      if ((paramCalendar.get(6) == mSelectedDate.get(6)) && (paramCalendar.get(1) == mSelectedDate.get(1))) {
        return;
      }
      mSelectedDate.setTimeInMillis(paramCalendar.getTimeInMillis());
      mSelectedWeek = CalendarView.this.getWeeksSinceMinDate(mSelectedDate);
      mFocusedMonth = mSelectedDate.get(2);
      notifyDataSetChanged();
    }
    
    class CalendarGestureListener
      extends GestureDetector.SimpleOnGestureListener
    {
      CalendarGestureListener() {}
      
      public boolean onSingleTapUp(MotionEvent paramMotionEvent)
      {
        return true;
      }
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.calendarview.CalendarView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */