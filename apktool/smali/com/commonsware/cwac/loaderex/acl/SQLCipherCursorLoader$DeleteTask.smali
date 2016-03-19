.class Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$DeleteTask;
.super Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;
.source "SQLCipherCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeleteTask"
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
.field final synthetic this$0:Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;


# direct methods
.method constructor <init>(Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;)V
    .locals 0
    .param p2, "loader"    # Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$DeleteTask;->this$0:Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader;

    .line 158
    invoke-direct {p0, p2}, Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;-><init>(Landroid/support/v4/content/Loader;)V

    .line 159
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 155
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/acl/SQLCipherCursorLoader$DeleteTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 5
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 163
    const/4 v4, 0x0

    aget-object v0, p1, v4

    check-cast v0, Lnet/sqlcipher/database/SQLiteDatabase;

    .line 164
    .local v0, "db":Lnet/sqlcipher/database/SQLiteDatabase;
    const/4 v4, 0x1

    aget-object v1, p1, v4

    check-cast v1, Ljava/lang/String;

    .line 165
    .local v1, "table":Ljava/lang/String;
    const/4 v4, 0x2

    aget-object v2, p1, v4

    check-cast v2, Ljava/lang/String;

    .line 166
    .local v2, "where":Ljava/lang/String;
    const/4 v4, 0x3

    aget-object v4, p1, v4

    check-cast v4, [Ljava/lang/String;

    move-object v3, v4

    check-cast v3, [Ljava/lang/String;

    .line 168
    .local v3, "whereParams":[Ljava/lang/String;
    invoke-virtual {v0, v1, v2, v3}, Lnet/sqlcipher/database/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 170
    const/4 v4, 0x0

    return-object v4
.end method
