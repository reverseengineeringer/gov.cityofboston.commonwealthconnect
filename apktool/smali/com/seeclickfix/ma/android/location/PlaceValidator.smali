.class public Lcom/seeclickfix/ma/android/location/PlaceValidator;
.super Ljava/lang/Object;
.source "PlaceValidator.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "PlaceValidator"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isPlaceNearLocation(Lcom/seeclickfix/ma/android/objects/loc/Place;Landroid/location/Location;)Z
    .locals 12
    .param p0, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    const/4 v9, 0x0

    .line 28
    const/4 v10, 0x3

    new-array v8, v10, [F

    .line 30
    .local v8, "distance":[F
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v0

    .line 31
    .local v0, "placeLat":D
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v2

    .line 33
    .local v2, "placeLng":D
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    .line 34
    .local v4, "locLat":D
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    .line 36
    .local v6, "locLng":D
    invoke-static/range {v0 .. v8}, Landroid/location/Location;->distanceBetween(DDDD[F)V

    .line 42
    aget v10, v8, v9

    const/high16 v11, 0x43480000    # 200.0f

    cmpg-float v10, v10, v11

    if-gez v10, :cond_0

    .line 45
    const/4 v9, 0x1

    .line 48
    :cond_0
    return v9
.end method

.method public static isPlaceRecent(Lcom/seeclickfix/ma/android/objects/loc/Place;)Z
    .locals 6
    .param p0, "dbPlace"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getLastPlaceUpdateFromApi()J

    move-result-wide v0

    .line 56
    .local v0, "lastRefreshed":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v2, v4, v0

    .line 58
    .local v2, "timeSinceRefresh":J
    const-wide/32 v4, 0xdbba0

    cmp-long v4, v2, v4

    if-gez v4, :cond_0

    .line 61
    const/4 v4, 0x1

    .line 64
    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method
