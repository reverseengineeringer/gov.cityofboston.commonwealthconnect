.class public Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;
.super Ljava/lang/Object;
.source "MapOptionsFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMiniMapOptions(Landroid/location/Location;)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 11
    .param p0, "lastLocation"    # Landroid/location/Location;

    .prologue
    const/4 v10, 0x0

    .line 58
    sget-object v3, Lcom/seeclickfix/ma/android/constants/LocationConstants;->US_CENTER_LATLNG:Lcom/google/android/gms/maps/model/LatLng;

    .line 59
    .local v3, "latLng":Lcom/google/android/gms/maps/model/LatLng;
    const/high16 v5, 0x40000000    # 2.0f

    .line 61
    .local v5, "zoom":F
    if-eqz p0, :cond_0

    .line 62
    new-instance v2, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {p0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v8

    invoke-direct {v2, v6, v7, v8, v9}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 64
    .local v2, "lastLatLng":Lcom/google/android/gms/maps/model/LatLng;
    if-eqz v2, :cond_0

    .line 65
    move-object v3, v2

    .line 66
    const/high16 v5, 0x41880000    # 17.0f

    .line 70
    .end local v2    # "lastLatLng":Lcom/google/android/gms/maps/model/LatLng;
    :cond_0
    invoke-static {}, Lcom/google/android/gms/maps/model/CameraPosition;->builder()Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    .line 71
    .local v0, "builder":Lcom/google/android/gms/maps/model/CameraPosition$Builder;
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->bearing(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 72
    invoke-virtual {v0, v3}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->target(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 73
    invoke-virtual {v0, v5}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->zoom(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 75
    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->build()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    .line 77
    .local v1, "camPosition":Lcom/google/android/gms/maps/model/CameraPosition;
    new-instance v4, Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-direct {v4}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    .line 78
    .local v4, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    invoke-virtual {v4, v10}, Lcom/google/android/gms/maps/GoogleMapOptions;->zOrderOnTop(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 79
    invoke-virtual {v4, v10}, Lcom/google/android/gms/maps/GoogleMapOptions;->compassEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 80
    invoke-virtual {v4, v10}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 81
    invoke-virtual {v4, v10}, Lcom/google/android/gms/maps/GoogleMapOptions;->rotateGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 82
    invoke-virtual {v4, v10}, Lcom/google/android/gms/maps/GoogleMapOptions;->tiltGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 83
    invoke-virtual {v4, v10}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 84
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lcom/google/android/gms/maps/GoogleMapOptions;->mapType(I)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 85
    invoke-virtual {v4, v1}, Lcom/google/android/gms/maps/GoogleMapOptions;->camera(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 87
    return-object v4
.end method

.method public static getPreviousOptions(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 6
    .param p0, "ll"    # Lcom/google/android/gms/maps/model/LatLng;
    .param p1, "zoom"    # F

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 36
    invoke-static {}, Lcom/google/android/gms/maps/model/CameraPosition;->builder()Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    .line 37
    .local v0, "builder":Lcom/google/android/gms/maps/model/CameraPosition$Builder;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->bearing(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 38
    invoke-virtual {v0, p0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->target(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 39
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->zoom(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 41
    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->build()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    .line 43
    .local v1, "camPosition":Lcom/google/android/gms/maps/model/CameraPosition;
    new-instance v2, Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-direct {v2}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    .line 44
    .local v2, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->zOrderOnTop(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 45
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->compassEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 46
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 47
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->rotateGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 48
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->tiltGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 49
    invoke-virtual {v2, v5}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 50
    invoke-virtual {v2, v5}, Lcom/google/android/gms/maps/GoogleMapOptions;->mapType(I)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 51
    invoke-virtual {v2, v1}, Lcom/google/android/gms/maps/GoogleMapOptions;->camera(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 53
    return-object v2
.end method

.method public static getStandardOptions()Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 15
    invoke-static {}, Lcom/google/android/gms/maps/model/CameraPosition;->builder()Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    .line 16
    .local v0, "builder":Lcom/google/android/gms/maps/model/CameraPosition$Builder;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->bearing(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 17
    sget-object v3, Lcom/seeclickfix/ma/android/constants/LocationConstants;->US_CENTER_LATLNG:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->target(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 18
    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual {v0, v3}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->zoom(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    .line 20
    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->build()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v1

    .line 22
    .local v1, "camPosition":Lcom/google/android/gms/maps/model/CameraPosition;
    new-instance v2, Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-direct {v2}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    .line 23
    .local v2, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->zOrderOnTop(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 24
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->compassEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 25
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 26
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->rotateGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 27
    invoke-virtual {v2, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->tiltGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 28
    invoke-virtual {v2, v5}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 29
    invoke-virtual {v2, v5}, Lcom/google/android/gms/maps/GoogleMapOptions;->mapType(I)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 30
    invoke-virtual {v2, v1}, Lcom/google/android/gms/maps/GoogleMapOptions;->camera(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 32
    return-object v2
.end method
