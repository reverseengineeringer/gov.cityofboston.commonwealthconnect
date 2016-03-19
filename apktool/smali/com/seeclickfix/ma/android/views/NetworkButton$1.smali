.class Lcom/seeclickfix/ma/android/views/NetworkButton$1;
.super Ljava/lang/Object;
.source "NetworkButton.java"

# interfaces
.implements Lcom/android/volley/toolbox/ImageLoader$ImageListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/NetworkButton;->loadImageIfNecessary(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

.field final synthetic val$isInLayoutPass:Z


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/NetworkButton;Z)V
    .locals 0

    .prologue
    .line 167
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    iput-boolean p2, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->val$isInLayoutPass:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 170
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    # getter for: Lcom/seeclickfix/ma/android/views/NetworkButton;->mErrorImageId:I
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->access$000(Lcom/seeclickfix/ma/android/views/NetworkButton;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    # getter for: Lcom/seeclickfix/ma/android/views/NetworkButton;->mErrorImageId:I
    invoke-static {v1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->access$000(Lcom/seeclickfix/ma/android/views/NetworkButton;)I

    move-result v1

    # invokes: Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromResId(I)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->access$100(Lcom/seeclickfix/ma/android/views/NetworkButton;I)V

    .line 173
    :cond_0
    return-void
.end method

.method public onResponse(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Z)V
    .locals 2
    .param p1, "response"    # Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    .param p2, "isImmediate"    # Z

    .prologue
    .line 181
    if-eqz p2, :cond_1

    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->val$isInLayoutPass:Z

    if-eqz v0, :cond_1

    .line 182
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    new-instance v1, Lcom/seeclickfix/ma/android/views/NetworkButton$1$1;

    invoke-direct {v1, p0, p1}, Lcom/seeclickfix/ma/android/views/NetworkButton$1$1;-><init>(Lcom/seeclickfix/ma/android/views/NetworkButton$1;Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)V

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->post(Ljava/lang/Runnable;)Z

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 191
    :cond_1
    invoke-virtual {p1}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 192
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    invoke-virtual {p1}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    # invokes: Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromBitmap(Landroid/graphics/Bitmap;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->access$200(Lcom/seeclickfix/ma/android/views/NetworkButton;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 193
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    # getter for: Lcom/seeclickfix/ma/android/views/NetworkButton;->mDefaultImageId:I
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->access$300(Lcom/seeclickfix/ma/android/views/NetworkButton;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton$1;->this$0:Lcom/seeclickfix/ma/android/views/NetworkButton;

    # getter for: Lcom/seeclickfix/ma/android/views/NetworkButton;->mDefaultImageId:I
    invoke-static {v1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->access$300(Lcom/seeclickfix/ma/android/views/NetworkButton;)I

    move-result v1

    # invokes: Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromResId(I)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->access$100(Lcom/seeclickfix/ma/android/views/NetworkButton;I)V

    goto :goto_0
.end method
