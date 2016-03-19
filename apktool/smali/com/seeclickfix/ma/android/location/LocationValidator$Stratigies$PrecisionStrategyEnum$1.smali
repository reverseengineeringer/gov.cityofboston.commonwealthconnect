.class final enum Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$1;
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
    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;-><init>(Ljava/lang/String;ILcom/seeclickfix/ma/android/location/LocationValidator$1;)V

    return-void
.end method


# virtual methods
.method public isValid(Landroid/location/Location;)Z
    .locals 1
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    .line 110
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
