.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removePlaceFromNav(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

.field final synthetic val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0

    .prologue
    .line 1096
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1101
    :try_start_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/db/InsertSinglePlace;->creatOrUpdate(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1102
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;

    .line 1103
    .local v0, "placeAddedListener":Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-interface {v0, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;->onPlaceRemoved(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1108
    .end local v0    # "placeAddedListener":Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;
    :goto_0
    return-void

    .line 1104
    :catch_0
    move-exception v1

    goto :goto_0
.end method
