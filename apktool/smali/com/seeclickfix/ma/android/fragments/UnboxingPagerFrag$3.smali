.class Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$3;
.super Ljava/lang/Object;
.source "UnboxingPagerFrag.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->setSwipeListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V
    .locals 0

    .prologue
    .line 173
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 175
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->gestureDetector:Landroid/view/GestureDetector;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)Landroid/view/GestureDetector;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
