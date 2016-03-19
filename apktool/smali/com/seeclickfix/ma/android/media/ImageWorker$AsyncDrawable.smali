.class Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "ImageWorker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/media/ImageWorker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AsyncDrawable"
.end annotation


# instance fields
.field private final bitmapWorkerTaskReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;)V
    .locals 1
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "bitmapWorkerTask"    # Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    .prologue
    .line 464
    invoke-direct {p0, p1, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 465
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;->bitmapWorkerTaskReference:Ljava/lang/ref/WeakReference;

    .line 467
    return-void
.end method


# virtual methods
.method public getBitmapWorkerTask()Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;
    .locals 1

    .prologue
    .line 470
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/ImageWorker$AsyncDrawable;->bitmapWorkerTaskReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/media/ImageWorker$BitmapWorkerTask;

    return-object v0
.end method
