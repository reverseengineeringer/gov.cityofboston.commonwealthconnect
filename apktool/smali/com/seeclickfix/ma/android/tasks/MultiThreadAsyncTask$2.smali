.class Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;
.super Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;
.source "MultiThreadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable",
        "<TParams;TResult;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;)V
    .locals 1

    .prologue
    .line 313
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask.2;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;->this$0:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;-><init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;)V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 315
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask.2;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;->this$0:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    # getter for: Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->access$300(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 317
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 319
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;->this$0:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;->this$0:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;->mParams:[Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    # invokes: Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->postResult(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->access$400(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
