.class public Lcom/seeclickfix/ma/android/dialogs/DateDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "DateDialog.java"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/dialogs/DateDialog$OnCompleteListener;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_DateDialog"


# instance fields
.field private cal:Ljava/util/Calendar;

.field private isSet:Z

.field private listener:Lcom/seeclickfix/ma/android/dialogs/DateDialog$OnCompleteListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->isSet:Z

    .line 47
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->cal:Ljava/util/Calendar;

    .line 88
    return-void
.end method


# virtual methods
.method public getCalendar()Ljava/util/Calendar;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->cal:Ljava/util/Calendar;

    return-object v0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->cal:Ljava/util/Calendar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 54
    .local v3, "year":I
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->cal:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 55
    .local v4, "month":I
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->cal:Ljava/util/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 58
    .local v5, "day":I
    new-instance v0, Landroid/app/DatePickerDialog;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    return-object v0
.end method

.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 3
    .param p1, "view"    # Landroid/widget/DatePicker;
    .param p2, "year"    # I
    .param p3, "month"    # I
    .param p4, "day"    # I

    .prologue
    const/4 v2, 0x1

    .line 62
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->isSet:Z

    if-nez v0, :cond_1

    .line 65
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->cal:Ljava/util/Calendar;

    invoke-virtual {v0, v2, p2}, Ljava/util/Calendar;->set(II)V

    .line 66
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->cal:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->cal:Ljava/util/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p4}, Ljava/util/Calendar;->set(II)V

    .line 69
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/DateDialog$OnCompleteListener;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/DateDialog$OnCompleteListener;

    invoke-interface {v0, p0}, Lcom/seeclickfix/ma/android/dialogs/DateDialog$OnCompleteListener;->onComplete(Lcom/seeclickfix/ma/android/dialogs/DateDialog;)V

    .line 73
    :cond_0
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->isSet:Z

    .line 75
    :cond_1
    return-void
.end method

.method public setListener(Lcom/seeclickfix/ma/android/dialogs/DateDialog$OnCompleteListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/dialogs/DateDialog$OnCompleteListener;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/DateDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/DateDialog$OnCompleteListener;

    .line 85
    return-void
.end method
