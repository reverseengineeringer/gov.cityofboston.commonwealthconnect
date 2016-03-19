.class public Lcom/seeclickfix/ma/android/media/ImageCache;
.super Ljava/lang/Object;
.source "ImageCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;,
        Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

.field private static final DEFAULT_COMPRESS_QUALITY:I = 0x46

.field private static final DEFAULT_DISK_CACHE_ENABLED:Z = true

.field private static final DEFAULT_DISK_CACHE_SIZE:I = 0xa00000

.field private static final DEFAULT_INIT_DISK_CACHE_ON_CREATE:Z = false

.field private static final DEFAULT_MEM_CACHE_ENABLED:Z = true

.field private static final DEFAULT_MEM_CACHE_SIZE:I = 0x1400

.field private static final DISK_CACHE_INDEX:I = 0x0

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ImageCache"


# instance fields
.field private mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

.field private final mDiskCacheLock:Ljava/lang/Object;

.field private mDiskCacheStarting:Z

.field private mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

.field private mMemoryCache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation
.end field

.field private mReusableBitmaps:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lcom/seeclickfix/ma/android/media/ImageCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method private constructor <init>(Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;)V
    .locals 1
    .param p1, "cacheParams"    # Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheStarting:Z

    .line 98
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/media/ImageCache;->init(Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;)V

    .line 99
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/media/ImageCache;)Ljava/util/HashSet;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/ImageCache;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mReusableBitmaps:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic access$100()Landroid/graphics/Bitmap$CompressFormat;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lcom/seeclickfix/ma/android/media/ImageCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    return-object v0
.end method

.method private static bytesToHexString([B)Ljava/lang/String;
    .locals 5
    .param p0, "bytes"    # [B

    .prologue
    .line 562
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 563
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_1

    .line 564
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 565
    .local v0, "hex":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 566
    const/16 v3, 0x30

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 568
    :cond_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 570
    .end local v0    # "hex":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static canUseForInBitmap(Landroid/graphics/Bitmap;Landroid/graphics/BitmapFactory$Options;)Z
    .locals 4
    .param p0, "candidate"    # Landroid/graphics/Bitmap;
    .param p1, "targetOptions"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 509
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v3, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int v1, v2, v3

    .line 510
    .local v1, "width":I
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v3, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int v0, v2, v3

    .line 512
    .local v0, "height":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-ne v2, v1, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-ne v2, v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static findOrCreateRetainFragment(Landroid/support/v4/app/FragmentManager;)Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;
    .locals 3
    .param p0, "fm"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 650
    const-string/jumbo v1, "ImageCache"

    invoke-virtual {p0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;

    .line 653
    .local v0, "mRetainFragment":Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;
    if-nez v0, :cond_0

    .line 654
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;

    .end local v0    # "mRetainFragment":Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;
    invoke-direct {v0}, Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;-><init>()V

    .line 655
    .restart local v0    # "mRetainFragment":Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;
    invoke-virtual {p0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string/jumbo v2, "ImageCache"

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 658
    :cond_0
    return-object v0
.end method

.method public static getBitmapSize(Landroid/graphics/drawable/BitmapDrawable;)I
    .locals 5
    .param p0, "value"    # Landroid/graphics/drawable/BitmapDrawable;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xc
    .end annotation

    .prologue
    .line 581
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 582
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    mul-int v2, v3, v4

    .line 583
    .local v2, "numBytesByRow":I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v1

    .line 587
    .local v1, "numBytesByCount":I
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasHoneycombMR1()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 588
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v3

    .line 591
    :goto_0
    return v3

    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    mul-int/2addr v3, v4

    goto :goto_0
.end method

.method public static getDiskCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uniqueName"    # Ljava/lang/String;

    .prologue
    .line 527
    :try_start_0
    const-string/jumbo v2, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {}, Lcom/seeclickfix/ma/android/media/ImageCache;->isExternalStorageRemovable()Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    invoke-static {p0}, Lcom/seeclickfix/ma/android/media/ImageCache;->getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 531
    .local v0, "cachePath":Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 537
    .end local v0    # "cachePath":Ljava/lang/String;
    :goto_1
    return-object v2

    .line 527
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 533
    :catch_0
    move-exception v1

    .line 537
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    .line 616
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasFroyo()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 617
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    .line 622
    :goto_0
    return-object v1

    .line 621
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "/Android/data/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/cache/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 622
    .local v0, "cacheDir":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getInstance(Landroid/support/v4/app/FragmentManager;Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;)Lcom/seeclickfix/ma/android/media/ImageCache;
    .locals 2
    .param p0, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p1, "cacheParams"    # Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    .prologue
    .line 113
    invoke-static {p0}, Lcom/seeclickfix/ma/android/media/ImageCache;->findOrCreateRetainFragment(Landroid/support/v4/app/FragmentManager;)Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;

    move-result-object v1

    .line 116
    .local v1, "mRetainFragment":Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/media/ImageCache;

    .line 119
    .local v0, "imageCache":Lcom/seeclickfix/ma/android/media/ImageCache;
    if-nez v0, :cond_0

    .line 120
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageCache;

    .end local v0    # "imageCache":Lcom/seeclickfix/ma/android/media/ImageCache;
    invoke-direct {v0, p1}, Lcom/seeclickfix/ma/android/media/ImageCache;-><init>(Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;)V

    .line 121
    .restart local v0    # "imageCache":Lcom/seeclickfix/ma/android/media/ImageCache;
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/media/ImageCache$RetainFragment;->setObject(Ljava/lang/Object;)V

    .line 124
    :cond_0
    return-object v0
.end method

.method public static getUsableSpace(Ljava/io/File;)J
    .locals 6
    .param p0, "path"    # Ljava/io/File;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 633
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasGingerbread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 634
    invoke-virtual {p0}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v2

    .line 637
    :goto_0
    return-wide v2

    .line 636
    :cond_0
    new-instance v0, Landroid/os/StatFs;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 637
    .local v0, "stats":Landroid/os/StatFs;
    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSize()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v1

    int-to-long v4, v1

    mul-long/2addr v2, v4

    goto :goto_0
.end method

.method public static hashKeyForDisk(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 551
    :try_start_0
    const-string/jumbo v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 552
    .local v2, "mDigest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 553
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lcom/seeclickfix/ma/android/media/ImageCache;->bytesToHexString([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 557
    .end local v2    # "mDigest":Ljava/security/MessageDigest;
    .local v0, "cacheKey":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 554
    .end local v0    # "cacheKey":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 555
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "cacheKey":Ljava/lang/String;
    goto :goto_0
.end method

.method private init(Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;)V
    .locals 2
    .param p1, "cacheParams"    # Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    .line 136
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    iget-boolean v0, v0, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->memoryCacheEnabled:Z

    if-eqz v0, :cond_1

    .line 142
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasHoneycomb()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mReusableBitmaps:Ljava/util/HashSet;

    .line 146
    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/media/ImageCache$1;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    iget v1, v1, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->memCacheSize:I

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/media/ImageCache$1;-><init>(Lcom/seeclickfix/ma/android/media/ImageCache;I)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    .line 183
    :cond_1
    iget-boolean v0, p1, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->initDiskCacheOnCreate:Z

    if-eqz v0, :cond_2

    .line 185
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageCache;->initDiskCache()V

    .line 187
    :cond_2
    return-void
.end method

.method public static isExternalStorageRemovable()Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 602
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasGingerbread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 603
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result v0

    .line 605
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addBitmapToCache(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;)V
    .locals 9
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 230
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 277
    :cond_0
    :goto_0
    return-void

    .line 235
    :cond_1
    iget-object v5, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    if-eqz v5, :cond_3

    .line 236
    const-class v5, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;

    invoke-virtual {v5, p2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    move-object v5, p2

    .line 239
    check-cast v5, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/seeclickfix/ma/android/media/RecyclingBitmapDrawable;->setIsCached(Z)V

    .line 241
    :cond_2
    iget-object v5, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v5, p1, p2}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    :cond_3
    iget-object v6, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v6

    .line 246
    :try_start_0
    iget-object v5, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    if-eqz v5, :cond_5

    .line 247
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/ImageCache;->hashKeyForDisk(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 248
    .local v2, "key":Ljava/lang/String;
    const/4 v3, 0x0

    .line 250
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_1
    iget-object v5, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v5, v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->get(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;

    move-result-object v4

    .line 251
    .local v4, "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    if-nez v4, :cond_6

    .line 252
    iget-object v5, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v5, v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->edit(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v1

    .line 253
    .local v1, "editor":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    if-eqz v1, :cond_4

    .line 254
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v3

    .line 255
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    iget-object v7, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    iget-object v7, v7, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    iget v8, v8, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->compressQuality:I

    invoke-virtual {v5, v7, v8, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 257
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->commit()V

    .line 258
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 269
    .end local v1    # "editor":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    :cond_4
    :goto_1
    if-eqz v3, :cond_5

    .line 270
    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 276
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "out":Ljava/io/OutputStream;
    .end local v4    # "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    :cond_5
    :goto_2
    :try_start_3
    monitor-exit v6

    goto :goto_0

    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v5

    .line 261
    .restart local v2    # "key":Ljava/lang/String;
    .restart local v3    # "out":Ljava/io/OutputStream;
    .restart local v4    # "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    :cond_6
    const/4 v5, 0x0

    :try_start_4
    invoke-virtual {v4, v5}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    .line 263
    .end local v4    # "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    :catch_0
    move-exception v0

    .line 264
    .local v0, "e":Ljava/io/IOException;
    :try_start_5
    const-string/jumbo v5, "ImageCache"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "addBitmapToCache - "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 269
    if-eqz v3, :cond_5

    .line 270
    :try_start_6
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2

    .line 272
    :catch_1
    move-exception v5

    goto :goto_2

    .line 265
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 266
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    const-string/jumbo v5, "ImageCache"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "addBitmapToCache - "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 269
    if-eqz v3, :cond_5

    .line 270
    :try_start_8
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_2

    .line 272
    :catch_3
    move-exception v5

    goto :goto_2

    .line 268
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1
    move-exception v5

    .line 269
    if-eqz v3, :cond_7

    .line 270
    :try_start_9
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 273
    :cond_7
    :goto_3
    :try_start_a
    throw v5
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 272
    .restart local v4    # "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    :catch_4
    move-exception v5

    goto :goto_2

    .end local v4    # "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    :catch_5
    move-exception v7

    goto :goto_3
.end method

.method public clearCache()V
    .locals 5

    .prologue
    .line 387
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    if-eqz v1, :cond_0

    .line 388
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v1}, Landroid/support/v4/util/LruCache;->evictAll()V

    .line 394
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v2

    .line 395
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheStarting:Z

    .line 396
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->isClosed()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_1

    .line 398
    :try_start_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->delete()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 405
    :goto_0
    const/4 v1, 0x0

    :try_start_2
    iput-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    .line 406
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageCache;->initDiskCache()V

    .line 408
    :cond_1
    monitor-exit v2

    .line 409
    return-void

    .line 402
    :catch_0
    move-exception v0

    .line 403
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "ImageCache"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "clearCache - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 408
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public close()V
    .locals 5

    .prologue
    .line 435
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v2

    .line 436
    :try_start_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 438
    :try_start_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 439
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->close()V

    .line 440
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 449
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2

    .line 450
    return-void

    .line 445
    :catch_0
    move-exception v0

    .line 446
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "ImageCache"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "close - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 449
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public flush()V
    .locals 5

    .prologue
    .line 416
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v2

    .line 417
    :try_start_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 419
    :try_start_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 427
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2

    .line 428
    return-void

    .line 423
    :catch_0
    move-exception v0

    .line 424
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "ImageCache"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "flush - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 427
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public getBitmapFromDiskCache(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 11
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 306
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/ImageCache;->hashKeyForDisk(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 307
    .local v5, "key":Ljava/lang/String;
    const/4 v1, 0x0

    .line 309
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v8

    .line 310
    :goto_0
    :try_start_0
    iget-boolean v7, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheStarting:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v7, :cond_0

    .line 312
    :try_start_1
    iget-object v7, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 313
    :catch_0
    move-exception v7

    goto :goto_0

    .line 316
    :cond_0
    :try_start_2
    iget-object v7, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v7, :cond_2

    .line 317
    const/4 v4, 0x0

    .line 319
    .local v4, "inputStream":Ljava/io/InputStream;
    :try_start_3
    iget-object v7, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v7, v5}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->get(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;

    move-result-object v6

    .line 320
    .local v6, "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    if-eqz v6, :cond_1

    .line 324
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v4

    .line 325
    if-eqz v4, :cond_1

    .line 326
    move-object v0, v4

    check-cast v0, Ljava/io/FileInputStream;

    move-object v7, v0

    invoke-virtual {v7}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    .line 330
    .local v3, "fd":Ljava/io/FileDescriptor;
    const v7, 0x7fffffff

    const v9, 0x7fffffff

    invoke-static {v3, v7, v9, p0}, Lcom/seeclickfix/ma/android/media/ImageResizer;->decodeSampledBitmapFromDescriptor(Ljava/io/FileDescriptor;IILcom/seeclickfix/ma/android/media/ImageCache;)Landroid/graphics/Bitmap;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v1

    .line 338
    .end local v3    # "fd":Ljava/io/FileDescriptor;
    :cond_1
    if-eqz v4, :cond_2

    .line 339
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 345
    .end local v4    # "inputStream":Ljava/io/InputStream;
    .end local v6    # "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    :cond_2
    :goto_1
    :try_start_5
    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-object v1

    .line 334
    .restart local v4    # "inputStream":Ljava/io/InputStream;
    :catch_1
    move-exception v2

    .line 335
    .local v2, "e":Ljava/io/IOException;
    :try_start_6
    const-string/jumbo v7, "ImageCache"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "getBitmapFromDiskCache - "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 338
    if-eqz v4, :cond_2

    .line 339
    :try_start_7
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_1

    .line 341
    :catch_2
    move-exception v7

    goto :goto_1

    .line 337
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 338
    if-eqz v4, :cond_3

    .line 339
    :try_start_8
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 342
    :cond_3
    :goto_2
    :try_start_9
    throw v7

    .line 346
    .end local v4    # "inputStream":Ljava/io/InputStream;
    :catchall_1
    move-exception v7

    monitor-exit v8
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    throw v7

    .line 341
    .restart local v4    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    :catch_3
    move-exception v7

    goto :goto_1

    .end local v6    # "snapshot":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    :catch_4
    move-exception v9

    goto :goto_2
.end method

.method public getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 286
    const/4 v0, 0x0

    .line 288
    .local v0, "memValue":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    if-eqz v1, :cond_0

    .line 289
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "memValue":Landroid/graphics/drawable/BitmapDrawable;
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 296
    .restart local v0    # "memValue":Landroid/graphics/drawable/BitmapDrawable;
    :cond_0
    return-object v0
.end method

.method protected getBitmapFromReusableSet(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 4
    .param p1, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 354
    const/4 v0, 0x0

    .line 356
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mReusableBitmaps:Ljava/util/HashSet;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mReusableBitmaps:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 357
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mReusableBitmaps:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 360
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/SoftReference<Landroid/graphics/Bitmap;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 361
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/SoftReference;

    invoke-virtual {v3}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    .line 363
    .local v1, "item":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 365
    invoke-static {v1, p1}, Lcom/seeclickfix/ma/android/media/ImageCache;->canUseForInBitmap(Landroid/graphics/Bitmap;Landroid/graphics/BitmapFactory$Options;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 366
    move-object v0, v1

    .line 369
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 379
    .end local v1    # "item":Landroid/graphics/Bitmap;
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/SoftReference<Landroid/graphics/Bitmap;>;>;"
    :cond_1
    return-object v0

    .line 374
    .restart local v1    # "item":Landroid/graphics/Bitmap;
    .restart local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/SoftReference<Landroid/graphics/Bitmap;>;>;"
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0
.end method

.method public initDiskCache()V
    .locals 8

    .prologue
    .line 197
    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    monitor-enter v3

    .line 198
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 199
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    iget-object v0, v2, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->diskCacheDir:Ljava/io/File;

    .line 200
    .local v0, "diskCacheDir":Ljava/io/File;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    iget-boolean v2, v2, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->diskCacheEnabled:Z

    if-eqz v2, :cond_2

    if-eqz v0, :cond_2

    .line 201
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 202
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 204
    :cond_1
    invoke-static {v0}, Lcom/seeclickfix/ma/android/media/ImageCache;->getUsableSpace(Ljava/io/File;)J

    move-result-wide v4

    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    iget v2, v2, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->diskCacheSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v6, v2

    cmp-long v2, v4, v6

    if-lez v2, :cond_2

    .line 206
    const/4 v2, 0x1

    const/4 v4, 0x1

    :try_start_1
    iget-object v5, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    iget v5, v5, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->diskCacheSize:I

    int-to-long v6, v5

    invoke-static {v0, v2, v4, v6, v7}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskLruCache:Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 218
    .end local v0    # "diskCacheDir":Ljava/io/File;
    :cond_2
    :goto_0
    const/4 v2, 0x0

    :try_start_2
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheStarting:Z

    .line 219
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mDiskCacheLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 220
    monitor-exit v3

    .line 221
    return-void

    .line 211
    .restart local v0    # "diskCacheDir":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 212
    .local v1, "e":Ljava/io/IOException;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/ImageCache;->mCacheParams:Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;

    const/4 v4, 0x0

    iput-object v4, v2, Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;->diskCacheDir:Ljava/io/File;

    .line 213
    const-string/jumbo v2, "ImageCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "initDiskCache - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 220
    .end local v0    # "diskCacheDir":Ljava/io/File;
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method
