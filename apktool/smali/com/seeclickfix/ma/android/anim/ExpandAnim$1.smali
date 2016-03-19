.class final Lcom/seeclickfix/ma/android/anim/ExpandAnim$1;
.super Landroid/view/animation/Animation;
.source "ExpandAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/anim/ExpandAnim;->expand(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$targtetHeight:I

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;I)V
    .locals 0

    .prologue
    .line 15
    iput-object p1, p0, Lcom/seeclickfix/ma/android/anim/ExpandAnim$1;->val$v:Landroid/view/View;

    iput p2, p0, Lcom/seeclickfix/ma/android/anim/ExpandAnim$1;->val$targtetHeight:I

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 2
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/seeclickfix/ma/android/anim/ExpandAnim$1;->val$v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    const/4 v0, -0x2

    :goto_0
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 21
    iget-object v0, p0, Lcom/seeclickfix/ma/android/anim/ExpandAnim$1;->val$v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 22
    return-void

    .line 18
    :cond_0
    iget v0, p0, Lcom/seeclickfix/ma/android/anim/ExpandAnim$1;->val$targtetHeight:I

    int-to-float v0, v0

    mul-float/2addr v0, p1

    float-to-int v0, v0

    goto :goto_0
.end method

.method public willChangeBounds()Z
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    return v0
.end method
