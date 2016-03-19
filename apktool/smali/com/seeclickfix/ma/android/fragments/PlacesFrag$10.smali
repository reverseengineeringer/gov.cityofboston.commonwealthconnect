.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showSinglePlaceAt(Lcom/seeclickfix/ma/android/objects/loc/Place;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

.field final synthetic val$p:Lcom/seeclickfix/ma/android/objects/loc/Place;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0

    .prologue
    .line 730
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;->val$p:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 735
    :try_start_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;->val$p:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getIgnored()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 736
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updatePlacePositions()V
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$700(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    .line 737
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;->val$p:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getPlaceRowByTag(Lcom/seeclickfix/ma/android/objects/loc/Place;)Landroid/view/View;

    move-result-object v0

    .line 738
    .local v0, "placeTile":Landroid/view/View;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;->val$p:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 739
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->performDismiss(Landroid/view/View;)V
    invoke-static {v1, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$800(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 747
    .end local v0    # "placeTile":Landroid/view/View;
    :cond_0
    :goto_0
    return-void

    .line 741
    :catch_0
    move-exception v1

    goto :goto_0
.end method
