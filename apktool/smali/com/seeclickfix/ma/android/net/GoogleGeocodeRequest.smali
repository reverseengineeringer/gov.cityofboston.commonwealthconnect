.class public Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest;
.super Lcom/seeclickfix/ma/android/net/VolleyJsonTask;
.source "GoogleGeocodeRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/net/VolleyJsonTask;-><init>()V

    return-void
.end method

.method public static buildUrl(Ljava/lang/String;Landroid/location/Location;)Ljava/lang/String;
    .locals 9
    .param p0, "address"    # Ljava/lang/String;
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 27
    const-string/jumbo v0, ""

    .line 29
    .local v0, "bounds":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 30
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    .line 31
    .local v2, "lat":D
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    .line 32
    .local v4, "lng":D
    const-string/jumbo v1, "%f,%f|%f,%f"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 36
    .end local v2    # "lat":D
    .end local v4    # "lng":D
    :cond_0
    invoke-static {}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getGoogleGeocodeUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v6, "address"

    invoke-virtual {v1, v6, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v6, "bounds"

    invoke-virtual {v1, v6, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static geocode(Ljava/lang/String;Landroid/location/Location;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
    .locals 2
    .param p0, "address"    # Ljava/lang/String;
    .param p1, "location"    # Landroid/location/Location;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/location/Location;",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/location/SimpleLocation;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p2, "listener":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<Ljava/util/List<Lcom/seeclickfix/ma/android/location/SimpleLocation;>;>;"
    invoke-static {p0, p1}, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest;->buildUrl(Ljava/lang/String;Landroid/location/Location;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest$1;

    invoke-direct {v1, p2}, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest$1;-><init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest;->enqueueJsonGet(Ljava/lang/String;Lcom/android/volley/Response$Listener;)V

    .line 71
    return-void
.end method
