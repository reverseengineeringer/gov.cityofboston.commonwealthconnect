.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$14;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updateMapCamera(Lcom/google/android/gms/maps/model/LatLngBounds;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

.field final synthetic val$cameUpdateFinal:Lcom/google/android/gms/maps/CameraUpdate;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/google/android/gms/maps/CameraUpdate;)V
    .locals 0

    .prologue
    .line 998
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$14;->val$cameUpdateFinal:Lcom/google/android/gms/maps/CameraUpdate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1002
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$1000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$14;->val$cameUpdateFinal:Lcom/google/android/gms/maps/CameraUpdate;

    const/16 v2, 0x1f4

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 1004
    return-void
.end method
