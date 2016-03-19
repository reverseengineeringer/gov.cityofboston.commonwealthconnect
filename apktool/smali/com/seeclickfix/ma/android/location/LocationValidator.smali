.class public Lcom/seeclickfix/ma/android/location/LocationValidator;
.super Ljava/lang/Object;
.source "LocationValidator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/location/LocationValidator$1;,
        Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "LocationValidator"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static compare(Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;Landroid/location/Location;Landroid/location/Location;)Z
    .locals 1
    .param p0, "strategy"    # Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;
    .param p1, "oldLoc"    # Landroid/location/Location;
    .param p2, "newLoc"    # Landroid/location/Location;

    .prologue
    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->isValid(Landroid/location/Location;Landroid/location/Location;)Z

    move-result v0

    return v0
.end method

.method public static isPrecise(Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;Landroid/location/Location;)Z
    .locals 1
    .param p0, "strategy"    # Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->isValid(Landroid/location/Location;)Z

    move-result v0

    return v0
.end method
