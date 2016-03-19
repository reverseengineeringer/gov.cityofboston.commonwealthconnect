.class public Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;
.super Ljava/lang/Object;
.source "LocationConnectedEvent.java"


# instance fields
.field private lastKnownLocation:Landroid/location/Location;


# direct methods
.method public constructor <init>(Landroid/location/Location;)V
    .locals 0
    .param p1, "lastKnownLocation"    # Landroid/location/Location;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;->lastKnownLocation:Landroid/location/Location;

    .line 11
    return-void
.end method


# virtual methods
.method public getLastKnownLocation()Landroid/location/Location;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;->lastKnownLocation:Landroid/location/Location;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "LocationConnectedEvent [lastKnownLocation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;->lastKnownLocation:Landroid/location/Location;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
