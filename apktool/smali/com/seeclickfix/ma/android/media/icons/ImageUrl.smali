.class public Lcom/seeclickfix/ma/android/media/icons/ImageUrl;
.super Ljava/lang/Object;
.source "ImageUrl.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ImageUrl"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSmallUrlForIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "dto"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p1, "baseUrl"    # Ljava/lang/String;

    .prologue
    .line 40
    const/4 v0, 0x0

    .line 43
    .local v0, "imgUrl":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 44
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v0

    .line 58
    :cond_0
    :goto_0
    return-object v0

    .line 45
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 46
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getIconSquare()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 48
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getIconSquare()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getUrlForIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "dto"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p1, "baseUrl"    # Ljava/lang/String;

    .prologue
    .line 18
    const/4 v0, 0x0

    .line 20
    .local v0, "imgUrl":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoLargeUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 21
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoLargeUrl()Ljava/lang/String;

    move-result-object v0

    .line 29
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lcom/seeclickfix/ma/android/util/StringUtil;->getFileNameFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 35
    :cond_1
    return-object v0

    .line 22
    :cond_2
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 24
    :cond_3
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 25
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
