.class public abstract Lcom/seeclickfix/ma/android/media/ImageWorker;
.super Ljava/lang/Object;
.source "ImageWorker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;,
        Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;,
        Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    }
.end annotation


# static fields
.field private static final FADE_IN_TIME:I = 0xc8

.field private static final MESSAGE_CLEAR:I = 0x0

.field private static final MESSAGE_CLOSE:I = 0x3

.field private static final MESSAGE_FLUSH:I = 0x2

.field private static final MESSAGE_INIT_DISK_CACHE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "ImageWorker"


# instance fields
.field private mExitTasksEarly:Z

.field private mFadeInBitmap:Z

.field private mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

.field private mImageCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

.field private mLoadingBitmap:Landroid/graphics/Bitmap;

.field protected mPauseWork:Z

.field private final mPauseWorkLock:Ljava/lang/Object;

.field protected mResources:Landroid/content/res/Resources;


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mFadeInBitmap:Z

    .line 53
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mExitTasksEarly:Z

    .line 54
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWork:Z

    .line 55
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWorkLock:Ljava/lang/Object;

    .line 65
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mResources:Landroid/content/res/Resources;

    .line 66
    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/media/ImageWorker;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/ImageWorker;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWorkLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/media/ImageWorker;)Lcom/seeclickfix/ma/android/media/ImageCache;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/ImageWorker;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/media/ImageWorker;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/ImageWorker;

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mExitTasksEarly:Z

    return v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/media/ImageWorker;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/ImageWorker;
    .param p1, "x1"    # Landroid/widget/ImageView;
    .param p2, "x2"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/media/ImageWorker;->setImageDrawable(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic access$500(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    .locals 1
    .param p0, "x0"    # Landroid/widget/ImageView;

    .prologue
    .line 45
    invoke-static {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->getBitmapWorkerTask(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Landroid/widget/Button;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    .locals 1
    .param p0, "x0"    # Landroid/widget/Button;

    .prologue
    .line 45
    invoke-static {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->getBitmapWorkerTaskBtn(Landroid/widget/Button;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v0

    return-object v0
.end method

.method public static cancelPotentialWork(Ljava/lang/Object;Landroid/widget/ImageView;)Z
    .locals 4
    .param p0, "data"    # Ljava/lang/Object;
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    const/4 v2, 0x1

    .line 233
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/ImageWorker;->getBitmapWorkerTask(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v1

    .line 235
    .local v1, "bitmapWorkerTask":Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    if-eqz v1, :cond_1

    .line 236
    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->data:Ljava/lang/Object;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->access$000(Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;)Ljava/lang/Object;

    move-result-object v0

    .line 237
    .local v0, "bitmapData":Ljava/lang/Object;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 238
    :cond_0
    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->cancel(Z)Z

    .line 247
    .end local v0    # "bitmapData":Ljava/lang/Object;
    :cond_1
    :goto_0
    return v2

    .line 244
    .restart local v0    # "bitmapData":Ljava/lang/Object;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static cancelPotentialWorkButton(Ljava/lang/Object;Landroid/widget/Button;)Z
    .locals 4
    .param p0, "data"    # Ljava/lang/Object;
    .param p1, "btn"    # Landroid/widget/Button;

    .prologue
    const/4 v2, 0x1

    .line 252
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/ImageWorker;->getBitmapWorkerTaskBtn(Landroid/widget/Button;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v1

    .line 254
    .local v1, "bitmapWorkerTask":Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    if-eqz v1, :cond_1

    .line 255
    # getter for: Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->data:Ljava/lang/Object;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->access$000(Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;)Ljava/lang/Object;

    move-result-object v0

    .line 256
    .local v0, "bitmapData":Ljava/lang/Object;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 257
    :cond_0
    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->cancel(Z)Z

    .line 266
    .end local v0    # "bitmapData":Ljava/lang/Object;
    :cond_1
    :goto_0
    return v2

    .line 263
    .restart local v0    # "bitmapData":Ljava/lang/Object;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static cancelWork(Landroid/widget/ImageView;)V
    .locals 2
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 216
    invoke-static {p0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->getBitmapWorkerTask(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v0

    .line 217
    .local v0, "bitmapWorkerTask":Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    if-eqz v0, :cond_0

    .line 218
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->cancel(Z)Z

    .line 224
    :cond_0
    return-void
.end method

.method private static getBitmapWorkerTask(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    .locals 3
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 275
    if-eqz p0, :cond_0

    .line 276
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 277
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v2, v1, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 278
    check-cast v0, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;

    .line 279
    .local v0, "asyncDrawable":Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;->getBitmapWorkerTask()Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v2

    .line 282
    .end local v0    # "asyncDrawable":Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static getBitmapWorkerTaskBtn(Landroid/widget/Button;)Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    .locals 4
    .param p0, "btn"    # Landroid/widget/Button;

    .prologue
    .line 286
    if-eqz p0, :cond_0

    .line 287
    invoke-virtual {p0}, Landroid/widget/Button;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v1, v2, v3

    .line 288
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v2, v1, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 289
    check-cast v0, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;

    .line 290
    .local v0, "asyncDrawable":Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;->getBitmapWorkerTask()Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    move-result-object v2

    .line 293
    .end local v0    # "asyncDrawable":Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private setImageDrawable(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 5
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 486
    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mFadeInBitmap:Z

    if-eqz v1, :cond_0

    .line 488
    new-instance v0, Landroid/graphics/drawable/TransitionDrawable;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const v4, 0x106000d

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-direct {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 494
    .local v0, "td":Landroid/graphics/drawable/TransitionDrawable;
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mResources:Landroid/content/res/Resources;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mLoadingBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 497
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 498
    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 502
    .end local v0    # "td":Landroid/graphics/drawable/TransitionDrawable;
    :goto_0
    return-void

    .line 500
    :cond_0
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method


# virtual methods
.method public addImageCache(Landroid/support/v4/app/FragmentActivity;Ljava/lang/String;)V
    .locals 4
    .param p1, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p2, "diskCacheDirectoryName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 175
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    invoke-direct {v0, p1, p2}, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    .line 176
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/media/ImageCache;->getInstance(Landroid/support/v4/app/FragmentManager;Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;)Lcom/seeclickfix/ma/android/media/ImageCache;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    .line 177
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;-><init>(Lcom/seeclickfix/ma/android/media/ImageWorker;)V

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->execute([Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    .line 178
    return-void
.end method

.method public addImageCache(Landroid/support/v4/app/FragmentManager;Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;)V
    .locals 4
    .param p1, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p2, "cacheParams"    # Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    .prologue
    const/4 v3, 0x1

    .line 161
    iput-object p2, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    .line 162
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    invoke-static {p1, v0}, Lcom/seeclickfix/ma/android/media/ImageCache;->getInstance(Landroid/support/v4/app/FragmentManager;Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;)Lcom/seeclickfix/ma/android/media/ImageCache;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    .line 163
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;-><init>(Lcom/seeclickfix/ma/android/media/ImageWorker;)V

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->execute([Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    .line 164
    return-void
.end method

.method public clearCache()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 574
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;-><init>(Lcom/seeclickfix/ma/android/media/ImageWorker;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->execute([Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    .line 575
    return-void
.end method

.method protected clearCacheInternal()V
    .locals 1

    .prologue
    .line 555
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    if-eqz v0, :cond_0

    .line 556
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageCache;->clearCache()V

    .line 558
    :cond_0
    return-void
.end method

.method public closeCache()V
    .locals 4

    .prologue
    .line 582
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;-><init>(Lcom/seeclickfix/ma/android/media/ImageWorker;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->execute([Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    .line 583
    return-void
.end method

.method protected closeCacheInternal()V
    .locals 1

    .prologue
    .line 567
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    if-eqz v0, :cond_0

    .line 568
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageCache;->close()V

    .line 569
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    .line 571
    :cond_0
    return-void
.end method

.method public flushCache()V
    .locals 4

    .prologue
    .line 578
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;-><init>(Lcom/seeclickfix/ma/android/media/ImageWorker;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$CacheAsyncTask;->execute([Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    .line 579
    return-void
.end method

.method protected flushCacheInternal()V
    .locals 1

    .prologue
    .line 561
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    if-eqz v0, :cond_0

    .line 562
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageCache;->flush()V

    .line 564
    :cond_0
    return-void
.end method

.method protected getImageCache()Lcom/seeclickfix/ma/android/media/ImageCache;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    return-object v0
.end method

.method protected initDiskCacheInternal()V
    .locals 1

    .prologue
    .line 549
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    if-eqz v0, :cond_0

    .line 550
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/ImageCache;->initDiskCache()V

    .line 552
    :cond_0
    return-void
.end method

.method public loadButtonIconLeft(Ljava/lang/Object;Landroid/widget/Button;)V
    .locals 6
    .param p1, "data"    # Ljava/lang/Object;
    .param p2, "btn"    # Landroid/widget/Button;

    .prologue
    const/4 v5, 0x0

    .line 108
    if-nez p1, :cond_1

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 112
    :cond_1
    const/4 v2, 0x0

    .line 114
    .local v2, "value":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    if-eqz v3, :cond_2

    .line 115
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/media/ImageCache;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v2

    .line 118
    :cond_2
    if-eqz v2, :cond_3

    .line 120
    invoke-virtual {p2, v2, v5, v5, v5}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 121
    :cond_3
    invoke-static {p1, p2}, Lcom/seeclickfix/ma/android/media/ImageWorker;->cancelPotentialWorkButton(Ljava/lang/Object;Landroid/widget/Button;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 122
    new-instance v1, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    invoke-direct {v1, p0, p2}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;-><init>(Lcom/seeclickfix/ma/android/media/ImageWorker;Landroid/widget/Button;)V

    .line 123
    .local v1, "task":Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mResources:Landroid/content/res/Resources;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mLoadingBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v3, v4, v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;)V

    .line 125
    .local v0, "asyncDrawable":Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;
    invoke-virtual {p2, v0, v5, v5, v5}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 130
    sget-object v3, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->DUAL_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v3, v4}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    goto :goto_0
.end method

.method public loadImage(Ljava/lang/Object;Landroid/widget/ImageView;)V
    .locals 6
    .param p1, "data"    # Ljava/lang/Object;
    .param p2, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 80
    if-nez p1, :cond_1

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 84
    :cond_1
    const/4 v2, 0x0

    .line 86
    .local v2, "value":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    if-eqz v3, :cond_2

    .line 87
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mImageCache:Lcom/seeclickfix/ma/android/media/ImageCache;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/media/ImageCache;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v2

    .line 90
    :cond_2
    if-eqz v2, :cond_3

    .line 92
    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 93
    :cond_3
    invoke-static {p1, p2}, Lcom/seeclickfix/ma/android/media/ImageWorker;->cancelPotentialWork(Ljava/lang/Object;Landroid/widget/ImageView;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 94
    new-instance v1, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    invoke-direct {v1, p0, p2}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;-><init>(Lcom/seeclickfix/ma/android/media/ImageWorker;Landroid/widget/ImageView;)V

    .line 95
    .local v1, "task":Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mResources:Landroid/content/res/Resources;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mLoadingBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v3, v4, v1}, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;)V

    .line 97
    .local v0, "asyncDrawable":Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 102
    sget-object v3, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;->DUAL_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v3, v4}, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;

    goto :goto_0
.end method

.method protected abstract processBitmap(Ljava/lang/Object;)Landroid/graphics/Bitmap;
.end method

.method public setExitTasksEarly(Z)V
    .locals 1
    .param p1, "exitTasksEarly"    # Z

    .prologue
    .line 188
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mExitTasksEarly:Z

    .line 189
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/media/ImageWorker;->setPauseWork(Z)V

    .line 190
    return-void
.end method

.method public setImageFadeIn(Z)V
    .locals 0
    .param p1, "fadeIn"    # Z

    .prologue
    .line 184
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mFadeInBitmap:Z

    .line 185
    return-void
.end method

.method public setLoadingImage(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 149
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mResources:Landroid/content/res/Resources;

    invoke-static {v0, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mLoadingBitmap:Landroid/graphics/Bitmap;

    .line 150
    return-void
.end method

.method public setLoadingImage(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mLoadingBitmap:Landroid/graphics/Bitmap;

    .line 141
    return-void
.end method

.method public setPauseWork(Z)V
    .locals 2
    .param p1, "pauseWork"    # Z

    .prologue
    .line 518
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWorkLock:Ljava/lang/Object;

    monitor-enter v1

    .line 519
    :try_start_0
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWork:Z

    .line 520
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWork:Z

    if-nez v0, :cond_0

    .line 521
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker;->mPauseWorkLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 523
    :cond_0
    monitor-exit v1

    .line 524
    return-void

    .line 523
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
