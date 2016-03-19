.class Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$4;
.super Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
.source "PlacesMapFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
        "<",
        "Landroid/location/Address;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V
    .locals 0

    .prologue
    .line 268
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
    .locals 0
    .param p1, "status"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .prologue
    .line 281
    return-void
.end method

.method public onSuccess(Landroid/location/Address;)V
    .locals 2
    .param p1, "bestMatch"    # Landroid/location/Address;

    .prologue
    .line 271
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 272
    invoke-static {p1}, Lcom/seeclickfix/ma/android/location/AddressLocalizer;->getAddressString(Landroid/location/Address;)Ljava/lang/String;

    move-result-object v0

    .line 273
    .local v0, "addrString":Ljava/lang/String;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/model/Marker;->setTitle(Ljava/lang/String;)V

    .line 274
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/maps/model/Marker;->showInfoWindow()V

    .line 276
    .end local v0    # "addrString":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 268
    check-cast p1, Landroid/location/Address;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$4;->onSuccess(Landroid/location/Address;)V

    return-void
.end method
