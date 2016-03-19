.class Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;
.super Ljava/lang/Object;
.source "MediaCaptureHelper.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->doAsyncPicSet()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)V
    .locals 0

    .prologue
    .line 169
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .prologue
    .line 175
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$900(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 176
    .local v0, "obs":Landroid/view/ViewTreeObserver;
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 178
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$900(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->getHeight()I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$900(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->getWidth()I

    move-result v1

    if-nez v1, :cond_1

    .line 179
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    const/4 v2, 0x1

    # setter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->forceScaleFactor:Z
    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$602(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;Z)Z

    .line 181
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;->this$0:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    # invokes: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->doPicSet()V
    invoke-static {v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->access$1000(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)V

    .line 183
    return-void
.end method
