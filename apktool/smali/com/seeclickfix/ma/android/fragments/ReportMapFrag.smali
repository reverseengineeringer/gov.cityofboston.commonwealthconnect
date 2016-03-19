.class public Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "ReportMapFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ReportMapFrag"


# instance fields
.field private c:Landroid/content/Context;

.field private camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

.field private exposeSearch:Ljava/lang/Runnable;

.field private final handler:Landroid/os/Handler;

.field private headerText:Landroid/widget/TextView;

.field locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mMap:Lcom/google/android/gms/maps/GoogleMap;

.field private mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

.field private mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

.field mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mapLongClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapLongClickListener;

.field private marker:Lcom/google/android/gms/maps/model/Marker;

.field private options:Lcom/google/android/gms/maps/GoogleMapOptions;

.field private previousLatLng:Lcom/google/android/gms/maps/model/LatLng;

.field private report:Lcom/seeclickfix/ma/android/objects/report/Report;

.field private returnPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field private saveBtn:Landroid/widget/Button;

.field private saveBtnListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 83
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handler:Landroid/os/Handler;

    .line 84
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;
    .param p1, "x1"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handleClick(Lcom/google/android/gms/maps/model/LatLng;)V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)Lcom/google/android/gms/maps/model/Marker;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;
    .param p1, "x1"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->saveLatLng(Lcom/google/android/gms/maps/model/LatLng;)V

    return-void
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->exposeSearch:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$502(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/model/CameraPosition;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;
    .param p1, "x1"    # Lcom/google/android/gms/maps/model/CameraPosition;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    return-object p1
.end method

.method private attachListeners()V
    .locals 2

    .prologue
    .line 313
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->saveBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->saveBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 314
    return-void
.end method

.method private getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 145
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "map_options"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 147
    .local v1, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    if-nez v1, :cond_1

    .line 148
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLastLocationIfAvailable()Landroid/location/Location;

    move-result-object v0

    .line 150
    .local v0, "lastLocation":Landroid/location/Location;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    if-eqz v2, :cond_0

    .line 153
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getCamPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 154
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->previousLatLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 158
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->previousLatLng:Lcom/google/android/gms/maps/model/LatLng;

    if-eqz v2, :cond_2

    .line 159
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->previousLatLng:Lcom/google/android/gms/maps/model/LatLng;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    iget v3, v3, Lcom/google/android/gms/maps/model/CameraPosition;->zoom:F

    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getPreviousOptions(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    .line 166
    :goto_0
    invoke-virtual {v1, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 167
    invoke-virtual {v1, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 168
    invoke-virtual {v1, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 170
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    if-eqz v2, :cond_1

    .line 171
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->camera(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 175
    .end local v0    # "lastLocation":Landroid/location/Location;
    :cond_1
    return-object v1

    .line 160
    .restart local v0    # "lastLocation":Landroid/location/Location;
    :cond_2
    if-eqz v0, :cond_3

    .line 161
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getMiniMapOptions(Landroid/location/Location;)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    goto :goto_0

    .line 163
    :cond_3
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getStandardOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    goto :goto_0
.end method

.method private handleClick(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 6
    .param p1, "markerLatLng"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 240
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    if-eqz v1, :cond_0

    .line 241
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/model/Marker;->remove()V

    .line 244
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 247
    new-instance v0, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 249
    .local v0, "markerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 250
    const-string/jumbo v1, "Open"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->c:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 252
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    .line 254
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->updateCamPosition()V

    .line 256
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$4;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$4;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->exposeSearch:Ljava/lang/Runnable;

    .line 265
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->exposeSearch:Ljava/lang/Runnable;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 267
    const-string/jumbo v1, "ReportMapFrag"

    new-instance v2, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$6;

    new-instance v3, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$5;

    invoke-direct {v3, p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$5;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)V

    invoke-direct {v2, p0, p0, v3}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$6;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V

    invoke-static {v1, p1, p0, v2}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->launch(Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    .line 295
    return-void
.end method

.method public static newInstance()Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;
    .locals 1

    .prologue
    .line 88
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;-><init>()V

    .line 90
    .local v0, "frag":Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;
    return-object v0
.end method

.method private saveLatLng(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 2
    .param p1, "markerLatLng"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 298
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "marker_latlng"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 299
    return-void
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 204
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00a8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->headerText:Landroid/widget/TextView;

    .line 207
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a0114

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->saveBtn:Landroid/widget/Button;

    .line 208
    return-void
.end method

.method private setUpMapIfNeeded()V
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v0, :cond_1

    .line 353
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 358
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    .line 360
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->setupMap()V

    .line 365
    :cond_0
    :goto_0
    return-void

    .line 363
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->setupMap()V

    goto :goto_0
.end method

.method private setupListeners()V
    .locals 1

    .prologue
    .line 211
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->saveBtnListener:Landroid/view/View$OnClickListener;

    .line 219
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

    .line 228
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mapLongClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapLongClickListener;

    .line 236
    return-void
.end method

.method private setupMap()V
    .locals 3

    .prologue
    .line 379
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 380
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setLocationSource(Lcom/google/android/gms/maps/LocationSource;)V

    .line 381
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMapClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;)V

    .line 382
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mapLongClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapLongClickListener;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMapLongClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMapLongClickListener;)V

    .line 384
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->previousLatLng:Lcom/google/android/gms/maps/model/LatLng;

    if-eqz v1, :cond_0

    .line 385
    new-instance v0, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 387
    .local v0, "markerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->previousLatLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 388
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 389
    const-string/jumbo v1, "Open"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->c:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 391
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 392
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    .line 394
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/model/Marker;->showInfoWindow()V

    .line 404
    .end local v0    # "markerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    :goto_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v2, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$7;

    invoke-direct {v2, p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$7;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnCameraChangeListener(Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;)V

    .line 413
    return-void

    .line 397
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handleClick(Lcom/google/android/gms/maps/model/LatLng;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 398
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private updateCamPosition()V
    .locals 6

    .prologue
    .line 302
    new-instance v0, Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;-><init>()V

    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/model/Marker;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    iget-wide v2, v2, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v4}, Lcom/google/android/gms/maps/model/Marker;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v4

    iget-wide v4, v4, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->target(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    iget v1, v1, Lcom/google/android/gms/maps/model/CameraPosition;->zoom:F

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->zoom(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    iget v1, v1, Lcom/google/android/gms/maps/model/CameraPosition;->tilt:F

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->tilt(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    iget v1, v1, Lcom/google/android/gms/maps/model/CameraPosition;->bearing:F

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->bearing(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->build()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 309
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-static {v1}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newCameraPosition(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;)V

    .line 310
    return-void
.end method


# virtual methods
.method public getLatLng()Lcom/google/android/gms/maps/model/LatLng;
    .locals 3

    .prologue
    .line 421
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "marker_latlng"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/maps/model/LatLng;

    .line 423
    .local v0, "latlng":Lcom/google/android/gms/maps/model/LatLng;
    if-eqz v0, :cond_0

    .line 426
    .end local v0    # "latlng":Lcom/google/android/gms/maps/model/LatLng;
    :goto_0
    return-object v0

    .restart local v0    # "latlng":Lcom/google/android/gms/maps/model/LatLng;
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    iget-object v0, v1, Lcom/google/android/gms/maps/model/CameraPosition;->target:Lcom/google/android/gms/maps/model/LatLng;

    goto :goto_0
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 181
    const/4 v0, 0x0

    return-object v0
.end method

.method public onBackKey()V
    .locals 1

    .prologue
    .line 417
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->popThisFragment(Z)V

    .line 418
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 96
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreate(Landroid/os/Bundle;)V

    .line 100
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 104
    if-nez p2, :cond_0

    .line 105
    const/4 v0, 0x0

    .line 120
    :goto_0
    return-object v0

    .line 107
    :cond_0
    const v0, 0x7f030036

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 108
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "page_params"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->returnPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 109
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->returnPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->getParcel()Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Report;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 115
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    const v1, 0x7f0a0116

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;->initMap(Landroid/support/v4/app/Fragment;ILcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    .line 120
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onDetach()V
    .locals 0

    .prologue
    .line 133
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDetach()V

    .line 135
    return-void
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 139
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onPause()V

    .line 140
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "map_options"

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 141
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 186
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 189
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->c:Landroid/content/Context;

    .line 190
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->setReferences()V

    .line 191
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->setupListeners()V

    .line 193
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->setUpMapIfNeeded()V

    .line 195
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->attachListeners()V

    .line 197
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->subscribeToEventBus()V

    .line 198
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startHighAccuracyLocationUpdates()V

    .line 200
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 125
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 127
    const-string/jumbo v0, "ReportMapFrag"

    invoke-static {v0}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->cancel(Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->exposeSearch:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 129
    return-void
.end method

.method protected popThisFragment(Z)V
    .locals 4
    .param p1, "saveLocation"    # Z

    .prologue
    .line 321
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;

    .line 323
    .local v1, "mainActivity":Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    if-eqz v2, :cond_1

    if-eqz p1, :cond_1

    .line 324
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/model/Marker;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v0

    .line 326
    .local v0, "latLng":Lcom/google/android/gms/maps/model/LatLng;
    if-eqz v0, :cond_1

    .line 328
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    if-eq v2, v0, :cond_0

    .line 329
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLatLngModified(Z)V

    .line 332
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setIsUsingCurrentLocation(Z)V

    .line 333
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v3}, Lcom/google/android/gms/maps/model/Marker;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setAddress(Ljava/lang/String;)V

    .line 334
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLatLng(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 335
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setCamPosition(Lcom/google/android/gms/maps/model/CameraPosition;)V

    .line 337
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/model/Marker;->remove()V

    .line 338
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    .line 343
    .end local v0    # "latLng":Lcom/google/android/gms/maps/model/LatLng;
    :cond_1
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->returnPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 344
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->returnPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-interface {v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;->onReportLocationSet(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    .line 346
    return-void
.end method
