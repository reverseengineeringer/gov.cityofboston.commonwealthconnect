.class Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;
.super Ljava/lang/Object;
.source "MultiThreadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AsyncTaskResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final mData:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TData;"
        }
    .end annotation
.end field

.field final mTask:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;


# direct methods
.method varargs constructor <init>(Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "task"    # Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;",
            "[TData;)V"
        }
    .end annotation

    .prologue
    .line 676
    .local p0, "this":Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;, "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult<TData;>;"
    .local p2, "data":[Ljava/lang/Object;, "[TData;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 677
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;->mTask:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    .line 678
    iput-object p2, p0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$AsyncTaskResult;->mData:[Ljava/lang/Object;

    .line 679
    return-void
.end method
