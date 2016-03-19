.class Lnet/simonvt/calendarview/CalendarView$WeekView;
.super Landroid/view/View;
.source "CalendarView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/simonvt/calendarview/CalendarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WeekView"
.end annotation


# instance fields
.field private mDayNumbers:[Ljava/lang/String;

.field private final mDrawPaint:Landroid/graphics/Paint;

.field private mFirstDay:Ljava/util/Calendar;

.field private mFocusDay:[Z

.field private mHasFocusedDay:Z

.field private mHasSelectedDay:Z

.field private mHasUnfocusedDay:Z

.field private mHeight:I

.field private mLastWeekDayMonth:I

.field private final mMonthNumDrawPaint:Landroid/graphics/Paint;

.field private mMonthOfFirstWeekDay:I

.field private mNumCells:I

.field private mSelectedDay:I

.field private mSelectedLeft:I

.field private mSelectedRight:I

.field private final mTempRect:Landroid/graphics/Rect;

.field private mWeek:I

.field private mWidth:I

.field final synthetic this$0:Lnet/simonvt/calendarview/CalendarView;


# direct methods
.method public constructor <init>(Lnet/simonvt/calendarview/CalendarView;Landroid/content/Context;)V
    .locals 2
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, -0x1

    .line 1548
    iput-object p1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    .line 1549
    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 1496
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    .line 1498
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    .line 1500
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    .line 1518
    iput v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthOfFirstWeekDay:I

    .line 1521
    iput v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mLastWeekDayMonth:I

    .line 1525
    iput v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWeek:I

    .line 1534
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasSelectedDay:Z

    .line 1537
    iput v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedDay:I

    .line 1543
    iput v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedLeft:I

    .line 1546
    iput v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedRight:I

    .line 1552
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->initilaizePaints()V

    .line 1553
    return-void
.end method

.method static synthetic access$100(Lnet/simonvt/calendarview/CalendarView$WeekView;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView$WeekView;

    .prologue
    .line 1494
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasSelectedDay:Z

    return v0
.end method

.method static synthetic access$200(Lnet/simonvt/calendarview/CalendarView$WeekView;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView$WeekView;

    .prologue
    .line 1494
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasFocusedDay:Z

    return v0
.end method

.method static synthetic access$300(Lnet/simonvt/calendarview/CalendarView$WeekView;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/calendarview/CalendarView$WeekView;

    .prologue
    .line 1494
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasUnfocusedDay:Z

    return v0
.end method

.method private drawBackground(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    .line 1715
    iget-boolean v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasSelectedDay:Z

    if-nez v2, :cond_0

    .line 1742
    :goto_0
    return-void

    .line 1718
    :cond_0
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedWeekBackgroundColor:I
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$2500(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1720
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mWeekSeperatorLineWidth:I
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$2600(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->top:I

    .line 1721
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHeight:I

    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 1723
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # invokes: Lnet/simonvt/calendarview/CalendarView;->isLayoutRtl()Z
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView;->access$2400(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v0

    .line 1725
    .local v0, "isLayoutRtl":Z
    if-eqz v0, :cond_1

    .line 1726
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iput v1, v2, Landroid/graphics/Rect;->left:I

    .line 1727
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedLeft:I

    add-int/lit8 v2, v2, -0x2

    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 1732
    :goto_1
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 1734
    if-eqz v0, :cond_4

    .line 1735
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedRight:I

    add-int/lit8 v2, v2, 0x3

    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 1736
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int/2addr v3, v4

    sub-int/2addr v1, v3

    :goto_2
    iput v1, v2, Landroid/graphics/Rect;->right:I

    .line 1741
    :goto_3
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 1729
    :cond_1
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int/2addr v1, v3

    :cond_2
    iput v1, v2, Landroid/graphics/Rect;->left:I

    .line 1730
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedLeft:I

    add-int/lit8 v2, v2, -0x2

    iput v2, v1, Landroid/graphics/Rect;->right:I

    goto :goto_1

    .line 1736
    :cond_3
    iget v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    goto :goto_2

    .line 1738
    :cond_4
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedRight:I

    add-int/lit8 v2, v2, 0x3

    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 1739
    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mTempRect:Landroid/graphics/Rect;

    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iput v2, v1, Landroid/graphics/Rect;->right:I

    goto :goto_3
.end method

.method private drawSelectedDateVerticalBars(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1822
    iget-boolean v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasSelectedDay:Z

    if-nez v0, :cond_0

    .line 1833
    :goto_0
    return-void

    .line 1825
    :cond_0
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$3200(Lnet/simonvt/calendarview/CalendarView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedLeft:I

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBarWidth:I
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView;->access$3100(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mWeekSeperatorLineWidth:I
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView;->access$2600(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v2

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedLeft:I

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBarWidth:I
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$3100(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    iget v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHeight:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1828
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$3200(Lnet/simonvt/calendarview/CalendarView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1829
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$3200(Lnet/simonvt/calendarview/CalendarView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedRight:I

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBarWidth:I
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView;->access$3100(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mWeekSeperatorLineWidth:I
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView;->access$2600(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v2

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedRight:I

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBarWidth:I
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$3100(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    iget v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHeight:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1832
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mSelectedDateVerticalBar:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$3200(Lnet/simonvt/calendarview/CalendarView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method private drawWeekNumbersAndDates(Landroid/graphics/Canvas;)V
    .locals 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v10, 0x0

    .line 1750
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {v6}, Landroid/graphics/Paint;->getTextSize()F

    move-result v3

    .line 1751
    .local v3, "textHeight":F
    iget v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHeight:I

    int-to-float v6, v6

    add-float/2addr v6, v3

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    float-to-int v6, v6

    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mWeekSeperatorLineWidth:I
    invoke-static {v7}, Lnet/simonvt/calendarview/CalendarView;->access$2600(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v7

    sub-int v5, v6, v7

    .line 1752
    .local v5, "y":I
    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    .line 1753
    .local v2, "nDays":I
    mul-int/lit8 v0, v2, 0x2

    .line 1755
    .local v0, "divisor":I
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 1756
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mDateTextSize:I
    invoke-static {v7}, Lnet/simonvt/calendarview/CalendarView;->access$2300(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 1758
    const/4 v1, 0x0

    .line 1760
    .local v1, "i":I
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # invokes: Lnet/simonvt/calendarview/CalendarView;->isLayoutRtl()Z
    invoke-static {v6}, Lnet/simonvt/calendarview/CalendarView;->access$2400(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1761
    :goto_0
    add-int/lit8 v6, v2, -0x1

    if-ge v1, v6, :cond_1

    .line 1762
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mFocusDay:[Z

    aget-boolean v6, v6, v1

    if-eqz v6, :cond_0

    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mFocusedMonthDateColor:I
    invoke-static {v6}, Lnet/simonvt/calendarview/CalendarView;->access$2700(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v6

    :goto_1
    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 1764
    mul-int/lit8 v6, v1, 0x2

    add-int/lit8 v6, v6, 0x1

    iget v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    mul-int/2addr v6, v7

    div-int v4, v6, v0

    .line 1765
    .local v4, "x":I
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDayNumbers:[Ljava/lang/String;

    add-int/lit8 v7, v2, -0x1

    sub-int/2addr v7, v1

    aget-object v6, v6, v7

    int-to-float v7, v4

    int-to-float v8, v5

    iget-object v9, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v7, v8, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1761
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1762
    .end local v4    # "x":I
    :cond_0
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mUnfocusedMonthDateColor:I
    invoke-static {v6}, Lnet/simonvt/calendarview/CalendarView;->access$2800(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v6

    goto :goto_1

    .line 1767
    :cond_1
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v6}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1768
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mWeekNumberColor:I
    invoke-static {v7}, Lnet/simonvt/calendarview/CalendarView;->access$2900(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 1769
    iget v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    div-int/2addr v7, v0

    sub-int v4, v6, v7

    .line 1770
    .restart local v4    # "x":I
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDayNumbers:[Ljava/lang/String;

    aget-object v6, v6, v10

    int-to-float v7, v4

    int-to-float v8, v5

    iget-object v9, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v7, v8, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1786
    .end local v4    # "x":I
    :cond_2
    return-void

    .line 1773
    :cond_3
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v6}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1774
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mWeekNumberColor:I
    invoke-static {v7}, Lnet/simonvt/calendarview/CalendarView;->access$2900(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 1775
    iget v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    div-int v4, v6, v0

    .line 1776
    .restart local v4    # "x":I
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDayNumbers:[Ljava/lang/String;

    aget-object v6, v6, v10

    int-to-float v7, v4

    int-to-float v8, v5

    iget-object v9, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v7, v8, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1777
    add-int/lit8 v1, v1, 0x1

    .line 1779
    .end local v4    # "x":I
    :cond_4
    :goto_2
    if-ge v1, v2, :cond_2

    .line 1780
    iget-object v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mFocusDay:[Z

    aget-boolean v6, v6, v1

    if-eqz v6, :cond_5

    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mFocusedMonthDateColor:I
    invoke-static {v6}, Lnet/simonvt/calendarview/CalendarView;->access$2700(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v6

    :goto_3
    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 1782
    mul-int/lit8 v6, v1, 0x2

    add-int/lit8 v6, v6, 0x1

    iget v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    mul-int/2addr v6, v7

    div-int v4, v6, v0

    .line 1783
    .restart local v4    # "x":I
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDayNumbers:[Ljava/lang/String;

    aget-object v6, v6, v1

    int-to-float v7, v4

    int-to-float v8, v5

    iget-object v9, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v7, v8, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1779
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1780
    .end local v4    # "x":I
    :cond_5
    iget-object v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mUnfocusedMonthDateColor:I
    invoke-static {v6}, Lnet/simonvt/calendarview/CalendarView;->access$2800(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v6

    goto :goto_3
.end method

.method private drawWeekSeparators(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 1795
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$1800(Lnet/simonvt/calendarview/CalendarView;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v6

    .line 1796
    .local v6, "firstFullyVisiblePosition":I
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$1800(Lnet/simonvt/calendarview/CalendarView;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    if-gez v0, :cond_0

    .line 1797
    add-int/lit8 v6, v6, 0x1

    .line 1799
    :cond_0
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWeek:I

    if-ne v6, v0, :cond_1

    .line 1814
    :goto_0
    return-void

    .line 1802
    :cond_1
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mWeekSeparatorLineColor:I
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$3000(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 1803
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mWeekSeperatorLineWidth:I
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$2600(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1806
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # invokes: Lnet/simonvt/calendarview/CalendarView;->isLayoutRtl()Z
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$2400(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1807
    const/4 v1, 0x0

    .line 1808
    .local v1, "startX":F
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int/2addr v4, v5

    sub-int/2addr v0, v4

    int-to-float v3, v0

    .line 1813
    .local v3, "stopX":F
    :goto_1
    iget-object v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 1808
    .end local v3    # "stopX":F
    :cond_2
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    int-to-float v3, v0

    goto :goto_1

    .line 1810
    .end local v1    # "startX":F
    :cond_3
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int/2addr v0, v4

    int-to-float v1, v0

    .line 1811
    .restart local v1    # "startX":F
    :goto_2
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    int-to-float v3, v0

    .restart local v3    # "stopX":F
    goto :goto_1

    .end local v1    # "startX":F
    .end local v3    # "stopX":F
    :cond_4
    move v1, v2

    .line 1810
    goto :goto_2
.end method

.method private initilaizePaints()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1624
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 1625
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 1626
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDrawPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1628
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 1629
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 1630
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1631
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 1632
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthNumDrawPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mDateTextSize:I
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView;->access$2300(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 1633
    return-void
.end method

.method private updateSelectionPositions()V
    .locals 5

    .prologue
    .line 1845
    iget-boolean v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasSelectedDay:Z

    if-eqz v2, :cond_2

    .line 1846
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # invokes: Lnet/simonvt/calendarview/CalendarView;->isLayoutRtl()Z
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView;->access$2400(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v0

    .line 1847
    .local v0, "isLayoutRtl":Z
    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedDay:I

    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1700(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v3

    sub-int v1, v2, v3

    .line 1848
    .local v1, "selectedPosition":I
    if-gez v1, :cond_0

    .line 1849
    add-int/lit8 v1, v1, 0x7

    .line 1851
    :cond_0
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez v0, :cond_1

    .line 1852
    add-int/lit8 v1, v1, 0x1

    .line 1854
    :cond_1
    if-eqz v0, :cond_3

    .line 1855
    iget-object v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I
    invoke-static {v2}, Lnet/simonvt/calendarview/CalendarView;->access$2200(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    sub-int/2addr v2, v1

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    mul-int/2addr v2, v3

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int/2addr v2, v3

    iput v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedLeft:I

    .line 1860
    :goto_0
    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedLeft:I

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int/2addr v3, v4

    add-int/2addr v2, v3

    iput v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedRight:I

    .line 1862
    .end local v0    # "isLayoutRtl":Z
    .end local v1    # "selectedPosition":I
    :cond_2
    return-void

    .line 1858
    .restart local v0    # "isLayoutRtl":Z
    .restart local v1    # "selectedPosition":I
    :cond_3
    iget v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    mul-int/2addr v2, v1

    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int/2addr v2, v3

    iput v2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedLeft:I

    goto :goto_0
.end method


# virtual methods
.method public getDayFromLocation(FLjava/util/Calendar;)Z
    .locals 8
    .param p1, "x"    # F
    .param p2, "outCalendar"    # Ljava/util/Calendar;

    .prologue
    const/4 v4, 0x0

    .line 1670
    iget-object v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # invokes: Lnet/simonvt/calendarview/CalendarView;->isLayoutRtl()Z
    invoke-static {v5}, Lnet/simonvt/calendarview/CalendarView;->access$2400(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v2

    .line 1675
    .local v2, "isLayoutRtl":Z
    if-eqz v2, :cond_2

    .line 1676
    const/4 v3, 0x0

    .line 1677
    .local v3, "start":I
    iget-object v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v5}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v5

    if-eqz v5, :cond_1

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v7, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int/2addr v6, v7

    sub-int v1, v5, v6

    .line 1683
    .local v1, "end":I
    :goto_0
    int-to-float v5, v3

    cmpg-float v5, p1, v5

    if-ltz v5, :cond_0

    int-to-float v5, v1

    cmpl-float v5, p1, v5

    if-lez v5, :cond_4

    .line 1684
    :cond_0
    invoke-virtual {p2}, Ljava/util/Calendar;->clear()V

    .line 1698
    :goto_1
    return v4

    .line 1677
    .end local v1    # "end":I
    :cond_1
    iget v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    goto :goto_0

    .line 1679
    .end local v3    # "start":I
    :cond_2
    iget-object v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v5}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v5

    if-eqz v5, :cond_3

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    iget v6, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    div-int v3, v5, v6

    .line 1680
    .restart local v3    # "start":I
    :goto_2
    iget v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    .restart local v1    # "end":I
    goto :goto_0

    .end local v1    # "end":I
    .end local v3    # "start":I
    :cond_3
    move v3, v4

    .line 1679
    goto :goto_2

    .line 1689
    .restart local v1    # "end":I
    .restart local v3    # "start":I
    :cond_4
    int-to-float v4, v3

    sub-float v4, p1, v4

    iget-object v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I
    invoke-static {v5}, Lnet/simonvt/calendarview/CalendarView;->access$2200(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    sub-int v5, v1, v3

    int-to-float v5, v5

    div-float/2addr v4, v5

    float-to-int v0, v4

    .line 1691
    .local v0, "dayPosition":I
    if-eqz v2, :cond_5

    .line 1692
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$2200(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    sub-int v0, v4, v0

    .line 1695
    :cond_5
    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mFirstDay:Ljava/util/Calendar;

    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {p2, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1696
    const/4 v4, 0x5

    invoke-virtual {p2, v4, v0}, Ljava/util/Calendar;->add(II)V

    .line 1698
    const/4 v4, 0x1

    goto :goto_1
.end method

.method public getFirstDay()Ljava/util/Calendar;
    .locals 1

    .prologue
    .line 1659
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mFirstDay:Ljava/util/Calendar;

    return-object v0
.end method

.method public getMonthOfFirstWeekDay()I
    .locals 1

    .prologue
    .line 1641
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthOfFirstWeekDay:I

    return v0
.end method

.method public getMonthOfLastWeekDay()I
    .locals 1

    .prologue
    .line 1650
    iget v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mLastWeekDayMonth:I

    return v0
.end method

.method public init(III)V
    .locals 11
    .param p1, "weekNumber"    # I
    .param p2, "selectedWeekDay"    # I
    .param p3, "focusedMonth"    # I

    .prologue
    .line 1567
    iput p2, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedDay:I

    .line 1568
    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mSelectedDay:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    const/4 v3, 0x1

    :goto_0
    iput-boolean v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasSelectedDay:Z

    .line 1569
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$2200(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    :goto_1
    iput v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    .line 1570
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWeek:I

    .line 1571
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$1600(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1573
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    const/4 v4, 0x3

    iget v5, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWeek:I

    invoke-virtual {v3, v4, v5}, Ljava/util/Calendar;->add(II)V

    .line 1574
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$1700(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->setFirstDayOfWeek(I)V

    .line 1577
    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    new-array v3, v3, [Ljava/lang/String;

    iput-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDayNumbers:[Ljava/lang/String;

    .line 1578
    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    new-array v3, v3, [Z

    iput-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mFocusDay:[Z

    .line 1581
    const/4 v1, 0x0

    .line 1582
    .local v1, "i":I
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShowWeekNumber:Z
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$2100(Lnet/simonvt/calendarview/CalendarView;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1583
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDayNumbers:[Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    const-string/jumbo v6, "%d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v9}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v9

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 1585
    add-int/lit8 v1, v1, 0x1

    .line 1589
    :cond_0
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mFirstDayOfWeek:I
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1700(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v3

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v4

    const/4 v5, 0x7

    invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v0, v3, v4

    .line 1590
    .local v0, "diff":I
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {v3, v4, v0}, Ljava/util/Calendar;->add(II)V

    .line 1592
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Calendar;

    iput-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mFirstDay:Ljava/util/Calendar;

    .line 1593
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    iput v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mMonthOfFirstWeekDay:I

    .line 1595
    const/4 v3, 0x1

    iput-boolean v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasUnfocusedDay:Z

    .line 1596
    :goto_2
    iget v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mNumCells:I

    if-ge v1, v3, :cond_7

    .line 1597
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v3, p3, :cond_4

    const/4 v2, 0x1

    .line 1598
    .local v2, "isFocusedDay":Z
    :goto_3
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mFocusDay:[Z

    aput-boolean v2, v3, v1

    .line 1599
    iget-boolean v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasFocusedDay:Z

    or-int/2addr v3, v2

    iput-boolean v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasFocusedDay:Z

    .line 1600
    iget-boolean v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasUnfocusedDay:Z

    if-nez v2, :cond_5

    const/4 v3, 0x1

    :goto_4
    and-int/2addr v3, v4

    iput-boolean v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHasUnfocusedDay:Z

    .line 1602
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mMinDate:Ljava/util/Calendar;
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$1600(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    iget-object v4, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mMaxDate:Ljava/util/Calendar;
    invoke-static {v4}, Lnet/simonvt/calendarview/CalendarView;->access$1500(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1603
    :cond_1
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDayNumbers:[Ljava/lang/String;

    const-string/jumbo v4, ""

    aput-object v4, v3, v1

    .line 1608
    :goto_5
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    const/4 v4, 0x5

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Ljava/util/Calendar;->add(II)V

    .line 1596
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1568
    .end local v0    # "diff":I
    .end local v1    # "i":I
    .end local v2    # "isFocusedDay":Z
    :cond_2
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 1569
    :cond_3
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mDaysPerWeek:I
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$2200(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v3

    goto/16 :goto_1

    .line 1597
    .restart local v0    # "diff":I
    .restart local v1    # "i":I
    :cond_4
    const/4 v2, 0x0

    goto :goto_3

    .line 1600
    .restart local v2    # "isFocusedDay":Z
    :cond_5
    const/4 v3, 0x0

    goto :goto_4

    .line 1605
    :cond_6
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mDayNumbers:[Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    const-string/jumbo v5, "%d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v8}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v8

    const/4 v9, 0x5

    invoke-virtual {v8, v9}, Ljava/util/Calendar;->get(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    goto :goto_5

    .line 1612
    .end local v2    # "isFocusedDay":Z
    :cond_7
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_8

    .line 1613
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    const/4 v4, 0x5

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Ljava/util/Calendar;->add(II)V

    .line 1615
    :cond_8
    iget-object v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mTempDate:Ljava/util/Calendar;
    invoke-static {v3}, Lnet/simonvt/calendarview/CalendarView;->access$1900(Lnet/simonvt/calendarview/CalendarView;)Ljava/util/Calendar;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    iput v3, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mLastWeekDayMonth:I

    .line 1617
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->updateSelectionPositions()V

    .line 1618
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1703
    invoke-direct {p0, p1}, Lnet/simonvt/calendarview/CalendarView$WeekView;->drawBackground(Landroid/graphics/Canvas;)V

    .line 1704
    invoke-direct {p0, p1}, Lnet/simonvt/calendarview/CalendarView$WeekView;->drawWeekNumbersAndDates(Landroid/graphics/Canvas;)V

    .line 1705
    invoke-direct {p0, p1}, Lnet/simonvt/calendarview/CalendarView$WeekView;->drawWeekSeparators(Landroid/graphics/Canvas;)V

    .line 1706
    invoke-direct {p0, p1}, Lnet/simonvt/calendarview/CalendarView$WeekView;->drawSelectedDateVerticalBars(Landroid/graphics/Canvas;)V

    .line 1707
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1866
    iget-object v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lnet/simonvt/calendarview/CalendarView;->access$1800(Lnet/simonvt/calendarview/CalendarView;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getHeight()I

    move-result v0

    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView;->access$1800(Lnet/simonvt/calendarview/CalendarView;)Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ListView;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mListView:Landroid/widget/ListView;
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView;->access$1800(Lnet/simonvt/calendarview/CalendarView;)Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ListView;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->this$0:Lnet/simonvt/calendarview/CalendarView;

    # getter for: Lnet/simonvt/calendarview/CalendarView;->mShownWeekCount:I
    invoke-static {v1}, Lnet/simonvt/calendarview/CalendarView;->access$3300(Lnet/simonvt/calendarview/CalendarView;)I

    move-result v1

    div-int/2addr v0, v1

    iput v0, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHeight:I

    .line 1868
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget v1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mHeight:I

    invoke-virtual {p0, v0, v1}, Lnet/simonvt/calendarview/CalendarView$WeekView;->setMeasuredDimension(II)V

    .line 1869
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 1837
    iput p1, p0, Lnet/simonvt/calendarview/CalendarView$WeekView;->mWidth:I

    .line 1838
    invoke-direct {p0}, Lnet/simonvt/calendarview/CalendarView$WeekView;->updateSelectionPositions()V

    .line 1839
    return-void
.end method
