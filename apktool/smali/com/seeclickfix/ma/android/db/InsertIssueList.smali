.class public Lcom/seeclickfix/ma/android/db/InsertIssueList;
.super Ljava/lang/Object;
.source "InsertIssueList.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "InsertIssueList"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getCallable(Lcom/j256/ormlite/dao/Dao;Ljava/util/List;)Ljava/util/concurrent/Callable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;)",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/db/InsertIssueList$1;

    invoke-direct {v0, p0, p2, p1}, Lcom/seeclickfix/ma/android/db/InsertIssueList$1;-><init>(Lcom/seeclickfix/ma/android/db/InsertIssueList;Ljava/util/List;Lcom/j256/ormlite/dao/Dao;)V

    .line 65
    .local v0, "batchCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Void;>;"
    return-object v0
.end method

.method private getJoinsCallable(Lcom/j256/ormlite/dao/Dao;Ljava/util/List;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;
    .locals 1
    .param p3, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ")",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    .local p1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;

    invoke-direct {v0, p0, p3, p2, p1}, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;-><init>(Lcom/seeclickfix/ma/android/db/InsertIssueList;Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/util/List;Lcom/j256/ormlite/dao/Dao;)V

    .line 107
    .local v0, "batchCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Void;>;"
    return-object v0
.end method


# virtual methods
.method public insert(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/loc/Place;Landroid/content/Context;)V
    .locals 7
    .param p2, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p3, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    const-class v6, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p3, v6}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 27
    .local v2, "dbHelper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 30
    :try_start_0
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getIssueDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    .line 31
    .local v1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getIssuePlaceJoinDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    .line 32
    .local v4, "joinsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getPlaceDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v5

    .line 33
    .local v5, "placeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    invoke-direct {p0, v1, p1}, Lcom/seeclickfix/ma/android/db/InsertIssueList;->getCallable(Lcom/j256/ormlite/dao/Dao;Ljava/util/List;)Ljava/util/concurrent/Callable;

    move-result-object v0

    .line 34
    .local v0, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Void;>;"
    invoke-direct {p0, v4, p1, p2}, Lcom/seeclickfix/ma/android/db/InsertIssueList;->getJoinsCallable(Lcom/j256/ormlite/dao/Dao;Ljava/util/List;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;

    move-result-object v3

    .line 39
    .local v3, "joinsCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Void;>;"
    invoke-static {p3, p2}, Lcom/seeclickfix/ma/android/db/InsertSinglePlace;->creatOrUpdate(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 41
    invoke-interface {v1, v0}, Lcom/j256/ormlite/dao/Dao;->callBatchTasks(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 42
    invoke-interface {v4, v3}, Lcom/j256/ormlite/dao/Dao;->callBatchTasks(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .end local v0    # "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Void;>;"
    .end local v1    # "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    .end local v3    # "joinsCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Void;>;"
    .end local v4    # "joinsDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    .end local v5    # "placeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v6

    goto :goto_0

    .line 43
    :catch_1
    move-exception v6

    goto :goto_0
.end method
