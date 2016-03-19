.class final enum Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$4;
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
    .line 140
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;-><init>(Ljava/lang/String;ILcom/seeclickfix/ma/android/location/LocationValidator$1;)V

    return-void
.end method


# virtual methods
.method public isValid(Landroid/location/Location;)Z
    .locals 2
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    const/4 v0, 0x0

    .line 143
    if-nez p1, :cond_0

    .line 148
    :goto_0
    return v0

    .line 146
    :cond_0
    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$4;->RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->isValid(Landroid/location/Location;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$4;->CLOSE:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->isValid(Landroid/location/Location;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    .line 148
    .local v0, "valid":Z
    :cond_1
    goto :goto_0
.end method
