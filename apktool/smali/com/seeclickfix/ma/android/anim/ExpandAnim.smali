.class public Lcom/seeclickfix/ma/android/anim/ExpandAnim;
.super Ljava/lang/Object;
.source "ExpandAnim.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collapse(Landroid/view/View;)V
    .locals 4
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 38
    .local v1, "initialHeight":I
    new-instance v0, Lcom/seeclickfix/ma/android/anim/ExpandAnim$2;

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/anim/ExpandAnim$2;-><init>(Landroid/view/View;I)V

    .line 56
    .local v0, "a":Landroid/view/animation/Animation;
    int-to-float v2, v1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v2, v3

    float-to-int v2, v2

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 57
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 58
    return-void
.end method

.method public static expand(Landroid/view/View;)V
    .locals 5
    .param p0, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 10
    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-virtual {p0, v2, v3}, Landroid/view/View;->measure(II)V

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 13
    .local v1, "targtetHeight":I
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 14
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 15
    new-instance v0, Lcom/seeclickfix/ma/android/anim/ExpandAnim$1;

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/anim/ExpandAnim$1;-><init>(Landroid/view/View;I)V

    .line 31
    .local v0, "a":Landroid/view/animation/Animation;
    int-to-float v2, v1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v2, v3

    float-to-int v2, v2

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 33
    return-void
.end method
