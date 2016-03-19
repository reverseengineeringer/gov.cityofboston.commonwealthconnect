.class public Lcom/j256/ormlite/misc/TransactionManager;
.super Ljava/lang/Object;
.source "TransactionManager.java"


# static fields
.field private static final SAVE_POINT_PREFIX:Ljava/lang/String; = "ORMLITE"

.field private static final logger:Lcom/j256/ormlite/logger/Logger;

.field private static savePointCounter:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private connectionSource:Lcom/j256/ormlite/support/ConnectionSource;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    const-class v0, Lcom/j256/ormlite/misc/TransactionManager;

    invoke-static {v0}, Lcom/j256/ormlite/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    sput-object v0, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    .line 68
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lcom/j256/ormlite/misc/TransactionManager;->savePointCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    return-void
.end method

.method public constructor <init>(Lcom/j256/ormlite/support/ConnectionSource;)V
    .locals 0
    .param p1, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/j256/ormlite/misc/TransactionManager;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    .line 82
    invoke-virtual {p0}, Lcom/j256/ormlite/misc/TransactionManager;->initialize()V

    .line 83
    return-void
.end method

.method public static callInTransaction(Lcom/j256/ormlite/support/ConnectionSource;Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 3
    .param p0, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/j256/ormlite/support/ConnectionSource;",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 121
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    invoke-interface {p0}, Lcom/j256/ormlite/support/ConnectionSource;->getReadWriteConnection()Lcom/j256/ormlite/support/DatabaseConnection;

    move-result-object v0

    .line 123
    .local v0, "connection":Lcom/j256/ormlite/support/DatabaseConnection;
    :try_start_0
    invoke-interface {p0, v0}, Lcom/j256/ormlite/support/ConnectionSource;->saveSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)Z

    move-result v1

    .line 124
    .local v1, "saved":Z
    invoke-interface {p0}, Lcom/j256/ormlite/support/ConnectionSource;->getDatabaseType()Lcom/j256/ormlite/db/DatabaseType;

    move-result-object v2

    invoke-static {v0, v1, v2, p1}, Lcom/j256/ormlite/misc/TransactionManager;->callInTransaction(Lcom/j256/ormlite/support/DatabaseConnection;ZLcom/j256/ormlite/db/DatabaseType;Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 127
    invoke-interface {p0, v0}, Lcom/j256/ormlite/support/ConnectionSource;->clearSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    .line 128
    invoke-interface {p0, v0}, Lcom/j256/ormlite/support/ConnectionSource;->releaseConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    return-object v2

    .line 127
    .end local v1    # "saved":Z
    :catchall_0
    move-exception v2

    invoke-interface {p0, v0}, Lcom/j256/ormlite/support/ConnectionSource;->clearSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    .line 128
    invoke-interface {p0, v0}, Lcom/j256/ormlite/support/ConnectionSource;->releaseConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    throw v2
.end method

.method public static callInTransaction(Lcom/j256/ormlite/support/DatabaseConnection;Lcom/j256/ormlite/db/DatabaseType;Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 1
    .param p0, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;
    .param p1, "databaseType"    # Lcom/j256/ormlite/db/DatabaseType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/j256/ormlite/support/DatabaseConnection;",
            "Lcom/j256/ormlite/db/DatabaseType;",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 137
    .local p2, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, p2}, Lcom/j256/ormlite/misc/TransactionManager;->callInTransaction(Lcom/j256/ormlite/support/DatabaseConnection;ZLcom/j256/ormlite/db/DatabaseType;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static callInTransaction(Lcom/j256/ormlite/support/DatabaseConnection;ZLcom/j256/ormlite/db/DatabaseType;Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 10
    .param p0, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;
    .param p1, "saved"    # Z
    .param p2, "databaseType"    # Lcom/j256/ormlite/db/DatabaseType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/j256/ormlite/support/DatabaseConnection;",
            "Z",
            "Lcom/j256/ormlite/db/DatabaseType;",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .local p3, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    const/4 v9, 0x1

    .line 146
    const/4 v0, 0x0

    .line 148
    .local v0, "autoCommitAtStart":Z
    const/4 v3, 0x0

    .line 149
    .local v3, "hasSavePoint":Z
    const/4 v5, 0x0

    .line 150
    .local v5, "savePoint":Ljava/sql/Savepoint;
    if-nez p1, :cond_0

    :try_start_0
    invoke-interface {p2}, Lcom/j256/ormlite/db/DatabaseType;->isNestedSavePointsSupported()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 151
    :cond_0
    invoke-interface {p0}, Lcom/j256/ormlite/support/DatabaseConnection;->isAutoCommitSupported()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 152
    invoke-interface {p0}, Lcom/j256/ormlite/support/DatabaseConnection;->isAutoCommit()Z

    move-result v0

    .line 153
    if-eqz v0, :cond_1

    .line 155
    const/4 v6, 0x0

    invoke-interface {p0, v6}, Lcom/j256/ormlite/support/DatabaseConnection;->setAutoCommit(Z)V

    .line 156
    sget-object v6, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v7, "had to set auto-commit to false"

    invoke-virtual {v6, v7}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;)V

    .line 159
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ORMLITE"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lcom/j256/ormlite/misc/TransactionManager;->savePointCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p0, v6}, Lcom/j256/ormlite/support/DatabaseConnection;->setSavePoint(Ljava/lang/String;)Ljava/sql/Savepoint;

    move-result-object v5

    .line 160
    if-nez v5, :cond_5

    .line 161
    sget-object v6, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v7, "started savePoint transaction"

    invoke-virtual {v6, v7}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    :goto_0
    const/4 v3, 0x1

    .line 168
    :cond_2
    :try_start_1
    invoke-interface {p3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v4

    .line 169
    .local v4, "result":Ljava/lang/Object;, "TT;"
    if-eqz v3, :cond_3

    .line 170
    invoke-static {p0, v5}, Lcom/j256/ormlite/misc/TransactionManager;->commit(Lcom/j256/ormlite/support/DatabaseConnection;Ljava/sql/Savepoint;)V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 195
    :cond_3
    if-eqz v0, :cond_4

    .line 197
    invoke-interface {p0, v9}, Lcom/j256/ormlite/support/DatabaseConnection;->setAutoCommit(Z)V

    .line 198
    sget-object v6, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v7, "restored auto-commit to true"

    invoke-virtual {v6, v7}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;)V

    :cond_4
    return-object v4

    .line 163
    .end local v4    # "result":Ljava/lang/Object;, "TT;"
    :cond_5
    :try_start_2
    sget-object v6, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v7, "started savePoint transaction {}"

    invoke-interface {v5}, Ljava/sql/Savepoint;->getSavepointName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 195
    :catchall_0
    move-exception v6

    if-eqz v0, :cond_6

    .line 197
    invoke-interface {p0, v9}, Lcom/j256/ormlite/support/DatabaseConnection;->setAutoCommit(Z)V

    .line 198
    sget-object v7, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v8, "restored auto-commit to true"

    invoke-virtual {v7, v8}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;)V

    :cond_6
    throw v6

    .line 173
    :catch_0
    move-exception v1

    .line 174
    .local v1, "e":Ljava/sql/SQLException;
    if-eqz v3, :cond_7

    .line 176
    :try_start_3
    invoke-static {p0, v5}, Lcom/j256/ormlite/misc/TransactionManager;->rollBack(Lcom/j256/ormlite/support/DatabaseConnection;Ljava/sql/Savepoint;)V
    :try_end_3
    .catch Ljava/sql/SQLException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 182
    :cond_7
    :goto_1
    :try_start_4
    throw v1

    .line 177
    :catch_1
    move-exception v2

    .line 178
    .local v2, "e2":Ljava/sql/SQLException;
    sget-object v6, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v7, "after commit exception, rolling back to save-point also threw exception"

    invoke-virtual {v6, v1, v7}, Lcom/j256/ormlite/logger/Logger;->error(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 183
    .end local v1    # "e":Ljava/sql/SQLException;
    .end local v2    # "e2":Ljava/sql/SQLException;
    :catch_2
    move-exception v1

    .line 184
    .local v1, "e":Ljava/lang/Exception;
    if-eqz v3, :cond_8

    .line 186
    :try_start_5
    invoke-static {p0, v5}, Lcom/j256/ormlite/misc/TransactionManager;->rollBack(Lcom/j256/ormlite/support/DatabaseConnection;Ljava/sql/Savepoint;)V
    :try_end_5
    .catch Ljava/sql/SQLException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 192
    :cond_8
    :goto_2
    :try_start_6
    const-string/jumbo v6, "Transaction callable threw non-SQL exception"

    invoke-static {v6, v1}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v6

    throw v6

    .line 187
    :catch_3
    move-exception v2

    .line 188
    .restart local v2    # "e2":Ljava/sql/SQLException;
    sget-object v6, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v7, "after commit exception, rolling back to save-point also threw exception"

    invoke-virtual {v6, v1, v7}, Lcom/j256/ormlite/logger/Logger;->error(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2
.end method

.method private static commit(Lcom/j256/ormlite/support/DatabaseConnection;Ljava/sql/Savepoint;)V
    .locals 3
    .param p0, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;
    .param p1, "savePoint"    # Ljava/sql/Savepoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 208
    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 209
    .local v0, "name":Ljava/lang/String;
    :goto_0
    invoke-interface {p0, p1}, Lcom/j256/ormlite/support/DatabaseConnection;->commit(Ljava/sql/Savepoint;)V

    .line 210
    if-nez v0, :cond_1

    .line 211
    sget-object v1, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "committed savePoint transaction"

    invoke-virtual {v1, v2}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;)V

    .line 215
    :goto_1
    return-void

    .line 208
    .end local v0    # "name":Ljava/lang/String;
    :cond_0
    invoke-interface {p1}, Ljava/sql/Savepoint;->getSavepointName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 213
    .restart local v0    # "name":Ljava/lang/String;
    :cond_1
    sget-object v1, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "committed savePoint transaction {}"

    invoke-virtual {v1, v2, v0}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1
.end method

.method private static rollBack(Lcom/j256/ormlite/support/DatabaseConnection;Ljava/sql/Savepoint;)V
    .locals 3
    .param p0, "connection"    # Lcom/j256/ormlite/support/DatabaseConnection;
    .param p1, "savePoint"    # Ljava/sql/Savepoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 218
    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 219
    .local v0, "name":Ljava/lang/String;
    :goto_0
    invoke-interface {p0, p1}, Lcom/j256/ormlite/support/DatabaseConnection;->rollback(Ljava/sql/Savepoint;)V

    .line 220
    if-nez v0, :cond_1

    .line 221
    sget-object v1, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "rolled back savePoint transaction"

    invoke-virtual {v1, v2}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;)V

    .line 225
    :goto_1
    return-void

    .line 218
    .end local v0    # "name":Ljava/lang/String;
    :cond_0
    invoke-interface {p1}, Ljava/sql/Savepoint;->getSavepointName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 223
    .restart local v0    # "name":Ljava/lang/String;
    :cond_1
    sget-object v1, Lcom/j256/ormlite/misc/TransactionManager;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "rolled back savePoint transaction {}"

    invoke-virtual {v1, v2, v0}, Lcom/j256/ormlite/logger/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1
.end method


# virtual methods
.method public callInTransaction(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    iget-object v0, p0, Lcom/j256/ormlite/misc/TransactionManager;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    invoke-static {v0, p1}, Lcom/j256/ormlite/misc/TransactionManager;->callInTransaction(Lcom/j256/ormlite/support/ConnectionSource;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public initialize()V
    .locals 3

    .prologue
    .line 89
    iget-object v0, p0, Lcom/j256/ormlite/misc/TransactionManager;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    if-nez v0, :cond_0

    .line 90
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "dataSource was not set on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_0
    return-void
.end method

.method public setConnectionSource(Lcom/j256/ormlite/support/ConnectionSource;)V
    .locals 0
    .param p1, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;

    .prologue
    .line 204
    iput-object p1, p0, Lcom/j256/ormlite/misc/TransactionManager;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    .line 205
    return-void
.end method
