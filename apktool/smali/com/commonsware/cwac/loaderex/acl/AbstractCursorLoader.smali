.class public abstract Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;
.super Landroid/support/v4/content/AsyncTaskLoader;
.source "AbstractCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/content/AsyncTaskLoader",
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
    .line 33
    invoke-direct {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 34
    return-void
.end method


# virtual methods
.method protected abstract buildCursor()Landroid/database/Cursor;
.end method

.method public deliverResult(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->isReset()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 61
    if-eqz p1, :cond_0

    .line 62
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 70
    .local v0, "oldCursor":Landroid/database/Cursor;
    if-eqz v0, :cond_2

    if-eq v0, p1, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_2

    .line 71
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 72
    const/4 v0, 0x0

    .line 75
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 76
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 78
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    invoke-super {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 24
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->deliverResult(Landroid/database/Cursor;)V

    return-void
.end method

.method public loadInBackground()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->buildCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 44
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 46
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    .line 49
    :cond_0
    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 24
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public onCanceled(Landroid/database/Cursor;)V
    .locals 1
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 120
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 123
    :cond_0
    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 24
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->onCanceled(Landroid/database/Cursor;)V

    return-void
.end method

.method protected onReset()V
    .locals 1

    .prologue
    .line 132
    invoke-super {p0}, Landroid/support/v4/content/AsyncTaskLoader;->onReset()V

    .line 135
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->onStopLoading()V

    .line 137
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 141
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    .line 142
    return-void
.end method

.method protected onStartLoading()V
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    invoke-virtual {p0, v0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->deliverResult(Landroid/database/Cursor;)V

    .line 98
    :cond_0
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->lastCursor:Landroid/database/Cursor;

    if-nez v0, :cond_2

    .line 99
    :cond_1
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->forceLoad()V

    .line 101
    :cond_2
    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/AbstractCursorLoader;->cancelLoad()Z

    .line 111
    return-void
.end method
