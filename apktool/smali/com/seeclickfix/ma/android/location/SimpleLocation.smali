.class public Lcom/seeclickfix/ma/android/location/SimpleLocation;
.super Ljava/lang/Object;
.source "SimpleLocation.java"


# instance fields
.field private address:Ljava/lang/String;

.field private lat:D

.field private lng:D


# direct methods
.method public constructor <init>(DDLjava/lang/String;)V
    .locals 1
    .param p1, "lat"    # D
    .param p3, "lng"    # D
    .param p5, "address"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/location/SimpleLocation;->lat:D

    .line 20
    iput-wide p3, p0, Lcom/seeclickfix/ma/android/location/SimpleLocation;->lng:D

    .line 21
    iput-object p5, p0, Lcom/seeclickfix/ma/android/location/SimpleLocation;->address:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public static fromJson(Lorg/json/JSONObject;)Lcom/seeclickfix/ma/android/location/SimpleLocation;
    .locals 7
    .param p0, "jsonLocation"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 31
    const-string/jumbo v0, "formatted_address"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 32
    .local v6, "full_address":Ljava/lang/String;
    const-string/jumbo v0, "geometry"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "location"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "lat"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    .line 33
    .local v2, "lat":D
    const-string/jumbo v0, "geometry"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "location"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "lng"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    .line 35
    .local v4, "lng":D
    new-instance v1, Lcom/seeclickfix/ma/android/location/SimpleLocation;

    invoke-direct/range {v1 .. v6}, Lcom/seeclickfix/ma/android/location/SimpleLocation;-><init>(DDLjava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/SimpleLocation;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getLat()D
    .locals 2

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/SimpleLocation;->lat:D

    return-wide v0
.end method

.method public getLng()D
    .locals 2

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/SimpleLocation;->lng:D

    return-wide v0
.end method

.method public latLng()Lcom/google/android/gms/maps/model/LatLng;
    .locals 6

    .prologue
    .line 46
    new-instance v0, Lcom/google/android/gms/maps/model/LatLng;

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/location/SimpleLocation;->lat:D

    iget-wide v4, p0, Lcom/seeclickfix/ma/android/location/SimpleLocation;->lng:D

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    return-object v0
.end method
