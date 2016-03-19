.class public final Lnet/simonvt/calendarview/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/simonvt/calendarview/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final CalendarView:[I

.field public static final CalendarView_cv_dateTextAppearance:I = 0xc

.field public static final CalendarView_cv_dividerHorizontal:I = 0xd

.field public static final CalendarView_cv_firstDayOfWeek:I = 0x0

.field public static final CalendarView_cv_focusedMonthDateColor:I = 0x6

.field public static final CalendarView_cv_maxDate:I = 0x3

.field public static final CalendarView_cv_minDate:I = 0x2

.field public static final CalendarView_cv_selectedDateVerticalBar:I = 0xa

.field public static final CalendarView_cv_selectedWeekBackgroundColor:I = 0x5

.field public static final CalendarView_cv_showWeekNumber:I = 0x1

.field public static final CalendarView_cv_shownWeekCount:I = 0x4

.field public static final CalendarView_cv_unfocusedMonthDateColor:I = 0x7

.field public static final CalendarView_cv_weekDayTextAppearance:I = 0xb

.field public static final CalendarView_cv_weekNumberColor:I = 0x8

.field public static final CalendarView_cv_weekSeparatorLineColor:I = 0x9

.field public static final NumberPicker:[I

.field public static final NumberPicker_internalLayout:I = 0x8

.field public static final NumberPicker_internalMaxHeight:I = 0x5

.field public static final NumberPicker_internalMaxWidth:I = 0x7

.field public static final NumberPicker_internalMinHeight:I = 0x4

.field public static final NumberPicker_internalMinWidth:I = 0x6

.field public static final NumberPicker_selectionDivider:I = 0x1

.field public static final NumberPicker_selectionDividerHeight:I = 0x2

.field public static final NumberPicker_selectionDividersDistance:I = 0x3

.field public static final NumberPicker_solidColor:I = 0x0

.field public static final NumberPicker_virtualButtonPressedDrawable:I = 0x9

.field public static final TextAppearanceCompatStyleable:[I

.field public static final TextAppearanceCompatStyleable_android_textSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 85
    const/16 v0, 0xe

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lnet/simonvt/calendarview/R$styleable;->CalendarView:[I

    .line 100
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lnet/simonvt/calendarview/R$styleable;->NumberPicker:[I

    .line 111
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x1010095

    aput v2, v0, v1

    sput-object v0, Lnet/simonvt/calendarview/R$styleable;->TextAppearanceCompatStyleable:[I

    return-void

    .line 85
    :array_0
    .array-data 4
        0x7f01000d
        0x7f01000e
        0x7f01000f
        0x7f010010
        0x7f010011
        0x7f010012
        0x7f010013
        0x7f010014
        0x7f010015
        0x7f010016
        0x7f010017
        0x7f010018
        0x7f010019
        0x7f01001a
    .end array-data

    .line 100
    :array_1
    .array-data 4
        0x7f010037
        0x7f010038
        0x7f010039
        0x7f01003a
        0x7f01003b
        0x7f01003c
        0x7f01003d
        0x7f01003e
        0x7f01003f
        0x7f010040
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
