.class Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$1;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;
.source "SwipeDismissTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;)V
    .locals 0

    .prologue
    .line 157
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$1;->this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 1
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$1;->this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;

    # invokes: Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->performDismiss()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->access$000(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;)V

    .line 161
    return-void
.end method
