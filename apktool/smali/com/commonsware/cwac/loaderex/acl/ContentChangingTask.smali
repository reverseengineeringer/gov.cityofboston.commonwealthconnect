.class public abstract Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;
.super Landroid/os/AsyncTask;
.source "ContentChangingTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T1:",
        "Ljava/lang/Object;",
        "T2:",
        "Ljava/lang/Object;",
        "T3:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask",
        "<TT1;TT2;TT3;>;"
    }
.end annotation


# instance fields
.field private loader:Landroid/support/v4/content/Loader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/content/Loader",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v4/content/Loader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;, "Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask<TT1;TT2;TT3;>;"
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<*>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;->loader:Landroid/support/v4/content/Loader;

    .line 26
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;->loader:Landroid/support/v4/content/Loader;

    .line 27
    return-void
.end method


# virtual methods
.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT3;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;, "Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask<TT1;TT2;TT3;>;"
    .local p1, "param":Ljava/lang/Object;, "TT3;"
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/ContentChangingTask;->loader:Landroid/support/v4/content/Loader;

    invoke-virtual {v0}, Landroid/support/v4/content/Loader;->onContentChanged()V

    .line 32
    return-void
.end method
