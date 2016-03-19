.class public Lcom/j256/ormlite/dao/RuntimeExceptionDao;
.super Ljava/lang/Object;
.source "RuntimeExceptionDao.java"

# interfaces
.implements Lcom/j256/ormlite/dao/CloseableIterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "ID:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/j256/ormlite/dao/CloseableIterable",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final LOG_LEVEL:Lcom/j256/ormlite/logger/Log$Level;

.field private static final logger:Lcom/j256/ormlite/logger/Logger;


# instance fields
.field private dao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<TT;TID;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/j256/ormlite/logger/Log$Level;->DEBUG:Lcom/j256/ormlite/logger/Log$Level;

    sput-object v0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->LOG_LEVEL:Lcom/j256/ormlite/logger/Log$Level;

    .line 51
    const-class v0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;

    invoke-static {v0}, Lcom/j256/ormlite/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    sput-object v0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logger:Lcom/j256/ormlite/logger/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/j256/ormlite/dao/Dao;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<TT;TID;>;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<TT;TID;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    .line 55
    return-void
.end method

.method public static createDao(Lcom/j256/ormlite/support/ConnectionSource;Lcom/j256/ormlite/table/DatabaseTableConfig;)Lcom/j256/ormlite/dao/RuntimeExceptionDao;
    .locals 2
    .param p0, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "ID:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/j256/ormlite/support/ConnectionSource;",
            "Lcom/j256/ormlite/table/DatabaseTableConfig",
            "<TT;>;)",
            "Lcom/j256/ormlite/dao/RuntimeExceptionDao",
            "<TT;TID;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "tableConfig":Lcom/j256/ormlite/table/DatabaseTableConfig;, "Lcom/j256/ormlite/table/DatabaseTableConfig<TT;>;"
    invoke-static {p0, p1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Lcom/j256/ormlite/table/DatabaseTableConfig;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 76
    .local v0, "castDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<TT;TID;>;"
    new-instance v1, Lcom/j256/ormlite/dao/RuntimeExceptionDao;

    invoke-direct {v1, v0}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    return-object v1
.end method

.method public static createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/RuntimeExceptionDao;
    .locals 2
    .param p0, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "ID:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/j256/ormlite/support/ConnectionSource;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/j256/ormlite/dao/RuntimeExceptionDao",
            "<TT;TID;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 65
    .local v0, "castDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<TT;TID;>;"
    new-instance v1, Lcom/j256/ormlite/dao/RuntimeExceptionDao;

    invoke-direct {v1, v0}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    return-object v1
.end method

.method private logMessage(Ljava/lang/Exception;Ljava/lang/String;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 847
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    sget-object v0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logger:Lcom/j256/ormlite/logger/Logger;

    sget-object v1, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->LOG_LEVEL:Lcom/j256/ormlite/logger/Log$Level;

    invoke-virtual {v0, v1, p1, p2}, Lcom/j256/ormlite/logger/Logger;->log(Lcom/j256/ormlite/logger/Log$Level;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 848
    return-void
.end method


# virtual methods
.method public assignEmptyForeignCollection(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3
    .param p2, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 634
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "parent":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->assignEmptyForeignCollection(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 639
    return-void

    .line 635
    :catch_0
    move-exception v0

    .line 636
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "assignEmptyForeignCollection threw exception on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 637
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public callBatchTasks(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<CT:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TCT;>;)TCT;"
        }
    .end annotation

    .prologue
    .line 534
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TCT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->callBatchTasks(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 535
    :catch_0
    move-exception v0

    .line 536
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "callBatchTasks threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 537
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public clearObjectCache()V
    .locals 1

    .prologue
    .line 688
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->clearObjectCache()V

    .line 689
    return-void
.end method

.method public closeLastIterator()V
    .locals 2

    .prologue
    .line 401
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->closeLastIterator()V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 406
    return-void

    .line 402
    :catch_0
    move-exception v0

    .line 403
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "closeLastIterator threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 404
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public closeableIterator()Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 372
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->closeableIterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    return-object v0
.end method

.method public commit(Lcom/j256/ormlite/support/DatabaseConnection;)V
    .locals 3
    .param p1, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;

    .prologue
    .line 806
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->commit(Lcom/j256/ormlite/support/DatabaseConnection;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 811
    return-void

    .line 807
    :catch_0
    move-exception v0

    .line 808
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "commit("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") threw exception"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 809
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public countOf()J
    .locals 4

    .prologue
    .line 610
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->countOf()J
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    return-wide v2

    .line 611
    :catch_0
    move-exception v0

    .line 612
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "countOf threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 613
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public countOf(Lcom/j256/ormlite/stmt/PreparedQuery;)J
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<TT;>;)J"
        }
    .end annotation

    .prologue
    .line 622
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->countOf(Lcom/j256/ormlite/stmt/PreparedQuery;)J
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    return-wide v2

    .line 623
    :catch_0
    move-exception v0

    .line 624
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "countOf threw exception on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 625
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public create(Ljava/lang/Object;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 225
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->create(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 226
    :catch_0
    move-exception v0

    .line 227
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "create threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 228
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public createIfNotExists(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 237
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->createIfNotExists(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 238
    :catch_0
    move-exception v0

    .line 239
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "createIfNotExists threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 240
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;"
        }
    .end annotation

    .prologue
    .line 249
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 250
    :catch_0
    move-exception v0

    .line 251
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "createOrUpdate threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 252
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public delete(Lcom/j256/ormlite/stmt/PreparedDelete;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedDelete",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 357
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "preparedDelete":Lcom/j256/ormlite/stmt/PreparedDelete;, "Lcom/j256/ormlite/stmt/PreparedDelete<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->delete(Lcom/j256/ormlite/stmt/PreparedDelete;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 358
    :catch_0
    move-exception v0

    .line 359
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "delete threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 360
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public delete(Ljava/lang/Object;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 309
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->delete(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 310
    :catch_0
    move-exception v0

    .line 311
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "delete threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 312
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public delete(Ljava/util/Collection;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 333
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "datas":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->delete(Ljava/util/Collection;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 334
    :catch_0
    move-exception v0

    .line 335
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "delete threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 336
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/stmt/DeleteBuilder",
            "<TT;TID;>;"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;

    move-result-object v0

    return-object v0
.end method

.method public deleteById(Ljava/lang/Object;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TID;)I"
        }
    .end annotation

    .prologue
    .line 321
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "id":Ljava/lang/Object;, "TID;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->deleteById(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 322
    :catch_0
    move-exception v0

    .line 323
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "deleteById threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 324
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public deleteIds(Ljava/util/Collection;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<TID;>;)I"
        }
    .end annotation

    .prologue
    .line 345
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "ids":Ljava/util/Collection;, "Ljava/util/Collection<TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->deleteIds(Ljava/util/Collection;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 346
    :catch_0
    move-exception v0

    .line 347
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "deleteIds threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 348
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public endThreadConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V
    .locals 3
    .param p1, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;

    .prologue
    .line 744
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->endThreadConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 749
    return-void

    .line 745
    :catch_0
    move-exception v0

    .line 746
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "endThreadConnection("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") threw exception"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 747
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs executeRaw(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "arguments"    # [Ljava/lang/String;

    .prologue
    .line 498
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->executeRaw(Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 499
    :catch_0
    move-exception v0

    .line 500
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "executeRaw threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 501
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public executeRawNoArgs(Ljava/lang/String;)I
    .locals 3
    .param p1, "statement"    # Ljava/lang/String;

    .prologue
    .line 510
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->executeRawNoArgs(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 511
    :catch_0
    move-exception v0

    .line 512
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "executeRawNoArgs threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 513
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public extractId(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TID;"
        }
    .end annotation

    .prologue
    .line 565
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->extractId(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 566
    :catch_0
    move-exception v0

    .line 567
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "extractId threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 568
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public findForeignFieldType(Ljava/lang/Class;)Lcom/j256/ormlite/field/FieldType;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/j256/ormlite/field/FieldType;"
        }
    .end annotation

    .prologue
    .line 583
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0, p1}, Lcom/j256/ormlite/dao/Dao;->findForeignFieldType(Ljava/lang/Class;)Lcom/j256/ormlite/field/FieldType;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionSource()Lcom/j256/ormlite/support/ConnectionSource;
    .locals 1

    .prologue
    .line 843
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->getConnectionSource()Lcom/j256/ormlite/support/ConnectionSource;

    move-result-object v0

    return-object v0
.end method

.method public getDataClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 576
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->getDataClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getEmptyForeignCollection(Ljava/lang/String;)Lcom/j256/ormlite/dao/ForeignCollection;
    .locals 3
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<FT:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<TFT;>;"
        }
    .end annotation

    .prologue
    .line 646
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->getEmptyForeignCollection(Ljava/lang/String;)Lcom/j256/ormlite/dao/ForeignCollection;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 647
    :catch_0
    move-exception v0

    .line 648
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "getEmptyForeignCollection threw exception on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 649
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getObjectCache()Lcom/j256/ormlite/dao/ObjectCache;
    .locals 1

    .prologue
    .line 669
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->getObjectCache()Lcom/j256/ormlite/dao/ObjectCache;

    move-result-object v0

    return-object v0
.end method

.method public getRawRowMapper()Lcom/j256/ormlite/dao/RawRowMapper;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/RawRowMapper",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 836
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->getRawRowMapper()Lcom/j256/ormlite/dao/RawRowMapper;

    move-result-object v0

    return-object v0
.end method

.method public getSelectStarRowMapper()Lcom/j256/ormlite/stmt/GenericRowMapper;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/stmt/GenericRowMapper",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 708
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->getSelectStarRowMapper()Lcom/j256/ormlite/stmt/GenericRowMapper;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 709
    :catch_0
    move-exception v0

    .line 710
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "getSelectStarRowMapper threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 711
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getWrappedIterable()Lcom/j256/ormlite/dao/CloseableWrappedIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/CloseableWrappedIterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 386
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->getWrappedIterable()Lcom/j256/ormlite/dao/CloseableWrappedIterable;

    move-result-object v0

    return-object v0
.end method

.method public getWrappedIterable(Lcom/j256/ormlite/stmt/PreparedQuery;)Lcom/j256/ormlite/dao/CloseableWrappedIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<TT;>;)",
            "Lcom/j256/ormlite/dao/CloseableWrappedIterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 393
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<TT;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0, p1}, Lcom/j256/ormlite/dao/Dao;->getWrappedIterable(Lcom/j256/ormlite/stmt/PreparedQuery;)Lcom/j256/ormlite/dao/CloseableWrappedIterable;

    move-result-object v0

    return-object v0
.end method

.method public idExists(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TID;)Z"
        }
    .end annotation

    .prologue
    .line 720
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "id":Ljava/lang/Object;, "TID;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->idExists(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 721
    :catch_0
    move-exception v0

    .line 722
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "idExists threw exception on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 723
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isAutoCommit()Z
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 782
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->isAutoCommit()Z
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 783
    :catch_0
    move-exception v0

    .line 784
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "isAutoCommit() threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 785
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isAutoCommit(Lcom/j256/ormlite/support/DatabaseConnection;)Z
    .locals 3
    .param p1, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;

    .prologue
    .line 794
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->isAutoCommit(Lcom/j256/ormlite/support/DatabaseConnection;)Z
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 795
    :catch_0
    move-exception v0

    .line 796
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "isAutoCommit("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") threw exception"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 797
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isTableExists()Z
    .locals 2

    .prologue
    .line 598
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->isTableExists()Z
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 599
    :catch_0
    move-exception v0

    .line 600
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "isTableExists threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 601
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isUpdatable()Z
    .locals 1

    .prologue
    .line 590
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->isUpdatable()Z

    move-result v0

    return v0
.end method

.method public iterator()Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 368
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator(I)Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 1
    .param p1, "resultFlags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 379
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0, p1}, Lcom/j256/ormlite/dao/Dao;->iterator(I)Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator(Lcom/j256/ormlite/stmt/PreparedQuery;)Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<TT;>;)",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 413
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->iterator(Lcom/j256/ormlite/stmt/PreparedQuery;)Lcom/j256/ormlite/dao/CloseableIterator;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 414
    :catch_0
    move-exception v0

    .line 415
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "iterator threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 416
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public iterator(Lcom/j256/ormlite/stmt/PreparedQuery;I)Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 3
    .param p2, "resultFlags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<TT;>;I)",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 425
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->iterator(Lcom/j256/ormlite/stmt/PreparedQuery;I)Lcom/j256/ormlite/dao/CloseableIterator;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 426
    :catch_0
    move-exception v0

    .line 427
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "iterator threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 428
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 42
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    return-object v0
.end method

.method public mapSelectStarRow(Lcom/j256/ormlite/support/DatabaseResults;)Ljava/lang/Object;
    .locals 2
    .param p1, "results"    # Lcom/j256/ormlite/support/DatabaseResults;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/support/DatabaseResults;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 696
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->mapSelectStarRow(Lcom/j256/ormlite/support/DatabaseResults;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 697
    :catch_0
    move-exception v0

    .line 698
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "mapSelectStarRow threw exception on results"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 699
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public objectToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 545
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0, p1}, Lcom/j256/ormlite/dao/Dao;->objectToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public objectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .prologue
    .line 553
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data1":Ljava/lang/Object;, "TT;"
    .local p2, "data2":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->objectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 554
    :catch_0
    move-exception v0

    .line 555
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "objectsEqual threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " and "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 556
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public query(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->query(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 214
    :catch_0
    move-exception v0

    .line 215
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "query threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 216
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/stmt/QueryBuilder",
            "<TT;TID;>;"
        }
    .end annotation

    .prologue
    .line 191
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public queryForAll()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->queryForAll()Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "queryForAll threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 111
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryForEq(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;
    .locals 3
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->queryForEq(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 121
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryForEq threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 123
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryForFieldValues(Ljava/util/Map;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->queryForFieldValues(Ljava/util/Map;)Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "queryForFieldValues threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 159
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryForFieldValuesArgs(Ljava/util/Map;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 168
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "fieldValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->queryForFieldValuesArgs(Ljava/util/Map;)Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 169
    :catch_0
    move-exception v0

    .line 170
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "queryForFieldValuesArgs threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 171
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryForFirst(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->queryForFirst(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryForFirst threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 99
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryForId(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TID;)TT;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "id":Ljava/lang/Object;, "TID;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->queryForId(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryForId threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 87
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryForMatching(Ljava/lang/Object;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "matchObj":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->queryForMatching(Ljava/lang/Object;)Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryForMatching threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 135
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryForMatchingArgs(Ljava/lang/Object;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "matchObj":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->queryForMatchingArgs(Ljava/lang/Object;)Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 145
    :catch_0
    move-exception v0

    .line 146
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryForMatchingArgs threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 147
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public queryForSameId(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 180
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->queryForSameId(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryForSameId threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 183
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs queryRaw(Ljava/lang/String;Lcom/j256/ormlite/dao/RawRowMapper;[Ljava/lang/String;)Lcom/j256/ormlite/dao/GenericRawResults;
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p3, "arguments"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UO:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/j256/ormlite/dao/RawRowMapper",
            "<TUO;>;[",
            "Ljava/lang/String;",
            ")",
            "Lcom/j256/ormlite/dao/GenericRawResults",
            "<TUO;>;"
        }
    .end annotation

    .prologue
    .line 461
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p2, "mapper":Lcom/j256/ormlite/dao/RawRowMapper;, "Lcom/j256/ormlite/dao/RawRowMapper<TUO;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2, p3}, Lcom/j256/ormlite/dao/Dao;->queryRaw(Ljava/lang/String;Lcom/j256/ormlite/dao/RawRowMapper;[Ljava/lang/String;)Lcom/j256/ormlite/dao/GenericRawResults;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 462
    :catch_0
    move-exception v0

    .line 463
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryRaw threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 464
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs queryRaw(Ljava/lang/String;[Lcom/j256/ormlite/field/DataType;Lcom/j256/ormlite/dao/RawRowObjectMapper;[Ljava/lang/String;)Lcom/j256/ormlite/dao/GenericRawResults;
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "columnTypes"    # [Lcom/j256/ormlite/field/DataType;
    .param p4, "arguments"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UO:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[",
            "Lcom/j256/ormlite/field/DataType;",
            "Lcom/j256/ormlite/dao/RawRowObjectMapper",
            "<TUO;>;[",
            "Ljava/lang/String;",
            ")",
            "Lcom/j256/ormlite/dao/GenericRawResults",
            "<TUO;>;"
        }
    .end annotation

    .prologue
    .line 474
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p3, "mapper":Lcom/j256/ormlite/dao/RawRowObjectMapper;, "Lcom/j256/ormlite/dao/RawRowObjectMapper<TUO;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2, p3, p4}, Lcom/j256/ormlite/dao/Dao;->queryRaw(Ljava/lang/String;[Lcom/j256/ormlite/field/DataType;Lcom/j256/ormlite/dao/RawRowObjectMapper;[Ljava/lang/String;)Lcom/j256/ormlite/dao/GenericRawResults;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 475
    :catch_0
    move-exception v0

    .line 476
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryRaw threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 477
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs queryRaw(Ljava/lang/String;[Lcom/j256/ormlite/field/DataType;[Ljava/lang/String;)Lcom/j256/ormlite/dao/GenericRawResults;
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "columnTypes"    # [Lcom/j256/ormlite/field/DataType;
    .param p3, "arguments"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Lcom/j256/ormlite/field/DataType;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Lcom/j256/ormlite/dao/GenericRawResults",
            "<[",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 486
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2, p3}, Lcom/j256/ormlite/dao/Dao;->queryRaw(Ljava/lang/String;[Lcom/j256/ormlite/field/DataType;[Ljava/lang/String;)Lcom/j256/ormlite/dao/GenericRawResults;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 487
    :catch_0
    move-exception v0

    .line 488
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryRaw threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 489
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs queryRaw(Ljava/lang/String;[Ljava/lang/String;)Lcom/j256/ormlite/dao/GenericRawResults;
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "arguments"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Lcom/j256/ormlite/dao/GenericRawResults",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 437
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->queryRaw(Ljava/lang/String;[Ljava/lang/String;)Lcom/j256/ormlite/dao/GenericRawResults;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 438
    :catch_0
    move-exception v0

    .line 439
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryRaw threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 440
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs queryRawValue(Ljava/lang/String;[Ljava/lang/String;)J
    .locals 4
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "arguments"    # [Ljava/lang/String;

    .prologue
    .line 449
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->queryRawValue(Ljava/lang/String;[Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    return-wide v2

    .line 450
    :catch_0
    move-exception v0

    .line 451
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "queryRawValue threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 452
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public refresh(Ljava/lang/Object;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 297
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->refresh(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 298
    :catch_0
    move-exception v0

    .line 299
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "refresh threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 300
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public rollBack(Lcom/j256/ormlite/support/DatabaseConnection;)V
    .locals 3
    .param p1, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;

    .prologue
    .line 818
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->rollBack(Lcom/j256/ormlite/support/DatabaseConnection;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 823
    return-void

    .line 819
    :catch_0
    move-exception v0

    .line 820
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "rollBack("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") threw exception"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 821
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setAutoCommit(Lcom/j256/ormlite/support/DatabaseConnection;Z)V
    .locals 3
    .param p1, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;
    .param p2, "autoCommit"    # Z

    .prologue
    .line 769
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->setAutoCommit(Lcom/j256/ormlite/support/DatabaseConnection;Z)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 774
    return-void

    .line 770
    :catch_0
    move-exception v0

    .line 771
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setAutoCommit("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") threw exception"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 772
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setAutoCommit(Z)V
    .locals 3
    .param p1, "autoCommit"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 757
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->setAutoCommit(Z)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 762
    return-void

    .line 758
    :catch_0
    move-exception v0

    .line 759
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setAutoCommit("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") threw exception"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 760
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setObjectCache(Lcom/j256/ormlite/dao/ObjectCache;)V
    .locals 3
    .param p1, "objectCache"    # Lcom/j256/ormlite/dao/ObjectCache;

    .prologue
    .line 677
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->setObjectCache(Lcom/j256/ormlite/dao/ObjectCache;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 682
    return-void

    .line 678
    :catch_0
    move-exception v0

    .line 679
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setObjectCache threw exception on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 680
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setObjectCache(Z)V
    .locals 3
    .param p1, "enabled"    # Z

    .prologue
    .line 658
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->setObjectCache(Z)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 663
    return-void

    .line 659
    :catch_0
    move-exception v0

    .line 660
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setObjectCache("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") threw exception"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 661
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setObjectFactory(Lcom/j256/ormlite/table/ObjectFactory;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/table/ObjectFactory",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 829
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "objectFactory":Lcom/j256/ormlite/table/ObjectFactory;, "Lcom/j256/ormlite/table/ObjectFactory<TT;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0, p1}, Lcom/j256/ormlite/dao/Dao;->setObjectFactory(Lcom/j256/ormlite/table/ObjectFactory;)V

    .line 830
    return-void
.end method

.method public startThreadConnection()Lcom/j256/ormlite/support/DatabaseConnection;
    .locals 2

    .prologue
    .line 732
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->startThreadConnection()Lcom/j256/ormlite/support/DatabaseConnection;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 733
    :catch_0
    move-exception v0

    .line 734
    .local v0, "e":Ljava/sql/SQLException;
    const-string/jumbo v1, "startThreadConnection() threw exception"

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 735
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public update(Lcom/j256/ormlite/stmt/PreparedUpdate;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedUpdate",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 285
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "preparedUpdate":Lcom/j256/ormlite/stmt/PreparedUpdate;, "Lcom/j256/ormlite/stmt/PreparedUpdate<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->update(Lcom/j256/ormlite/stmt/PreparedUpdate;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 286
    :catch_0
    move-exception v0

    .line 287
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "update threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 288
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public update(Ljava/lang/Object;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 261
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/dao/Dao;->update(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 262
    :catch_0
    move-exception v0

    .line 263
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "update threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 264
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public updateBuilder()Lcom/j256/ormlite/stmt/UpdateBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/stmt/UpdateBuilder",
            "<TT;TID;>;"
        }
    .end annotation

    .prologue
    .line 198
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->updateBuilder()Lcom/j256/ormlite/stmt/UpdateBuilder;

    move-result-object v0

    return-object v0
.end method

.method public updateId(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TID;)I"
        }
    .end annotation

    .prologue
    .line 273
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    .local p2, "newId":Ljava/lang/Object;, "TID;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->updateId(Ljava/lang/Object;Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 274
    :catch_0
    move-exception v0

    .line 275
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "updateId threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 276
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public varargs updateRaw(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "arguments"    # [Ljava/lang/String;

    .prologue
    .line 522
    .local p0, "this":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "Lcom/j256/ormlite/dao/RuntimeExceptionDao<TT;TID;>;"
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1, p1, p2}, Lcom/j256/ormlite/dao/Dao;->updateRaw(Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 523
    :catch_0
    move-exception v0

    .line 524
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "updateRaw threw exception on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;->logMessage(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 525
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
