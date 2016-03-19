.class Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;
.super Ljava/lang/Object;
.source "ImageViewerFrag.java"

# interfaces
.implements Lcom/android/volley/toolbox/ImageLoader$ImageListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->getImageListener(Landroid/widget/ImageView;IILjava/lang/String;)Lcom/android/volley/toolbox/ImageLoader$ImageListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;

.field final synthetic val$defaultImageResId:I

.field final synthetic val$errorImageResId:I

.field final synthetic val$smallImgUrl:Ljava/lang/String;

.field final synthetic val$view:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;ILjava/lang/String;Landroid/widget/ImageView;I)V
    .locals 0

    .prologue
    .line 154
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;

    iput p2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$errorImageResId:I

    iput-object p3, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$smallImgUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$view:Landroid/widget/ImageView;

    iput p5, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$defaultImageResId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 5
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 157
    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$errorImageResId:I

    if-eqz v1, :cond_0

    .line 159
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$smallImgUrl:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 161
    :try_start_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$smallImgUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$view:Landroid/widget/ImageView;

    const/4 v4, 0x0

    # invokes: Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->loadImage(Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/String;)V
    invoke-static {v1, v2, v3, v4}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    :cond_0
    :goto_0
    return-void

    .line 162
    :catch_0
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/Exception;
    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$errorImageResId:I

    if-eqz v1, :cond_0

    .line 166
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$view:Landroid/widget/ImageView;

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$errorImageResId:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 169
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$errorImageResId:I

    if-eqz v1, :cond_0

    .line 170
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$view:Landroid/widget/ImageView;

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$errorImageResId:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method

.method public onResponse(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Z)V
    .locals 5
    .param p1, "response"    # Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    .param p2, "isImmediate"    # Z

    .prologue
    .line 178
    invoke-virtual {p1}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 179
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$view:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 180
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;)Luk/co/senab/photoview/PhotoViewAttacher;

    move-result-object v1

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 181
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$smallImgUrl:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 183
    :try_start_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$smallImgUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$view:Landroid/widget/ImageView;

    const/4 v4, 0x0

    # invokes: Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->loadImage(Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/String;)V
    invoke-static {v1, v2, v3, v4}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 184
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Ljava/lang/Exception;
    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$errorImageResId:I

    if-eqz v1, :cond_0

    .line 188
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$view:Landroid/widget/ImageView;

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$errorImageResId:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 191
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$defaultImageResId:I

    if-eqz v1, :cond_0

    .line 192
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$view:Landroid/widget/ImageView;

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;->val$defaultImageResId:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method
