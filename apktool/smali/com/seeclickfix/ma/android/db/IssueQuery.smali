.class public Lcom/seeclickfix/ma/android/db/IssueQuery;
.super Ljava/lang/Object;
.source "IssueQuery.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/db/DbQuery;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/seeclickfix/ma/android/db/DbQuery",
        "<",
        "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
        ">;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "IssueQuery"


# instance fields
.field private place:Lcom/seeclickfix/ma/android/objects/loc/Place;

.field private preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 30
    return-void
.end method


# virtual methods
.method public getPreparedQuery(Landroid/content/Context;)Lcom/j256/ormlite/stmt/PreparedQuery;
    .locals 9
    .param p1, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;

    if-eqz v6, :cond_0

    .line 35
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;

    .line 68
    :goto_0
    return-object v6

    .line 38
    :cond_0
    const-class v6, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p1, v6}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 39
    .local v0, "dbHelper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    const/4 v5, 0x0

    .line 41
    .local v5, "rawQuery":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 42
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;

    .line 47
    :try_start_0
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getIssueDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    .line 48
    .local v1, "issueDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v2

    .line 49
    .local v2, "issueQueryBuilder":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getIssuePlaceJoinDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v3

    .line 50
    .local v3, "joinDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    invoke-interface {v3}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v4

    .line 51
    .local v4, "joinQueryBuilder":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    invoke-virtual {v4}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v6

    const-string/jumbo v7, "place_id"

    iget-object v8, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 52
    const-wide/16 v6, 0x19

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/j256/ormlite/stmt/QueryBuilder;->limit(Ljava/lang/Long;)Lcom/j256/ormlite/stmt/QueryBuilder;

    .line 53
    invoke-virtual {v2, v4}, Lcom/j256/ormlite/stmt/QueryBuilder;->join(Lcom/j256/ormlite/stmt/QueryBuilder;)Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/j256/ormlite/stmt/QueryBuilder;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v6

    iput-object v6, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;

    .line 62
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;

    invoke-interface {v6}, Lcom/j256/ormlite/stmt/PreparedQuery;->getStatement()Ljava/lang/String;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 68
    .end local v1    # "issueDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    .end local v2    # "issueQueryBuilder":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    .end local v3    # "joinDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    .end local v4    # "joinQueryBuilder":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    :goto_1
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;

    goto :goto_0

    .line 65
    :catch_0
    move-exception v6

    goto :goto_1
.end method

.method public getRawQuery(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "SELECT * FROM issues_by_place WHERE place_id ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "stmt":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/db/IssueQuery;->getPreparedQuery(Landroid/content/Context;)Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v1

    invoke-interface {v1}, Lcom/j256/ormlite/stmt/PreparedQuery;->getStatement()Ljava/lang/String;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 80
    :goto_0
    return-object v0

    .line 77
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public setPreparedQuery(Lcom/j256/ormlite/stmt/PreparedQuery;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/IssueQuery;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;

    .line 86
    return-void
.end method
