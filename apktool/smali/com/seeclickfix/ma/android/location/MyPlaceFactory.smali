.class public Lcom/seeclickfix/ma/android/location/MyPlaceFactory;
.super Ljava/lang/Object;
.source "MyPlaceFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Landroid/location/Location;Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/loc/Place;
    .locals 6
    .param p0, "location"    # Landroid/location/Location;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 14
    .local v2, "res":Landroid/content/res/Resources;
    const v3, 0x7f0c00cc

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 16
    .local v1, "name":Ljava/lang/String;
    new-instance v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;-><init>()V

    .line 18
    .local v0, "myPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setApiId(I)V

    .line 19
    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setName(Ljava/lang/String;)V

    .line 20
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setMyLocation(Z)V

    .line 21
    invoke-virtual {p0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setPlaceLat(D)V

    .line 22
    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setPlaceLng(D)V

    .line 24
    return-object v0
.end method
