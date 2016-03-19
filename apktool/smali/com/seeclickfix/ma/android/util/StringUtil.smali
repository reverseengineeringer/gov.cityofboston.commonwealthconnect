.class public Lcom/seeclickfix/ma/android/util/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "StringUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFileNameFromUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 25
    const-string/jumbo v0, ""

    .line 27
    .local v0, "filename":Ljava/lang/String;
    const-string/jumbo v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 29
    .local v1, "lastIndexSlash":I
    new-instance v0, Ljava/lang/String;

    .end local v0    # "filename":Ljava/lang/String;
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 33
    .restart local v0    # "filename":Ljava/lang/String;
    return-object v0
.end method

.method public static removeExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 38
    const-string/jumbo v0, ""

    .line 40
    .local v0, "filename":Ljava/lang/String;
    const-string/jumbo v2, "."

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 42
    .local v1, "lastIndexDot":I
    new-instance v0, Ljava/lang/String;

    .end local v0    # "filename":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 44
    .restart local v0    # "filename":Ljava/lang/String;
    return-object v0
.end method
