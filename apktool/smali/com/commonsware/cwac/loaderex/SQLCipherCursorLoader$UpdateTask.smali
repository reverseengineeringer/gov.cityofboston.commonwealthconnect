.class Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$UpdateTask;
.super Lcom/commonsware/cwac/loaderex/ContentChangingTask;
.source "SQLCipherCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateTask"
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
.field final synthetic this$0:Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;


# direct methods
.method constructor <init>(Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;)V
    .locals 0
    .param p2, "loader"    # Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$UpdateTask;->this$0:Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader;

    .line 121
    invoke-direct {p0, p2}, Lcom/commonsware/cwac/loaderex/ContentChangingTask;-><init>(Landroid/content/Loader;)V

    .line 122
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 118
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/SQLCipherCursorLoader$UpdateTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 6
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 126
    const/4 v5, 0x0

    aget-object v0, p1, v5

    check-cast v0, Lnet/sqlcipher/database/SQLiteDatabase;

    .line 127
    .local v0, "db":Lnet/sqlcipher/database/SQLiteDatabase;
    const/4 v5, 0x1

    aget-object v1, p1, v5

    check-cast v1, Ljava/lang/String;

    .line 128
    .local v1, "table":Ljava/lang/String;
    const/4 v5, 0x2

    aget-object v2, p1, v5

    check-cast v2, Landroid/content/ContentValues;

    .line 129
    .local v2, "values":Landroid/content/ContentValues;
    const/4 v5, 0x3

    aget-object v3, p1, v5

    check-cast v3, Ljava/lang/String;

    .line 130
    .local v3, "where":Ljava/lang/String;
    const/4 v5, 0x4

    aget-object v5, p1, v5

    check-cast v5, [Ljava/lang/String;

    move-object v4, v5

    check-cast v4, [Ljava/lang/String;

    .line 132
    .local v4, "whereParams":[Ljava/lang/String;
    invoke-virtual {v0, v1, v2, v3, v4}, Lnet/sqlcipher/database/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 134
    const/4 v5, 0x0

    return-object v5
.end method
