.class public Lcom/commonsware/cwac/loaderex/SQLCipherUtils;
.super Ljava/lang/Object;
.source "SQLCipherUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static encrypt(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p0, "ctxt"    # Landroid/content/Context;
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "passphrase"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 60
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 62
    .local v2, "originalFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 63
    const-string/jumbo v4, "sqlcipherutils"

    const-string/jumbo v5, "tmp"

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v6

    invoke-static {v4, v5, v6}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 66
    .local v1, "newFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-static {v4, v5, v8, v7}, Lnet/sqlcipher/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;I)Lnet/sqlcipher/database/SQLiteDatabase;

    move-result-object v0

    .line 71
    .local v0, "db":Lnet/sqlcipher/database/SQLiteDatabase;
    const-string/jumbo v4, "ATTACH DATABASE \'%s\' AS encrypted KEY \'%s\';"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    const/4 v6, 0x1

    aput-object p2, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lnet/sqlcipher/database/SQLiteDatabase;->rawExecSQL(Ljava/lang/String;)V

    .line 73
    const-string/jumbo v4, "SELECT sqlcipher_export(\'encrypted\')"

    invoke-virtual {v0, v4}, Lnet/sqlcipher/database/SQLiteDatabase;->rawExecSQL(Ljava/lang/String;)V

    .line 74
    const-string/jumbo v4, "DETACH DATABASE encrypted;"

    invoke-virtual {v0, v4}, Lnet/sqlcipher/database/SQLiteDatabase;->rawExecSQL(Ljava/lang/String;)V

    .line 76
    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->getVersion()I

    move-result v3

    .line 78
    .local v3, "version":I
    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->close()V

    .line 80
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p2, v8, v7}, Lnet/sqlcipher/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;I)Lnet/sqlcipher/database/SQLiteDatabase;

    move-result-object v0

    .line 84
    invoke-virtual {v0, v3}, Lnet/sqlcipher/database/SQLiteDatabase;->setVersion(I)V

    .line 85
    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->close()V

    .line 87
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 88
    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 90
    .end local v0    # "db":Lnet/sqlcipher/database/SQLiteDatabase;
    .end local v1    # "newFile":Ljava/io/File;
    .end local v3    # "version":I
    :cond_0
    return-void
.end method

.method public static getDatabaseState(Landroid/content/Context;Ljava/lang/String;)Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 32
    .local v1, "dbPath":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 33
    const/4 v0, 0x0

    .line 36
    .local v0, "db":Lnet/sqlcipher/database/SQLiteDatabase;
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v3, v4, v5, v6}, Lnet/sqlcipher/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;I)Lnet/sqlcipher/database/SQLiteDatabase;

    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->getVersion()I

    .line 43
    sget-object v3, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->UNENCRYPTED:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->close()V

    .line 55
    .end local v0    # "db":Lnet/sqlcipher/database/SQLiteDatabase;
    :cond_0
    :goto_0
    return-object v3

    .line 45
    .restart local v0    # "db":Lnet/sqlcipher/database/SQLiteDatabase;
    :catch_0
    move-exception v2

    .line 46
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v3, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->ENCRYPTED:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->close()V

    goto :goto_0

    .line 49
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_1

    .line 50
    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->close()V

    :cond_1
    throw v3

    .line 55
    .end local v0    # "db":Lnet/sqlcipher/database/SQLiteDatabase;
    :cond_2
    sget-object v3, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->DOES_NOT_EXIST:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    goto :goto_0
.end method
