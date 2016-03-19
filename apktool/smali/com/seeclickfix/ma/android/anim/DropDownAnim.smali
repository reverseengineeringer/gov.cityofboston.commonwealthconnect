.class public Lcom/seeclickfix/ma/android/anim/DropDownAnim;
.super Landroid/view/animation/Animation;
.source "DropDownAnim.java"


# instance fields
.field down:Z

.field targetHeight:I

.field view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;IZ)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "targetHeight"    # I
    .param p3, "down"    # Z

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;->view:Landroid/view/View;

    .line 14
    iput p2, p0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;->targetHeight:I

    .line 15
    iput-boolean p3, p0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;->down:Z

    .line 16
    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 3
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .prologue
    .line 21
    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;->down:Z

    if-eqz v1, :cond_0

    .line 22
    iget v1, p0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;->targetHeight:I

    int-to-float v1, v1

    mul-float/2addr v1, p1

    float-to-int v0, v1

    .line 26
    .local v0, "newHeight":I
    :goto_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 27
    iget-object v1, p0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    .line 28
    return-void

    .line 24
    .end local v0    # "newHeight":I
    :cond_0
    iget v1, p0, Lcom/seeclickfix/ma/android/anim/DropDownAnim;->targetHeight:I

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v2, p1

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .restart local v0    # "newHeight":I
    goto :goto_0
.end method

.method public initialize(IIII)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "parentWidth"    # I
    .param p4, "parentHeight"    # I

    .prologue
    .line 33
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 34
    return-void
.end method

.method public willChangeBounds()Z
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x1

    return v0
.end method
