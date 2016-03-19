.class Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader$ExecSQLTask;
.super Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;
.source "SQLiteCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExecSQLTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;


# direct methods
.method constructor <init>(Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;)V
    .locals 0
    .param p2, "loader"    # Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader$ExecSQLTask;->this$0:Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;

    .line 179
    invoke-direct {p0, p2}, Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;-><init>(Landroid/support/v4/content/Loader;)V

    .line 180
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 176
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader$ExecSQLTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 4
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 184
    const/4 v3, 0x0

    aget-object v1, p1, v3

    check-cast v1, Landroid/database/sqlite/SQLiteOpenHelper;

    .line 185
    .local v1, "db":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v3, 0x1

    aget-object v2, p1, v3

    check-cast v2, Ljava/lang/String;

    .line 186
    .local v2, "sql":Ljava/lang/String;
    const/4 v3, 0x2

    aget-object v3, p1, v3

    check-cast v3, [Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, [Ljava/lang/Object;

    .line 188
    .local v0, "bindParams":[Ljava/lang/Object;
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 190
    const/4 v3, 0x0

    return-object v3
.end method
