.class public Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;
.super Ljava/lang/Object;
.source "MediaCaptureHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "MediaCaptureHelper"


# instance fields
.field private activity:Landroid/app/Activity;

.field private bitmapDecodeTask:Landroid/os/AsyncTask;
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
.end field

.field private forceScaleFactor:Z

.field private imageIntent:Landroid/content/Intent;

.field private imageView:Landroid/widget/ImageView;

.field private photoPath:Ljava/lang/String;

.field private targetH:I

.field private targetW:I

.field private viewToHide:Landroid/view/View;

.field private viewToShow:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    .line 33
    iput v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    .line 43
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->forceScaleFactor:Z

    .line 47
    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->photoPath:Ljava/lang/String;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->access$000(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->photoPath:Ljava/lang/String;

    .line 48
    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imgIntent:Landroid/content/Intent;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->access$100(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageIntent:Landroid/content/Intent;

    .line 49
    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->activity:Landroid/app/Activity;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->access$200(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->activity:Landroid/app/Activity;

    .line 50
    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToShow:Landroid/view/View;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->access$300(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToShow:Landroid/view/View;

    .line 51
    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToHide:Landroid/view/View;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->access$400(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToHide:Landroid/view/View;

    .line 52
    # getter for: Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imageView:Landroid/widget/ImageView;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->access$500(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)Landroid/widget/ImageView;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;

    .line 53
    return-void
.end method

.method synthetic constructor <init>(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;-><init>(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->doPicSet()V

    return-void
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->forceScaleFactor:Z

    return v0
.end method

.method static synthetic access$602(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;
    .param p1, "x1"    # Z

    .prologue
    .line 25
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->forceScaleFactor:Z

    return p1
.end method

.method static synthetic access$700(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)I
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    .prologue
    .line 25
    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    return v0
.end method

.method static synthetic access$800(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)I
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    .prologue
    .line 25
    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    return v0
.end method

.method static synthetic access$900(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method private doAsyncPicSet()V
    .locals 2

    .prologue
    .line 168
    iget-object v1, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 169
    .local v0, "vto":Landroid/view/ViewTreeObserver;
    new-instance v1, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$2;-><init>(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 186
    return-void
.end method

.method private doPicSet()V
    .locals 4

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->cancel()V

    .line 93
    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    :goto_0
    iput v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    .line 94
    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    if-lez v0, :cond_2

    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    :goto_1
    iput v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    .line 96
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->forceScaleFactor:Z

    if-nez v0, :cond_3

    .line 97
    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    if-nez v0, :cond_3

    .line 100
    :cond_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->doAsyncPicSet()V

    .line 160
    :goto_2
    return-void

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    goto :goto_0

    .line 94
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    goto :goto_1

    .line 106
    :cond_3
    new-instance v0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$1;-><init>(Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->bitmapDecodeTask:Landroid/os/AsyncTask;

    .line 158
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->bitmapDecodeTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->photoPath:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_2
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->bitmapDecodeTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->bitmapDecodeTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 206
    :cond_0
    return-void
.end method

.method public getPathFromtIntent(Landroid/content/Intent;)Ljava/lang/String;
    .locals 3
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    .line 189
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 194
    .local v1, "selectedImageUri":Landroid/net/Uri;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->activity:Landroid/app/Activity;

    invoke-static {v2, v1}, Lcom/seeclickfix/ma/android/media/GalleryPathHelper;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, "path":Ljava/lang/String;
    return-object v0
.end method

.method public hidePic()V
    .locals 2

    .prologue
    .line 209
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->cancel()V

    .line 211
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToHide:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToHide:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToShow:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 216
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToShow:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 219
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 220
    return-void
.end method

.method public setPic()V
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->photoPath:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 59
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageIntent:Landroid/content/Intent;

    if-nez v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->hidePic()V

    .line 88
    :goto_0
    return-void

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->getPathFromtIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->photoPath:Ljava/lang/String;

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToShow:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 73
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToShow:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 76
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToHide:Landroid/view/View;

    if-eqz v0, :cond_3

    .line 77
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->viewToHide:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 80
    :cond_3
    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    if-lez v0, :cond_5

    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    :goto_1
    iput v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    .line 81
    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    if-lez v0, :cond_6

    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    :goto_2
    iput v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    .line 83
    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetH:I

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->targetW:I

    if-nez v0, :cond_7

    .line 84
    :cond_4
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->doAsyncPicSet()V

    goto :goto_0

    .line 80
    :cond_5
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    goto :goto_1

    .line 81
    :cond_6
    iget-object v0, p0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    goto :goto_2

    .line 86
    :cond_7
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->doPicSet()V

    goto :goto_0
.end method
