.class public Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;
.super Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;
.source "SQLCipherCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$ExecSQLTask;,
        Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$DeleteTask;,
        Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$ReplaceTask;,
        Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$UpdateTask;,
        Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$InsertTask;
    }
.end annotation


# instance fields
.field args:[Ljava/lang/String;

.field db:Lnet/sqlcipher/database/SQLiteDatabase;

.field rawQuery:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lnet/sqlcipher/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "db"    # Lnet/sqlcipher/database/SQLiteDatabase;
    .param p3, "rawQuery"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;-><init>(Landroid/content/Context;)V

    .line 28
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    .line 29
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->rawQuery:Ljava/lang/String;

    .line 30
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->args:[Ljava/lang/String;

    .line 42
    iput-object p2, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    .line 43
    iput-object p3, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->rawQuery:Ljava/lang/String;

    .line 44
    iput-object p4, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->args:[Ljava/lang/String;

    .line 45
    return-void
.end method


# virtual methods
.method protected buildCursor()Landroid/database/Cursor;
    .locals 3

    .prologue
    .line 53
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    iget-object v1, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->rawQuery:Ljava/lang/String;

    iget-object v2, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->args:[Ljava/lang/String;

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
    .line 90
    new-instance v0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$DeleteTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$DeleteTask;-><init>(Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$DeleteTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 91
    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    .line 63
    invoke-super {p0, p1, p2, p3, p4}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 64
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 65
    const-string/jumbo v0, "rawQuery="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->rawQuery:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 68
    const-string/jumbo v0, "args="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 69
    invoke-static {p4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 4
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "bindArgs"    # [Ljava/lang/Object;

    .prologue
    .line 94
    new-instance v0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$ExecSQLTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$ExecSQLTask;-><init>(Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$ExecSQLTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 95
    return-void
.end method

.method public insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "nullColumnHack"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 74
    new-instance v0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$InsertTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$InsertTask;-><init>(Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$InsertTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 75
    return-void
.end method

.method public replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "nullColumnHack"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 85
    new-instance v0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$ReplaceTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$ReplaceTask;-><init>(Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$ReplaceTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 86
    return-void
.end method

.method public update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "whereClause"    # Ljava/lang/String;
    .param p4, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 79
    new-instance v0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$UpdateTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$UpdateTask;-><init>(Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;)V

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    const/4 v2, 0x4

    aput-object p4, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$UpdateTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 81
    return-void
.end method
