.class public Lcom/seeclickfix/ma/android/views/NetworkButton;
.super Landroid/widget/Button;
.source "NetworkButton.java"


# instance fields
.field private filter:Landroid/graphics/ColorFilter;

.field private mDefaultImageId:I

.field private mErrorImageId:I

.field private mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private mPriority:Lcom/android/volley/Request$Priority;

.field private mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/seeclickfix/ma/android/views/NetworkButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/seeclickfix/ma/android/views/NetworkButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 77
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 78
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/views/NetworkButton;)I
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/NetworkButton;

    .prologue
    .line 38
    iget v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mErrorImageId:I

    return v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/views/NetworkButton;I)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/NetworkButton;
    .param p1, "x1"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromResId(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/views/NetworkButton;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/NetworkButton;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/views/NetworkButton;)I
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/NetworkButton;

    .prologue
    .line 38
    iget v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mDefaultImageId:I

    return v0
.end method

.method private loadImageIfNecessary(Z)V
    .locals 8
    .param p1, "isInLayoutPass"    # Z

    .prologue
    const/4 v6, -0x2

    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 123
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->getWidth()I

    move-result v3

    .line 124
    .local v3, "width":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->getHeight()I

    move-result v0

    .line 126
    .local v0, "height":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iget v5, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v5, v6, :cond_1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iget v5, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v5, v6, :cond_1

    const/4 v1, 0x1

    .line 131
    .local v1, "isFullyWrapContent":Z
    :goto_0
    if-nez v3, :cond_2

    if-nez v0, :cond_2

    if-nez v1, :cond_2

    .line 204
    :cond_0
    :goto_1
    return-void

    .end local v1    # "isFullyWrapContent":Z
    :cond_1
    move v1, v4

    .line 126
    goto :goto_0

    .line 137
    .restart local v1    # "isFullyWrapContent":Z
    :cond_2
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mUrl:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 138
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v4, :cond_3

    .line 139
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v4}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 140
    iput-object v7, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 144
    :cond_3
    iget v4, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mDefaultImageId:I

    if-eqz v4, :cond_4

    .line 145
    iget v4, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mDefaultImageId:I

    invoke-direct {p0, v4}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromResId(I)V

    goto :goto_1

    .line 148
    :cond_4
    invoke-direct {p0, v7}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1

    .line 153
    :cond_5
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v5, :cond_6

    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v5}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getRequestUrl()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 154
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v5}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getRequestUrl()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mUrl:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 159
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v5}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 160
    invoke-direct {p0, v7}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromBitmap(Landroid/graphics/Bitmap;)V

    .line 166
    :cond_6
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mUrl:Ljava/lang/String;

    new-instance v7, Lcom/seeclickfix/ma/android/views/NetworkButton$1;

    invoke-direct {v7, p0, p1}, Lcom/seeclickfix/ma/android/views/NetworkButton$1;-><init>(Lcom/seeclickfix/ma/android/views/NetworkButton;Z)V

    invoke-virtual {v5, v6, v7, v4, v4}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v2

    .line 203
    .local v2, "newContainer":Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    iput-object v2, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto :goto_1
.end method

.method private setIconDrawableFromBitmap(Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 210
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 212
    .local v0, "bitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->filter:Landroid/graphics/ColorFilter;

    if-eqz v1, :cond_0

    .line 213
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->filter:Landroid/graphics/ColorFilter;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 216
    :cond_0
    invoke-virtual {p0, v0, v2, v2, v2}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 219
    return-void
.end method

.method private setIconDrawableFromResId(I)V
    .locals 2
    .param p1, "resId"    # I

    .prologue
    .line 225
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 227
    .local v0, "bmp":Landroid/graphics/Bitmap;
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromBitmap(Landroid/graphics/Bitmap;)V

    .line 229
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 0

    .prologue
    .line 252
    invoke-super {p0}, Landroid/widget/Button;->drawableStateChanged()V

    .line 253
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->invalidate()V

    .line 254
    return-void
.end method

.method public getFilter()Landroid/graphics/ColorFilter;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->filter:Landroid/graphics/ColorFilter;

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 239
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v0}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 243
    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setIconDrawableFromBitmap(Landroid/graphics/Bitmap;)V

    .line 245
    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 247
    :cond_0
    invoke-super {p0}, Landroid/widget/Button;->onDetachedFromWindow()V

    .line 248
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 1
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 233
    invoke-super/range {p0 .. p5}, Landroid/widget/Button;->onLayout(ZIIII)V

    .line 234
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->loadImageIfNecessary(Z)V

    .line 235
    return-void
.end method

.method public setDefaultImageResId(I)V
    .locals 0
    .param p1, "defaultImage"    # I

    .prologue
    .line 106
    iput p1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mDefaultImageId:I

    .line 107
    return-void
.end method

.method public setErrorImageResId(I)V
    .locals 0
    .param p1, "errorImage"    # I

    .prologue
    .line 114
    iput p1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mErrorImageId:I

    .line 115
    return-void
.end method

.method public setFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "filter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 261
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->filter:Landroid/graphics/ColorFilter;

    .line 262
    return-void
.end method

.method public setImageUrl(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader;Lcom/android/volley/Request$Priority;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imageLoader"    # Lcom/android/volley/toolbox/ImageLoader;
    .param p3, "priority"    # Lcom/android/volley/Request$Priority;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mUrl:Ljava/lang/String;

    .line 94
    iput-object p2, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 95
    iput-object p3, p0, Lcom/seeclickfix/ma/android/views/NetworkButton;->mPriority:Lcom/android/volley/Request$Priority;

    .line 98
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/views/NetworkButton;->loadImageIfNecessary(Z)V

    .line 99
    return-void
.end method
