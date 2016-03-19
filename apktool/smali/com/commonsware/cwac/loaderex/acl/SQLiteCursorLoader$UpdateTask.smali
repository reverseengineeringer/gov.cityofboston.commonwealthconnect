.class Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader$UpdateTask;
.super Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;
.source "SQLiteCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateTask"
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
    .line 119
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader$UpdateTask;->this$0:Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;

    .line 120
    invoke-direct {p0, p2}, Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;-><init>(Landroid/support/v4/content/Loader;)V

    .line 121
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 117
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader$UpdateTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 6
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 125
    const/4 v5, 0x0

    aget-object v0, p1, v5

    check-cast v0, Landroid/database/sqlite/SQLiteOpenHelper;

    .line 126
    .local v0, "db":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v5, 0x1

    aget-object v1, p1, v5

    check-cast v1, Ljava/lang/String;

    .line 127
    .local v1, "table":Ljava/lang/String;
    const/4 v5, 0x2

    aget-object v2, p1, v5

    check-cast v2, Landroid/content/ContentValues;

    .line 128
    .local v2, "values":Landroid/content/ContentValues;
    const/4 v5, 0x3

    aget-object v3, p1, v5

    check-cast v3, Ljava/lang/String;

    .line 129
    .local v3, "where":Ljava/lang/String;
    const/4 v5, 0x4

    aget-object v5, p1, v5

    check-cast v5, [Ljava/lang/String;

    move-object v4, v5

    check-cast v4, [Ljava/lang/String;

    .line 131
    .local v4, "whereParams":[Ljava/lang/String;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    invoke-virtual {v5, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 134
    const/4 v5, 0x0

    return-object v5
.end method
