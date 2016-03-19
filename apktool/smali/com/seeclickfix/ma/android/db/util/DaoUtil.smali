.class public Lcom/seeclickfix/ma/android/db/util/DaoUtil;
.super Ljava/lang/Object;
.source "DaoUtil.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DaoUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAnswerDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Answer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 59
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    const/4 v0, 0x0

    .line 62
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    :try_start_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getAnswerDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 67
    :goto_0
    return-object v0

    .line 63
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getEnhancedWatchAreaDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 150
    const/4 v0, 0x0

    .line 153
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Ljava/lang/Integer;>;"
    :try_start_0
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 154
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getEnhancedWatchAreaDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 159
    .end local v1    # "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :goto_0
    return-object v0

    .line 155
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getIssueDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    const/4 v0, 0x0

    .line 113
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    :try_start_0
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 114
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getIssueDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 119
    .end local v1    # "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :goto_0
    return-object v0

    .line 115
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getPlaceDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    const/4 v0, 0x0

    .line 100
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    :try_start_0
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 101
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 102
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getPlaceDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 106
    .end local v1    # "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :goto_0
    return-object v0

    .line 103
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getQuestionDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 46
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    const/4 v0, 0x0

    .line 49
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Question;Ljava/lang/Integer;>;"
    :try_start_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getQuestionDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 54
    :goto_0
    return-object v0

    .line 50
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getReportDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 32
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 33
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    const/4 v0, 0x0

    .line 36
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Report;Ljava/lang/Integer;>;"
    :try_start_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getReportDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 41
    :goto_0
    return-object v0

    .line 37
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getRequestTypeDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 84
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 85
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    const/4 v0, 0x0

    .line 88
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/RequestType;Ljava/lang/Integer;>;"
    :try_start_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getRequestTypeDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 93
    :goto_0
    return-object v0

    .line 89
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getWatchAreaDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 72
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    const/4 v0, 0x0

    .line 75
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/Integer;>;"
    :try_start_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWatchAreaDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 80
    :goto_0
    return-object v0

    .line 76
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getZonePlaceJoinDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x0

    .line 140
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;Ljava/lang/Integer;>;"
    :try_start_0
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 141
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getZonePlaceJoinDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 146
    .end local v1    # "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :goto_0
    return-object v0

    .line 142
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getZonesDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 123
    const/4 v0, 0x0

    .line 126
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;Ljava/lang/Integer;>;"
    :try_start_0
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p0, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 127
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getZoneDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 132
    .end local v1    # "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :goto_0
    return-object v0

    .line 128
    :catch_0
    move-exception v2

    goto :goto_0
.end method
