.class Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;
.super Landroid/os/AsyncTask;
.source "MediaCaptureHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->doPicSet()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)V
    .locals 0

    .prologue
    .line 106
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 9
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 111
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 112
    .local v1, "bmOptions":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v8, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 113
    iput-boolean v8, v1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 115
    aget-object v5, p1, v7

    invoke-static {v5, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 116
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 117
    .local v3, "photoW":I
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 118
    .local v2, "photoH":I
    const/16 v4, 0x8

    .line 119
    .local v4, "scaleFactor":I
    iget-object v5, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->forceScaleFactor:Z
    invoke-static {v5}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$600(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 124
    iget-object v5, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I
    invoke-static {v5}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$700(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)I

    move-result v5

    div-int v5, v3, v5

    iget-object v6, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I
    invoke-static {v6}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$800(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)I

    move-result v6

    div-int v6, v2, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 131
    :cond_0
    iput-boolean v7, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 132
    iput v4, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 133
    iput-boolean v8, v1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 135
    const/4 v0, 0x0

    .line 138
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v5, 0x0

    :try_start_0
    aget-object v5, p1, v5

    invoke-static {v5, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 144
    :goto_0
    return-object v0

    .line 139
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 106
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$900(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 149
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$900(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 150
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$900(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->invalidate()V

    .line 151
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$900(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->requestLayout()V

    .line 152
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 106
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
