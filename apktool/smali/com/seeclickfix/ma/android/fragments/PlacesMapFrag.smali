.class public Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "PlacesMapFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "PlacesMapFrag"


# instance fields
.field private c:Landroid/content/Context;

.field private camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

.field geocodeListener:Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
            "<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation
.end field

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

.field private markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

.field private namePlaceDialog:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

.field private pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field private saveBtn:Landroid/widget/Button;

.field private saveBtnListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 268
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$4;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$4;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;-><init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->geocodeListener:Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;
    .param p1, "x1"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->handleClick(Lcom/google/android/gms/maps/model/LatLng;)V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)Lcom/google/android/gms/maps/model/Marker;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    return-object v0
.end method

.method static synthetic access$202(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/model/CameraPosition;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;
    .param p1, "x1"    # Lcom/google/android/gms/maps/model/CameraPosition;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    return-object p1
.end method

.method private attachListeners()V
    .locals 2

    .prologue
    .line 285
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->saveBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->saveBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    return-void
.end method

.method private getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 118
    const/4 v1, 0x0

    .line 119
    .local v1, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLastLocationIfAvailable()Landroid/location/Location;

    move-result-object v0

    .line 121
    .local v0, "lastLocation":Landroid/location/Location;
    if-eqz v0, :cond_1

    .line 122
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getMiniMapOptions(Landroid/location/Location;)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    .line 126
    :goto_0
    invoke-virtual {v1, v3}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 127
    invoke-virtual {v1, v3}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 128
    invoke-virtual {v1, v3}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 130
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "cam_position"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/maps/model/CameraPosition;

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 132
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    if-eqz v2, :cond_0

    .line 133
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->camera(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 136
    :cond_0
    return-object v1

    .line 124
    :cond_1
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getStandardOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    goto :goto_0
.end method

.method private handleClick(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 1
    .param p1, "markerLatLng"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 240
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    if-eqz v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/Marker;->remove()V

    .line 244
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 246
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setMarker(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 247
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->updateCamPosition()V

    .line 248
    return-void
.end method

.method private initMap()V
    .locals 3

    .prologue
    .line 113
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    const v1, 0x7f0a00dc

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;->initMap(Landroid/support/v4/app/Fragment;ILcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    .line 114
    return-void
.end method

.method private setMarker(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 3
    .param p1, "markerLatLng"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 251
    if-nez p1, :cond_0

    .line 266
    :goto_0
    return-void

    .line 257
    :cond_0
    new-instance v0, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 259
    .local v0, "markerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 260
    const-string/jumbo v1, "Acknowledged"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->c:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 261
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    .line 263
    const-string/jumbo v1, "PlacesMapFrag"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->geocodeListener:Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;

    invoke-static {v1, p1, p0, v2}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->launch(Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    .line 265
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    goto :goto_0
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 189
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00da

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->saveBtn:Landroid/widget/Button;

    .line 190
    return-void
.end method

.method private setUpMapIfNeeded()V
    .locals 1

    .prologue
    .line 291
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v0, :cond_1

    .line 293
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 299
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    .line 301
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setupMap()V

    .line 306
    :cond_0
    :goto_0
    return-void

    .line 304
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setupMap()V

    goto :goto_0
.end method

.method private setupListeners()V
    .locals 1

    .prologue
    .line 193
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->saveBtnListener:Landroid/view/View$OnClickListener;

    .line 201
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

    .line 210
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mapLongClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapLongClickListener;

    .line 218
    return-void
.end method

.method private setupMap()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 312
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 314
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    if-nez v1, :cond_0

    .line 316
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1, v4}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 317
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setLocationSource(Lcom/google/android/gms/maps/LocationSource;)V

    .line 325
    :goto_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1, v4}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 327
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMapClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;)V

    .line 328
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mapLongClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapLongClickListener;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMapLongClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMapLongClickListener;)V

    .line 330
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v2, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$5;

    invoke-direct {v2, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$5;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnCameraChangeListener(Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;)V

    .line 340
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setMarker(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 341
    return-void

    .line 321
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    iget-object v1, v1, Lcom/google/android/gms/maps/model/CameraPosition;->target:Lcom/google/android/gms/maps/model/LatLng;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    iget v2, v2, Lcom/google/android/gms/maps/model/CameraPosition;->zoom:F

    invoke-static {v1, v2}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 322
    .local v0, "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/16 v2, 0x1f4

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    goto :goto_0
.end method

.method private updateCamPosition()V
    .locals 6

    .prologue
    .line 367
    new-instance v0, Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;-><init>()V

    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/model/Marker;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    iget-wide v2, v2, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v4}, Lcom/google/android/gms/maps/model/Marker;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v4

    iget-wide v4, v4, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->target(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    iget v1, v1, Lcom/google/android/gms/maps/model/CameraPosition;->zoom:F

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->zoom(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    iget v1, v1, Lcom/google/android/gms/maps/model/CameraPosition;->tilt:F

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->tilt(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    iget v1, v1, Lcom/google/android/gms/maps/model/CameraPosition;->bearing:F

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->bearing(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->build()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 374
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-static {v1}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newCameraPosition(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;)V

    .line 375
    return-void
.end method


# virtual methods
.method protected getMarkerFromParcel(Lcom/seeclickfix/ma/android/objects/PageParams;)Lcom/google/android/gms/maps/model/LatLng;
    .locals 3
    .param p1, "pageParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    const/4 v1, 0x0

    .line 174
    if-nez p1, :cond_0

    move-object v0, v1

    .line 182
    :goto_0
    return-object v0

    .line 177
    :cond_0
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getParcel()Landroid/os/Parcelable;

    move-result-object v0

    .line 179
    .local v0, "parcelPackage":Landroid/os/Parcelable;
    instance-of v2, v0, Lcom/google/android/gms/maps/model/LatLng;

    if-eqz v2, :cond_1

    .line 180
    check-cast v0, Lcom/google/android/gms/maps/model/LatLng;

    goto :goto_0

    :cond_1
    move-object v0, v1

    .line 182
    goto :goto_0
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 142
    const/4 v0, 0x0

    return-object v0
.end method

.method public onBackKey()V
    .locals 1

    .prologue
    .line 362
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->popBackStack()V

    .line 364
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 89
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreate(Landroid/os/Bundle;)V

    .line 93
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 97
    if-nez p2, :cond_0

    .line 98
    const/4 v0, 0x0

    .line 108
    :goto_0
    return-object v0

    .line 100
    :cond_0
    const v0, 0x7f030033

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 104
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->initMap()V

    .line 108
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onLocationChangedEvent(Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;)V
    .locals 3
    .param p1, "locEvent"    # Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 346
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;->getLocation()Landroid/location/Location;

    move-result-object v0

    .line 349
    .local v0, "location":Landroid/location/Location;
    if-eqz v0, :cond_0

    .line 350
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 352
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMapClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;)V

    .line 354
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopActiveLocationUpdates()V

    .line 357
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 147
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 150
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "page_params"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 151
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getMarkerFromParcel(Lcom/seeclickfix/ma/android/objects/PageParams;)Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 153
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->c:Landroid/content/Context;

    .line 154
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setReferences()V

    .line 155
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setupListeners()V

    .line 157
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setUpMapIfNeeded()V

    .line 159
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->attachListeners()V

    .line 161
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->subscribeToEventBus()V

    .line 162
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startHighAccuracyLocationUpdates()V

    .line 163
    return-void
.end method

.method public onStop()V
    .locals 3

    .prologue
    .line 168
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 170
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "cam_position"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 171
    return-void
.end method

.method protected save()V
    .locals 5

    .prologue
    .line 223
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

    if-nez v0, :cond_0

    .line 224
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0c00f8

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;I)V

    .line 234
    :goto_0
    return-void

    .line 228
    :cond_0
    const v0, 0x7f0c0097

    const v1, 0x7f0c0095

    const v2, 0x7f02010d

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->newInstance(IIILcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/objects/PageParams;)Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->namePlaceDialog:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    .line 233
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->namePlaceDialog:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0
.end method
