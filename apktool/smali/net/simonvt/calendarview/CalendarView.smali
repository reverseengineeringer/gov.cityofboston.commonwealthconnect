.class public Lnet/simonvt/calendarview/CalendarView;
.super Landroid/widget/FrameLayout;
.source "CalendarView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/simonvt/calendarview/CalendarView$WeekView;,
        Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;,
        Lnet/simonvt/calendarview/CalendarView$ScrollStateRunnable;,
        Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;
    }
.end annotation


# static fields
.field private static final ADJUSTMENT_SCROLL_DURATION:I = 0x1f4

.field private static final DATE_FORMAT:Ljava/lang/String; = "MM/dd/yyyy"

.field private static final DAYS_PER_WEEK:I = 0x7

.field private static final DEFAULT_DATE_TEXT_SIZE:I = 0xe

.field private static final DEFAULT_MAX_DATE:Ljava/lang/String; = "01/01/2100"

.field private static final DEFAULT_MIN_DATE:Ljava/lang/String; = "01/01/1900"

.field private static final DEFAULT_SHOWN_WEEK_COUNT:I = 0x6

.field private static final DEFAULT_SHOW_WEEK_NUMBER:Z = true

.field private static final DEFAULT_WEEK_DAY_TEXT_APPEARANCE_RES_ID:I = -0x1

.field private static final GOTO_SCROLL_DURATION:I = 0x3e8

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final MILLIS_IN_DAY:J = 0x5265c00L

.field private static final MILLIS_IN_WEEK:J = 0x240c8400L

.field private static final SCROLL_CHANGE_DELAY:I = 0x28

.field private static final SCROLL_HYST_WEEKS:I = 0x2

.field private static final UNSCALED_BOTTOM_BUFFER:I = 0x14

.field private static final UNSCALED_LIST_SCROLL_TOP_OFFSET:I = 0x2

.field private static final UNSCALED_SELECTED_DATE_VERTICAL_BAR_WIDTH:I = 0x6

.field private static final UNSCALED_WEEK_MIN_VISIBLE_HEIGHT:I = 0xc

.field private static final UNSCALED_WEEK_SEPARATOR_LINE_WIDTH:I = 0x1


# instance fields
.field private mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

.field private mBottomBuffer:I

.field private mCurrentLocale:Ljava/util/Locale;

.field private mCurrentMonthDisplayed:I

.field private mCurrentScrollState:I

.field private final mDateFormat:Ljava/text/DateFormat;

.field private mDateTextAppearanceResId:I

.field private mDateTextSize:I

.field private mDayLabels:[Ljava/lang/String;

.field private mDayNamesHeader:Landroid/view/ViewGroup;

.field private mDaysPerWeek:I

.field private mFirstDayOfMonth:Ljava/util/Calendar;

.field private mFirstDayOfWeek:I

.field private mFocusedMonthDateColor:I

.field private mFriction:F

.field private mIsScrollingUp:Z

.field private mListScrollTopOffset:I

.field private mListView:Landroid/widget/ListView;

.field private mMaxDate:Ljava/util/Calendar;

.field private mMinDate:Ljava/util/Calendar;

.field private mMonthName:Landroid/widget/TextView;

.field private mOnDateChangeListener:Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;

.field private mPreviousScrollPosition:J

.field private mPreviousScrollState:I

.field private mScrollStateChangedRunnable:Lnet/simonvt/calendarview/CalendarView$ScrollStateRunnable;

.field private mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;

.field private final mSelectedDateVerticalBarWidth:I

.field private mSelectedWeekBackgroundColor:I

.field private mShowWeekNumber:Z

.field private mShownWeekCount:I

.field private mTempDate:Ljava/util/Calendar;

.field private mUnfocusedMonthDateColor:I

.field private mVelocityScale:F

.field private mWeekDayTextAppearanceResId:I

.field private mWeekMinVisibleHeight:I

.field private mWeekNumberColor:I

.field private mWeekSeparatorLineColor:I

.field private final mWeekSeperatorLineWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 83
    const-class v0, Lnet/simonvt/calendarview/CalendarView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnet/simonvt/calendarview/CalendarView;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 331
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnet/simonvt/calendarview/CalendarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 332
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 335
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lnet/simonvt/calendarview/CalendarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 336
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v9, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 339
    invoke-direct {p0, p1, p2, v10}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 182
    const/4 v7, 0x2

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mListScrollTopOffset:I

    .line 187
    const/16 v7, 0xc

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekMinVisibleHeight:I

    .line 192
    const/16 v7, 0x14

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mBottomBuffer:I

    .line 207
    const/4 v7, 0x7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I

    .line 212
    const v7, 0x3d4ccccd    # 0.05f

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mFriction:F

    .line 217
    const v7, 0x3eaa7efa    # 0.333f

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mVelocityScale:F

    .line 262
    iput-boolean v10, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    .line 267
    iput v10, p0, Lnet/simonvt/calendarview/CalendarView;->mPreviousScrollState:I

    .line 272
    iput v10, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentScrollState:I

    .line 282
    new-instance v7, Lnet/simonvt/calendarview/CalendarView$ScrollStateRunnable;

    invoke-direct {v7, p0, v9}, Lnet/simonvt/calendarview/CalendarView$ScrollStateRunnable;-><init>(Lnet/simonvt/calendarview/CalendarView;Lnet/simonvt/calendarview/CalendarView$1;)V

    iput-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mScrollStateChangedRunnable:Lnet/simonvt/calendarview/CalendarView$ScrollStateRunnable;

    .line 307
    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string/jumbo v8, "MM/dd/yyyy"

    invoke-direct {v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mDateFormat:Ljava/text/DateFormat;

    .line 342
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-direct {p0, v7}, Lnet/simonvt/calendarview/CalendarView;->setCurrentLocale(Ljava/util/Locale;)V

    .line 344
    sget-object v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView:[I

    sget v8, Lnet/simonvt/calendarview/R$attr;->calendarViewStyle:I

    invoke-virtual {p1, p2, v7, v8, v10}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 346
    .local v0, "attributesArray":Landroid/content/res/TypedArray;
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_showWeekNumber:I

    invoke-virtual {v0, v7, v11}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z

    .line 348
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_firstDayOfWeek:I

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    move-result v8

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    .line 351
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_minDate:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 352
    .local v6, "minDate":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-direct {p0, v6, v7}, Lnet/simonvt/calendarview/CalendarView;->parseDate(Ljava/lang/String;Ljava/util/Calendar;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 353
    :cond_0
    const-string/jumbo v7, "01/01/1900"

    iget-object v8, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-direct {p0, v7, v8}, Lnet/simonvt/calendarview/CalendarView;->parseDate(Ljava/lang/String;Ljava/util/Calendar;)Z

    .line 355
    :cond_1
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_maxDate:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 356
    .local v5, "maxDate":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-direct {p0, v5, v7}, Lnet/simonvt/calendarview/CalendarView;->parseDate(Ljava/lang/String;Ljava/util/Calendar;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 357
    :cond_2
    const-string/jumbo v7, "01/01/2100"

    iget-object v8, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-direct {p0, v7, v8}, Lnet/simonvt/calendarview/CalendarView;->parseDate(Ljava/lang/String;Ljava/util/Calendar;)Z

    .line 359
    :cond_3
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    iget-object v8, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v7, v8}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 360
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v8, "Max date cannot be before min date."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 362
    :cond_4
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_shownWeekCount:I

    const/4 v8, 0x6

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mShownWeekCount:I

    .line 364
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_selectedWeekBackgroundColor:I

    invoke-virtual {v0, v7, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedWeekBackgroundColor:I

    .line 366
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_focusedMonthDateColor:I

    invoke-virtual {v0, v7, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mFocusedMonthDateColor:I

    .line 368
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_unfocusedMonthDateColor:I

    invoke-virtual {v0, v7, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mUnfocusedMonthDateColor:I

    .line 370
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_weekSeparatorLineColor:I

    invoke-virtual {v0, v7, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekSeparatorLineColor:I

    .line 372
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_weekNumberColor:I

    invoke-virtual {v0, v7, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekNumberColor:I

    .line 373
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_selectedDateVerticalBar:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    iput-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;

    .line 376
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_dateTextAppearance:I

    const v8, 0x1030046

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mDateTextAppearanceResId:I

    .line 378
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->updateDateTextSize()V

    .line 380
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_weekDayTextAppearance:I

    const/4 v8, -0x1

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekDayTextAppearanceResId:I

    .line 384
    sget v7, Lnet/simonvt/calendarview/R$styleable;->CalendarView_cv_dividerHorizontal:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 385
    .local v3, "horizontalDivider":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 387
    invoke-virtual {p0}, Lnet/simonvt/calendarview/CalendarView;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 388
    .local v2, "displayMetrics":Landroid/util/DisplayMetrics;
    const/high16 v7, 0x41400000    # 12.0f

    invoke-static {v11, v7, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekMinVisibleHeight:I

    .line 390
    const/high16 v7, 0x40000000    # 2.0f

    invoke-static {v11, v7, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mListScrollTopOffset:I

    .line 392
    const/high16 v7, 0x41a00000    # 20.0f

    invoke-static {v11, v7, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mBottomBuffer:I

    .line 394
    const/high16 v7, 0x40c00000    # 6.0f

    invoke-static {v11, v7, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBarWidth:I

    .line 396
    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v11, v7, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekSeperatorLineWidth:I

    .line 399
    const-string/jumbo v7, "layout_inflater"

    invoke-virtual {p1, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/LayoutInflater;

    .line 401
    .local v4, "layoutInflater":Landroid/view/LayoutInflater;
    sget v7, Lnet/simonvt/calendarview/R$layout;->calendar_view:I

    invoke-virtual {v4, v7, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 402
    .local v1, "content":Landroid/view/View;
    invoke-virtual {p0, v1}, Lnet/simonvt/calendarview/CalendarView;->addView(Landroid/view/View;)V

    .line 404
    const v7, 0x102000a

    invoke-virtual {p0, v7}, Lnet/simonvt/calendarview/CalendarView;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ListView;

    iput-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    .line 405
    sget v7, Lnet/simonvt/calendarview/R$id;->cv_day_names:I

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    iput-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mDayNamesHeader:Landroid/view/ViewGroup;

    .line 406
    sget v7, Lnet/simonvt/calendarview/R$id;->cv_month_name:I

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mMonthName:Landroid/widget/TextView;

    .line 407
    sget v7, Lnet/simonvt/calendarview/R$id;->cv_divider:I

    invoke-virtual {p0, v7}, Lnet/simonvt/calendarview/CalendarView;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    invoke-virtual {v7, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 409
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->setUpHeader()V

    .line 410
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->setUpListView()V

    .line 411
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->setUpAdapter()V

    .line 414
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 415
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    iget-object v8, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v7, v8}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 416
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-direct {p0, v7, v10, v11, v11}, Lnet/simonvt/calendarview/CalendarView;->goTo(Ljava/util/Calendar;ZZZ)V

    .line 423
    :goto_0
    invoke-virtual {p0}, Lnet/simonvt/calendarview/CalendarView;->invalidate()V

    .line 424
    return-void

    .line 417
    :cond_5
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    iget-object v8, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v7, v8}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 418
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-direct {p0, v7, v10, v11, v11}, Lnet/simonvt/calendarview/CalendarView;->goTo(Ljava/util/Calendar;ZZZ)V

    goto :goto_0

    .line 420
    :cond_6
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    invoke-direct {p0, v7, v10, v11, v11}, Lnet/simonvt/calendarview/CalendarView;->goTo(Ljava/util/Calendar;ZZZ)V

    goto :goto_0
.end method

.method static synthetic access$1002(Lnet/simonvt/calendarview/CalendarView;I)I
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;
    .param p1, "x1"    # I

    .prologue
    .line 78
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentScrollState:I

    return p1
.end method

.method static synthetic access$1100(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mPreviousScrollState:I

    return v0
.end method

.method static synthetic access$1102(Lnet/simonvt/calendarview/CalendarView;I)I
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;
    .param p1, "x1"    # I

    .prologue
    .line 78
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mPreviousScrollState:I

    return p1
.end method

.method static synthetic access$1200(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListScrollTopOffset:I

    return v0
.end method

.method static synthetic access$1300(Lnet/simonvt/calendarview/CalendarView;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    return v0
.end method

.method static synthetic access$1400(Lnet/simonvt/calendarview/CalendarView;Ljava/util/Calendar;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;
    .param p1, "x1"    # Ljava/util/Calendar;

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lnet/simonvt/calendarview/CalendarView;->getWeeksSinceMinDate(Ljava/util/Calendar;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1500(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    return-object v0
.end method

.method static synthetic access$1600(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    return-object v0
.end method

.method static synthetic access$1700(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    return v0
.end method

.method static synthetic access$1800(Lnet/simonvt/calendarview/CalendarView;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    return-object v0
.end method

.method static synthetic access$2000(Lnet/simonvt/calendarview/CalendarView;Ljava/util/Calendar;)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;
    .param p1, "x1"    # Ljava/util/Calendar;

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lnet/simonvt/calendarview/CalendarView;->setMonthDisplayed(Ljava/util/Calendar;)V

    return-void
.end method

.method static synthetic access$2100(Lnet/simonvt/calendarview/CalendarView;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z

    return v0
.end method

.method static synthetic access$2200(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I

    return v0
.end method

.method static synthetic access$2300(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mDateTextSize:I

    return v0
.end method

.method static synthetic access$2400(Lnet/simonvt/calendarview/CalendarView;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->isLayoutRtl()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2500(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedWeekBackgroundColor:I

    return v0
.end method

.method static synthetic access$2600(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekSeperatorLineWidth:I

    return v0
.end method

.method static synthetic access$2700(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mFocusedMonthDateColor:I

    return v0
.end method

.method static synthetic access$2800(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mUnfocusedMonthDateColor:I

    return v0
.end method

.method static synthetic access$2900(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekNumberColor:I

    return v0
.end method

.method static synthetic access$3000(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekSeparatorLineColor:I

    return v0
.end method

.method static synthetic access$3100(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBarWidth:I

    return v0
.end method

.method static synthetic access$3200(Lnet/simonvt/calendarview/CalendarView;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$3300(Lnet/simonvt/calendarview/CalendarView;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mShownWeekCount:I

    return v0
.end method

.method static synthetic access$600(Lnet/simonvt/calendarview/CalendarView;)Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mOnDateChangeListener:Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;

    return-object v0
.end method

.method static synthetic access$700(Lnet/simonvt/calendarview/CalendarView;)Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;

    .prologue
    .line 78
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    return-object v0
.end method

.method static synthetic access$800(Lnet/simonvt/calendarview/CalendarView;Landroid/widget/AbsListView;I)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;
    .param p1, "x1"    # Landroid/widget/AbsListView;
    .param p2, "x2"    # I

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Lnet/simonvt/calendarview/CalendarView;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    return-void
.end method

.method static synthetic access$900(Lnet/simonvt/calendarview/CalendarView;Landroid/widget/AbsListView;III)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView;
    .param p1, "x1"    # Landroid/widget/AbsListView;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/simonvt/calendarview/CalendarView;->onScroll(Landroid/widget/AbsListView;III)V

    return-void
.end method

.method private getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;
    .locals 3
    .param p1, "oldCalendar"    # Ljava/util/Calendar;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 989
    if-nez p1, :cond_0

    .line 990
    invoke-static {p2}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v2

    .line 995
    :goto_0
    return-object v2

    .line 992
    :cond_0
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 993
    .local v0, "currentTimeMillis":J
    invoke-static {p2}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v2

    .line 994
    .local v2, "newCalendar":Ljava/util/Calendar;
    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    goto :goto_0
.end method

.method private getWeeksSinceMinDate(Ljava/util/Calendar;)I
    .locals 12
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 1277
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {p1, v6}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1278
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "fromDate: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v8}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " does not precede toDate: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1281
    :cond_0
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v6

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v8

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v8

    int-to-long v8, v8

    add-long v2, v6, v8

    .line 1283
    .local v2, "endTimeMillis":J
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v6}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v6

    iget-object v8, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v8}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v8

    iget-object v9, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v9}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v8

    int-to-long v8, v8

    add-long v4, v6, v8

    .line 1285
    .local v4, "startTimeMillis":J
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    const/4 v7, 0x7

    invoke-virtual {v6, v7}, Ljava/util/Calendar;->get(I)I

    move-result v6

    iget v7, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    sub-int/2addr v6, v7

    int-to-long v6, v6

    const-wide/32 v8, 0x5265c00

    mul-long v0, v6, v8

    .line 1287
    .local v0, "dayOffsetMillis":J
    sub-long v6, v2, v4

    add-long/2addr v6, v0

    const-wide/32 v8, 0x240c8400

    div-long/2addr v6, v8

    long-to-int v6, v6

    return v6
.end method

.method private goTo(Ljava/util/Calendar;ZZZ)V
    .locals 9
    .param p1, "date"    # Ljava/util/Calendar;
    .param p2, "animate"    # Z
    .param p3, "setSelected"    # Z
    .param p4, "forceScroll"    # Z

    .prologue
    const/4 v8, 0x0

    .line 1110
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {p1, v4}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {p1, v4}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1111
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Time not between "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v6}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " and "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v6}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1115
    :cond_1
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    .line 1116
    .local v1, "firstFullyVisiblePosition":I
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v4, v8}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1117
    .local v0, "firstChild":Landroid/view/View;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v4

    if-gez v4, :cond_2

    .line 1118
    add-int/lit8 v1, v1, 0x1

    .line 1120
    :cond_2
    iget v4, p0, Lnet/simonvt/calendarview/CalendarView;->mShownWeekCount:I

    add-int/2addr v4, v1

    add-int/lit8 v2, v4, -0x1

    .line 1121
    .local v2, "lastFullyVisiblePosition":I
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v4

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView;->mBottomBuffer:I

    if-le v4, v5, :cond_3

    .line 1122
    add-int/lit8 v2, v2, -0x1

    .line 1124
    :cond_3
    if-eqz p3, :cond_4

    .line 1125
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    invoke-virtual {v4, p1}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->setSelectedDay(Ljava/util/Calendar;)V

    .line 1128
    :cond_4
    invoke-direct {p0, p1}, Lnet/simonvt/calendarview/CalendarView;->getWeeksSinceMinDate(Ljava/util/Calendar;)I

    move-result v3

    .line 1132
    .local v3, "position":I
    if-lt v3, v1, :cond_5

    if-gt v3, v2, :cond_5

    if-eqz p4, :cond_9

    .line 1134
    :cond_5
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfMonth:Ljava/util/Calendar;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1135
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfMonth:Ljava/util/Calendar;

    const/4 v5, 0x5

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/Calendar;->set(II)V

    .line 1137
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfMonth:Ljava/util/Calendar;

    invoke-direct {p0, v4}, Lnet/simonvt/calendarview/CalendarView;->setMonthDisplayed(Ljava/util/Calendar;)V

    .line 1140
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfMonth:Ljava/util/Calendar;

    iget-object v5, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v4, v5}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1141
    const/4 v3, 0x0

    .line 1146
    :goto_0
    const/4 v4, 0x2

    iput v4, p0, Lnet/simonvt/calendarview/CalendarView;->mPreviousScrollState:I

    .line 1147
    if-eqz p2, :cond_8

    .line 1148
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView;->mListScrollTopOffset:I

    const/16 v6, 0x3e8

    invoke-virtual {v4, v3, v5, v6}, Landroid/widget/ListView;->smoothScrollToPositionFromTop(III)V

    .line 1159
    :cond_6
    :goto_1
    return-void

    .line 1143
    :cond_7
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfMonth:Ljava/util/Calendar;

    invoke-direct {p0, v4}, Lnet/simonvt/calendarview/CalendarView;->getWeeksSinceMinDate(Ljava/util/Calendar;)I

    move-result v3

    goto :goto_0

    .line 1151
    :cond_8
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView;->mListScrollTopOffset:I

    invoke-virtual {v4, v3, v5}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 1153
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-direct {p0, v4, v8}, Lnet/simonvt/calendarview/CalendarView;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    goto :goto_1

    .line 1155
    :cond_9
    if-eqz p3, :cond_6

    .line 1157
    invoke-direct {p0, p1}, Lnet/simonvt/calendarview/CalendarView;->setMonthDisplayed(Ljava/util/Calendar;)V

    goto :goto_1
.end method

.method private invalidateAllWeekViews()V
    .locals 4

    .prologue
    .line 957
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    .line 958
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 959
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 960
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    .line 958
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 962
    .end local v2    # "view":Landroid/view/View;
    :cond_0
    return-void
.end method

.method private isLayoutRtl()Z
    .locals 1

    .prologue
    .line 1878
    const/4 v0, 0x0

    return v0
.end method

.method private isSameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .locals 3
    .param p1, "firstDate"    # Ljava/util/Calendar;
    .param p2, "secondDate"    # Ljava/util/Calendar;

    .prologue
    const/4 v2, 0x6

    const/4 v0, 0x1

    .line 1004
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p2, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v1, v2, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onScroll(Landroid/widget/AbsListView;III)V
    .locals 10
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 1191
    const/4 v7, 0x0

    invoke-virtual {p1, v7}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/simonvt/calendarview/CalendarView$WeekView;

    .line 1192
    .local v0, "child":Lnet/simonvt/calendarview/CalendarView$WeekView;
    if-nez v0, :cond_1

    .line 1250
    :cond_0
    :goto_0
    return-void

    .line 1197
    :cond_1
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v7

    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->getHeight()I

    move-result v8

    mul-int/2addr v7, v8

    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->getBottom()I

    move-result v8

    sub-int/2addr v7, v8

    int-to-long v2, v7

    .line 1200
    .local v2, "currScroll":J
    iget-wide v8, p0, Lnet/simonvt/calendarview/CalendarView;->mPreviousScrollPosition:J

    cmp-long v7, v2, v8

    if-gez v7, :cond_6

    .line 1201
    const/4 v7, 0x1

    iput-boolean v7, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    .line 1212
    :goto_1
    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->getBottom()I

    move-result v7

    iget v8, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekMinVisibleHeight:I

    if-ge v7, v8, :cond_7

    const/4 v6, 0x1

    .line 1213
    .local v6, "offset":I
    :goto_2
    iget-boolean v7, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    if-eqz v7, :cond_8

    .line 1214
    add-int/lit8 v7, v6, 0x2

    invoke-virtual {p1, v7}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "child":Lnet/simonvt/calendarview/CalendarView$WeekView;
    check-cast v0, Lnet/simonvt/calendarview/CalendarView$WeekView;

    .line 1221
    .restart local v0    # "child":Lnet/simonvt/calendarview/CalendarView$WeekView;
    :cond_2
    :goto_3
    iget-boolean v7, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    if-eqz v7, :cond_9

    .line 1222
    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->getMonthOfFirstWeekDay()I

    move-result v4

    .line 1229
    .local v4, "month":I
    :goto_4
    iget v7, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentMonthDisplayed:I

    const/16 v8, 0xb

    if-ne v7, v8, :cond_a

    if-nez v4, :cond_a

    .line 1230
    const/4 v5, 0x1

    .line 1239
    .local v5, "monthDiff":I
    :goto_5
    iget-boolean v7, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    if-nez v7, :cond_3

    if-gtz v5, :cond_4

    :cond_3
    iget-boolean v7, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    if-eqz v7, :cond_5

    if-gez v5, :cond_5

    .line 1240
    :cond_4
    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->getFirstDay()Ljava/util/Calendar;

    move-result-object v1

    .line 1241
    .local v1, "firstDay":Ljava/util/Calendar;
    iget-boolean v7, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    if-eqz v7, :cond_c

    .line 1242
    const/4 v7, 0x5

    const/4 v8, -0x7

    invoke-virtual {v1, v7, v8}, Ljava/util/Calendar;->add(II)V

    .line 1246
    :goto_6
    invoke-direct {p0, v1}, Lnet/simonvt/calendarview/CalendarView;->setMonthDisplayed(Ljava/util/Calendar;)V

    .line 1248
    .end local v1    # "firstDay":Ljava/util/Calendar;
    :cond_5
    iput-wide v2, p0, Lnet/simonvt/calendarview/CalendarView;->mPreviousScrollPosition:J

    .line 1249
    iget v7, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentScrollState:I

    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mPreviousScrollState:I

    goto :goto_0

    .line 1202
    .end local v4    # "month":I
    .end local v5    # "monthDiff":I
    .end local v6    # "offset":I
    :cond_6
    iget-wide v8, p0, Lnet/simonvt/calendarview/CalendarView;->mPreviousScrollPosition:J

    cmp-long v7, v2, v8

    if-lez v7, :cond_0

    .line 1203
    const/4 v7, 0x0

    iput-boolean v7, p0, Lnet/simonvt/calendarview/CalendarView;->mIsScrollingUp:Z

    goto :goto_1

    .line 1212
    :cond_7
    const/4 v6, 0x0

    goto :goto_2

    .line 1215
    .restart local v6    # "offset":I
    :cond_8
    if-eqz v6, :cond_2

    .line 1216
    invoke-virtual {p1, v6}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "child":Lnet/simonvt/calendarview/CalendarView$WeekView;
    check-cast v0, Lnet/simonvt/calendarview/CalendarView$WeekView;

    .restart local v0    # "child":Lnet/simonvt/calendarview/CalendarView$WeekView;
    goto :goto_3

    .line 1224
    :cond_9
    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->getMonthOfLastWeekDay()I

    move-result v4

    .restart local v4    # "month":I
    goto :goto_4

    .line 1231
    :cond_a
    iget v7, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentMonthDisplayed:I

    if-nez v7, :cond_b

    const/16 v7, 0xb

    if-ne v4, v7, :cond_b

    .line 1232
    const/4 v5, -0x1

    .restart local v5    # "monthDiff":I
    goto :goto_5

    .line 1234
    .end local v5    # "monthDiff":I
    :cond_b
    iget v7, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentMonthDisplayed:I

    sub-int v5, v4, v7

    .restart local v5    # "monthDiff":I
    goto :goto_5

    .line 1244
    .restart local v1    # "firstDay":Ljava/util/Calendar;
    :cond_c
    const/4 v7, 0x5

    const/4 v8, 0x7

    invoke-virtual {v1, v7, v8}, Ljava/util/Calendar;->add(II)V

    goto :goto_6
.end method

.method private onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 1182
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mScrollStateChangedRunnable:Lnet/simonvt/calendarview/CalendarView$ScrollStateRunnable;

    invoke-virtual {v0, p1, p2}, Lnet/simonvt/calendarview/CalendarView$ScrollStateRunnable;->doScrollStateChange(Landroid/widget/AbsListView;I)V

    .line 1183
    return-void
.end method

.method private parseDate(Ljava/lang/String;Ljava/util/Calendar;)Z
    .locals 4
    .param p1, "date"    # Ljava/lang/String;
    .param p2, "outDate"    # Ljava/util/Calendar;

    .prologue
    .line 1169
    :try_start_0
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mDateFormat:Ljava/text/DateFormat;

    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1170
    const/4 v1, 0x1

    .line 1173
    :goto_0
    return v1

    .line 1171
    :catch_0
    move-exception v0

    .line 1172
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Lnet/simonvt/calendarview/CalendarView;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Date: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " not in format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "MM/dd/yyyy"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1173
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setCurrentLocale(Ljava/util/Locale;)V
    .locals 1
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 970
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentLocale:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 980
    :goto_0
    return-void

    .line 974
    :cond_0
    iput-object p1, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentLocale:Ljava/util/Locale;

    .line 976
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    invoke-direct {p0, v0, p1}, Lnet/simonvt/calendarview/CalendarView;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    .line 977
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfMonth:Ljava/util/Calendar;

    invoke-direct {p0, v0, p1}, Lnet/simonvt/calendarview/CalendarView;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfMonth:Ljava/util/Calendar;

    .line 978
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-direct {p0, v0, p1}, Lnet/simonvt/calendarview/CalendarView;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    .line 979
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-direct {p0, v0, p1}, Lnet/simonvt/calendarview/CalendarView;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    goto :goto_0
.end method

.method private setMonthDisplayed(Ljava/util/Calendar;)V
    .locals 9
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 1259
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v7

    .line 1260
    .local v7, "newMonthDisplayed":I
    iget v1, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentMonthDisplayed:I

    if-eq v1, v7, :cond_0

    .line 1261
    iput v7, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentMonthDisplayed:I

    .line 1262
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    iget v4, p0, Lnet/simonvt/calendarview/CalendarView;->mCurrentMonthDisplayed:I

    invoke-virtual {v1, v4}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->setFocusMonth(I)V

    .line 1263
    const/16 v0, 0x34

    .line 1265
    .local v0, "flags":I
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 1266
    .local v2, "millis":J
    invoke-virtual {p0}, Lnet/simonvt/calendarview/CalendarView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v6, 0x34

    move-wide v4, v2

    invoke-static/range {v1 .. v6}, Landroid/text/format/DateUtils;->formatDateRange(Landroid/content/Context;JJI)Ljava/lang/String;

    move-result-object v8

    .line 1267
    .local v8, "newMonthName":Ljava/lang/String;
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mMonthName:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1268
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mMonthName:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->invalidate()V

    .line 1270
    .end local v0    # "flags":I
    .end local v2    # "millis":J
    .end local v8    # "newMonthName":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private setUpAdapter()V
    .locals 2

    .prologue
    .line 1012
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    if-nez v0, :cond_0

    .line 1013
    new-instance v0, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    invoke-virtual {p0}, Lnet/simonvt/calendarview/CalendarView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;-><init>(Lnet/simonvt/calendarview/CalendarView;Landroid/content/Context;)V

    iput-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    .line 1014
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    new-instance v1, Lnet/simonvt/calendarview/CalendarView$1;

    invoke-direct {v1, p0}, Lnet/simonvt/calendarview/CalendarView$1;-><init>(Lnet/simonvt/calendarview/CalendarView;)V

    invoke-virtual {v0, v1}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 1026
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1030
    :cond_0
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->notifyDataSetChanged()V

    .line 1031
    return-void
.end method

.method private setUpHeader()V
    .locals 9

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x0

    .line 1037
    iget v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I

    new-array v4, v4, [Ljava/lang/String;

    iput-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDayLabels:[Ljava/lang/String;

    .line 1038
    iget v2, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    .local v2, "i":I
    iget v4, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I

    add-int v1, v4, v5

    .local v1, "count":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 1039
    const/4 v4, 0x7

    if-le v2, v4, :cond_0

    add-int/lit8 v0, v2, -0x7

    .line 1040
    .local v0, "calendarDay":I
    :goto_1
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDayLabels:[Ljava/lang/String;

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    sub-int v5, v2, v5

    const/16 v6, 0x32

    invoke-static {v0, v6}, Landroid/text/format/DateUtils;->getDayOfWeekString(II)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 1038
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "calendarDay":I
    :cond_0
    move v0, v2

    .line 1039
    goto :goto_1

    .line 1044
    :cond_1
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDayNamesHeader:Landroid/view/ViewGroup;

    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 1045
    .local v3, "label":Landroid/widget/TextView;
    iget-boolean v4, p0, Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z

    if-eqz v4, :cond_3

    .line 1046
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1050
    :goto_2
    const/4 v2, 0x1

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDayNamesHeader:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    :goto_3
    if-ge v2, v1, :cond_5

    .line 1051
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDayNamesHeader:Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "label":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 1052
    .restart local v3    # "label":Landroid/widget/TextView;
    iget v4, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekDayTextAppearanceResId:I

    const/4 v5, -0x1

    if-le v4, v5, :cond_2

    .line 1053
    invoke-virtual {p0}, Lnet/simonvt/calendarview/CalendarView;->getContext()Landroid/content/Context;

    move-result-object v4

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekDayTextAppearanceResId:I

    invoke-virtual {v3, v4, v5}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 1055
    :cond_2
    iget v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I

    add-int/lit8 v4, v4, 0x1

    if-ge v2, v4, :cond_4

    .line 1056
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDayLabels:[Ljava/lang/String;

    add-int/lit8 v5, v2, -0x1

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1057
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1050
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1048
    :cond_3
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    .line 1059
    :cond_4
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_4

    .line 1062
    :cond_5
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView;->mDayNamesHeader:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->invalidate()V

    .line 1063
    return-void
.end method

.method private setUpListView()V
    .locals 2

    .prologue
    .line 1070
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 1071
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 1072
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    .line 1073
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    new-instance v1, Lnet/simonvt/calendarview/CalendarView$2;

    invoke-direct {v1, p0}, Lnet/simonvt/calendarview/CalendarView$2;-><init>(Lnet/simonvt/calendarview/CalendarView;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 1086
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 1087
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    iget v1, p0, Lnet/simonvt/calendarview/CalendarView;->mFriction:F

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setFriction(F)V

    .line 1088
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    iget v1, p0, Lnet/simonvt/calendarview/CalendarView;->mVelocityScale:F

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVelocityScale(F)V

    .line 1090
    :cond_0
    return-void
.end method

.method private updateDateTextSize()V
    .locals 4

    .prologue
    .line 946
    invoke-virtual {p0}, Lnet/simonvt/calendarview/CalendarView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lnet/simonvt/calendarview/CalendarView;->mDateTextAppearanceResId:I

    sget-object v3, Lnet/simonvt/calendarview/R$styleable;->TextAppearanceCompatStyleable:[I

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 948
    .local v0, "dateTextAppearance":Landroid/content/res/TypedArray;
    sget v1, Lnet/simonvt/calendarview/R$styleable;->TextAppearanceCompatStyleable_android_textSize:I

    const/16 v2, 0xe

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lnet/simonvt/calendarview/CalendarView;->mDateTextSize:I

    .line 950
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 951
    return-void
.end method


# virtual methods
.method public getDate()J
    .locals 2

    .prologue
    .line 903
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    # getter for: Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->mSelectedDate:Ljava/util/Calendar;
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->access$400(Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDateTextAppearance()I
    .locals 1

    .prologue
    .line 688
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mDateTextAppearanceResId:I

    return v0
.end method

.method public getFirstDayOfWeek()I
    .locals 1

    .prologue
    .line 859
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    return v0
.end method

.method public getFocusedMonthDateColor()I
    .locals 1

    .prologue
    .line 510
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mFocusedMonthDateColor:I

    return v0
.end method

.method public getMaxDate()J
    .locals 2

    .prologue
    .line 784
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMinDate()J
    .locals 2

    .prologue
    .line 732
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSelectedDateVerticalBar()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 637
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getSelectedWeekBackgroundColor()I
    .locals 1

    .prologue
    .line 479
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedWeekBackgroundColor:I

    return v0
.end method

.method public getShowWeekNumber()Z
    .locals 1

    .prologue
    .line 840
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z

    return v0
.end method

.method public getShownWeekCount()I
    .locals 1

    .prologue
    .line 448
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mShownWeekCount:I

    return v0
.end method

.method public getUnfocusedMonthDateColor()I
    .locals 1

    .prologue
    .line 541
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mFocusedMonthDateColor:I

    return v0
.end method

.method public getWeekDayTextAppearance()I
    .locals 1

    .prologue
    .line 662
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekDayTextAppearanceResId:I

    return v0
.end method

.method public getWeekNumberColor()I
    .locals 1

    .prologue
    .line 568
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekNumberColor:I

    return v0
.end method

.method public getWeekSeparatorLineColor()I
    .locals 1

    .prologue
    .line 593
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekSeparatorLineColor:I

    return v0
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 698
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->isEnabled()Z

    move-result v0

    return v0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 703
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 704
    iget-object v0, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-direct {p0, v0}, Lnet/simonvt/calendarview/CalendarView;->setCurrentLocale(Ljava/util/Locale;)V

    .line 705
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 709
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 710
    const-class v0, Lnet/simonvt/calendarview/CalendarView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 711
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 715
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 716
    const-class v0, Lnet/simonvt/calendarview/CalendarView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 717
    return-void
.end method

.method public setDate(J)V
    .locals 1
    .param p1, "date"    # J

    .prologue
    const/4 v0, 0x0

    .line 920
    invoke-virtual {p0, p1, p2, v0, v0}, Lnet/simonvt/calendarview/CalendarView;->setDate(JZZ)V

    .line 921
    return-void
.end method

.method public setDate(JZZ)V
    .locals 3
    .param p1, "date"    # J
    .param p3, "animate"    # Z
    .param p4, "center"    # Z

    .prologue
    .line 938
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 939
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    # getter for: Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->mSelectedDate:Ljava/util/Calendar;
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->access$400(Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;)Ljava/util/Calendar;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lnet/simonvt/calendarview/CalendarView;->isSameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 943
    :goto_0
    return-void

    .line 942
    :cond_0
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    const/4 v1, 0x1

    invoke-direct {p0, v0, p3, v1, p4}, Lnet/simonvt/calendarview/CalendarView;->goTo(Ljava/util/Calendar;ZZZ)V

    goto :goto_0
.end method

.method public setDateTextAppearance(I)V
    .locals 1
    .param p1, "resourceId"    # I

    .prologue
    .line 673
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mDateTextAppearanceResId:I

    if-eq v0, p1, :cond_0

    .line 674
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mDateTextAppearanceResId:I

    .line 675
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->updateDateTextSize()V

    .line 676
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->invalidateAllWeekViews()V

    .line 678
    :cond_0
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 693
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 694
    return-void
.end method

.method public setFirstDayOfWeek(I)V
    .locals 1
    .param p1, "firstDayOfWeek"    # I

    .prologue
    .line 878
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    if-ne v0, p1, :cond_0

    .line 885
    :goto_0
    return-void

    .line 881
    :cond_0
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I

    .line 882
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    # invokes: Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->init()V
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->access$500(Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;)V

    .line 883
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->notifyDataSetChanged()V

    .line 884
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->setUpHeader()V

    goto :goto_0
.end method

.method public setFocusedMonthDateColor(I)V
    .locals 4
    .param p1, "color"    # I

    .prologue
    .line 490
    iget v3, p0, Lnet/simonvt/calendarview/CalendarView;->mFocusedMonthDateColor:I

    if-eq v3, p1, :cond_1

    .line 491
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mFocusedMonthDateColor:I

    .line 492
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    .line 493
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 494
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lnet/simonvt/calendarview/CalendarView$WeekView;

    .line 495
    .local v2, "weekView":Lnet/simonvt/calendarview/CalendarView$WeekView;
    # getter for: Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasFocusedDay:Z
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView$WeekView;->access$200(Lnet/simonvt/calendarview/CalendarView$WeekView;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 496
    invoke-virtual {v2}, Lnet/simonvt/calendarview/CalendarView$WeekView;->invalidate()V

    .line 493
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 500
    .end local v0    # "childCount":I
    .end local v1    # "i":I
    .end local v2    # "weekView":Lnet/simonvt/calendarview/CalendarView$WeekView;
    :cond_1
    return-void
.end method

.method public setMaxDate(J)V
    .locals 5
    .param p1, "maxDate"    # J

    .prologue
    const/4 v3, 0x0

    .line 797
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v1, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 798
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-direct {p0, v1, v2}, Lnet/simonvt/calendarview/CalendarView;->isSameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 814
    :goto_0
    return-void

    .line 801
    :cond_0
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v1, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 803
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    # invokes: Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->init()V
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->access$500(Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;)V

    .line 804
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    # getter for: Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->mSelectedDate:Ljava/util/Calendar;
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->access$400(Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;)Ljava/util/Calendar;

    move-result-object v0

    .line 805
    .local v0, "date":Ljava/util/Calendar;
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 806
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lnet/simonvt/calendarview/CalendarView;->setDate(J)V

    goto :goto_0

    .line 812
    :cond_1
    const/4 v1, 0x1

    invoke-direct {p0, v0, v3, v1, v3}, Lnet/simonvt/calendarview/CalendarView;->goTo(Ljava/util/Calendar;ZZZ)V

    goto :goto_0
.end method

.method public setMinDate(J)V
    .locals 5
    .param p1, "minDate"    # J

    .prologue
    const/4 v3, 0x0

    .line 745
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v1, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 746
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-direct {p0, v1, v2}, Lnet/simonvt/calendarview/CalendarView;->isSameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 769
    :goto_0
    return-void

    .line 749
    :cond_0
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v1, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 754
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    # getter for: Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->mSelectedDate:Ljava/util/Calendar;
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->access$400(Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;)Ljava/util/Calendar;

    move-result-object v0

    .line 755
    .local v0, "date":Ljava/util/Calendar;
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 756
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v1, v2}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->setSelectedDay(Ljava/util/Calendar;)V

    .line 759
    :cond_1
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    # invokes: Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->init()V
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->access$500(Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;)V

    .line 760
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 761
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lnet/simonvt/calendarview/CalendarView;->setDate(J)V

    goto :goto_0

    .line 767
    :cond_2
    const/4 v1, 0x1

    invoke-direct {p0, v0, v3, v1, v3}, Lnet/simonvt/calendarview/CalendarView;->goTo(Ljava/util/Calendar;ZZZ)V

    goto :goto_0
.end method

.method public setOnDateChangeListener(Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;)V
    .locals 0
    .param p1, "listener"    # Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;

    .prologue
    .line 893
    iput-object p1, p0, Lnet/simonvt/calendarview/CalendarView;->mOnDateChangeListener:Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;

    .line 894
    return-void
.end method

.method public setSelectedDateVerticalBar(I)V
    .locals 2
    .param p1, "resourceId"    # I

    .prologue
    .line 605
    invoke-virtual {p0}, Lnet/simonvt/calendarview/CalendarView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 606
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0, v0}, Lnet/simonvt/calendarview/CalendarView;->setSelectedDateVerticalBar(Landroid/graphics/drawable/Drawable;)V

    .line 607
    return-void
.end method

.method public setSelectedDateVerticalBar(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 618
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;

    if-eq v3, p1, :cond_1

    .line 619
    iput-object p1, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;

    .line 620
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    .line 621
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 622
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lnet/simonvt/calendarview/CalendarView$WeekView;

    .line 623
    .local v2, "weekView":Lnet/simonvt/calendarview/CalendarView$WeekView;
    # getter for: Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasSelectedDay:Z
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView$WeekView;->access$100(Lnet/simonvt/calendarview/CalendarView$WeekView;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 624
    invoke-virtual {v2}, Lnet/simonvt/calendarview/CalendarView$WeekView;->invalidate()V

    .line 621
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 628
    .end local v0    # "childCount":I
    .end local v1    # "i":I
    .end local v2    # "weekView":Lnet/simonvt/calendarview/CalendarView$WeekView;
    :cond_1
    return-void
.end method

.method public setSelectedWeekBackgroundColor(I)V
    .locals 4
    .param p1, "color"    # I

    .prologue
    .line 459
    iget v3, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedWeekBackgroundColor:I

    if-eq v3, p1, :cond_1

    .line 460
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mSelectedWeekBackgroundColor:I

    .line 461
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    .line 462
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 463
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lnet/simonvt/calendarview/CalendarView$WeekView;

    .line 464
    .local v2, "weekView":Lnet/simonvt/calendarview/CalendarView$WeekView;
    # getter for: Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasSelectedDay:Z
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView$WeekView;->access$100(Lnet/simonvt/calendarview/CalendarView$WeekView;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 465
    invoke-virtual {v2}, Lnet/simonvt/calendarview/CalendarView$WeekView;->invalidate()V

    .line 462
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 469
    .end local v0    # "childCount":I
    .end local v1    # "i":I
    .end local v2    # "weekView":Lnet/simonvt/calendarview/CalendarView$WeekView;
    :cond_1
    return-void
.end method

.method public setShowWeekNumber(Z)V
    .locals 1
    .param p1, "showWeekNumber"    # Z

    .prologue
    .line 824
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z

    if-ne v0, p1, :cond_0

    .line 830
    :goto_0
    return-void

    .line 827
    :cond_0
    iput-boolean p1, p0, Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z

    .line 828
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView;->mAdapter:Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;

    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView$WeeksAdapter;->notifyDataSetChanged()V

    .line 829
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->setUpHeader()V

    goto :goto_0
.end method

.method public setShownWeekCount(I)V
    .locals 1
    .param p1, "count"    # I

    .prologue
    .line 434
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mShownWeekCount:I

    if-eq v0, p1, :cond_0

    .line 435
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mShownWeekCount:I

    .line 436
    invoke-virtual {p0}, Lnet/simonvt/calendarview/CalendarView;->invalidate()V

    .line 438
    :cond_0
    return-void
.end method

.method public setUnfocusedMonthDateColor(I)V
    .locals 4
    .param p1, "color"    # I

    .prologue
    .line 521
    iget v3, p0, Lnet/simonvt/calendarview/CalendarView;->mUnfocusedMonthDateColor:I

    if-eq v3, p1, :cond_1

    .line 522
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mUnfocusedMonthDateColor:I

    .line 523
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    .line 524
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 525
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lnet/simonvt/calendarview/CalendarView$WeekView;

    .line 526
    .local v2, "weekView":Lnet/simonvt/calendarview/CalendarView$WeekView;
    # getter for: Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasUnfocusedDay:Z
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView$WeekView;->access$300(Lnet/simonvt/calendarview/CalendarView$WeekView;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 527
    invoke-virtual {v2}, Lnet/simonvt/calendarview/CalendarView$WeekView;->invalidate()V

    .line 524
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 531
    .end local v0    # "childCount":I
    .end local v1    # "i":I
    .end local v2    # "weekView":Lnet/simonvt/calendarview/CalendarView$WeekView;
    :cond_1
    return-void
.end method

.method public setWeekDayTextAppearance(I)V
    .locals 1
    .param p1, "resourceId"    # I

    .prologue
    .line 648
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekDayTextAppearanceResId:I

    if-eq v0, p1, :cond_0

    .line 649
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekDayTextAppearanceResId:I

    .line 650
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->setUpHeader()V

    .line 652
    :cond_0
    return-void
.end method

.method public setWeekNumberColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 552
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekNumberColor:I

    if-eq v0, p1, :cond_0

    .line 553
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekNumberColor:I

    .line 554
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z

    if-eqz v0, :cond_0

    .line 555
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->invalidateAllWeekViews()V

    .line 558
    :cond_0
    return-void
.end method

.method public setWeekSeparatorLineColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 579
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekSeparatorLineColor:I

    if-eq v0, p1, :cond_0

    .line 580
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView;->mWeekSeparatorLineColor:I

    .line 581
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView;->invalidateAllWeekViews()V

    .line 583
    :cond_0
    return-void
.end method
