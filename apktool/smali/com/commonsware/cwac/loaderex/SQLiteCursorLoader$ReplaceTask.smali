.class Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ReplaceTask;
.super Lcom/commonsware/cwac/loaderex/ContentChangingTask;
.source "SQLiteCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReplaceTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/commonsware/cwac/loaderex/ContentChangingTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;


# direct methods
.method constructor <init>(Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;)V
    .locals 0
    .param p2, "loader"    # Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ReplaceTask;->this$0:Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader;

    .line 141
    invoke-direct {p0, p2}, Lcom/commonsware/cwac/loaderex/ContentChangingTask;-><init>(Landroid/content/Loader;)V

    .line 142
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 138
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/SQLiteCursorLoader$ReplaceTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 5
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 146
    const/4 v4, 0x0

    aget-object v0, p1, v4

    check-cast v0, Landroid/database/sqlite/SQLiteOpenHelper;

    .line 147
    .local v0, "db":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v4, 0x1

    aget-object v2, p1, v4

    check-cast v2, Ljava/lang/String;

    .line 148
    .local v2, "table":Ljava/lang/String;
    const/4 v4, 0x2

    aget-object v1, p1, v4

    check-cast v1, Ljava/lang/String;

    .line 149
    .local v1, "nullColumnHack":Ljava/lang/String;
    const/4 v4, 0x3

    aget-object v3, p1, v4

    check-cast v3, Landroid/content/ContentValues;

    .line 151
    .local v3, "values":Landroid/content/ContentValues;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    invoke-virtual {v4, v2, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 153
    const/4 v4, 0x0

    return-object v4
.end method
