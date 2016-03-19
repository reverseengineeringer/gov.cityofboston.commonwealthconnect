.class abstract Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;
.super Ljava/lang/Object;
.source "MultiThreadAsyncTask.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "WorkerRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TResult;>;"
    }
.end annotation


# instance fields
.field mParams:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TParams;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 667
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable<TParams;TResult;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$1;

    .prologue
    .line 667
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable<TParams;TResult;>;"
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$WorkerRunnable;-><init>()V

    return-void
.end method
