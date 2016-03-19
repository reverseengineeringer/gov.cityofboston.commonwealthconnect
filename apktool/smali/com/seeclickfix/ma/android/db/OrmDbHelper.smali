.class public Lcom/seeclickfix/ma/android/db/OrmDbHelper;
.super Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;
.source "OrmDbHelper.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "OrmDbHelper"


# instance fields
.field private answerDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Answer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private c:Landroid/content/Context;

.field private cityDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/City;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private enahancedWatchAreaDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private isUpgrading:Z

.field private issueDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private issuePlaceJoinDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mobileButtonsDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private placeDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private questionDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private reportDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private requestTypeDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private watchAreaDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private zoneDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private zonePlaceJoinDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 58
    const-string/jumbo v1, "scfcache.db"

    const/4 v2, 0x0

    sget v3, Lcom/seeclickfix/ma/android/db/DatabaseConfig;->DB_VERSION:I

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 54
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading:Z

    .line 59
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->c:Landroid/content/Context;

    .line 61
    const-string/jumbo v1, "Pref:DB_VERSION"

    invoke-static {v1, v4, p1}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getInt(Ljava/lang/String;ILandroid/content/Context;)I

    move-result v0

    .line 63
    .local v0, "currentDBVersion":I
    sget v1, Lcom/seeclickfix/ma/android/db/DatabaseConfig;->DB_VERSION:I

    if-ge v0, v1, :cond_0

    .line 64
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading:Z

    .line 68
    :goto_0
    return-void

    .line 66
    :cond_0
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading:Z

    goto :goto_0
.end method


# virtual methods
.method public getAnswerDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Answer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 171
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->answerDao:Lcom/j256/ormlite/dao/Dao;

    .line 172
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->answerDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getCityDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/City;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 176
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/loc/City;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->cityDao:Lcom/j256/ormlite/dao/Dao;

    .line 177
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->cityDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getEnhancedWatchAreaDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 197
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->enahancedWatchAreaDao:Lcom/j256/ormlite/dao/Dao;

    .line 198
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->enahancedWatchAreaDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getIssueDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->issueDao:Lcom/j256/ormlite/dao/Dao;

    .line 142
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->issueDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getIssuePlaceJoinDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->issuePlaceJoinDao:Lcom/j256/ormlite/dao/Dao;

    .line 152
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->issuePlaceJoinDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getMobileButtonsDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->mobileButtonsDao:Lcom/j256/ormlite/dao/Dao;

    .line 203
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->mobileButtonsDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getPlaceDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->placeDao:Lcom/j256/ormlite/dao/Dao;

    .line 147
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->placeDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getQuestionDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 166
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->questionDao:Lcom/j256/ormlite/dao/Dao;

    .line 167
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->questionDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getReportDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 156
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->reportDao:Lcom/j256/ormlite/dao/Dao;

    .line 157
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->reportDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getRequestTypeDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->requestTypeDao:Lcom/j256/ormlite/dao/Dao;

    .line 182
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->requestTypeDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getWatchAreaDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 161
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->watchAreaDao:Lcom/j256/ormlite/dao/Dao;

    .line 162
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->watchAreaDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getZoneDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->zoneDao:Lcom/j256/ormlite/dao/Dao;

    .line 188
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->zoneDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getZonePlaceJoinDao()Lcom/j256/ormlite/dao/Dao;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 192
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    const-class v1, Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;

    invoke-static {v0, v1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->zonePlaceJoinDao:Lcom/j256/ormlite/dao/Dao;

    .line 193
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->zonePlaceJoinDao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public isUpgrading()Z
    .locals 1

    .prologue
    .line 208
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading:Z

    return v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;)V
    .locals 18
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;

    .prologue
    .line 76
    :try_start_0
    const-class v15, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v1

    .line 77
    .local v1, "result1":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/loc/Place;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v7

    .line 78
    .local v7, "result2":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v8

    .line 79
    .local v8, "result3":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/report/Report;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v9

    .line 80
    .local v9, "result4":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v10

    .line 81
    .local v10, "result5":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/report/Question;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v11

    .line 82
    .local v11, "result6":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v12

    .line 83
    .local v12, "result7":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/loc/City;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v13

    .line 84
    .local v13, "result8":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v14

    .line 85
    .local v14, "result9":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v2

    .line 86
    .local v2, "result10":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v3

    .line 87
    .local v3, "result11":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v4

    .line 88
    .local v4, "result12":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v5

    .line 89
    .local v5, "result13":I
    const-class v15, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    move-object/from16 v0, p2

    invoke-static {v0, v15}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    move-result v6

    .line 92
    .local v6, "result14":I
    const-string/jumbo v15, "CREATE VIEW IF NOT EXISTS issues_by_place AS SELECT DISTINCT i.id as id,i.user_id as user_id,i.address as address,i.description as description,i.lat as lat,i.lng as lng,i.anonymize_reporter as anonymize_reporter,i.summary as summary,i.num_comments as num_comments,i.bitly as bitly,i.slug as slug,i.rating as rating,i.status as status,i.type as type,i.updated_at as updated_at,i.updated_at_raw as updated_at_raw,i.comment_count_excluding_activity as comment_count_excluding_activity,i.following as following,i.icon_square as icon_square,i.photo_large_url as photo_large_url,i.photo_small_url as photo_small_url,i.photo_square_url as photo_square_url,i.minutes_since_created as minutes_since_created,i.voted_before as voted_before,i.created_at_epoch as created_at_epoch,i.created_at as created_at,i.reporter_display as reporter_display,p.id as place_id FROM issues i, places p, issue_place_join j WHERE j.place_id = p.id AND j.issue_id = i.id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .end local v1    # "result1":I
    .end local v2    # "result10":I
    .end local v3    # "result11":I
    .end local v4    # "result12":I
    .end local v5    # "result13":I
    .end local v6    # "result14":I
    .end local v7    # "result2":I
    .end local v8    # "result3":I
    .end local v9    # "result4":I
    .end local v10    # "result5":I
    .end local v11    # "result6":I
    .end local v12    # "result7":I
    .end local v13    # "result8":I
    .end local v14    # "result9":I
    :goto_0
    const-string/jumbo v15, "Pref:DB_VERSION"

    sget v16, Lcom/seeclickfix/ma/android/db/DatabaseConfig;->DB_VERSION:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->c:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-static/range {v15 .. v17}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putInt(Ljava/lang/String;ILandroid/content/Context;)V

    .line 103
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading:Z

    .line 105
    return-void

    .line 95
    :catch_0
    move-exception v15

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;II)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # I

    .prologue
    const/4 v1, 0x1

    .line 109
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading:Z

    .line 115
    :try_start_0
    const-class v1, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 116
    const-class v1, Lcom/seeclickfix/ma/android/objects/loc/Place;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 117
    const-class v1, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 118
    const-class v1, Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 119
    const-class v1, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 120
    const-class v1, Lcom/seeclickfix/ma/android/objects/report/Question;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 121
    const-class v1, Lcom/seeclickfix/ma/android/objects/report/Answer;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 122
    const-class v1, Lcom/seeclickfix/ma/android/objects/loc/City;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 123
    const-class v1, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 124
    const-class v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 125
    const-class v1, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 126
    const-class v1, Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 127
    const-class v1, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 128
    const-class v1, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 130
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    :goto_0
    return-void

    .line 131
    :catch_0
    move-exception v0

    .line 135
    .local v0, "e":Ljava/sql/SQLException;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading:Z

    goto :goto_0
.end method

.method public setUpgrading(Z)V
    .locals 0
    .param p1, "isUpgrading"    # Z

    .prologue
    .line 213
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->isUpgrading:Z

    .line 214
    return-void
.end method
