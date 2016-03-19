.class public Lcom/seeclickfix/ma/android/dialogs/TimeDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "TimeDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "TimeDialog"


# instance fields
.field cal:Ljava/util/Calendar;

.field private formattedTime:Ljava/lang/String;

.field private listener:Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;

.field private mHour:I

.field private mIs24Time:Z

.field private mMinute:I

.field private mTimeChangedListener:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

.field private picker:Lnet/simonvt/timepicker/TimePicker;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 42
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->cal:Ljava/util/Calendar;

    .line 44
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->setupListeners()V

    .line 45
    return-void
.end method

.method static synthetic access$002(Lcom/seeclickfix/ma/android/dialogs/TimeDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/dialogs/TimeDialog;
    .param p1, "x1"    # I

    .prologue
    .line 22
    iput p1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mHour:I

    return p1
.end method

.method static synthetic access$102(Lcom/seeclickfix/ma/android/dialogs/TimeDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/dialogs/TimeDialog;
    .param p1, "x1"    # I

    .prologue
    .line 22
    iput p1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mMinute:I

    return p1
.end method

.method public static newInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/dialogs/TimeDialog;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 53
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;-><init>()V

    .line 54
    .local v0, "td":Lcom/seeclickfix/ma/android/dialogs/TimeDialog;
    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->setContext(Landroid/content/Context;)V

    .line 55
    return-object v0
.end method

.method private setContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-static {p1}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mIs24Time:Z

    .line 49
    return-void
.end method

.method private setCurrentTime(Lnet/simonvt/timepicker/TimePicker;)V
    .locals 2
    .param p1, "timePicker"    # Lnet/simonvt/timepicker/TimePicker;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->cal:Ljava/util/Calendar;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mHour:I

    .line 92
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->cal:Ljava/util/Calendar;

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mMinute:I

    .line 93
    return-void
.end method

.method private setPreviousTime(Lnet/simonvt/timepicker/TimePicker;)V
    .locals 10
    .param p1, "timePicker"    # Lnet/simonvt/timepicker/TimePicker;

    .prologue
    .line 96
    iget-object v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 97
    .local v1, "colonIndex":I
    iget-object v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 98
    .local v7, "spaceIndex":I
    iget-object v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v3

    .line 99
    .local v3, "length":I
    iget-object v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual {v8, v9, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 100
    .local v2, "hourString":Ljava/lang/String;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    add-int/lit8 v9, v1, 0x1

    invoke-virtual {v8, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 102
    .local v4, "minString":Ljava/lang/String;
    const-string/jumbo v0, ".."

    .line 104
    .local v0, "amPm":Ljava/lang/String;
    iget-boolean v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mIs24Time:Z

    if-nez v8, :cond_0

    .line 105
    iget-object v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    add-int/lit8 v9, v1, 0x1

    invoke-virtual {v8, v9, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 106
    iget-object v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    add-int/lit8 v9, v7, 0x1

    invoke-virtual {v8, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 114
    :cond_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 115
    .local v5, "prevHour":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 117
    .local v6, "prevMin":I
    iget-boolean v8, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mIs24Time:Z

    if-eqz v8, :cond_1

    .line 118
    const-string/jumbo v8, "PM"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 119
    add-int/lit8 v5, v5, 0xc

    .line 125
    :cond_1
    :goto_0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p1, v8}, Lnet/simonvt/timepicker/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 126
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p1, v8}, Lnet/simonvt/timepicker/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 128
    return-void

    .line 120
    :cond_2
    const-string/jumbo v8, "AM"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/16 v8, 0xc

    if-ne v5, v8, :cond_1

    .line 121
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private setupListeners()V
    .locals 1

    .prologue
    .line 146
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog$1;-><init>(Lcom/seeclickfix/ma/android/dialogs/TimeDialog;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mTimeChangedListener:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

    .line 154
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 133
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;

    if-eqz v1, :cond_0

    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mHour:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mMinute:I

    invoke-static {v2}, Lcom/seeclickfix/ma/android/date/TimeUtil;->padZeroIfSingleDigit(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "timeString":Ljava/lang/String;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->cal:Ljava/util/Calendar;

    const/16 v2, 0xb

    iget v3, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mHour:I

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 139
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->cal:Ljava/util/Calendar;

    const/16 v2, 0xc

    iget v3, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mMinute:I

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 141
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->cal:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Calendar;

    invoke-interface {v2, v1}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;->onTimeSet(Ljava/util/Calendar;)V

    .line 143
    .end local v0    # "timeString":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 63
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 65
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f030020

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 66
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 68
    const v3, 0x104000a

    invoke-virtual {v1, v3, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 71
    const v3, 0x7f0a0059

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lnet/simonvt/timepicker/TimePicker;

    iput-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->picker:Lnet/simonvt/timepicker/TimePicker;

    .line 73
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->picker:Lnet/simonvt/timepicker/TimePicker;

    iget-boolean v4, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mIs24Time:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnet/simonvt/timepicker/TimePicker;->setIs24HourView(Ljava/lang/Boolean;)V

    .line 75
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->picker:Lnet/simonvt/timepicker/TimePicker;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mTimeChangedListener:Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;

    invoke-virtual {v3, v4}, Lnet/simonvt/timepicker/TimePicker;->setOnTimeChangedListener(Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;)V

    .line 77
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 78
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->picker:Lnet/simonvt/timepicker/TimePicker;

    invoke-direct {p0, v3}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->setPreviousTime(Lnet/simonvt/timepicker/TimePicker;)V

    .line 84
    :goto_0
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 86
    .local v0, "ad":Landroid/app/AlertDialog;
    return-object v0

    .line 80
    .end local v0    # "ad":Landroid/app/AlertDialog;
    :cond_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->picker:Lnet/simonvt/timepicker/TimePicker;

    invoke-direct {p0, v3}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->setCurrentTime(Lnet/simonvt/timepicker/TimePicker;)V

    goto :goto_0
.end method

.method public setOnTimeValueSetListener(Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;)V
    .locals 0
    .param p1, "l"    # Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;

    .prologue
    .line 167
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;

    .line 168
    return-void
.end method

.method public setPreviousTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "formattedTime"    # Ljava/lang/String;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->formattedTime:Ljava/lang/String;

    .line 186
    return-void
.end method
