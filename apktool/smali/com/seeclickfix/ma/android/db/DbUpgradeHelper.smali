.class public Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;
.super Ljava/lang/Object;
.source "DbUpgradeHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;,
        Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field protected static final SHOW_UPGRADING:I = 0x38

.field private static final TAG:Ljava/lang/String; = "DbUpgradeHelper"

.field protected static final UPGRADE_COMPLETE:I = 0x37


# instance fields
.field private a:Landroid/support/v4/app/FragmentActivity;

.field private c:Landroid/content/Context;

.field private checkUpgradeThread:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;

.field private handler:Landroid/os/Handler;

.field private listener:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;

.field private progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;


# direct methods
.method public constructor <init>(Landroid/support/v4/app/FragmentActivity;)V
    .locals 1
    .param p1, "a"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->a:Landroid/support/v4/app/FragmentActivity;

    .line 35
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->c:Landroid/content/Context;

    .line 36
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->setupHandler()V

    .line 37
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->runCallbacksAndCleanup()V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method private runCallbacksAndCleanup()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 139
    iput-object v1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->handler:Landroid/os/Handler;

    .line 140
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->hideUpgradingDialog()V

    .line 141
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->listener:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;->onDbReady()V

    .line 142
    iput-object v1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->listener:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;

    .line 143
    iput-object v1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->a:Landroid/support/v4/app/FragmentActivity;

    .line 144
    return-void
.end method

.method private setupHandler()V
    .locals 1

    .prologue
    .line 50
    new-instance v0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$1;-><init>(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->handler:Landroid/os/Handler;

    .line 67
    return-void
.end method


# virtual methods
.method protected hideUpgradingDialog()V
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->isDetached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->dismiss()V

    .line 151
    :cond_0
    return-void
.end method

.method public setOnDbReadyListner(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->listener:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;

    .line 166
    return-void
.end method

.method protected showUpgradingDialog()V
    .locals 4

    .prologue
    .line 154
    iget-object v1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->c:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0155

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "searchingText":Ljava/lang/String;
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;-><init>()V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    .line 156
    iget-object v1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->setMessage(Ljava/lang/String;)V

    .line 157
    iget-object v1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->a:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 158
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->checkUpgradeThread:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->checkUpgradeThread:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->checkUpgradeThread:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->interrupt()V

    .line 44
    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->c:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;-><init>(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->checkUpgradeThread:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;

    .line 45
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->checkUpgradeThread:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->start()V

    .line 46
    return-void
.end method
