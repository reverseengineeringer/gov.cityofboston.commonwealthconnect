.class Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$MyGestureDetector;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "UnboxingPagerFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyGestureDetector"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V
    .locals 0

    .prologue
    .line 183
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$MyGestureDetector;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 5
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v4, 0x0

    const/high16 v3, 0x43480000    # 200.0f

    const/high16 v2, 0x42f00000    # 120.0f

    .line 187
    :try_start_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x437a0000    # 250.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 201
    :cond_0
    :goto_0
    return v4

    .line 190
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    cmpl-float v0, v0, v2

    if-lez v0, :cond_2

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v3

    if-lez v0, :cond_2

    .line 193
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$MyGestureDetector;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->checkForFinishSwipe()V

    goto :goto_0

    .line 198
    :catch_0
    move-exception v0

    goto :goto_0

    .line 195
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    cmpl-float v0, v0, v2

    if-lez v0, :cond_0

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    cmpl-float v0, v0, v3

    if-lez v0, :cond_0

    goto :goto_0
.end method
