.class public abstract Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;
.super Landroid/content/AsyncTaskLoader;
.source "AbstractCursorLoader.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader",
        "<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field lastCursor:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 33
    return-void
.end method


# virtual methods
.method protected abstract buildCursor()Landroid/database/Cursor;
.end method

.method public deliverResult(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->isReset()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 67
    :cond_1
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 68
    .local v0, "oldCursor":Landroid/database/Cursor;
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 70
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 71
    invoke-super {p0, p1}, Landroid/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    .line 74
    :cond_2
    if-eqz v0, :cond_0

    if-eq v0, p1, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 75
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 26
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->deliverResult(Landroid/database/Cursor;)V

    return-void
.end method

.method public loadInBackground()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->buildCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 43
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 45
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    .line 48
    :cond_0
    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public onCanceled(Landroid/database/Cursor;)V
    .locals 1
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 116
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 117
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 119
    :cond_0
    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 26
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->onCanceled(Landroid/database/Cursor;)V

    return-void
.end method

.method protected onReset()V
    .locals 1

    .prologue
    .line 128
    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    .line 131
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->onStopLoading()V

    .line 133
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 137
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 138
    return-void
.end method

.method protected onStartLoading()V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    invoke-virtual {p0, v0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->deliverResult(Landroid/database/Cursor;)V

    .line 94
    :cond_0
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    if-nez v0, :cond_2

    .line 95
    :cond_1
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->forceLoad()V

    .line 97
    :cond_2
    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/AbstractCursorLoader;->cancelLoad()Z

    .line 107
    return-void
.end method
