.class public Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;
.super Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;
.source "SQLCipherCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$ExecSQLTask;,
        Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$DeleteTask;,
        Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$ReplaceTask;,
        Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$UpdateTask;,
        Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$InsertTask;
    }
.end annotation


# instance fields
.field args:[Ljava/lang/String;

.field db:Lnet/sqlcipher/database/SQLiteDatabase;

.field rawQuery:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lnet/sqlcipher/database/SQLiteOpenHelper;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "db"    # Lnet/sqlcipher/database/SQLiteOpenHelper;
    .param p3, "passphrase"    # Ljava/lang/String;
    .param p4, "rawQuery"    # Ljava/lang/String;
    .param p5, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;-><init>(Landroid/content/Context;)V

    .line 29
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    .line 30
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->rawQuery:Ljava/lang/String;

    .line 31
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->args:[Ljava/lang/String;

    .line 44
    invoke-virtual {p2, p3}, Lnet/sqlcipher/database/SQLiteOpenHelper;->getWritableDatabase(Ljava/lang/String;)Lnet/sqlcipher/database/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    .line 45
    iput-object p4, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->rawQuery:Ljava/lang/String;

    .line 46
    iput-object p5, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->args:[Ljava/lang/String;

    .line 47
    return-void
.end method


# virtual methods
.method protected buildCursor()Landroid/database/Cursor;
    .locals 3

    .prologue
    .line 55
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    iget-object v1, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->rawQuery:Ljava/lang/String;

    iget-object v2, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->args:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lnet/sqlcipher/database/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Lnet/sqlcipher/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "whereClause"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 92
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$DeleteTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$DeleteTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$DeleteTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 93
    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    .line 65
    invoke-super {p0, p1, p2, p3, p4}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 66
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 67
    const-string/jumbo v0, "rawQuery="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->rawQuery:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 69
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 70
    const-string/jumbo v0, "args="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 71
    invoke-static {p4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 4
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "bindArgs"    # [Ljava/lang/Object;

    .prologue
    .line 96
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$ExecSQLTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$ExecSQLTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$ExecSQLTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 97
    return-void
.end method

.method public insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "nullColumnHack"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 76
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$InsertTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$InsertTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$InsertTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 77
    return-void
.end method

.method public replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "nullColumnHack"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 87
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$ReplaceTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$ReplaceTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$ReplaceTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 88
    return-void
.end method

.method public update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "whereClause"    # Ljava/lang/String;
    .param p4, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 81
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$UpdateTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$UpdateTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;)V

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    const/4 v2, 0x4

    aput-object p4, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$UpdateTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 83
    return-void
.end method
