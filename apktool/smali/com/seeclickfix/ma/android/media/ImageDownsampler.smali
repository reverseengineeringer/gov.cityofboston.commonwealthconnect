.class public Lcom/seeclickfix/ma/android/media/ImageDownsampler;
.super Ljava/lang/Object;
.source "ImageDownsampler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/media/ImageDownsampler$Quality;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ImageDownsampler"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static downsampleFileFromUri(Landroid/net/Uri;Landroid/content/Context;)Ljava/io/File;
    .locals 8
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 44
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 47
    .local v2, "contentResolver":Landroid/content/ContentResolver;
    new-instance v5, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v5}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 48
    .local v5, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v6, 0x4

    iput v6, v5, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 49
    const/4 v4, 0x0

    .line 51
    .local v4, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v2, p0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 57
    :goto_0
    const/4 v6, 0x0

    invoke-static {v4, v6, v5}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 60
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 61
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v7, 0x4b

    invoke-virtual {v1, v6, v7, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 64
    const/4 v3, 0x0

    .line 66
    .local v3, "file":Ljava/io/File;
    return-object v3

    .line 52
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "file":Ljava/io/File;
    :catch_0
    move-exception v6

    goto :goto_0
.end method
