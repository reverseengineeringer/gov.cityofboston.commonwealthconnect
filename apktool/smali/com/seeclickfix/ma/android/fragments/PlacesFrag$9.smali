.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$9;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V
    .locals 0

    .prologue
    .line 715
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$9;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 719
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 720
    .local v0, "undoPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$9;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->undo(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 721
    return-void
.end method
