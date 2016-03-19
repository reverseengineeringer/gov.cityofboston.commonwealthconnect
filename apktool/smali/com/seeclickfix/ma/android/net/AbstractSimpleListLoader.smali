.class public abstract Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;
.super Landroid/support/v4/content/AsyncTaskLoader;
.source "AbstractSimpleListLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v4/content/AsyncTaskLoader",
        "<",
        "Ljava/util/List",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    invoke-direct {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 18
    return-void
.end method


# virtual methods
.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 13
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->deliverResult(Ljava/util/List;)V

    return-void
.end method

.method public deliverResult(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->isReset()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 46
    :cond_0
    :goto_0
    return-void

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    .line 37
    .local v0, "oldList":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    .line 39
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 40
    invoke-super {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    .line 43
    :cond_2
    if-eqz v0, :cond_0

    if-eq v0, p1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 44
    invoke-interface {v0}, Ljava/util/List;->clear()V

    goto :goto_0
.end method

.method protected abstract getData()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end method

.method protected getList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 13
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->loadInBackground()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public loadInBackground()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->getData()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 13
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->onCanceled(Ljava/util/List;)V

    return-void
.end method

.method public onCanceled(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 77
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 79
    :cond_0
    return-void
.end method

.method protected onReset()V
    .locals 1

    .prologue
    .line 83
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    invoke-super {p0}, Landroid/support/v4/content/AsyncTaskLoader;->onReset()V

    .line 86
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->onStopLoading()V

    .line 88
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 91
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    .line 92
    return-void
.end method

.method protected onStartLoading()V
    .locals 1

    .prologue
    .line 57
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->deliverResult(Ljava/util/List;)V

    .line 60
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->mList:Ljava/util/List;

    if-nez v0, :cond_2

    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->forceLoad()V

    .line 63
    :cond_2
    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    .prologue
    .line 71
    .local p0, "this":Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;, "Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader<TT;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleListLoader;->cancelLoad()Z

    .line 72
    return-void
.end method
