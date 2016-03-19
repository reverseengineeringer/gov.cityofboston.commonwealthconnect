.class public Lcom/seeclickfix/ma/android/location/BoundingBox;
.super Ljava/lang/Object;
.source "BoundingBox.java"


# static fields
.field public static final DELTA_LATITUDE_DEFAULT:D = 0.07

.field public static final DELTA_LONGITUDE_DEFAULT:D = 0.07


# instance fields
.field lowerLeftLatitude:D

.field lowerLeftLongitude:D

.field upperRightLatitude:D

.field upperRightLongitude:D


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-wide v0, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLatitude:D

    .line 18
    iput-wide v0, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLongitude:D

    .line 20
    iput-wide v0, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLatitude:D

    .line 21
    iput-wide v0, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLongitude:D

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/location/Location;)V
    .locals 10
    .param p1, "centerLocation"    # Landroid/location/Location;

    .prologue
    const-wide v8, 0x3fb1eb851eb851ecL    # 0.07

    const-wide/16 v6, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-wide v6, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLatitude:D

    .line 18
    iput-wide v6, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLongitude:D

    .line 20
    iput-wide v6, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLatitude:D

    .line 21
    iput-wide v6, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLongitude:D

    .line 33
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    .line 34
    .local v2, "centerLong":D
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    .line 35
    .local v0, "centerLat":D
    invoke-virtual {p0, v8, v9, v0, v1}, Lcom/seeclickfix/ma/android/location/BoundingBox;->calcDeltaLong(DD)D

    move-result-wide v4

    .line 37
    .local v4, "deltaLong":D
    sub-double v6, v0, v8

    iput-wide v6, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLatitude:D

    .line 38
    sub-double v6, v2, v4

    iput-wide v6, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLongitude:D

    .line 40
    add-double v6, v0, v8

    iput-wide v6, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLatitude:D

    .line 41
    add-double v6, v2, v4

    iput-wide v6, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLongitude:D

    .line 42
    return-void
.end method


# virtual methods
.method public calcDeltaLong(DD)D
    .locals 7
    .param p1, "defaultDelta"    # D
    .param p3, "latitude"    # D

    .prologue
    .line 51
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {p3, p4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    div-double v0, v2, v4

    .line 53
    .local v0, "latCosine":D
    mul-double v2, p1, v0

    return-wide v2
.end method

.method public lowerLeftLatitude()D
    .locals 2

    .prologue
    .line 77
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLatitude:D

    return-wide v0
.end method

.method public lowerLeftLatitude(D)Lcom/seeclickfix/ma/android/location/BoundingBox;
    .locals 1
    .param p1, "lowerLeftLatitude"    # D

    .prologue
    .line 107
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLatitude:D

    .line 108
    return-object p0
.end method

.method public lowerLeftLongitude()D
    .locals 2

    .prologue
    .line 83
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLongitude:D

    return-wide v0
.end method

.method public lowerLeftLongitude(D)Lcom/seeclickfix/ma/android/location/BoundingBox;
    .locals 1
    .param p1, "lowerLeftLongitude"    # D

    .prologue
    .line 121
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->lowerLeftLongitude:D

    .line 122
    return-object p0
.end method

.method public upperRightLatitude()D
    .locals 2

    .prologue
    .line 89
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLatitude:D

    return-wide v0
.end method

.method public upperRightLatitude(D)Lcom/seeclickfix/ma/android/location/BoundingBox;
    .locals 1
    .param p1, "upperRightLatitude"    # D

    .prologue
    .line 114
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLatitude:D

    .line 115
    return-object p0
.end method

.method public upperRightLongitude()D
    .locals 2

    .prologue
    .line 95
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLongitude:D

    return-wide v0
.end method

.method public upperRightLongitude(D)Lcom/seeclickfix/ma/android/location/BoundingBox;
    .locals 1
    .param p1, "upperRightLongitude"    # D

    .prologue
    .line 128
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/location/BoundingBox;->upperRightLongitude:D

    .line 129
    return-object p0
.end method
