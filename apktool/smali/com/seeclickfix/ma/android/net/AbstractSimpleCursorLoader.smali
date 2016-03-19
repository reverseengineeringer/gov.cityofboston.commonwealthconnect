.class public abstract Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;
.super Landroid/support/v4/content/AsyncTaskLoader;
.source "AbstractSimpleCursorLoader.java"


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
.field private mCursor:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 20
    return-void
.end method


# virtual methods
.method public deliverResult(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->isReset()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 46
    :cond_0
    :goto_0
    return-void

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    .line 37
    .local v0, "oldCursor":Landroid/database/Cursor;
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    .line 40
    invoke-super {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    .line 43
    if-eqz v0, :cond_0

    if-eq v0, p1, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 44
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 15
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->deliverResult(Landroid/database/Cursor;)V

    return-void
.end method

.method public forceLoad()V
    .locals 0

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->onForceLoad()V

    .line 68
    return-void
.end method

.method public abstract loadInBackground()Landroid/database/Cursor;
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public onCanceled(Landroid/database/Cursor;)V
    .locals 1
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 81
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 82
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 84
    :cond_0
    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 15
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->onCanceled(Landroid/database/Cursor;)V

    return-void
.end method

.method protected onReset()V
    .locals 1

    .prologue
    .line 88
    invoke-super {p0}, Landroid/support/v4/content/AsyncTaskLoader;->onReset()V

    .line 91
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->onStopLoading()V

    .line 93
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 96
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    .line 97
    return-void
.end method

.method protected onStartLoading()V
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->deliverResult(Landroid/database/Cursor;)V

    .line 60
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_2

    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->forceLoad()V

    .line 63
    :cond_2
    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/AbstractSimpleCursorLoader;->cancelLoad()Z

    .line 77
    return-void
.end method
