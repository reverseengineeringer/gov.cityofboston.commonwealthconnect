.class public Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;
.super Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;
.source "SQLiteCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ExecSQLTask;,
        Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$DeleteTask;,
        Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ReplaceTask;,
        Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$UpdateTask;,
        Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$InsertTask;
    }
.end annotation


# instance fields
.field args:[Ljava/lang/String;

.field db:Landroid/database/sqlite/SQLiteOpenHelper;

.field rawQuery:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/database/sqlite/SQLiteOpenHelper;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "db"    # Landroid/database/sqlite/SQLiteOpenHelper;
    .param p3, "rawQuery"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;-><init>(Landroid/content/Context;)V

    .line 29
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 30
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->rawQuery:Ljava/lang/String;

    .line 31
    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->args:[Ljava/lang/String;

    .line 43
    iput-object p2, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 44
    iput-object p3, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->rawQuery:Ljava/lang/String;

    .line 45
    iput-object p4, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->args:[Ljava/lang/String;

    .line 46
    return-void
.end method


# virtual methods
.method protected buildCursor()Landroid/database/Cursor;
    .locals 3

    .prologue
    .line 54
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iget-object v1, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->rawQuery:Ljava/lang/String;

    iget-object v2, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->args:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "whereClause"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 91
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$DeleteTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$DeleteTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$DeleteTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 92
    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    .line 64
    invoke-super {p0, p1, p2, p3, p4}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 65
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 66
    const-string/jumbo v0, "rawQuery="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->rawQuery:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 68
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 69
    const-string/jumbo v0, "args="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 70
    invoke-static {p4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 4
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "bindArgs"    # [Ljava/lang/Object;

    .prologue
    .line 95
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ExecSQLTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ExecSQLTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ExecSQLTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 96
    return-void
.end method

.method public insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "nullColumnHack"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 75
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$InsertTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$InsertTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$InsertTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 76
    return-void
.end method

.method public replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "nullColumnHack"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 86
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ReplaceTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ReplaceTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;)V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ReplaceTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 87
    return-void
.end method

.method public update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "whereClause"    # Ljava/lang/String;
    .param p4, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 80
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$UpdateTask;

    invoke-direct {v0, p0, p0}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$UpdateTask;-><init>(Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;)V

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    const/4 v2, 0x4

    aput-object p4, v1, v2

    invoke-virtual {v0, v1}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$UpdateTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 82
    return-void
.end method
