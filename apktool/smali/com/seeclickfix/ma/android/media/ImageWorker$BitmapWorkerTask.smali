.class Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
.super Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
.source "ImageWorker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/media/ImageWorker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BitmapWorkerTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field private btnReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field private data:Ljava/lang/Object;

.field private imageViewReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/media/ImageWorker;Landroid/widget/Button;)V
    .locals 1
    .param p2, "btn"    # Landroid/widget/Button;

    .prologue
    .line 308
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;-><init>()V

    .line 309
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->btnReference:Ljava/lang/ref/WeakReference;

    .line 310
    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/media/ImageWorker;Landroid/widget/ImageView;)V
    .locals 1
    .param p2, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 304
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;-><init>()V

    .line 305
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    .line 306
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    .prologue
    .line 299
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->data:Ljava/lang/Object;

    return-object v0
.end method

.method private getAttachedButton()Landroid/widget/Button;
    .locals 3

    .prologue
    .line 432
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->btnReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 433
    .local v1, "btn":Landroid/widget/Button;
    # invokes: Lcom/seeclickfix/ma/android/media/ImageWorker;->getBitmapWorkerTaskBtn(Landroid/widget/Button;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$600(Landroid/widget/Button;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v0

    .line 435
    .local v0, "bitmapWorkerTask":Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    if-ne p0, v0, :cond_0

    .line 439
    .end local v1    # "btn":Landroid/widget/Button;
    :goto_0
    return-object v1

    .restart local v1    # "btn":Landroid/widget/Button;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getAttachedImageView()Landroid/widget/ImageView;
    .locals 3

    .prologue
    .line 417
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 418
    .local v1, "imageView":Landroid/widget/ImageView;
    # invokes: Lcom/seeclickfix/ma/android/media/ImageWorker;->getBitmapWorkerTask(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$500(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v0

    .line 420
    .local v0, "bitmapWorkerTask":Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    if-ne p0, v0, :cond_0

    .line 424
    .end local v1    # "imageView":Landroid/widget/ImageView;
    :goto_0
    return-object v1

    .restart local v1    # "imageView":Landroid/widget/ImageView;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 6
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 321
    aget-object v3, p1, v5

    iput-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->data:Ljava/lang/Object;

    .line 322
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->data:Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 323
    .local v1, "dataString":Ljava/lang/String;
    const/4 v0, 0x0

    .line 324
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v2, 0x0

    .line 327
    .local v2, "drawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWorkLock:Ljava/lang/Object;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$100(Lcom/seeclickfix/ma/android/media/ImageWorker;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 328
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    iget-boolean v3, v3, Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWork:Z

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->isCancelled()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_0

    .line 330
    :try_start_1
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWorkLock:Ljava/lang/Object;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$100(Lcom/seeclickfix/ma/android/media/ImageWorker;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 331
    :catch_0
    move-exception v3

    goto :goto_0

    .line 334
    :cond_0
    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 340
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$200(Lcom/seeclickfix/ma/android/media/ImageWorker;)Lcom/seeclickfix/ma/android/media/ImageCache;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->getAttachedView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mExitTasksEarly:Z
    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$300(Lcom/seeclickfix/ma/android/media/ImageWorker;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 342
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$200(Lcom/seeclickfix/ma/android/media/ImageWorker;)Lcom/seeclickfix/ma/android/media/ImageCache;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/seeclickfix/ma/android/media/ImageCache;->getBitmapFromDiskCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 349
    :cond_1
    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->getAttachedView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mExitTasksEarly:Z
    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$300(Lcom/seeclickfix/ma/android/media/ImageWorker;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 351
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    aget-object v4, p1, v5

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/media/ImageWorker;->processBitmap(Ljava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 358
    :cond_2
    if-eqz v0, :cond_3

    .line 359
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasHoneycomb()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 361
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    .end local v2    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    iget-object v3, v3, Lcom/seeclickfix/ma/android/media/ImageWorker;->mResources:Landroid/content/res/Resources;

    invoke-direct {v2, v3, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 368
    .restart local v2    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    :goto_1
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$200(Lcom/seeclickfix/ma/android/media/ImageWorker;)Lcom/seeclickfix/ma/android/media/ImageCache;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 369
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$200(Lcom/seeclickfix/ma/android/media/ImageWorker;)Lcom/seeclickfix/ma/android/media/ImageCache;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lcom/seeclickfix/ma/android/media/ImageCache;->addBitmapToCache(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;)V

    .line 377
    :cond_3
    return-object v2

    .line 334
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 365
    :cond_4
    new-instance v2, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;

    .end local v2    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    iget-object v3, v3, Lcom/seeclickfix/ma/android/media/ImageWorker;->mResources:Landroid/content/res/Resources;

    invoke-direct {v2, v3, v0}, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .restart local v2    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 299
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->doInBackground([Ljava/lang/Object;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    return-object v0
.end method

.method public getAttachedView()Landroid/view/View;
    .locals 1

    .prologue
    .line 444
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 445
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->getAttachedImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 449
    :goto_0
    return-object v0

    .line 446
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->btnReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    .line 447
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->getAttachedButton()Landroid/widget/Button;

    move-result-object v0

    goto :goto_0

    .line 449
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onCancelled(Landroid/graphics/drawable/BitmapDrawable;)V
    .locals 2
    .param p1, "value"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 406
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->onCancelled(Ljava/lang/Object;)V

    .line 407
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWorkLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$100(Lcom/seeclickfix/ma/android/media/ImageWorker;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 408
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWorkLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$100(Lcom/seeclickfix/ma/android/media/ImageWorker;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 409
    monitor-exit v1

    .line 410
    return-void

    .line 409
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 299
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->onCancelled(Landroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method

.method protected onPostExecute(Landroid/graphics/drawable/BitmapDrawable;)V
    .locals 3
    .param p1, "value"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    const/4 v2, 0x0

    .line 386
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker;->mExitTasksEarly:Z
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$300(Lcom/seeclickfix/ma/android/media/ImageWorker;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 387
    :cond_0
    const/4 p1, 0x0

    .line 390
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->getAttachedView()Landroid/view/View;

    move-result-object v0

    .line 391
    .local v0, "v":Landroid/view/View;
    if-eqz p1, :cond_2

    if-eqz v0, :cond_2

    .line 396
    instance-of v1, v0, Landroid/widget/Button;

    if-eqz v1, :cond_3

    .line 397
    check-cast v0, Landroid/widget/Button;

    .end local v0    # "v":Landroid/view/View;
    invoke-virtual {v0, p1, v2, v2, v2}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 402
    :cond_2
    :goto_0
    return-void

    .line 398
    .restart local v0    # "v":Landroid/view/View;
    :cond_3
    instance-of v1, v0, Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    .line 399
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->this$0:Lcom/seeclickfix/ma/android/media/ImageWorker;

    check-cast v0, Landroid/widget/ImageView;

    .end local v0    # "v":Landroid/view/View;
    # invokes: Lcom/seeclickfix/ma/android/media/ImageWorker;->setImageDrawable(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    invoke-static {v1, v0, p1}, Lcom/seeclickfix/ma/android/media/ImageWorker;->access$400(Lcom/seeclickfix/ma/android/media/ImageWorker;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 299
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->onPostExecute(Landroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method
