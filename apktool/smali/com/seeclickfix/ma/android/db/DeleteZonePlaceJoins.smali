.class public Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;
.super Ljava/lang/Object;
.source "DeleteZonePlaceJoins.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DeleteZonePlaceJoins"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getDeleteCallable(Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;
    .locals 1
    .param p5, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
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
    .line 62
    .local p1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;Ljava/lang/Integer;>;"
    .local p2, "zonesDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;Ljava/lang/Integer;>;"
    .local p3, "enhancedWADao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Ljava/lang/Integer;>;"
    .local p4, "btnsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Ljava/lang/Integer;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;

    invoke-direct {v0, p0, p1, p5}, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;-><init>(Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 95
    .local v0, "batchCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Integer;>;"
    return-object v0
.end method


# virtual methods
.method public deletePlaceJoins(Lcom/seeclickfix/ma/android/objects/loc/Place;Landroid/content/Context;)I
    .locals 9
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 29
    const/4 v8, -0x1

    .line 30
    .local v8, "numDeleted":I
    const-class v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p2, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v6

    check-cast v6, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 32
    .local v6, "dbHelper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 35
    :try_start_0
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getZonePlaceJoinDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    .line 36
    .local v1, "joinsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;Ljava/lang/Integer;>;"
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getZoneDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    .line 37
    .local v2, "zonesDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;Ljava/lang/Integer;>;"
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getEnhancedWatchAreaDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v3

    .line 38
    .local v3, "enhancedWADao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Ljava/lang/Integer;>;"
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getMobileButtonsDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    .local v4, "btnsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Ljava/lang/Integer;>;"
    move-object v0, p0

    move-object v5, p1

    .line 39
    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;->getDeleteCallable(Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;

    move-result-object v7

    .line 44
    .local v7, "joinsCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Integer;>;"
    invoke-interface {v1, v7}, Lcom/j256/ormlite/dao/Dao;->callBatchTasks(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 53
    .end local v1    # "joinsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;Ljava/lang/Integer;>;"
    .end local v2    # "zonesDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;Ljava/lang/Integer;>;"
    .end local v3    # "enhancedWADao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Ljava/lang/Integer;>;"
    .end local v4    # "btnsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Ljava/lang/Integer;>;"
    .end local v7    # "joinsCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Integer;>;"
    :goto_0
    return v8

    .line 47
    :catch_0
    move-exception v0

    goto :goto_0

    .line 45
    :catch_1
    move-exception v0

    goto :goto_0
.end method
