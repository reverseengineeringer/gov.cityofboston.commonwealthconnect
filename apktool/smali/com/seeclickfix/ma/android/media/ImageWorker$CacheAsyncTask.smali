.class public Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;
.super Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
.source "ImageWorker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/media/ImageWorker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CacheAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;


# direct methods
.method protected constructor <init>(Lcom/seeclickfix/ma/android/media/ImageWorker;)V
    .locals 0

    .prologue
    .line 526
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 526
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 530
    const/4 v0, 0x0

    aget-object v0, p1, v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 544
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 532
    :pswitch_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->clearCacheInternal()V

    goto :goto_0

    .line 535
    :pswitch_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->initDiskCacheInternal()V

    goto :goto_0

    .line 538
    :pswitch_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->flushCacheInternal()V

    goto :goto_0

    .line 541
    :pswitch_3
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->closeCacheInternal()V

    goto :goto_0

    .line 530
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
