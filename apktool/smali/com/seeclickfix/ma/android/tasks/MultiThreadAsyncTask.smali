.class public abstract Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
.super Ljava/lang/Object;
.source "MultiThreadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$4;,
        Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;,
        Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;,
        Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;,
        Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;,
        Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$SerialExecutor;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final CORE_POOL_SIZE:I = 0x5

.field public static final DUAL_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static final KEEP_ALIVE:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "MultiThreadAsyncTask"

.field private static final MAXIMUM_POOL_SIZE:I = 0x80

.field private static final MESSAGE_POST_PROGRESS:I = 0x2

.field private static final MESSAGE_POST_RESULT:I = 0x1

.field public static final SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

.field public static final THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static volatile sDefaultExecutor:Ljava/util/concurrent/Executor;

.field private static final sHandler:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;

.field private static final sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static final sThreadFactory:Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private final mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mFuture:Ljava/util/concurrent/FutureTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/FutureTask",
            "<TResult;>;"
        }
    .end annotation
.end field

.field private volatile mStatus:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

.field private final mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mWorker:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable",
            "<TParams;TResult;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 206
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 214
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;

    .line 220
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v2, 0x5

    const/16 v3, 0x80

    const-wide/16 v4, 0x1

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v7, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;

    sget-object v8, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    new-instance v9, Ljava/util/concurrent/ThreadPoolExecutor$DiscardOldestPolicy;

    invoke-direct {v9}, Ljava/util/concurrent/ThreadPoolExecutor$DiscardOldestPolicy;-><init>()V

    invoke-direct/range {v1 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    sput-object v1, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 229
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasHoneycomb()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$SerialExecutor;

    invoke-direct {v0, v10}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$SerialExecutor;-><init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;)V

    :goto_0
    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 232
    const/4 v0, 0x2

    sget-object v1, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->DUAL_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 238
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;

    invoke-direct {v0, v10}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;-><init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;)V

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sHandler:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;

    .line 240
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sDefaultExecutor:Ljava/util/concurrent/Executor;

    return-void

    .line 229
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 312
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 244
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->PENDING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mStatus:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    .line 246
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 247
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 313
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$2;-><init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mWorker:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;

    .line 323
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$3;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mWorker:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$3;-><init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;Ljava/util/concurrent/Callable;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    .line 338
    return-void
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    .prologue
    .line 199
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 199
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->postResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 199
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->postResultIfNotInvoked(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 199
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->finish(Ljava/lang/Object;)V

    return-void
.end method

.method public static execute(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 618
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sDefaultExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 619
    return-void
.end method

.method private finish(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 642
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 643
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->onCancelled(Ljava/lang/Object;)V

    .line 647
    :goto_0
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->FINISHED:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mStatus:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    .line 648
    return-void

    .line 645
    :cond_0
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->onPostExecute(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static init()V
    .locals 1

    .prologue
    .line 299
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sHandler:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;->getLooper()Landroid/os/Looper;

    .line 300
    return-void
.end method

.method private postResult(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)TResult;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    const/4 v5, 0x1

    .line 349
    sget-object v1, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sHandler:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;

    new-instance v2, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-direct {v2, p0, v3}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;-><init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;[Ljava/lang/Object;)V

    invoke-virtual {v1, v5, v2}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 351
    .local v0, "message":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 352
    return-object p1
.end method

.method private postResultIfNotInvoked(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 341
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    .line 342
    .local v0, "wasTaskInvoked":Z
    if-nez v0, :cond_0

    .line 343
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->postResult(Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    :cond_0
    return-void
.end method

.method public static setDefaultExecutor(Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p0, "exec"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 306
    sput-object p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sDefaultExecutor:Ljava/util/concurrent/Executor;

    .line 307
    return-void
.end method


# virtual methods
.method public final cancel(Z)Z
    .locals 2
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 487
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 488
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method protected varargs abstract doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation
.end method

.method public final varargs execute([Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)",
            "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask",
            "<TParams;TProgress;TResult;>;"
        }
    .end annotation

    .prologue
    .line 549
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "params":[Ljava/lang/Object;, "[TParams;"
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sDefaultExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    move-result-object v0

    return-object v0
.end method

.method public final varargs executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
    .locals 2
    .param p1, "exec"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "[TParams;)",
            "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask",
            "<TParams;TProgress;TResult;>;"
        }
    .end annotation

    .prologue
    .line 584
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p2, "params":[Ljava/lang/Object;, "[TParams;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mStatus:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    sget-object v1, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->PENDING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 585
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$4;->$SwitchMap$com$seeclickfix$ma$android$tasks$MultiThreadAsyncTask$Status:[I

    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mStatus:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 599
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->RUNNING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mStatus:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    .line 601
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->onPreExecute()V

    .line 603
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mWorker:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;

    iput-object p2, v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;->mParams:[Ljava/lang/Object;

    .line 604
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 606
    return-object p0

    .line 587
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Cannot execute task: the task is already running."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 590
    :pswitch_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Cannot execute task: the task has already been executed (a task can be executed only once)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 585
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 502
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 520
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getStatus()Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;
    .locals 1

    .prologue
    .line 361
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mStatus:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    return-object v0
.end method

.method public final isCancelled()Z
    .locals 1

    .prologue
    .line 456
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method protected onCancelled()V
    .locals 0

    .prologue
    .line 444
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    return-void
.end method

.method protected onCancelled(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 428
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->onCancelled()V

    .line 429
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 401
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 387
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .prologue
    .line 412
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "values":[Ljava/lang/Object;, "[TProgress;"
    return-void
.end method

.method protected final varargs publishProgress([Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .prologue
    .line 635
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "values":[Ljava/lang/Object;, "[TProgress;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 636
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->sHandler:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;

    const/4 v1, 0x2

    new-instance v2, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;

    invoke-direct {v2, p0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;-><init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$InternalHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 639
    :cond_0
    return-void
.end method
