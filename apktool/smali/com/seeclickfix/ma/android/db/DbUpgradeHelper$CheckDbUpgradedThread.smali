.class Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;
.super Ljava/lang/Thread;
.source "DbUpgradeHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CheckDbUpgradedThread"
.end annotation


# instance fields
.field private c:Landroid/content/Context;

.field private numTimesCheckedDb:I

.field final synthetic this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;Landroid/content/Context;)V
    .locals 1
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->numTimesCheckedDb:I

    .line 75
    iput-object p2, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->c:Landroid/content/Context;

    .line 77
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/16 v9, 0x37

    const/4 v8, 0x0

    .line 82
    const-string/jumbo v5, "Pref:DB_VERSION"

    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->c:Landroid/content/Context;

    invoke-static {v5, v8, v6}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getInt(Ljava/lang/String;ILandroid/content/Context;)I

    move-result v0

    .line 86
    .local v0, "currentDBVersion":I
    const/4 v4, 0x0

    .line 87
    .local v4, "needsUpgrade":Z
    const/4 v3, 0x0

    .line 89
    .local v3, "needsCreation":Z
    if-nez v0, :cond_1

    .line 92
    const/4 v3, 0x1

    .line 104
    :goto_0
    if-nez v4, :cond_0

    if-eqz v3, :cond_3

    .line 105
    :cond_0
    iget-object v5, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->c:Landroid/content/Context;

    const-class v6, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {v5, v6}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 106
    .local v2, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 108
    :goto_1
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading()Z

    move-result v5

    if-eqz v5, :cond_3

    iget v5, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->numTimesCheckedDb:I

    const/16 v6, 0x64

    if-ge v5, v6, :cond_3

    .line 113
    const-wide/16 v6, 0x1e

    :try_start_0
    invoke-static {v6, v7}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->sleep(J)V

    .line 114
    iget v5, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->numTimesCheckedDb:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->numTimesCheckedDb:I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 115
    :catch_0
    move-exception v1

    .line 133
    .end local v2    # "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :goto_2
    return-void

    .line 93
    :cond_1
    sget v5, Lcom/seeclickfix/ma/android/db/DatabaseConfig;->DB_VERSION:I

    if-ge v0, v5, :cond_2

    .line 94
    const/4 v4, 0x1

    .line 96
    iget-object v5, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    # getter for: Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->handler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->access$100(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)Landroid/os/Handler;

    move-result-object v5

    const/16 v6, 0x38

    invoke-virtual {v5, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 99
    :cond_2
    iget-object v5, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    # getter for: Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->handler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->access$100(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto :goto_2

    .line 129
    :cond_3
    iput v8, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->numTimesCheckedDb:I

    .line 131
    iget-object v5, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$CheckDbUpgradedThread;->this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    # getter for: Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->handler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->access$100(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto :goto_2
.end method
