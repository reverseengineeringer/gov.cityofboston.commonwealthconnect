.class public Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;
.super Ljava/lang/Object;
.source "NetDetectionHelper.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "NetDetectionHelper"


# instance fields
.field private callback:Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    return-void
.end method

.method private showDialog(Landroid/support/v4/app/FragmentManager;Lcom/actionbarsherlock/app/SherlockFragmentActivity;)V
    .locals 3
    .param p1, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p2, "fragmentActivity"    # Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    .prologue
    .line 91
    const-string/jumbo v2, "PreBakedDialogs::NO_NETWORK"

    invoke-static {v2}, Lcom/seeclickfix/ma/android/dialogs/PreBakedDialogs;->getDialogOptions(Ljava/lang/String;)Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    move-result-object v0

    .line 93
    .local v0, "opts":Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->newInstance(Lcom/seeclickfix/ma/android/dialogs/DialogOptions;)Lcom/seeclickfix/ma/android/dialogs/WarnDialog;

    move-result-object v1

    .line 95
    .local v1, "warnDialog":Lcom/seeclickfix/ma/android/dialogs/WarnDialog;
    invoke-virtual {v1, p0}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->setClickListener(Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;)V

    .line 97
    const-string/jumbo v2, "FragmentTags:DIALOG_WARN_NO_NETWORK"

    invoke-virtual {v1, p1, v2}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 99
    return-void
.end method


# virtual methods
.method public getIsNetConnectedOrShowDialog(Lcom/actionbarsherlock/app/SherlockFragmentActivity;Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;)Z
    .locals 2
    .param p1, "sherlockFragActivity"    # Lcom/actionbarsherlock/app/SherlockFragmentActivity;
    .param p2, "callback"    # Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;

    .prologue
    .line 76
    iput-object p2, p0, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;->callback:Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;

    .line 77
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;->isNetworkOnline(Landroid/content/Context;)Z

    move-result v1

    .line 79
    .local v1, "isOnline":Z
    invoke-virtual {p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 81
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    if-nez v1, :cond_0

    .line 82
    invoke-direct {p0, v0, p1}, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;->showDialog(Landroid/support/v4/app/FragmentManager;Lcom/actionbarsherlock/app/SherlockFragmentActivity;)V

    .line 85
    :cond_0
    return v1
.end method

.method public isNetworkOnline(Landroid/content/Context;)Z
    .locals 8
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 29
    const/4 v6, 0x0

    .line 32
    .local v6, "status":Z
    :try_start_0
    const-string/jumbo v7, "connectivity"

    invoke-virtual {p1, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 34
    .local v0, "cm":Landroid/net/ConnectivityManager;
    const/4 v7, 0x1

    invoke-virtual {v0, v7}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    .line 35
    .local v3, "netInfoWiFi":Landroid/net/NetworkInfo;
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 37
    .local v2, "netInfoMobile":Landroid/net/NetworkInfo;
    const/4 v5, 0x0

    .line 38
    .local v5, "stateWiFi":Landroid/net/NetworkInfo$State;
    const/4 v4, 0x0

    .line 40
    .local v4, "stateMobile":Landroid/net/NetworkInfo$State;
    if-eqz v3, :cond_0

    .line 41
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v5

    .line 44
    :cond_0
    if-eqz v2, :cond_1

    .line 45
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v4

    .line 48
    :cond_1
    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-eq v4, v7, :cond_2

    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v5, v7, :cond_4

    .line 49
    :cond_2
    const/4 v6, 0x1

    .line 60
    .end local v0    # "cm":Landroid/net/ConnectivityManager;
    .end local v2    # "netInfoMobile":Landroid/net/NetworkInfo;
    .end local v3    # "netInfoWiFi":Landroid/net/NetworkInfo;
    .end local v4    # "stateMobile":Landroid/net/NetworkInfo$State;
    .end local v5    # "stateWiFi":Landroid/net/NetworkInfo$State;
    :cond_3
    :goto_0
    return v6

    .line 50
    .restart local v0    # "cm":Landroid/net/ConnectivityManager;
    .restart local v2    # "netInfoMobile":Landroid/net/NetworkInfo;
    .restart local v3    # "netInfoWiFi":Landroid/net/NetworkInfo;
    .restart local v4    # "stateMobile":Landroid/net/NetworkInfo$State;
    .restart local v5    # "stateWiFi":Landroid/net/NetworkInfo$State;
    :cond_4
    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    if-eq v4, v7, :cond_5

    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v5, v7, :cond_3

    .line 51
    :cond_5
    const/4 v6, 0x0

    goto :goto_0

    .line 53
    .end local v0    # "cm":Landroid/net/ConnectivityManager;
    .end local v2    # "netInfoMobile":Landroid/net/NetworkInfo;
    .end local v3    # "netInfoWiFi":Landroid/net/NetworkInfo;
    .end local v4    # "stateMobile":Landroid/net/NetworkInfo$State;
    .end local v5    # "stateWiFi":Landroid/net/NetworkInfo$State;
    :catch_0
    move-exception v1

    .line 57
    .local v1, "e":Ljava/lang/Exception;
    const/4 v6, 0x0

    goto :goto_0
.end method

.method public onNegativeClick()V
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;->callback:Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;->callback:Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;->onUserClickCancel()V

    .line 114
    :cond_0
    return-void
.end method

.method public bridge synthetic onPositiveClick(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 19
    check-cast p1, Ljava/lang/Void;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;->onPositiveClick(Ljava/lang/Void;)V

    return-void
.end method

.method public onPositiveClick(Ljava/lang/Void;)V
    .locals 1
    .param p1, "arg"    # Ljava/lang/Void;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;->callback:Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper;->callback:Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/net/util/NetDetectionHelper$NetDetectDialogCallback;->onUserClickRetry()V

    .line 107
    :cond_0
    return-void
.end method
