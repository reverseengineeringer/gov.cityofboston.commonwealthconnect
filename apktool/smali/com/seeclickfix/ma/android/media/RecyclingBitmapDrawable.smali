.class public Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "RecyclingBitmapDrawable.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "CountingBitmapDrawable"


# instance fields
.field private mCacheRefCount:I

.field private mDisplayRefCount:I

.field private mHasBeenDisplayed:Z


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 35
    iput v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mCacheRefCount:I

    .line 36
    iput v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mDisplayRefCount:I

    .line 42
    return-void
.end method

.method private declared-synchronized checkState()V
    .locals 1

    .prologue
    .line 87
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mCacheRefCount:I

    if-gtz v0, :cond_0

    iget v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mDisplayRefCount:I

    if-gtz v0, :cond_0

    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mHasBeenDisplayed:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->hasValidBitmap()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    :cond_0
    monitor-exit p0

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized hasValidBitmap()Z
    .locals 2

    .prologue
    .line 99
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 100
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    monitor-exit p0

    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 99
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public setIsCached(Z)V
    .locals 1
    .param p1, "isCached"    # Z

    .prologue
    .line 72
    monitor-enter p0

    .line 73
    if-eqz p1, :cond_0

    .line 74
    :try_start_0
    iget v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mCacheRefCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mCacheRefCount:I

    .line 78
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->checkState()V

    .line 82
    return-void

    .line 76
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mCacheRefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mCacheRefCount:I

    goto :goto_0

    .line 78
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public setIsDisplayed(Z)V
    .locals 1
    .param p1, "isDisplayed"    # Z

    .prologue
    .line 52
    monitor-enter p0

    .line 53
    if-eqz p1, :cond_0

    .line 54
    :try_start_0
    iget v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mDisplayRefCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mDisplayRefCount:I

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mHasBeenDisplayed:Z

    .line 59
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->checkState()V

    .line 63
    return-void

    .line 57
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mDisplayRefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->mDisplayRefCount:I

    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
