.class public Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;
.super Ljava/lang/Object;
.source "LocationTimeoutEvent.java"


# instance fields
.field private location:Landroid/location/Location;


# direct methods
.method public constructor <init>(Landroid/location/Location;)V
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;->location:Landroid/location/Location;

    .line 12
    return-void
.end method


# virtual methods
.method public getLocation()Landroid/location/Location;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;->location:Landroid/location/Location;

    return-object v0
.end method
