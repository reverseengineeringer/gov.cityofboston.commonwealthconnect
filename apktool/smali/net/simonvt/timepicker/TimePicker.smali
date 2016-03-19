.class public Lnet/simonvt/timepicker/TimePicker;
.super Landroid/widget/FrameLayout;
.source "TimePicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/simonvt/timepicker/TimePicker$SavedState;,
        Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_ENABLED_STATE:Z = true

.field private static final HOURS_IN_HALF_DAY:I = 0xc

.field private static final NO_OP_CHANGE_LISTENER:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;


# instance fields
.field private final mAmPmButton:Landroid/widget/Button;

.field private final mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

.field private final mAmPmSpinnerInput:Landroid/widget/EditText;

.field private final mAmPmStrings:[Ljava/lang/String;

.field private mCurrentLocale:Ljava/util/Locale;

.field private final mDivider:Landroid/widget/TextView;

.field private final mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

.field private final mHourSpinnerInput:Landroid/widget/EditText;

.field private mIs24HourView:Z

.field private mIsAm:Z

.field private mIsEnabled:Z

.field private final mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

.field private final mMinuteSpinnerInput:Landroid/widget/EditText;

.field private mOnTimeChangedListener:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

.field private mTempCalendar:Ljava/util/Calendar;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    new-instance v0, Lnet/simonvt/timepicker/TimePicker$1;

    invoke-direct {v0}, Lnet/simonvt/timepicker/TimePicker$1;-><init>()V

    sput-object v0, Lnet/simonvt/timepicker/TimePicker;->NO_OP_CHANGE_LISTENER:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnet/simonvt/timepicker/TimePicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 126
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 129
    sget v0, Lnet/simonvt/timepicker/R$attr;->timePickerStyle:I

    invoke-direct {p0, p1, p2, v0}, Lnet/simonvt/timepicker/TimePicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 130
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v9, 0x5

    const/4 v8, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 133
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 102
    iput-boolean v6, p0, Lnet/simonvt/timepicker/TimePicker;->mIsEnabled:Z

    .line 136
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-direct {p0, v3}, Lnet/simonvt/timepicker/TimePicker;->setCurrentLocale(Ljava/util/Locale;)V

    .line 144
    sget v2, Lnet/simonvt/timepicker/R$layout;->time_picker_holo:I

    .line 146
    .local v2, "layoutResourceId":I
    const-string/jumbo v3, "layout_inflater"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 148
    .local v1, "inflater":Landroid/view/LayoutInflater;
    invoke-virtual {v1, v2, p0, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 151
    sget v3, Lnet/simonvt/timepicker/R$id;->hour:I

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePicker;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lnet/simonvt/numberpicker/NumberPicker;

    iput-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    .line 152
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    new-instance v4, Lnet/simonvt/timepicker/TimePicker$2;

    invoke-direct {v4, p0}, Lnet/simonvt/timepicker/TimePicker$2;-><init>(Lnet/simonvt/timepicker/TimePicker;)V

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V

    .line 165
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    sget v4, Lnet/simonvt/timepicker/R$id;->np__numberpicker_input:I

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinnerInput:Landroid/widget/EditText;

    .line 166
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v3, v9}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 169
    sget v3, Lnet/simonvt/timepicker/R$id;->divider:I

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePicker;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mDivider:Landroid/widget/TextView;

    .line 170
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mDivider:Landroid/widget/TextView;

    if-eqz v3, :cond_0

    .line 171
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mDivider:Landroid/widget/TextView;

    sget v4, Lnet/simonvt/timepicker/R$string;->time_picker_separator:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 175
    :cond_0
    sget v3, Lnet/simonvt/timepicker/R$id;->minute:I

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePicker;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lnet/simonvt/numberpicker/NumberPicker;

    iput-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    .line 176
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3, v7}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 177
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    const/16 v4, 0x3b

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 178
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    const-wide/16 v4, 0x64

    invoke-virtual {v3, v4, v5}, Lnet/simonvt/numberpicker/NumberPicker;->setOnLongPressUpdateInterval(J)V

    .line 179
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {}, Lnet/simonvt/numberpicker/NumberPicker;->getTwoDigitFormatter()Lnet/simonvt/numberpicker/NumberPicker$Formatter;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->setFormatter(Lnet/simonvt/numberpicker/NumberPicker$Formatter;)V

    .line 180
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    new-instance v4, Lnet/simonvt/timepicker/TimePicker$3;

    invoke-direct {v4, p0}, Lnet/simonvt/timepicker/TimePicker$3;-><init>(Lnet/simonvt/timepicker/TimePicker;)V

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V

    .line 203
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    sget v4, Lnet/simonvt/timepicker/R$id;->np__numberpicker_input:I

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinnerInput:Landroid/widget/EditText;

    .line 204
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v3, v9}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 207
    new-instance v3, Ljava/text/DateFormatSymbols;

    invoke-direct {v3}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v3}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmStrings:[Ljava/lang/String;

    .line 210
    sget v3, Lnet/simonvt/timepicker/R$id;->amPm:I

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePicker;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 211
    .local v0, "amPmView":Landroid/view/View;
    instance-of v3, v0, Landroid/widget/Button;

    if-eqz v3, :cond_3

    .line 212
    iput-object v8, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    .line 213
    iput-object v8, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinnerInput:Landroid/widget/EditText;

    .line 214
    check-cast v0, Landroid/widget/Button;

    .end local v0    # "amPmView":Landroid/view/View;
    iput-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmButton:Landroid/widget/Button;

    .line 215
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmButton:Landroid/widget/Button;

    new-instance v4, Lnet/simonvt/timepicker/TimePicker$4;

    invoke-direct {v4, p0}, Lnet/simonvt/timepicker/TimePicker$4;-><init>(Lnet/simonvt/timepicker/TimePicker;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 243
    :goto_0
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->updateHourControl()V

    .line 244
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->updateAmPmControl()V

    .line 246
    sget-object v3, Lnet/simonvt/timepicker/TimePicker;->NO_OP_CHANGE_LISTENER:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePicker;->setOnTimeChangedListener(Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;)V

    .line 249
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mTempCalendar:Ljava/util/Calendar;

    const/16 v4, 0xb

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 250
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mTempCalendar:Ljava/util/Calendar;

    const/16 v4, 0xc

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 252
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->isEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 253
    invoke-virtual {p0, v7}, Lnet/simonvt/timepicker/TimePicker;->setEnabled(Z)V

    .line 257
    :cond_1
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->setContentDescriptions()V

    .line 260
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-lt v3, v4, :cond_2

    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getImportantForAccessibility()I

    move-result v3

    if-nez v3, :cond_2

    .line 261
    invoke-virtual {p0, v6}, Lnet/simonvt/timepicker/TimePicker;->setImportantForAccessibility(I)V

    .line 263
    :cond_2
    return-void

    .line 224
    .restart local v0    # "amPmView":Landroid/view/View;
    :cond_3
    iput-object v8, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmButton:Landroid/widget/Button;

    .line 225
    check-cast v0, Lnet/simonvt/numberpicker/NumberPicker;

    .end local v0    # "amPmView":Landroid/view/View;
    iput-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    .line 226
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3, v7}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 227
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3, v6}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 228
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v4, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmStrings:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->setDisplayedValues([Ljava/lang/String;)V

    .line 229
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    new-instance v4, Lnet/simonvt/timepicker/TimePicker$5;

    invoke-direct {v4, p0}, Lnet/simonvt/timepicker/TimePicker$5;-><init>(Lnet/simonvt/timepicker/TimePicker;)V

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V

    .line 238
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    sget v4, Lnet/simonvt/timepicker/R$id;->np__numberpicker_input:I

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinnerInput:Landroid/widget/EditText;

    .line 239
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinnerInput:Landroid/widget/EditText;

    const/4 v4, 0x6

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setImeOptions(I)V

    goto :goto_0
.end method

.method static synthetic access$000(Lnet/simonvt/timepicker/TimePicker;)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/timepicker/TimePicker;

    .prologue
    .line 59
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->updateInputState()V

    return-void
.end method

.method static synthetic access$100(Lnet/simonvt/timepicker/TimePicker;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/timepicker/TimePicker;

    .prologue
    .line 59
    iget-boolean v0, p0, Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z

    return v0
.end method

.method static synthetic access$102(Lnet/simonvt/timepicker/TimePicker;Z)Z
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/timepicker/TimePicker;
    .param p1, "x1"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z

    return p1
.end method

.method static synthetic access$200(Lnet/simonvt/timepicker/TimePicker;)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/timepicker/TimePicker;

    .prologue
    .line 59
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->updateAmPmControl()V

    return-void
.end method

.method static synthetic access$300(Lnet/simonvt/timepicker/TimePicker;)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/timepicker/TimePicker;

    .prologue
    .line 59
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->onTimeChanged()V

    return-void
.end method

.method static synthetic access$400(Lnet/simonvt/timepicker/TimePicker;)Lnet/simonvt/numberpicker/NumberPicker;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/timepicker/TimePicker;

    .prologue
    .line 59
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    return-object v0
.end method

.method static synthetic access$500(Lnet/simonvt/timepicker/TimePicker;)Lnet/simonvt/numberpicker/NumberPicker;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/timepicker/TimePicker;

    .prologue
    .line 59
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    return-object v0
.end method

.method private onTimeChanged()V
    .locals 3

    .prologue
    .line 536
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lnet/simonvt/timepicker/TimePicker;->sendAccessibilityEvent(I)V

    .line 537
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mOnTimeChangedListener:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

    if-eqz v0, :cond_0

    .line 538
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mOnTimeChangedListener:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v0, p0, v1, v2}, Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;->onTimeChanged(Lnet/simonvt/timepicker/TimePicker;II)V

    .line 540
    :cond_0
    return-void
.end method

.method private setContentDescriptions()V
    .locals 0

    .prologue
    .line 543
    return-void
.end method

.method private setCurrentLocale(Ljava/util/Locale;)V
    .locals 1
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 301
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mCurrentLocale:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 306
    :goto_0
    return-void

    .line 304
    :cond_0
    iput-object p1, p0, Lnet/simonvt/timepicker/TimePicker;->mCurrentLocale:Ljava/util/Locale;

    .line 305
    invoke-static {p1}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mTempCalendar:Ljava/util/Calendar;

    goto :goto_0
.end method

.method private trySetContentDescription(Landroid/view/View;II)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "viewId"    # I
    .param p3, "contDescResId"    # I

    .prologue
    .line 564
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 565
    .local v0, "target":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 566
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 568
    :cond_0
    return-void
.end method

.method private updateAmPmControl()V
    .locals 4

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x0

    .line 516
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->is24HourView()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 517
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    if-eqz v1, :cond_0

    .line 518
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1, v3}, Lnet/simonvt/numberpicker/NumberPicker;->setVisibility(I)V

    .line 532
    :goto_0
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lnet/simonvt/timepicker/TimePicker;->sendAccessibilityEvent(I)V

    .line 533
    return-void

    .line 520
    :cond_0
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmButton:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 523
    :cond_1
    iget-boolean v2, p0, Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z

    if-eqz v2, :cond_2

    move v0, v1

    .line 524
    .local v0, "index":I
    :goto_1
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    if-eqz v2, :cond_3

    .line 525
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 526
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setVisibility(I)V

    goto :goto_0

    .line 523
    .end local v0    # "index":I
    :cond_2
    const/4 v0, 0x1

    goto :goto_1

    .line 528
    .restart local v0    # "index":I
    :cond_3
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmButton:Landroid/widget/Button;

    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmStrings:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 529
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmButton:Landroid/widget/Button;

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0
.end method

.method private updateHourControl()V
    .locals 2

    .prologue
    .line 504
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->is24HourView()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 505
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 506
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    const/16 v1, 0x17

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 507
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {}, Lnet/simonvt/numberpicker/NumberPicker;->getTwoDigitFormatter()Lnet/simonvt/numberpicker/NumberPicker$Formatter;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setFormatter(Lnet/simonvt/numberpicker/NumberPicker$Formatter;)V

    .line 513
    :goto_0
    return-void

    .line 509
    :cond_0
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 510
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 511
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setFormatter(Lnet/simonvt/numberpicker/NumberPicker$Formatter;)V

    goto :goto_0
.end method

.method private updateInputState()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 577
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 579
    .local v0, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_0

    .line 580
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 581
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 582
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 591
    :cond_0
    :goto_0
    return-void

    .line 583
    :cond_1
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 584
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 585
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_0

    .line 586
    :cond_2
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 587
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 588
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_0
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 470
    invoke-virtual {p0, p1}, Lnet/simonvt/timepicker/TimePicker;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 471
    const/4 v0, 0x1

    return v0
.end method

.method public getBaseline()I
    .locals 1

    .prologue
    .line 465
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getBaseline()I

    move-result v0

    return v0
.end method

.method public getCurrentHour()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 383
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v0

    .line 384
    .local v0, "currentHour":I
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->is24HourView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 385
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 389
    :goto_0
    return-object v1

    .line 386
    :cond_0
    iget-boolean v1, p0, Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z

    if-eqz v1, :cond_1

    .line 387
    rem-int/lit8 v1, v0, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    .line 389
    :cond_1
    rem-int/lit8 v1, v0, 0xc

    add-int/lit8 v1, v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0
.end method

.method public getCurrentMinute()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 449
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public is24HourView()Z
    .locals 1

    .prologue
    .line 442
    iget-boolean v0, p0, Lnet/simonvt/timepicker/TimePicker;->mIs24HourView:Z

    return v0
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 286
    iget-boolean v0, p0, Lnet/simonvt/timepicker/TimePicker;->mIsEnabled:Z

    return v0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 291
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 292
    iget-object v0, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-direct {p0, v0}, Lnet/simonvt/timepicker/TimePicker;->setCurrentLocale(Ljava/util/Locale;)V

    .line 293
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 493
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 494
    const-class v0, Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 495
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 499
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 500
    const-class v0, Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 501
    return-void
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 6
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 476
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 478
    const/4 v0, 0x1

    .line 479
    .local v0, "flags":I
    iget-boolean v2, p0, Lnet/simonvt/timepicker/TimePicker;->mIs24HourView:Z

    if-eqz v2, :cond_0

    .line 480
    or-int/lit16 v0, v0, 0x80

    .line 484
    :goto_0
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePicker;->mTempCalendar:Ljava/util/Calendar;

    const/16 v3, 0xb

    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 485
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePicker;->mTempCalendar:Ljava/util/Calendar;

    const/16 v3, 0xc

    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 486
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker;->mTempCalendar:Ljava/util/Calendar;

    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-static {v2, v4, v5, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    .line 488
    .local v1, "selectedDateUtterance":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 489
    return-void

    .line 482
    .end local v1    # "selectedDateUtterance":Ljava/lang/String;
    :cond_0
    or-int/lit8 v0, v0, 0x40

    goto :goto_0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 364
    move-object v0, p1

    check-cast v0, Lnet/simonvt/timepicker/TimePicker$SavedState;

    .line 365
    .local v0, "ss":Lnet/simonvt/timepicker/TimePicker$SavedState;
    invoke-virtual {v0}, Lnet/simonvt/timepicker/TimePicker$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 366
    invoke-virtual {v0}, Lnet/simonvt/timepicker/TimePicker$SavedState;->getHour()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1}, Lnet/simonvt/timepicker/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 367
    invoke-virtual {v0}, Lnet/simonvt/timepicker/TimePicker$SavedState;->getMinute()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1}, Lnet/simonvt/timepicker/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 368
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 5

    .prologue
    .line 358
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 359
    .local v0, "superState":Landroid/os/Parcelable;
    new-instance v1, Lnet/simonvt/timepicker/TimePicker$SavedState;

    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v0, v2, v3, v4}, Lnet/simonvt/timepicker/TimePicker$SavedState;-><init>(Landroid/os/Parcelable;IILnet/simonvt/timepicker/TimePicker$1;)V

    return-object v1
.end method

.method public setCurrentHour(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "currentHour"    # Ljava/lang/Integer;

    .prologue
    const/16 v1, 0xc

    .line 398
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v0

    if-ne p1, v0, :cond_1

    .line 418
    :cond_0
    :goto_0
    return-void

    .line 401
    :cond_1
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->is24HourView()Z

    move-result v0

    if-nez v0, :cond_3

    .line 403
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lt v0, v1, :cond_4

    .line 404
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z

    .line 405
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v1, :cond_2

    .line 406
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, -0xc

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 414
    :cond_2
    :goto_1
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->updateAmPmControl()V

    .line 416
    :cond_3
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 417
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->onTimeChanged()V

    goto :goto_0

    .line 409
    :cond_4
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z

    .line 410
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_2

    .line 411
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1
.end method

.method public setCurrentMinute(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "currentMinute"    # Ljava/lang/Integer;

    .prologue
    .line 456
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 461
    :goto_0
    return-void

    .line 459
    :cond_0
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 460
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->onTimeChanged()V

    goto :goto_0
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 267
    iget-boolean v0, p0, Lnet/simonvt/timepicker/TimePicker;->mIsEnabled:Z

    if-ne v0, p1, :cond_0

    .line 282
    :goto_0
    return-void

    .line 270
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setEnabled(Z)V

    .line 271
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->setEnabled(Z)V

    .line 272
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mDivider:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 273
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mDivider:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 275
    :cond_1
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->setEnabled(Z)V

    .line 276
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    if-eqz v0, :cond_2

    .line 277
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmSpinner:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->setEnabled(Z)V

    .line 281
    :goto_1
    iput-boolean p1, p0, Lnet/simonvt/timepicker/TimePicker;->mIsEnabled:Z

    goto :goto_0

    .line 279
    :cond_2
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker;->mAmPmButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1
.end method

.method public setIs24HourView(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "is24HourView"    # Ljava/lang/Boolean;

    .prologue
    .line 426
    iget-boolean v1, p0, Lnet/simonvt/timepicker/TimePicker;->mIs24HourView:Z

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-ne v1, v2, :cond_0

    .line 436
    :goto_0
    return-void

    .line 429
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lnet/simonvt/timepicker/TimePicker;->mIs24HourView:Z

    .line 431
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 432
    .local v0, "currentHour":I
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->updateHourControl()V

    .line 434
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1}, Lnet/simonvt/timepicker/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 435
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePicker;->updateAmPmControl()V

    goto :goto_0
.end method

.method public setOnTimeChangedListener(Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;)V
    .locals 0
    .param p1, "onTimeChangedListener"    # Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

    .prologue
    .line 376
    iput-object p1, p0, Lnet/simonvt/timepicker/TimePicker;->mOnTimeChangedListener:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

    .line 377
    return-void
.end method
