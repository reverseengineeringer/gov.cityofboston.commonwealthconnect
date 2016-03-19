.class final enum Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$2;
.super Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;
.source "LocationValidator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;-><init>(Ljava/lang/String;ILcom/seeclickfix/ma/android/location/LocationValidator$1;)V

    return-void
.end method


# virtual methods
.method public isValid(Landroid/location/Location;)Z
    .locals 10
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    const/4 v6, 0x0

    .line 117
    if-nez p1, :cond_0

    .line 125
    :goto_0
    return v6

    .line 120
    :cond_0
    const-wide/32 v4, 0xdbba0

    .line 121
    .local v4, "timeDelta":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 122
    .local v2, "now":J
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v0

    .line 123
    .local v0, "fixTime":J
    sub-long v8, v2, v0

    cmp-long v7, v8, v4

    if-gtz v7, :cond_1

    const/4 v6, 0x1

    .line 125
    .local v6, "wasInTimeDelta":Z
    :cond_1
    goto :goto_0
.end method
