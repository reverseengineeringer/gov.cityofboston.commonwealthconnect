.class public Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "CalendarDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_CalendarView"


# instance fields
.field private ad:Landroid/app/AlertDialog;

.field private calView:Lnet/simonvt/calendarview/CalendarView;

.field private dateMs:J

.field private formattedDate:Ljava/lang/String;

.field private listener:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 50
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->dateMs:J

    .line 119
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 93
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->calView:Lnet/simonvt/calendarview/CalendarView;

    invoke-virtual {v0}, Lnet/simonvt/calendarview/CalendarView;->getDate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->dateMs:J

    .line 97
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->dateMs:J

    invoke-interface {v0, v2, v3}, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;->onDateSet(J)V

    .line 100
    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x1

    .line 56
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 58
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f03001a

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 59
    .local v1, "view":Landroid/view/View;
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 61
    const v2, 0x104000a

    invoke-virtual {v0, v2, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 64
    const v2, 0x7f0a004d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lnet/simonvt/calendarview/CalendarView;

    iput-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->calView:Lnet/simonvt/calendarview/CalendarView;

    .line 66
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->calView:Lnet/simonvt/calendarview/CalendarView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lnet/simonvt/calendarview/CalendarView;->setShowWeekNumber(Z)V

    .line 67
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->calView:Lnet/simonvt/calendarview/CalendarView;

    invoke-virtual {v2, p0}, Lnet/simonvt/calendarview/CalendarView;->setOnDateChangeListener(Lnet/simonvt/calendarview/CalendarView$OnDateChangeListener;)V

    .line 69
    iget-wide v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->dateMs:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 70
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->calView:Lnet/simonvt/calendarview/CalendarView;

    iget-wide v4, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->dateMs:J

    invoke-virtual {v2, v4, v5, v6, v6}, Lnet/simonvt/calendarview/CalendarView;->setDate(JZZ)V

    .line 73
    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->ad:Landroid/app/AlertDialog;

    .line 74
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->calView:Lnet/simonvt/calendarview/CalendarView;

    invoke-virtual {v2}, Lnet/simonvt/calendarview/CalendarView;->getDate()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->dateMs:J

    .line 78
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->ad:Landroid/app/AlertDialog;

    return-object v2
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 86
    return-void
.end method

.method public onSelectedDayChange(Lnet/simonvt/calendarview/CalendarView;III)V
    .locals 2
    .param p1, "view"    # Lnet/simonvt/calendarview/CalendarView;
    .param p2, "year"    # I
    .param p3, "month"    # I
    .param p4, "dayOfMonth"    # I

    .prologue
    .line 108
    invoke-virtual {p1}, Lnet/simonvt/calendarview/CalendarView;->getDate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->dateMs:J

    .line 111
    return-void
.end method

.method public setDateSelectedListener(Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;)V
    .locals 0
    .param p1, "l"    # Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;

    .line 116
    return-void
.end method

.method public setPreviousDate(J)V
    .locals 1
    .param p1, "dateMilliseconds"    # J

    .prologue
    .line 130
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->dateMs:J

    .line 131
    return-void
.end method
