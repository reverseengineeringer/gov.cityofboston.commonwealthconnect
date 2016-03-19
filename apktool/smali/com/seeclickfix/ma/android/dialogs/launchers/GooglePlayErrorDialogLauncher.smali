.class public Lcom/seeclickfix/ma/android/dialogs/launchers/GooglePlayErrorDialogLauncher;
.super Ljava/lang/Object;
.source "GooglePlayErrorDialogLauncher.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/launchers/DialogLauncher;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GooglePlayErrorDialogLauncher"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private attempAutoResolution(Lcom/google/android/gms/common/ConnectionResult;Landroid/support/v4/app/FragmentActivity;)V
    .locals 1
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;
    .param p2, "activity"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 30
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 33
    const/16 v0, 0xa28

    :try_start_0
    invoke-virtual {p1, p2, v0}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :goto_0
    return-void

    .line 42
    :cond_0
    invoke-direct {p0, p2, p1}, Lcom/seeclickfix/ma/android/dialogs/launchers/GooglePlayErrorDialogLauncher;->show(Landroid/support/v4/app/FragmentActivity;Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_0

    .line 36
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private show(Landroid/support/v4/app/FragmentActivity;Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 5
    .param p1, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p2, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 50
    if-nez p2, :cond_1

    .line 52
    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v2

    .line 57
    .local v2, "resultCode":I
    :goto_0
    const/16 v3, 0xa28

    invoke-static {v2, p1, v3}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorDialog(ILandroid/app/Activity;I)Landroid/app/Dialog;

    move-result-object v0

    .line 63
    .local v0, "errorDialog":Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 65
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;-><init>()V

    .line 67
    .local v1, "errorFragment":Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;->setDialog(Landroid/app/Dialog;)V

    .line 69
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    const-string/jumbo v4, "LocationErrorDialog"

    invoke-virtual {v1, v3, v4}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 72
    .end local v1    # "errorFragment":Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;
    :cond_0
    return-void

    .line 54
    .end local v0    # "errorDialog":Landroid/app/Dialog;
    .end local v2    # "resultCode":I
    :cond_1
    invoke-virtual {p2}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v2

    .restart local v2    # "resultCode":I
    goto :goto_0
.end method


# virtual methods
.method public showDialog(Lcom/seeclickfix/ma/android/events/Event;Landroid/support/v4/app/FragmentActivity;)V
    .locals 2
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/Event;
    .param p2, "activity"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 25
    move-object v0, p1

    check-cast v0, Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;

    .line 26
    .local v0, "gpee":Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;->getConnectionResult()Lcom/google/android/gms/common/ConnectionResult;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/seeclickfix/ma/android/dialogs/launchers/GooglePlayErrorDialogLauncher;->attempAutoResolution(Lcom/google/android/gms/common/ConnectionResult;Landroid/support/v4/app/FragmentActivity;)V

    .line 27
    return-void
.end method
