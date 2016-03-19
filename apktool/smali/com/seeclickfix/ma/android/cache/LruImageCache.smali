.class public Lcom/seeclickfix/ma/android/cache/LruImageCache;
.super Landroid/support/v4/util/LruCache;
.source "LruImageCache.java"

# interfaces
.implements Lcom/android/volley/toolbox/ImageLoader$ImageCache;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/util/LruCache",
        "<",
        "Ljava/lang/String;",
        "Landroid/graphics/Bitmap;",
        ">;",
        "Lcom/android/volley/toolbox/ImageLoader$ImageCache;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "LruImageCache"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-static {}, Lcom/seeclickfix/ma/android/cache/LruImageCache;->getDefaultLruCacheSize()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/cache/LruImageCache;-><init>(I)V

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "maxSizeInKiloBytes"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1}, Landroid/support/v4/util/LruCache;-><init>(I)V

    .line 34
    return-void
.end method

.method protected static getDefaultLruCacheSize()I
    .locals 1

    .prologue
    .line 53
    const/high16 v0, 0x600000

    .line 55
    .local v0, "cacheSize":I
    return v0
.end method


# virtual methods
.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/cache/LruImageCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/cache/LruImageCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    return-void
.end method

.method protected bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 10
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Landroid/graphics/Bitmap;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/cache/LruImageCache;->sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I

    move-result v0

    return v0
.end method

.method protected sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/graphics/Bitmap;

    .prologue
    .line 38
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method
