.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$15;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 1009
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1012
    const v2, 0x7f0a016a

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 1013
    .local v0, "checkBox":Landroid/widget/CheckBox;
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 1015
    .local v1, "place":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setSelected(Z)V

    .line 1016
    invoke-virtual {v0}, Landroid/widget/CheckBox;->toggle()V

    .line 1020
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1021
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v2, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1025
    :goto_1
    return-void

    .line 1015
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 1023
    :cond_1
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v2, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    goto :goto_1
.end method
