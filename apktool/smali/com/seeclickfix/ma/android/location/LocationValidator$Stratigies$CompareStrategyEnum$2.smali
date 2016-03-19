.class final enum Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum$2;
.super Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;
.source "LocationValidator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;-><init>(Ljava/lang/String;ILcom/seeclickfix/ma/android/location/LocationValidator$1;)V

    return-void
.end method


# virtual methods
.method public isValid(Landroid/location/Location;Landroid/location/Location;)Z
    .locals 19
    .param p1, "locOld"    # Landroid/location/Location;
    .param p2, "locNew"    # Landroid/location/Location;

    .prologue
    .line 70
    if-nez p2, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 97
    :goto_0
    return v0

    .line 72
    :cond_0
    if-nez p1, :cond_1

    if-eqz p2, :cond_1

    .line 74
    const/4 v0, 0x1

    goto :goto_0

    .line 77
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getTime()J

    move-result-wide v16

    .line 78
    .local v16, "oldTime":J
    invoke-virtual/range {p2 .. p2}, Landroid/location/Location;->getTime()J

    move-result-wide v12

    .line 80
    .local v12, "newTime":J
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getAccuracy()F

    move-result v15

    .line 81
    .local v15, "oldAccuracy":F
    invoke-virtual/range {p2 .. p2}, Landroid/location/Location;->getAccuracy()F

    move-result v11

    .line 83
    .local v11, "newAccuracy":F
    const/4 v0, 0x3

    new-array v8, v0, [F

    .line 85
    .local v8, "distanceArray":[F
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual/range {p2 .. p2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-static/range {v0 .. v8}, Landroid/location/Location;->distanceBetween(DDDD[F)V

    .line 87
    const/4 v0, 0x0

    aget v9, v8, v0

    .line 89
    .local v9, "distance":F
    const-wide/16 v0, 0x1f4

    add-long v0, v0, v16

    cmp-long v0, v12, v0

    if-ltz v0, :cond_2

    const/4 v14, 0x1

    .line 90
    .local v14, "newer":Z
    :goto_1
    const/high16 v0, 0x41200000    # 10.0f

    add-float/2addr v0, v15

    cmpg-float v0, v11, v0

    if-gtz v0, :cond_3

    const/4 v10, 0x1

    .line 91
    .local v10, "moreAccurate":Z
    :goto_2
    const/high16 v0, 0x41a00000    # 20.0f

    cmpg-float v0, v0, v9

    if-gez v0, :cond_4

    const/16 v18, 0x1

    .line 94
    .local v18, "significantDistance":Z
    :goto_3
    if-eqz v14, :cond_5

    if-eqz v10, :cond_5

    if-eqz v18, :cond_5

    .line 95
    const/4 v0, 0x1

    goto :goto_0

    .line 89
    .end local v10    # "moreAccurate":Z
    .end local v14    # "newer":Z
    .end local v18    # "significantDistance":Z
    :cond_2
    const/4 v14, 0x0

    goto :goto_1

    .line 90
    .restart local v14    # "newer":Z
    :cond_3
    const/4 v10, 0x0

    goto :goto_2

    .line 91
    .restart local v10    # "moreAccurate":Z
    :cond_4
    const/16 v18, 0x0

    goto :goto_3

    .line 97
    .restart local v18    # "significantDistance":Z
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method
