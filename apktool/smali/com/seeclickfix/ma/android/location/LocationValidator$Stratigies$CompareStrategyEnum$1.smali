.class final enum Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum$1;
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
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;-><init>(Ljava/lang/String;ILcom/seeclickfix/ma/android/location/LocationValidator$1;)V

    return-void
.end method


# virtual methods
.method public isValid(Landroid/location/Location;Landroid/location/Location;)Z
    .locals 11
    .param p1, "locOld"    # Landroid/location/Location;
    .param p2, "locNew"    # Landroid/location/Location;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 38
    if-nez p2, :cond_1

    .line 57
    :cond_0
    :goto_0
    return v8

    .line 40
    :cond_1
    if-nez p1, :cond_2

    move v8, v9

    .line 42
    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v6

    .line 46
    .local v6, "oldTime":J
    invoke-virtual {p2}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    .line 48
    .local v2, "newTime":J
    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v5

    .line 49
    .local v5, "oldAccuracy":F
    invoke-virtual {p2}, Landroid/location/Location;->getAccuracy()F

    move-result v1

    .line 51
    .local v1, "newAccuracy":F
    cmp-long v10, v2, v6

    if-ltz v10, :cond_3

    move v4, v9

    .line 52
    .local v4, "newer":Z
    :goto_1
    cmpg-float v10, v1, v5

    if-gtz v10, :cond_4

    move v0, v9

    .line 54
    .local v0, "moreAccurate":Z
    :goto_2
    if-eqz v4, :cond_0

    if-eqz v0, :cond_0

    move v8, v9

    .line 55
    goto :goto_0

    .end local v0    # "moreAccurate":Z
    .end local v4    # "newer":Z
    :cond_3
    move v4, v8

    .line 51
    goto :goto_1

    .restart local v4    # "newer":Z
    :cond_4
    move v0, v8

    .line 52
    goto :goto_2
.end method
