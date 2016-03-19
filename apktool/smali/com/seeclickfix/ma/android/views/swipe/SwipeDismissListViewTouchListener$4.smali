.class Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;
.super Ljava/lang/Object;
.source "SwipeDismissListViewTouchListener.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->performDismiss(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

.field final synthetic val$dismissView:Landroid/view/View;

.field final synthetic val$lp:Landroid/view/ViewGroup$LayoutParams;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;Landroid/view/ViewGroup$LayoutParams;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 349
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;->this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    iput-object p3, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;->val$dismissView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .locals 2
    .param p1, "valueAnimator"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 352
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 353
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;->val$dismissView:Landroid/view/View;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 354
    return-void
.end method
