.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;
.source "PlacesFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->performDismiss(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

.field final synthetic val$lp:Landroid/view/ViewGroup$LayoutParams;

.field final synthetic val$originalHeight:I

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;I)V
    .locals 0

    .prologue
    .line 889
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$v:Landroid/view/View;

    iput-object p3, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    iput p4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$originalHeight:I

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 895
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updatePlacePositions()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$700(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    .line 897
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$v:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 898
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$v:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    .line 899
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$originalHeight:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 900
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$v:Landroid/view/View;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 902
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$900(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/view/ViewGroup;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$v:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 903
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->val$v:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 905
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$900(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/view/ViewGroup;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->delayedUpdatePositions:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 907
    return-void
.end method
