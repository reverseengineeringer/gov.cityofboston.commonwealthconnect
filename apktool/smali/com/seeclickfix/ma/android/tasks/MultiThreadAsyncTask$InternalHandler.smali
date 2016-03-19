.class Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;
.super Landroid/os/Handler;
.source "MultiThreadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InternalHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 650
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;

    .prologue
    .line 650
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 654
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;

    .line 655
    .local v0, "result":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 664
    :goto_0
    return-void

    .line 658
    :pswitch_0
    iget-object v1, v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;->mTask:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    iget-object v2, v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;->mData:[Ljava/lang/Object;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    # invokes: Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->finish(Ljava/lang/Object;)V
    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->access$600(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;Ljava/lang/Object;)V

    goto :goto_0

    .line 661
    :pswitch_1
    iget-object v1, v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;->mTask:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    iget-object v2, v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;->mData:[Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    goto :goto_0

    .line 655
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
