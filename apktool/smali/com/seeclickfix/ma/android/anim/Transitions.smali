.class public Lcom/seeclickfix/ma/android/anim/Transitions;
.super Ljava/lang/Object;
.source "Transitions.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dropDown(Landroid/content/Context;Landroid/view/View;IZ)Landroid/view/animation/Animation;
    .locals 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "view"    # Landroid/view/View;
    .param p2, "targetHeightPx"    # I
    .param p3, "isDown"    # Z

    .prologue
    const/4 v4, 0x1

    .line 43
    new-instance v0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;

    invoke-direct {v0, p1, p2, p3}, Lcom/seeclickfix/ma/android/anim/DropDownAnim;-><init>(Landroid/view/View;IZ)V

    .line 44
    .local v0, "anim":Landroid/view/animation/Animation;
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 45
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 46
    invoke-virtual {v0, v4}, Landroid/view/animation/Animation;->setFillBefore(Z)V

    .line 47
    invoke-virtual {v0, v4}, Landroid/view/animation/Animation;->setFillEnabled(Z)V

    .line 48
    invoke-virtual {v0, v4}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 49
    return-object v0
.end method

.method public static fadeIn(Landroid/content/Context;)Landroid/view/animation/Animation;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 16
    const v1, 0x7f040006

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 17
    .local v0, "anim":Landroid/view/animation/Animation;
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillBefore(Z)V

    .line 18
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillEnabled(Z)V

    .line 19
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 20
    return-object v0
.end method

.method public static fadeOut(Landroid/content/Context;)Landroid/view/animation/Animation;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 24
    const v1, 0x7f040007

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 25
    .local v0, "anim":Landroid/view/animation/Animation;
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillBefore(Z)V

    .line 26
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillEnabled(Z)V

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 28
    return-object v0
.end method

.method public static setFragTransAnim(Landroid/support/v4/app/FragmentTransaction;)V
    .locals 2
    .param p0, "ft"    # Landroid/support/v4/app/FragmentTransaction;

    .prologue
    const v1, 0x7f040007

    const v0, 0x7f040006

    .line 57
    invoke-virtual {p0, v0, v1, v0, v1}, Landroid/support/v4/app/FragmentTransaction;->setCustomAnimations(IIII)Landroid/support/v4/app/FragmentTransaction;

    .line 60
    return-void
.end method

.method public static slideDown(Landroid/content/Context;)Landroid/view/animation/Animation;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 37
    const v1, 0x7f040008

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 38
    .local v0, "anim":Landroid/view/animation/Animation;
    return-object v0
.end method

.method public static slideUp(Landroid/content/Context;)Landroid/view/animation/Animation;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 32
    const v1, 0x7f040009

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 33
    .local v0, "anim":Landroid/view/animation/Animation;
    return-object v0
.end method
