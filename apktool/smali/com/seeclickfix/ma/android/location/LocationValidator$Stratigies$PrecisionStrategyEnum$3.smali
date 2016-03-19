.class final enum Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$3;
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
    .line 129
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;-><init>(Ljava/lang/String;ILcom/seeclickfix/ma/android/location/LocationValidator$1;)V

    return-void
.end method


# virtual methods
.method public isValid(Landroid/location/Location;)Z
    .locals 3
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    const/4 v1, 0x0

    .line 132
    if-nez p1, :cond_1

    .line 137
    :cond_0
    :goto_0
    return v1

    .line 135
    :cond_1
    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v0

    .line 137
    .local v0, "accuracy":F
    const/high16 v2, 0x42960000    # 75.0f

    cmpg-float v2, v0, v2

    if-gez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method
