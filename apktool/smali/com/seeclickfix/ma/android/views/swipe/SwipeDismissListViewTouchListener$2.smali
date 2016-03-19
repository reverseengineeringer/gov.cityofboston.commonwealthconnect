.class Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;
.source "SwipeDismissListViewTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

.field final synthetic val$downPosition:I

.field final synthetic val$downView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;Landroid/view/View;I)V
    .locals 0

    .prologue
    .line 240
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;->this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;->val$downView:Landroid/view/View;

    iput p3, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;->val$downPosition:I

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 243
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;->this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;->val$downView:Landroid/view/View;

    iget v2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;->val$downPosition:I

    # invokes: Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->performDismiss(Landroid/view/View;I)V
    invoke-static {v0, v1, v2}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->access$000(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;Landroid/view/View;I)V

    .line 244
    return-void
.end method
