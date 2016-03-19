.class public Lcom/seeclickfix/ma/android/events/LocationProcessedEvent;
.super Ljava/lang/Object;
.source "LocationProcessedEvent.java"


# instance fields
.field private location:Landroid/location/Location;


# direct methods
.method public constructor <init>(Landroid/location/Location;)V
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/LocationProcessedEvent;->location:Landroid/location/Location;

    .line 19
    return-void
.end method


# virtual methods
.method public getLocation()Landroid/location/Location;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/LocationProcessedEvent;->location:Landroid/location/Location;

    return-object v0
.end method
