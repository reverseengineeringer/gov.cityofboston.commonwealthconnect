.class public Lcom/alostpacket/pajamalib/utils/ViewUtil;
.super Ljava/lang/Object;
.source "ViewUtil.java"


# static fields
.field private static inflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getInflater(Landroid/content/Context;)Landroid/view/LayoutInflater;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 16
    sget-object v0, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflater:Landroid/view/LayoutInflater;

    if-nez v0, :cond_0

    const-string/jumbo v0, "layout_inflater"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    :goto_0
    sput-object v0, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflater:Landroid/view/LayoutInflater;

    .line 17
    sget-object v0, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflater:Landroid/view/LayoutInflater;

    return-object v0

    .line 16
    :cond_0
    sget-object v0, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflater:Landroid/view/LayoutInflater;

    goto :goto_0
.end method

.method public static inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "resourceID"    # I
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 31
    invoke-static {p0}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->getInflater(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
