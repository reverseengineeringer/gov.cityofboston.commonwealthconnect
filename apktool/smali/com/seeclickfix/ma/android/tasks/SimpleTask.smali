.class public abstract Lcom/seeclickfix/ma/android/tasks/SimpleTask;
.super Landroid/os/AsyncTask;
.source "SimpleTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ArgType:",
        "Ljava/lang/Object;",
        "ResultType:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask",
        "<TArgType;",
        "Ljava/lang/Integer;",
        "TResultType;>;"
    }
.end annotation


# static fields
.field protected static active:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/seeclickfix/ma/android/tasks/SimpleTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private failureCode:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

.field private listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
            "<TResultType;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->active:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
            "<TResultType;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SimpleTask;, "Lcom/seeclickfix/ma/android/tasks/SimpleTask<TArgType;TResultType;>;"
    .local p1, "listener":Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener<TResultType;>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    .line 34
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->failureCode:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .line 35
    return-void
.end method

.method public static cancel(Ljava/lang/String;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    .line 38
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->active:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->active:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->cancel(Z)Z

    .line 41
    :cond_0
    return-void
.end method

.method public static register(Ljava/lang/String;Lcom/seeclickfix/ma/android/tasks/SimpleTask;)Lcom/seeclickfix/ma/android/tasks/SimpleTask;
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "task"    # Lcom/seeclickfix/ma/android/tasks/SimpleTask;

    .prologue
    .line 44
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->active:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;

    return-object v0
.end method


# virtual methods
.method public getErrorCode()Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;
    .locals 1

    .prologue
    .line 63
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SimpleTask;, "Lcom/seeclickfix/ma/android/tasks/SimpleTask<TArgType;TResultType;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->failureCode:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResultType;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SimpleTask;, "Lcom/seeclickfix/ma/android/tasks/SimpleTask<TArgType;TResultType;>;"
    .local p1, "result":Ljava/lang/Object;, "TResultType;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->FINISHED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->successful()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;->onStateChange(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;Z)V

    .line 50
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->successful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;->onSuccess(Ljava/lang/Object;)V

    .line 55
    :goto_0
    return-void

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->getErrorCode()Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;->onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V

    goto :goto_0
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 59
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SimpleTask;, "Lcom/seeclickfix/ma/android/tasks/SimpleTask<TArgType;TResultType;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->STARTED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->successful()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;->onStateChange(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;Z)V

    .line 60
    return-void
.end method

.method public setErrorCode(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
    .locals 0
    .param p1, "failureCode"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .prologue
    .line 67
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SimpleTask;, "Lcom/seeclickfix/ma/android/tasks/SimpleTask<TArgType;TResultType;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->failureCode:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .line 68
    return-void
.end method

.method public successful()Z
    .locals 2

    .prologue
    .line 71
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/SimpleTask;, "Lcom/seeclickfix/ma/android/tasks/SimpleTask<TArgType;TResultType;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/SimpleTask;->failureCode:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
