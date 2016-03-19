.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$11;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V
    .locals 0

    .prologue
    .line 861
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$11;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/view/View;Ljava/lang/Object;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "token"    # Ljava/lang/Object;

    .prologue
    .line 865
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .local v1, "parent":Landroid/view/ViewGroup;
    move-object v0, p2

    .line 867
    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 868
    .local v0, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 870
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$11;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->ignorePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 871
    return-void
.end method
