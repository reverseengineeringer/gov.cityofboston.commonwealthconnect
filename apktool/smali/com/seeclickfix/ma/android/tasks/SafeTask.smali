.class public abstract Lcom/seeclickfix/ma/android/tasks/SafeTask;
.super Lcom/seeclickfix/ma/android/tasks/SimpleTask;
.source "SafeTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ArgType:",
        "Ljava/lang/Object;",
        "ResultType:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/seeclickfix/ma/android/tasks/SimpleTask",
        "<TArgType;TResultType;>;"
    }
.end annotation


# instance fields
.field private fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;


# direct methods
.method protected constructor <init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
            "<TResultType;>;)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SafeTask;, "Lcom/seeclickfix/ma/android/tasks/SafeTask<TArgType;TResultType;>;"
    .local p1, "listener":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<TResultType;>;"
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/tasks/SimpleTask;-><init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V

    .line 17
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->getFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SafeTask;->fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    .line 18
    return-void
.end method


# virtual methods
.method public getFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
    .locals 1

    .prologue
    .line 12
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SafeTask;, "Lcom/seeclickfix/ma/android/tasks/SafeTask<TArgType;TResultType;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SafeTask;->fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    return-object v0
.end method

.method public isAttached()Z
    .locals 1

    .prologue
    .line 21
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SafeTask;, "Lcom/seeclickfix/ma/android/tasks/SafeTask<TArgType;TResultType;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SafeTask;->fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResultType;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SafeTask;, "Lcom/seeclickfix/ma/android/tasks/SafeTask<TArgType;TResultType;>;"
    .local p1, "result":Ljava/lang/Object;, "TResultType;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/SafeTask;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->onPostExecute(Ljava/lang/Object;)V

    .line 28
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SafeTask;->fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    .line 29
    return-void
.end method
