.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 0

    .prologue
    .line 589
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 9
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v8, 0x0

    .line 595
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/seeclickfix/ma/android/objects/report/Report;->setIsUsingCurrentLocation(Z)V

    .line 597
    if-eqz p2, :cond_0

    .line 599
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLastLocationIfAvailable()Landroid/location/Location;

    move-result-object v1

    .line 601
    .local v1, "lastLocation":Landroid/location/Location;
    if-eqz v1, :cond_1

    .line 602
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    new-instance v3, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    # setter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;
    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$302(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/LatLng;

    .line 608
    :goto_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$300(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLatLng(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 609
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLatLngModified(Z)V

    .line 611
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$300(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v2, v3}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 612
    .local v0, "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$400(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v2

    const/16 v3, 0x1f4

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v3, v4}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 613
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$400(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 615
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$400(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v3}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;
    invoke-static {v4}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$300(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v3

    const-string/jumbo v4, "Open"

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    .line 620
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # setter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z
    invoke-static {v2, v8}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$502(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Z)Z

    .line 621
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # invokes: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->performLocationTasks()V
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$600(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    .line 623
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v2

    invoke-virtual {v2, v8}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 626
    .end local v0    # "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    .end local v1    # "lastLocation":Landroid/location/Location;
    :cond_0
    return-void

    .line 605
    .restart local v1    # "lastLocation":Landroid/location/Location;
    :cond_1
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$400(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/gms/maps/model/CameraPosition;->target:Lcom/google/android/gms/maps/model/LatLng;

    # setter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;
    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$302(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/LatLng;

    goto/16 :goto_0
.end method
