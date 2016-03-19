.class public Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
.super Ljava/lang/Object;
.source "MediaCaptureHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private imageView:Landroid/widget/ImageView;

.field private imgIntent:Landroid/content/Intent;

.field private photoPath:Ljava/lang/String;

.field private viewToHide:Landroid/view/View;

.field private viewToShow:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->photoPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/content/Intent;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imgIntent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToShow:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToHide:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imageView:Landroid/widget/ImageView;

    return-object v0
.end method


# virtual methods
.method public activity(Landroid/app/Activity;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 265
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->activity:Landroid/app/Activity;

    .line 266
    return-object p0
.end method

.method public build()Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;
    .locals 2

    .prologue
    .line 270
    new-instance v0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;-><init>(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;)V

    return-object v0
.end method

.method public imageView(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .locals 0
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 241
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imageView:Landroid/widget/ImageView;

    .line 242
    return-object p0
.end method

.method public imgIntent(Landroid/content/Intent;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .locals 0
    .param p1, "imgIntent"    # Landroid/content/Intent;

    .prologue
    .line 260
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imgIntent:Landroid/content/Intent;

    .line 261
    return-object p0
.end method

.method public measureImageView(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .locals 0
    .param p1, "measureImageView"    # Landroid/widget/ImageView;

    .prologue
    .line 246
    return-object p0
.end method

.method public photoPath(Ljava/lang/String;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .locals 0
    .param p1, "photoPath"    # Ljava/lang/String;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->photoPath:Ljava/lang/String;

    .line 237
    return-object p0
.end method

.method public viewToHide(Landroid/view/View;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .locals 0
    .param p1, "viewToHide"    # Landroid/view/View;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToHide:Landroid/view/View;

    .line 251
    return-object p0
.end method

.method public viewToShow(Landroid/view/View;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .locals 0
    .param p1, "viewToShow"    # Landroid/view/View;

    .prologue
    .line 255
    iput-object p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToShow:Landroid/view/View;

    .line 256
    return-object p0
.end method
