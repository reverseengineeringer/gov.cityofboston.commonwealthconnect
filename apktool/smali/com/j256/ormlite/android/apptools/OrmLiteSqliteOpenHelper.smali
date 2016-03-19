.class public abstract Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "OrmLiteSqliteOpenHelper.java"


# static fields
.field protected static logger:Lcom/j256/ormlite/logger/Logger;


# instance fields
.field protected connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

.field private volatile isOpen:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    invoke-static {v0}, Lcom/j256/ormlite/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    sput-object v0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->logger:Lcom/j256/ormlite/logger/Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "databaseName"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "databaseVersion"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 37
    new-instance v0, Lcom/j256/ormlite/android/AndroidConnectionSource;

    invoke-direct {v0, p0}, Lcom/j256/ormlite/android/AndroidConnectionSource;-><init>(Landroid/database/sqlite/SQLiteOpenHelper;)V

    iput-object v0, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->isOpen:Z

    .line 53
    sget-object v0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v1, "{}: constructed connectionSource {}"

    iget-object v2, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    invoke-virtual {v0, v1, p0, v2}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;II)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "databaseName"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "databaseVersion"    # I
    .param p5, "configFileId"    # I

    .prologue
    .line 74
    invoke-static {p1, p5}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->openFileId(Landroid/content/Context;I)Ljava/io/InputStream;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILjava/io/InputStream;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILjava/io/File;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "databaseName"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "databaseVersion"    # I
    .param p5, "configFile"    # Ljava/io/File;

    .prologue
    .line 94
    invoke-static {p5}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->openFile(Ljava/io/File;)Ljava/io/InputStream;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILjava/io/InputStream;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILjava/io/InputStream;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "databaseName"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "databaseVersion"    # I
    .param p5, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 115
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 37
    new-instance v2, Lcom/j256/ormlite/android/AndroidConnectionSource;

    invoke-direct {v2, p0}, Lcom/j256/ormlite/android/AndroidConnectionSource;-><init>(Landroid/database/sqlite/SQLiteOpenHelper;)V

    iput-object v2, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    .line 38
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->isOpen:Z

    .line 116
    if-nez p5, :cond_0

    .line 134
    :goto_0
    return-void

    .line 122
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, p5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v3, 0x1000

    invoke-direct {v1, v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 123
    .local v1, "reader":Ljava/io/BufferedReader;
    invoke-static {v1}, Lcom/j256/ormlite/table/DatabaseTableConfigLoader;->loadDatabaseConfigFromReader(Ljava/io/BufferedReader;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/j256/ormlite/dao/DaoManager;->addCachedDatabaseConfigs(Ljava/util/Collection;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    :try_start_1
    invoke-virtual {p5}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 130
    :catch_0
    move-exception v2

    goto :goto_0

    .line 124
    .end local v1    # "reader":Ljava/io/BufferedReader;
    :catch_1
    move-exception v0

    .line 125
    .local v0, "e":Ljava/sql/SQLException;
    :try_start_2
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Could not load object config file"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 127
    .end local v0    # "e":Ljava/sql/SQLException;
    :catchall_0
    move-exception v2

    .line 129
    :try_start_3
    invoke-virtual {p5}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 132
    :goto_1
    throw v2

    .line 130
    :catch_2
    move-exception v3

    goto :goto_1
.end method

.method private static openFile(Ljava/io/File;)Ljava/io/InputStream;
    .locals 4
    .param p0, "configFile"    # Ljava/io/File;

    .prologue
    .line 317
    if-nez p0, :cond_0

    .line 318
    const/4 v1, 0x0

    .line 320
    :goto_0
    return-object v1

    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 322
    :catch_0
    move-exception v0

    .line 323
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Could not open config file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static openFileId(Landroid/content/Context;I)Ljava/io/InputStream;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fileId"    # I

    .prologue
    .line 308
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    .line 309
    .local v0, "stream":Ljava/io/InputStream;
    if-nez v0, :cond_0

    .line 310
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Could not find object config file with id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 312
    :cond_0
    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 251
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    .line 252
    iget-object v0, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    invoke-virtual {v0}, Lcom/j256/ormlite/android/AndroidConnectionSource;->close()V

    .line 257
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->isOpen:Z

    .line 258
    return-void
.end method

.method public getConnectionSource()Lcom/j256/ormlite/support/ConnectionSource;
    .locals 3

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->isOpen:Z

    if-nez v0, :cond_0

    .line 179
    sget-object v0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->logger:Lcom/j256/ormlite/logger/Logger;

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    const-string/jumbo v2, "Getting connectionSource was called after closed"

    invoke-virtual {v0, v1, v2}, Lcom/j256/ormlite/logger/Logger;->warn(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->connectionSource:Lcom/j256/ormlite/android/AndroidConnectionSource;

    return-object v0
.end method

.method public getDao(Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<D::",
            "Lcom/j256/ormlite/dao/Dao",
            "<TT;*>;T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TD;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 277
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->getConnectionSource()Lcom/j256/ormlite/support/ConnectionSource;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    .line 279
    .local v1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<TT;*>;"
    move-object v0, v1

    .line 280
    .local v0, "castDao":Lcom/j256/ormlite/dao/Dao;, "TD;"
    return-object v0
.end method

.method public getRuntimeExceptionDao(Ljava/lang/Class;)Lcom/j256/ormlite/dao/RuntimeExceptionDao;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<D:",
            "Lcom/j256/ormlite/dao/RuntimeExceptionDao",
            "<TT;*>;T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TD;"
        }
    .end annotation

    .prologue
    .line 293
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->getDao(Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    .line 295
    .local v1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<TT;*>;"
    new-instance v0, Lcom/j256/ormlite/dao/RuntimeExceptionDao;

    invoke-direct {v0, v1}, Lcom/j256/ormlite/dao/RuntimeExceptionDao;-><init>(Lcom/j256/ormlite/dao/Dao;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 296
    .local v0, "castDao":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "TD;"
    return-object v0

    .line 297
    .end local v0    # "castDao":Lcom/j256/ormlite/dao/RuntimeExceptionDao;, "TD;"
    .end local v1    # "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<TT;*>;"
    :catch_0
    move-exception v2

    .line 298
    .local v2, "e":Ljava/sql/SQLException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Could not create RuntimeExcepitionDao for class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 264
    iget-boolean v0, p0, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->isOpen:Z

    return v0
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->getConnectionSource()Lcom/j256/ormlite/support/ConnectionSource;

    move-result-object v2

    .line 195
    .local v2, "cs":Lcom/j256/ormlite/support/ConnectionSource;
    invoke-interface {v2}, Lcom/j256/ormlite/support/ConnectionSource;->getSpecialConnection()Lcom/j256/ormlite/support/DatabaseConnection;

    move-result-object v1

    .line 196
    .local v1, "conn":Lcom/j256/ormlite/support/DatabaseConnection;
    const/4 v0, 0x0

    .line 197
    .local v0, "clearSpecial":Z
    if-nez v1, :cond_0

    .line 198
    new-instance v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;

    .end local v1    # "conn":Lcom/j256/ormlite/support/DatabaseConnection;
    const/4 v4, 0x1

    invoke-direct {v1, p1, v4}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;-><init>(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 200
    .restart local v1    # "conn":Lcom/j256/ormlite/support/DatabaseConnection;
    :try_start_0
    invoke-interface {v2, v1}, Lcom/j256/ormlite/support/ConnectionSource;->saveSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)Z
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    const/4 v0, 0x1

    .line 207
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1, v2}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 209
    if-eqz v0, :cond_1

    .line 210
    invoke-interface {v2, v1}, Lcom/j256/ormlite/support/ConnectionSource;->clearSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    .line 213
    :cond_1
    return-void

    .line 202
    :catch_0
    move-exception v3

    .line 203
    .local v3, "e":Ljava/sql/SQLException;
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string/jumbo v5, "Could not save special connection"

    invoke-direct {v4, v5, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 209
    .end local v3    # "e":Ljava/sql/SQLException;
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_2

    .line 210
    invoke-interface {v2, v1}, Lcom/j256/ormlite/support/ConnectionSource;->clearSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    :cond_2
    throw v4
.end method

.method public abstract onCreate(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;)V
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 6
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 220
    invoke-virtual {p0}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->getConnectionSource()Lcom/j256/ormlite/support/ConnectionSource;

    move-result-object v2

    .line 226
    .local v2, "cs":Lcom/j256/ormlite/support/ConnectionSource;
    invoke-interface {v2}, Lcom/j256/ormlite/support/ConnectionSource;->getSpecialConnection()Lcom/j256/ormlite/support/DatabaseConnection;

    move-result-object v1

    .line 227
    .local v1, "conn":Lcom/j256/ormlite/support/DatabaseConnection;
    const/4 v0, 0x0

    .line 228
    .local v0, "clearSpecial":Z
    if-nez v1, :cond_0

    .line 229
    new-instance v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;

    .end local v1    # "conn":Lcom/j256/ormlite/support/DatabaseConnection;
    const/4 v4, 0x1

    invoke-direct {v1, p1, v4}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;-><init>(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 231
    .restart local v1    # "conn":Lcom/j256/ormlite/support/DatabaseConnection;
    :try_start_0
    invoke-interface {v2, v1}, Lcom/j256/ormlite/support/ConnectionSource;->saveSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)Z
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    const/4 v0, 0x1

    .line 238
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1, v2, p2, p3}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 240
    if-eqz v0, :cond_1

    .line 241
    invoke-interface {v2, v1}, Lcom/j256/ormlite/support/ConnectionSource;->clearSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    .line 244
    :cond_1
    return-void

    .line 233
    :catch_0
    move-exception v3

    .line 234
    .local v3, "e":Ljava/sql/SQLException;
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string/jumbo v5, "Could not save special connection"

    invoke-direct {v4, v5, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 240
    .end local v3    # "e":Ljava/sql/SQLException;
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_2

    .line 241
    invoke-interface {v2, v1}, Lcom/j256/ormlite/support/ConnectionSource;->clearSpecialConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    :cond_2
    throw v4
.end method

.method public abstract onUpgrade(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;II)V
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 304
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
