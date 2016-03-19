.class public Lcom/seeclickfix/ma/android/db/DeleteJoins;
.super Ljava/lang/Object;
.source "DeleteJoins.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DeleteJoins"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getDeleteCallable(Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;
    .locals 1
    .param p2, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ")",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;-><init>(Lcom/seeclickfix/ma/android/db/DeleteJoins;Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 58
    .local v0, "batchCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Integer;>;"
    return-object v0
.end method


# virtual methods
.method public deletePlaceJoins(Lcom/seeclickfix/ma/android/objects/loc/Place;Landroid/content/Context;)I
    .locals 5
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 24
    const/4 v3, -0x1

    .line 25
    .local v3, "numDeleted":I
    const-class v4, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p2, v4}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 26
    .local v0, "dbHelper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 29
    :try_start_0
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getIssuePlaceJoinDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    .line 30
    .local v2, "joinsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    invoke-direct {p0, v2, p1}, Lcom/seeclickfix/ma/android/db/DeleteJoins;->getDeleteCallable(Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;

    move-result-object v1

    .line 31
    .local v1, "joinsCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Integer;>;"
    invoke-interface {v2, v1}, Lcom/j256/ormlite/dao/Dao;->callBatchTasks(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 38
    .end local v1    # "joinsCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Integer;>;"
    .end local v2    # "joinsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    :goto_0
    return v3

    .line 34
    :catch_0
    move-exception v4

    goto :goto_0

    .line 32
    :catch_1
    move-exception v4

    goto :goto_0
.end method
