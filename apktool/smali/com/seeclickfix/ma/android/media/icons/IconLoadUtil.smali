.class public Lcom/seeclickfix/ma/android/media/icons/IconLoadUtil;
.super Ljava/lang/Object;
.source "IconLoadUtil.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "IconLoadUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static loadIcon(Ljava/lang/String;Landroid/widget/ImageView;Lcom/android/volley/toolbox/ImageLoader;)V
    .locals 4
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "imgView"    # Landroid/widget/ImageView;
    .param p2, "imgLoader"    # Lcom/android/volley/toolbox/ImageLoader;

    .prologue
    const/16 v3, 0x60

    .line 45
    if-eqz p0, :cond_0

    const-string/jumbo v1, "null"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 62
    :cond_0
    :goto_0
    return-void

    .line 48
    :cond_1
    const-string/jumbo v1, "http://"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 49
    new-instance v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "http://seeclickfix.com"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .end local p0    # "url":Ljava/lang/String;
    .local v0, "url":Ljava/lang/String;
    move-object p0, v0

    .line 53
    .end local v0    # "url":Ljava/lang/String;
    .restart local p0    # "url":Ljava/lang/String;
    :cond_2
    const v1, 0x7f020158

    const v2, 0x7f020150

    invoke-static {p1, v1, v2}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v1

    invoke-virtual {p2, p0, v1, v3, v3}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto :goto_0
.end method

.method public static loadImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/android/volley/toolbox/ImageLoader;)V
    .locals 4
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "imgView"    # Landroid/widget/ImageView;
    .param p2, "imgLoader"    # Lcom/android/volley/toolbox/ImageLoader;

    .prologue
    .line 22
    if-eqz p0, :cond_0

    const-string/jumbo v1, "null"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 40
    :cond_0
    :goto_0
    return-void

    .line 25
    :cond_1
    const-string/jumbo v1, "http://"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 26
    new-instance v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "http://seeclickfix.com"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .end local p0    # "url":Ljava/lang/String;
    .local v0, "url":Ljava/lang/String;
    move-object p0, v0

    .line 30
    .end local v0    # "url":Ljava/lang/String;
    .restart local p0    # "url":Ljava/lang/String;
    :cond_2
    const v1, 0x7f020158

    const v2, 0x7f020150

    invoke-static {p1, v1, v2}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v1

    const/16 v2, 0x2a8

    const/16 v3, 0x12c

    invoke-virtual {p2, p0, v1, v2, v3}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto :goto_0
.end method
