.class public Lnet/simonvt/timepicker/TimePickerDialog;
.super Landroid/app/AlertDialog;
.source "TimePickerDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;
    }
.end annotation


# static fields
.field private static final HOUR:Ljava/lang/String; = "hour"

.field private static final IS_24_HOUR:Ljava/lang/String; = "is24hour"

.field private static final MINUTE:Ljava/lang/String; = "minute"


# instance fields
.field private final mCallback:Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;

.field mInitialHourOfDay:I

.field mInitialMinute:I

.field mIs24HourView:Z

.field private final mTimePicker:Lnet/simonvt/timepicker/TimePicker;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;IIZ)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I
    .param p3, "callBack"    # Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;
    .param p4, "hourOfDay"    # I
    .param p5, "minute"    # I
    .param p6, "is24HourView"    # Z

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 90
    iput-object p3, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mCallback:Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;

    .line 91
    iput p4, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mInitialHourOfDay:I

    .line 92
    iput p5, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mInitialMinute:I

    .line 93
    iput-boolean p6, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mIs24HourView:Z

    .line 95
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePickerDialog;->setIcon(I)V

    .line 96
    sget v3, Lnet/simonvt/timepicker/R$string;->time_picker_dialog_title:I

    invoke-virtual {p0, v3}, Lnet/simonvt/timepicker/TimePickerDialog;->setTitle(I)V

    .line 98
    invoke-virtual {p0}, Lnet/simonvt/timepicker/TimePickerDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 99
    .local v1, "themeContext":Landroid/content/Context;
    const/4 v3, -0x1

    sget v4, Lnet/simonvt/timepicker/R$string;->date_time_done:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {p0, v3, v4, p0}, Lnet/simonvt/timepicker/TimePickerDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 101
    const-string/jumbo v3, "layout_inflater"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 103
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v3, Lnet/simonvt/timepicker/R$layout;->time_picker_dialog:I

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 104
    .local v2, "view":Landroid/view/View;
    invoke-virtual {p0, v2}, Lnet/simonvt/timepicker/TimePickerDialog;->setView(Landroid/view/View;)V

    .line 105
    sget v3, Lnet/simonvt/timepicker/R$id;->timePicker:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lnet/simonvt/timepicker/TimePicker;

    iput-object v3, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    .line 108
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    iget-boolean v4, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mIs24HourView:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnet/simonvt/timepicker/TimePicker;->setIs24HourView(Ljava/lang/Boolean;)V

    .line 109
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    iget v4, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mInitialHourOfDay:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnet/simonvt/timepicker/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 110
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    iget v4, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mInitialMinute:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnet/simonvt/timepicker/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 111
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v3, p0}, Lnet/simonvt/timepicker/TimePicker;->setOnTimeChangedListener(Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;)V

    .line 112
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;IIZ)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callBack"    # Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;
    .param p3, "hourOfDay"    # I
    .param p4, "minute"    # I
    .param p5, "is24HourView"    # Z

    .prologue
    .line 74
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    sget v2, Lnet/simonvt/timepicker/R$style;->Theme_Dialog_Alert:I

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lnet/simonvt/timepicker/TimePickerDialog;-><init>(Landroid/content/Context;ILnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 75
    return-void

    .line 74
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private tryNotifyTimeSet()V
    .locals 4

    .prologue
    .line 128
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mCallback:Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v0}, Lnet/simonvt/timepicker/TimePicker;->clearFocus()V

    .line 130
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mCallback:Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;

    iget-object v1, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    iget-object v2, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v2}, Lnet/simonvt/timepicker/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v3}, Lnet/simonvt/timepicker/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v1, v2, v3}, Lnet/simonvt/timepicker/TimePickerDialog$OnTimeSetListener;->onTimeSet(Lnet/simonvt/timepicker/TimePicker;II)V

    .line 133
    :cond_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 115
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePickerDialog;->tryNotifyTimeSet()V

    .line 116
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 152
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 153
    const-string/jumbo v2, "hour"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 154
    .local v0, "hour":I
    const-string/jumbo v2, "minute"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 155
    .local v1, "minute":I
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    const-string/jumbo v3, "is24hour"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnet/simonvt/timepicker/TimePicker;->setIs24HourView(Ljava/lang/Boolean;)V

    .line 156
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnet/simonvt/timepicker/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 157
    iget-object v2, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnet/simonvt/timepicker/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 158
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 3

    .prologue
    .line 143
    invoke-super {p0}, Landroid/app/AlertDialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v0

    .line 144
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "hour"

    iget-object v2, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v2}, Lnet/simonvt/timepicker/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 145
    const-string/jumbo v1, "minute"

    iget-object v2, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v2}, Lnet/simonvt/timepicker/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 146
    const-string/jumbo v1, "is24hour"

    iget-object v2, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v2}, Lnet/simonvt/timepicker/TimePicker;->is24HourView()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 147
    return-object v0
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 137
    invoke-direct {p0}, Lnet/simonvt/timepicker/TimePickerDialog;->tryNotifyTimeSet()V

    .line 138
    invoke-super {p0}, Landroid/app/AlertDialog;->onStop()V

    .line 139
    return-void
.end method

.method public onTimeChanged(Lnet/simonvt/timepicker/TimePicker;II)V
    .locals 0
    .param p1, "view"    # Lnet/simonvt/timepicker/TimePicker;
    .param p2, "hourOfDay"    # I
    .param p3, "minute"    # I

    .prologue
    .line 125
    return-void
.end method

.method public updateTime(II)V
    .locals 2
    .param p1, "hourOfDay"    # I
    .param p2, "minutOfHour"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnet/simonvt/timepicker/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 120
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePickerDialog;->mTimePicker:Lnet/simonvt/timepicker/TimePicker;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnet/simonvt/timepicker/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 121
    return-void
.end method
