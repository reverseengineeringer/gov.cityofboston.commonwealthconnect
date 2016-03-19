.class public Lcom/seeclickfix/ma/android/media/ImageResizer;
.super Lcom/seeclickfix/ma/android/media/ImageWorker;
.source "ImageResizer.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ImageResizer"


# instance fields
.field protected mImageHeight:I

.field protected mImageWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "imageSize"    # I

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/media/ImageWorker;-><init>(Landroid/content/Context;)V

    .line 62
    invoke-virtual {p0, p2}, Lcom/seeclickfix/ma/android/media/ImageResizer;->setImageSize(I)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "imageWidth"    # I
    .param p3, "imageHeight"    # I

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/media/ImageWorker;-><init>(Landroid/content/Context;)V

    .line 51
    invoke-virtual {p0, p2, p3}, Lcom/seeclickfix/ma/android/media/ImageResizer;->setImageSize(II)V

    .line 52
    return-void
.end method

.method private static addInBitmapOptions(Landroid/graphics/BitmapFactory$Options;Lcom/seeclickfix/ma/android/media/ImageCache;)V
    .locals 2
    .param p0, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p1, "cache"    # Lcom/seeclickfix/ma/android/media/ImageCache;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 204
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 206
    if-eqz p1, :cond_0

    .line 208
    invoke-virtual {p1, p0}, Lcom/seeclickfix/ma/android/media/ImageCache;->getBitmapFromReusableSet(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 210
    .local v0, "inBitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 214
    iput-object v0, p0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 217
    .end local v0    # "inBitmap":Landroid/graphics/Bitmap;
    :cond_0
    return-void
.end method

.method public static calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I
    .locals 9
    .param p0, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I

    .prologue
    .line 236
    iget v0, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 237
    .local v0, "height":I
    iget v5, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 238
    .local v5, "width":I
    const/4 v2, 0x1

    .line 240
    .local v2, "inSampleSize":I
    if-gt v0, p2, :cond_0

    if-le v5, p1, :cond_2

    .line 243
    :cond_0
    int-to-float v7, v0

    int-to-float v8, p2

    div-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 244
    .local v1, "heightRatio":I
    int-to-float v7, v5

    int-to-float v8, p1

    div-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 248
    .local v6, "widthRatio":I
    if-ge v1, v6, :cond_1

    move v2, v1

    .line 256
    :goto_0
    mul-int v7, v5, v0

    int-to-float v3, v7

    .line 259
    .local v3, "totalPixels":F
    mul-int v7, p1, p2

    mul-int/lit8 v7, v7, 0x2

    int-to-float v4, v7

    .line 261
    .local v4, "totalReqPixelsCap":F
    :goto_1
    mul-int v7, v2, v2

    int-to-float v7, v7

    div-float v7, v3, v7

    cmpl-float v7, v7, v4

    if-lez v7, :cond_2

    .line 262
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v3    # "totalPixels":F
    .end local v4    # "totalReqPixelsCap":F
    :cond_1
    move v2, v6

    .line 248
    goto :goto_0

    .line 265
    .end local v1    # "heightRatio":I
    .end local v6    # "widthRatio":I
    :cond_2
    return v2
.end method

.method public static decodeSampledBitmapFromDescriptor(Ljava/io/FileDescriptor;IILcom/seeclickfix/ma/android/media/ImageCache;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "fileDescriptor"    # Ljava/io/FileDescriptor;
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I
    .param p3, "cache"    # Lcom/seeclickfix/ma/android/media/ImageCache;

    .prologue
    const/4 v2, 0x0

    .line 182
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 183
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 184
    invoke-static {p0, v2, v0}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 187
    invoke-static {v0, p1, p2}, Lcom/seeclickfix/ma/android/media/ImageResizer;->calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 190
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 193
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasHoneycomb()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 194
    invoke-static {v0, p3}, Lcom/seeclickfix/ma/android/media/ImageResizer;->addInBitmapOptions(Landroid/graphics/BitmapFactory$Options;Lcom/seeclickfix/ma/android/media/ImageCache;)V

    .line 197
    :cond_0
    invoke-static {p0, v2, v0}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public static decodeSampledBitmapFromFile(Ljava/lang/String;IILcom/seeclickfix/ma/android/media/ImageCache;)Landroid/graphics/Bitmap;
    .locals 2
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I
    .param p3, "cache"    # Lcom/seeclickfix/ma/android/media/ImageCache;

    .prologue
    .line 151
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 152
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 153
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 156
    invoke-static {v0, p1, p2}, Lcom/seeclickfix/ma/android/media/ImageResizer;->calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 159
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasHoneycomb()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 160
    invoke-static {v0, p3}, Lcom/seeclickfix/ma/android/media/ImageResizer;->addInBitmapOptions(Landroid/graphics/BitmapFactory$Options;Lcom/seeclickfix/ma/android/media/ImageCache;)V

    .line 164
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 165
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public static decodeSampledBitmapFromResource(Landroid/content/res/Resources;IIILcom/seeclickfix/ma/android/media/ImageCache;)Landroid/graphics/Bitmap;
    .locals 2
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "resId"    # I
    .param p2, "reqWidth"    # I
    .param p3, "reqHeight"    # I
    .param p4, "cache"    # Lcom/seeclickfix/ma/android/media/ImageCache;

    .prologue
    .line 120
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 121
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 122
    invoke-static {p0, p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 125
    invoke-static {v0, p2, p3}, Lcom/seeclickfix/ma/android/media/ImageResizer;->calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 128
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/APIUtil;->hasHoneycomb()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    invoke-static {v0, p4}, Lcom/seeclickfix/ma/android/media/ImageResizer;->addInBitmapOptions(Landroid/graphics/BitmapFactory$Options;Lcom/seeclickfix/ma/android/media/ImageCache;)V

    .line 133
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 134
    invoke-static {p0, p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method private processBitmap(I)Landroid/graphics/Bitmap;
    .locals 4
    .param p1, "resId"    # I

    .prologue
    .line 96
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageResizer;->mResources:Landroid/content/res/Resources;

    iget v1, p0, Lcom/seeclickfix/ma/android/media/ImageResizer;->mImageWidth:I

    iget v2, p0, Lcom/seeclickfix/ma/android/media/ImageResizer;->mImageHeight:I

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/ImageResizer;->getImageCache()Lcom/seeclickfix/ma/android/media/ImageCache;

    move-result-object v3

    invoke-static {v0, p1, v1, v2, v3}, Lcom/seeclickfix/ma/android/media/ImageResizer;->decodeSampledBitmapFromResource(Landroid/content/res/Resources;IIILcom/seeclickfix/ma/android/media/ImageCache;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected processBitmap(Ljava/lang/Object;)Landroid/graphics/Bitmap;
    .locals 1
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 102
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/media/ImageResizer;->processBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public setImageSize(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 82
    invoke-virtual {p0, p1, p1}, Lcom/seeclickfix/ma/android/media/ImageResizer;->setImageSize(II)V

    .line 83
    return-void
.end method

.method public setImageSize(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 72
    iput p1, p0, Lcom/seeclickfix/ma/android/media/ImageResizer;->mImageWidth:I

    .line 73
    iput p2, p0, Lcom/seeclickfix/ma/android/media/ImageResizer;->mImageHeight:I

    .line 74
    return-void
.end method
