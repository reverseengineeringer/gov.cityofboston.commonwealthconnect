.class public Lcom/seeclickfix/ma/android/views/ProgressWheelFactory;
.super Ljava/lang/Object;
.source "ProgressWheelFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addPorgreesWheel(Landroid/view/ViewGroup;)V
    .locals 3
    .param p0, "container"    # Landroid/view/ViewGroup;

    .prologue
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 16
    .local v0, "ctx":Landroid/content/Context;
    const v2, 0x7f030043

    invoke-static {v0, v2, p0}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    .line 18
    .local v1, "pb":Landroid/widget/ProgressBar;
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 19
    return-void
.end method
