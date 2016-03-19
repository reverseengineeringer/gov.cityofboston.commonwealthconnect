.class public Lcom/j256/ormlite/android/AndroidDatabaseConnection;
.super Ljava/lang/Object;
.source "AndroidDatabaseConnection.java"

# interfaces
.implements Lcom/j256/ormlite/support/DatabaseConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/j256/ormlite/android/AndroidDatabaseConnection$1;,
        Lcom/j256/ormlite/android/AndroidDatabaseConnection$OurSavePoint;
    }
.end annotation


# static fields
.field private static final ANDROID_VERSION:Ljava/lang/String; = "VERSION__4.47__"

.field private static final NO_STRING_ARGS:[Ljava/lang/String;

.field private static logger:Lcom/j256/ormlite/logger/Logger;


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;

.field private final readWrite:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;

    invoke-static {v0}, Lcom/j256/ormlite/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    sput-object v0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    .line 33
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->NO_STRING_ARGS:[Ljava/lang/String;

    .line 39
    const-string/jumbo v0, "VERSION__4.47__"

    invoke-static {v0}, Lcom/j256/ormlite/misc/VersionUtils;->checkCoreVersusAndroidVersions(Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Z)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "readWrite"    # Z

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 44
    iput-boolean p2, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->readWrite:Z

    .line 45
    sget-object v0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v1, "{}: db {} opened, read-write = {}"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, p0, p1, v2}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    return-void
.end method

.method private bindArgs(Landroid/database/sqlite/SQLiteStatement;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;)V
    .locals 6
    .param p1, "stmt"    # Landroid/database/sqlite/SQLiteStatement;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 323
    if-nez p2, :cond_1

    .line 366
    :cond_0
    return-void

    .line 326
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_0

    .line 327
    aget-object v0, p2, v1

    .line 328
    .local v0, "arg":Ljava/lang/Object;
    if-nez v0, :cond_2

    .line 329
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteStatement;->bindNull(I)V

    .line 326
    .end local v0    # "arg":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 331
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_2
    aget-object v3, p3, v1

    invoke-virtual {v3}, Lcom/j256/ormlite/field/FieldType;->getSqlType()Lcom/j256/ormlite/field/SqlType;

    move-result-object v2

    .line 332
    .local v2, "sqlType":Lcom/j256/ormlite/field/SqlType;
    sget-object v3, Lcom/j256/ormlite/android/AndroidDatabaseConnection$1;->$SwitchMap$com$j256$ormlite$field$SqlType:[I

    invoke-virtual {v2}, Lcom/j256/ormlite/field/SqlType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 362
    new-instance v3, Ljava/sql/SQLException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unknown sql argument type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 336
    :pswitch_0
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    goto :goto_1

    .line 343
    :pswitch_1
    add-int/lit8 v3, v1, 0x1

    check-cast v0, Ljava/lang/Number;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    invoke-virtual {p1, v3, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    goto :goto_1

    .line 347
    .restart local v0    # "arg":Ljava/lang/Object;
    :pswitch_2
    add-int/lit8 v3, v1, 0x1

    check-cast v0, Ljava/lang/Number;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    invoke-virtual {p1, v3, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindDouble(ID)V

    goto :goto_1

    .line 351
    .restart local v0    # "arg":Ljava/lang/Object;
    :pswitch_3
    add-int/lit8 v3, v1, 0x1

    check-cast v0, [B

    .end local v0    # "arg":Ljava/lang/Object;
    check-cast v0, [B

    invoke-virtual {p1, v3, v0}, Landroid/database/sqlite/SQLiteStatement;->bindBlob(I[B)V

    goto :goto_1

    .line 359
    .restart local v0    # "arg":Ljava/lang/Object;
    :pswitch_4
    new-instance v3, Ljava/sql/SQLException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Invalid Android type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 332
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method private toStrings([Ljava/lang/Object;)[Ljava/lang/String;
    .locals 5
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 369
    if-eqz p1, :cond_0

    array-length v4, p1

    if-nez v4, :cond_2

    :cond_0
    move-object v2, v3

    .line 382
    :cond_1
    return-object v2

    .line 372
    :cond_2
    array-length v4, p1

    new-array v2, v4, [Ljava/lang/String;

    .line 373
    .local v2, "strings":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, p1

    if-ge v1, v4, :cond_1

    .line 374
    aget-object v0, p1, v1

    .line 375
    .local v0, "arg":Ljava/lang/Object;
    if-nez v0, :cond_3

    .line 376
    aput-object v3, v2, v1

    .line 373
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 378
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v1

    goto :goto_1
.end method

.method private update(Ljava/lang/String;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;)I
    .locals 6
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .param p4, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 293
    const/4 v2, 0x0

    .line 295
    .local v2, "stmt":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    iget-object v3, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3, p1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v2

    .line 296
    invoke-direct {p0, v2, p2, p3}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->bindArgs(Landroid/database/sqlite/SQLiteStatement;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;)V

    .line 297
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->execute()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    if-eqz v2, :cond_0

    .line 302
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 303
    const/4 v2, 0x0

    .line 308
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "SELECT CHANGES()"

    invoke-virtual {v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v2

    .line 309
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v4

    long-to-int v1, v4

    .line 314
    .local v1, "result":I
    if-eqz v2, :cond_1

    .line 315
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 318
    :cond_1
    :goto_0
    sget-object v3, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v4, "{} statement is compiled and executed, changed {}: {}"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, p4, v5, p1}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 319
    return v1

    .line 298
    .end local v1    # "result":I
    :catch_0
    move-exception v0

    .line 299
    .local v0, "e":Landroid/database/SQLException;
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "updating database failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v3

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 301
    .end local v0    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_2

    .line 302
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 303
    const/4 v2, 0x0

    :cond_2
    throw v3

    .line 310
    :catch_1
    move-exception v0

    .line 312
    .restart local v0    # "e":Landroid/database/SQLException;
    const/4 v1, 0x1

    .line 314
    .restart local v1    # "result":I
    if-eqz v2, :cond_1

    .line 315
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    goto :goto_0

    .line 314
    .end local v0    # "e":Landroid/database/SQLException;
    .end local v1    # "result":I
    :catchall_1
    move-exception v3

    if-eqz v2, :cond_3

    .line 315
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_3
    throw v3
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 250
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 251
    sget-object v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "{}: db {} closed"

    iget-object v3, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v2, p0, v3}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    return-void

    .line 252
    :catch_0
    move-exception v0

    .line 253
    .local v0, "e":Landroid/database/SQLException;
    const-string/jumbo v1, "problems closing the database connection"

    invoke-static {v1, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v1

    throw v1
.end method

.method public closeQuietly()V
    .locals 1

    .prologue
    .line 259
    :try_start_0
    invoke-virtual {p0}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->close()V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    :goto_0
    return-void

    .line 260
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public commit(Ljava/sql/Savepoint;)V
    .locals 4
    .param p1, "savepoint"    # Ljava/sql/Savepoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 99
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 100
    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 101
    if-nez p1, :cond_0

    .line 102
    sget-object v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "{}: transaction is successfuly ended"

    invoke-virtual {v1, v2, p0}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    :goto_0
    return-void

    .line 104
    :cond_0
    sget-object v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "{}: transaction {} is successfuly ended"

    invoke-interface {p1}, Ljava/sql/Savepoint;->getSavepointName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, p0, v3}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Landroid/database/SQLException;
    if-nez p1, :cond_1

    .line 108
    const-string/jumbo v1, "problems commiting transaction"

    invoke-static {v1, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v1

    throw v1

    .line 110
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "problems commiting transaction "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Ljava/sql/Savepoint;->getSavepointName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v1

    throw v1
.end method

.method public compileStatement(Ljava/lang/String;Lcom/j256/ormlite/stmt/StatementBuilder$StatementType;[Lcom/j256/ormlite/field/FieldType;)Lcom/j256/ormlite/support/CompiledStatement;
    .locals 3
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "type"    # Lcom/j256/ormlite/stmt/StatementBuilder$StatementType;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;

    .prologue
    .line 138
    new-instance v0, Lcom/j256/ormlite/android/AndroidCompiledStatement;

    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {v0, p1, v1, p2}, Lcom/j256/ormlite/android/AndroidCompiledStatement;-><init>(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/stmt/StatementBuilder$StatementType;)V

    .line 139
    .local v0, "stmt":Lcom/j256/ormlite/support/CompiledStatement;
    sget-object v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "{}: compiled statement got {}: {}"

    invoke-virtual {v1, v2, p0, v0, p1}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 140
    return-object v0
.end method

.method public compileStatement(Ljava/lang/String;Lcom/j256/ormlite/stmt/StatementBuilder$StatementType;[Lcom/j256/ormlite/field/FieldType;I)Lcom/j256/ormlite/support/CompiledStatement;
    .locals 1
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "type"    # Lcom/j256/ormlite/stmt/StatementBuilder$StatementType;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .param p4, "resultFlags"    # I

    .prologue
    .line 146
    invoke-virtual {p0, p1, p2, p3}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->compileStatement(Ljava/lang/String;Lcom/j256/ormlite/stmt/StatementBuilder$StatementType;[Lcom/j256/ormlite/field/FieldType;)Lcom/j256/ormlite/support/CompiledStatement;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/String;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;)I
    .locals 1
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 181
    const-string/jumbo v0, "deleted"

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->update(Ljava/lang/String;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public executeStatement(Ljava/lang/String;I)I
    .locals 2
    .param p1, "statementStr"    # Ljava/lang/String;
    .param p2, "resultFlags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    sget-object v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->NO_STRING_ARGS:[Ljava/lang/String;

    invoke-static {v0, p1, p1, v1}, Lcom/j256/ormlite/android/AndroidCompiledStatement;->execSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public insert(Ljava/lang/String;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;Lcom/j256/ormlite/support/GeneratedKeyHolder;)I
    .locals 8
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .param p4, "keyHolder"    # Lcom/j256/ormlite/support/GeneratedKeyHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 151
    const/4 v4, 0x0

    .line 153
    .local v4, "stmt":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    iget-object v5, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5, p1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v4

    .line 154
    invoke-direct {p0, v4, p2, p3}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->bindArgs(Landroid/database/sqlite/SQLiteStatement;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;)V

    .line 155
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v2

    .line 156
    .local v2, "rowId":J
    if-eqz p4, :cond_0

    .line 157
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {p4, v5}, Lcom/j256/ormlite/support/GeneratedKeyHolder;->addKey(Ljava/lang/Number;)V

    .line 163
    :cond_0
    const/4 v1, 0x1

    .line 164
    .local v1, "result":I
    sget-object v5, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v6, "{}: insert statement is compiled and executed, changed {}: {}"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, p0, v7, p1}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    if-eqz v4, :cond_1

    .line 170
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_1
    return v1

    .line 166
    .end local v1    # "result":I
    .end local v2    # "rowId":J
    :catch_0
    move-exception v0

    .line 167
    .local v0, "e":Landroid/database/SQLException;
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "inserting to database failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v5

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    .end local v0    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v5

    if-eqz v4, :cond_2

    .line 170
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_2
    throw v5
.end method

.method public isAutoCommit()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 54
    :try_start_0
    iget-object v2, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v1

    .line 55
    .local v1, "inTransaction":Z
    sget-object v2, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v3, "{}: in transaction is {}"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v2, v3, p0, v4}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    if-nez v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 58
    .end local v1    # "inTransaction":Z
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Landroid/database/SQLException;
    const-string/jumbo v2, "problems getting auto-commit from database"

    invoke-static {v2, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v2

    throw v2
.end method

.method public isAutoCommitSupported()Z
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x1

    return v0
.end method

.method public isClosed()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 267
    :try_start_0
    iget-object v2, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v1

    .line 268
    .local v1, "isOpen":Z
    sget-object v2, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v3, "{}: db {} isOpen returned {}"

    iget-object v4, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v2, v3, p0, v4, v5}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    if-nez v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 270
    .end local v1    # "isOpen":Z
    :catch_0
    move-exception v0

    .line 271
    .local v0, "e":Landroid/database/SQLException;
    const-string/jumbo v2, "problems detecting if the database is closed"

    invoke-static {v2, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v2

    throw v2
.end method

.method public isReadWrite()Z
    .locals 1

    .prologue
    .line 94
    iget-boolean v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->readWrite:Z

    return v0
.end method

.method public isTableExists(Ljava/lang/String;)Z
    .locals 5
    .param p1, "tableName"    # Ljava/lang/String;

    .prologue
    .line 276
    iget-object v2, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "SELECT DISTINCT tbl_name FROM sqlite_master WHERE tbl_name = \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 280
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 281
    const/4 v1, 0x1

    .line 285
    .local v1, "result":Z
    :goto_0
    sget-object v2, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v3, "{}: isTableExists \'{}\' returned {}"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v2, v3, p0, p1, v4}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 288
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    return v1

    .line 283
    .end local v1    # "result":Z
    :cond_0
    const/4 v1, 0x0

    .restart local v1    # "result":Z
    goto :goto_0

    .line 288
    .end local v1    # "result":Z
    :catchall_0
    move-exception v2

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v2
.end method

.method public queryForLong(Ljava/lang/String;)J
    .locals 7
    .param p1, "statement"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 211
    const/4 v1, 0x0

    .line 213
    .local v1, "stmt":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    iget-object v4, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4, p1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 214
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v2

    .line 215
    .local v2, "result":J
    sget-object v4, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v5, "{}: query for long simple query returned {}: {}"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, p0, v6, p1}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    if-eqz v1, :cond_0

    .line 221
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_0
    return-wide v2

    .line 217
    .end local v2    # "result":J
    :catch_0
    move-exception v0

    .line 218
    .local v0, "e":Landroid/database/SQLException;
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "queryForLong from database failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v4

    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 220
    .end local v0    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v4

    if-eqz v1, :cond_1

    .line 221
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_1
    throw v4
.end method

.method public queryForLong(Ljava/lang/String;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;)J
    .locals 8
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 227
    const/4 v0, 0x0

    .line 229
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v5, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {p0, p2}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->toStrings([Ljava/lang/Object;)[Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, p1, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 230
    new-instance v4, Lcom/j256/ormlite/android/AndroidDatabaseResults;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5}, Lcom/j256/ormlite/android/AndroidDatabaseResults;-><init>(Landroid/database/Cursor;Lcom/j256/ormlite/dao/ObjectCache;)V

    .line 232
    .local v4, "results":Lcom/j256/ormlite/android/AndroidDatabaseResults;
    invoke-virtual {v4}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->first()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 233
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->getLong(I)J

    move-result-wide v2

    .line 237
    .local v2, "result":J
    :goto_0
    sget-object v5, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v6, "{}: query for long raw query returned {}: {}"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v6, p0, v7, p1}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    if-eqz v0, :cond_0

    .line 243
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_0
    return-wide v2

    .line 235
    .end local v2    # "result":J
    :cond_1
    const-wide/16 v2, 0x0

    .restart local v2    # "result":J
    goto :goto_0

    .line 239
    .end local v2    # "result":J
    .end local v4    # "results":Lcom/j256/ormlite/android/AndroidDatabaseResults;
    :catch_0
    move-exception v1

    .line 240
    .local v1, "e":Landroid/database/SQLException;
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "queryForLong from database failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v1}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v5

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 242
    .end local v1    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v5

    if-eqz v0, :cond_2

    .line 243
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v5
.end method

.method public queryForOne(Ljava/lang/String;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;Lcom/j256/ormlite/stmt/GenericRowMapper;Lcom/j256/ormlite/dao/ObjectCache;)Ljava/lang/Object;
    .locals 6
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .param p5, "objectCache"    # Lcom/j256/ormlite/dao/ObjectCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            "[",
            "Lcom/j256/ormlite/field/FieldType;",
            "Lcom/j256/ormlite/stmt/GenericRowMapper",
            "<TT;>;",
            "Lcom/j256/ormlite/dao/ObjectCache;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 186
    .local p4, "rowMapper":Lcom/j256/ormlite/stmt/GenericRowMapper;, "Lcom/j256/ormlite/stmt/GenericRowMapper<TT;>;"
    const/4 v0, 0x0

    .line 188
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v4, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {p0, p2}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->toStrings([Ljava/lang/Object;)[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, p1, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 189
    new-instance v3, Lcom/j256/ormlite/android/AndroidDatabaseResults;

    invoke-direct {v3, v0, p5}, Lcom/j256/ormlite/android/AndroidDatabaseResults;-><init>(Landroid/database/Cursor;Lcom/j256/ormlite/dao/ObjectCache;)V

    .line 190
    .local v3, "results":Lcom/j256/ormlite/android/AndroidDatabaseResults;
    sget-object v4, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v5, "{}: queried for one result: {}"

    invoke-virtual {v4, v5, p0, p1}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    invoke-virtual {v3}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->first()Z
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_1

    .line 192
    const/4 v2, 0x0

    .line 204
    if-eqz v0, :cond_0

    .line 205
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_0
    :goto_0
    return-object v2

    .line 194
    :cond_1
    :try_start_1
    invoke-interface {p4, v3}, Lcom/j256/ormlite/stmt/GenericRowMapper;->mapRow(Lcom/j256/ormlite/support/DatabaseResults;)Ljava/lang/Object;

    move-result-object v2

    .line 195
    .local v2, "first":Ljava/lang/Object;, "TT;"
    invoke-virtual {v3}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->next()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 196
    sget-object v2, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->MORE_THAN_ONE:Ljava/lang/Object;
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 204
    .end local v2    # "first":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_0

    .line 205
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 204
    .restart local v2    # "first":Ljava/lang/Object;, "TT;"
    :cond_2
    if-eqz v0, :cond_0

    .line 205
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 201
    .end local v2    # "first":Ljava/lang/Object;, "TT;"
    .end local v3    # "results":Lcom/j256/ormlite/android/AndroidDatabaseResults;
    :catch_0
    move-exception v1

    .line 202
    .local v1, "e":Landroid/database/SQLException;
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "queryForOne from database failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v4

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 204
    .end local v1    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_3

    .line 205
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v4
.end method

.method public rollback(Ljava/sql/Savepoint;)V
    .locals 4
    .param p1, "savepoint"    # Ljava/sql/Savepoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 118
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 119
    if-nez p1, :cond_0

    .line 120
    sget-object v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "{}: transaction is ended, unsuccessfuly"

    invoke-virtual {v1, v2, p0}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;)V

    .line 131
    :goto_0
    return-void

    .line 122
    :cond_0
    sget-object v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "{}: transaction {} is ended, unsuccessfuly"

    invoke-interface {p1}, Ljava/sql/Savepoint;->getSavepointName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, p0, v3}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Landroid/database/SQLException;
    if-nez p1, :cond_1

    .line 126
    const-string/jumbo v1, "problems rolling back transaction"

    invoke-static {v1, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v1

    throw v1

    .line 128
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "problems rolling back transaction "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Ljava/sql/Savepoint;->getSavepointName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v1

    throw v1
.end method

.method public setAutoCommit(Z)V
    .locals 1
    .param p1, "autoCommit"    # Z

    .prologue
    .line 68
    if-eqz p1, :cond_1

    .line 69
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 71
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 78
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    goto :goto_0
.end method

.method public setSavePoint(Ljava/lang/String;)Ljava/sql/Savepoint;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 82
    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 83
    sget-object v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->logger:Lcom/j256/ormlite/logger/Logger;

    const-string/jumbo v2, "{}: save-point set with name {}"

    invoke-virtual {v1, v2, p0, p1}, Lcom/j256/ormlite/logger/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 84
    new-instance v1, Lcom/j256/ormlite/android/AndroidDatabaseConnection$OurSavePoint;

    invoke-direct {v1, p1}, Lcom/j256/ormlite/android/AndroidDatabaseConnection$OurSavePoint;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Landroid/database/SQLException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "problems beginning transaction "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v1

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 387
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

.method public update(Ljava/lang/String;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;)I
    .locals 1
    .param p1, "statement"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "argFieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 176
    const-string/jumbo v0, "updated"

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/j256/ormlite/android/AndroidDatabaseConnection;->update(Ljava/lang/String;[Ljava/lang/Object;[Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method
