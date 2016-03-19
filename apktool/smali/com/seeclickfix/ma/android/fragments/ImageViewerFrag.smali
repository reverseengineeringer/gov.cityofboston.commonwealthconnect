.class public Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "ImageViewerFrag.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ImageViewerFrag"


# instance fields
.field private args:Landroid/os/Bundle;

.field private c:Landroid/content/Context;

.field private imgParcel:Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

.field private mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private mImageView:Landroid/widget/ImageView;

.field private mRequestQueue:Lcom/android/volley/RequestQueue;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Landroid/widget/ImageView;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->loadImage(Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;)Luk/co/senab/photoview/PhotoViewAttacher;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    return-object v0
.end method

.method private cancelQueue()V
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mRequestQueue:Lcom/android/volley/RequestQueue;

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0}, Lcom/android/volley/RequestQueue;->stop()V

    .line 126
    :cond_0
    return-void
.end method

.method private loadImage(Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imgView"    # Landroid/widget/ImageView;
    .param p3, "smallImageUrl"    # Ljava/lang/String;

    .prologue
    const v5, 0x7f020152

    const/16 v4, 0x400

    .line 132
    if-eqz p1, :cond_0

    const-string/jumbo v2, "null"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 134
    :cond_0
    invoke-virtual {p2, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 150
    :goto_0
    return-void

    .line 136
    :cond_1
    const-string/jumbo v2, "http://"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 137
    new-instance v1, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "http://seeclickfix.com"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .end local p1    # "url":Ljava/lang/String;
    .local v1, "url":Ljava/lang/String;
    move-object p1, v1

    .line 140
    .end local v1    # "url":Ljava/lang/String;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_2
    const v2, 0x7f020132

    invoke-virtual {p0, p2, v2, v5, p3}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->getImageListener(Landroid/widget/ImageView;IILjava/lang/String;)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v0

    .line 145
    .local v0, "imgListener":Lcom/android/volley/toolbox/ImageLoader$ImageListener;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    invoke-virtual {v2, p1, v0, v4, v4}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto :goto_0
.end method

.method private showText()V
    .locals 4

    .prologue
    .line 95
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a007b

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 96
    .local v0, "header":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a007c

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 98
    .local v1, "subtitle":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->imgParcel:Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->getTitle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 99
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->imgParcel:Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->imgParcel:Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->getSubtitle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 103
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->imgParcel:Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->getSubtitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    :cond_1
    return-void
.end method


# virtual methods
.method getImageListener(Landroid/widget/ImageView;IILjava/lang/String;)Lcom/android/volley/toolbox/ImageLoader$ImageListener;
    .locals 6
    .param p1, "view"    # Landroid/widget/ImageView;
    .param p2, "defaultImageResId"    # I
    .param p3, "errorImageResId"    # I
    .param p4, "smallImgUrl"    # Ljava/lang/String;

    .prologue
    .line 154
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;

    move-object v1, p0

    move v2, p3

    move-object v3, p4

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;ILjava/lang/String;Landroid/widget/ImageView;I)V

    return-object v0
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 63
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->c:Landroid/content/Context;

    .line 64
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getImageLoader()Lcom/android/volley/toolbox/ImageLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 65
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 49
    if-nez p2, :cond_0

    .line 51
    const/4 v0, 0x0

    .line 54
    :goto_0
    return-object v0

    .line 53
    :cond_0
    const v0, 0x7f03002a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 54
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onDetach()V
    .locals 0

    .prologue
    .line 117
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDetach()V

    .line 118
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->cancelQueue()V

    .line 119
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 74
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 76
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->args:Landroid/os/Bundle;

    .line 78
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->args:Landroid/os/Bundle;

    const-string/jumbo v3, "IMAGE_PARCEL"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->imgParcel:Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    .line 80
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a007d

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mImageView:Landroid/widget/ImageView;

    .line 82
    new-instance v2, Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mImageView:Landroid/widget/ImageView;

    invoke-direct {v2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    .line 84
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 86
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->imgParcel:Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->getUriPath()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "imgUrl":Ljava/lang/String;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->imgParcel:Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->getSmallImageUri()Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "smallImgUrl":Ljava/lang/String;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->mImageView:Landroid/widget/ImageView;

    invoke-direct {p0, v0, v2, v1}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->loadImage(Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/String;)V

    .line 91
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->showText()V

    .line 92
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 111
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 112
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;->cancelQueue()V

    .line 113
    return-void
.end method
