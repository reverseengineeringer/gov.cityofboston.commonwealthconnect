.class public Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;
.super Lcom/seeclickfix/ma/android/tasks/SafeTask;
.source "ReverseGeocodeTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/tasks/SafeTask",
        "<",
        "Lcom/google/android/gms/maps/model/LatLng;",
        "Landroid/location/Address;",
        ">;"
    }
.end annotation


# instance fields
.field private geoCoder:Landroid/location/Geocoder;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
    .locals 2
    .param p1, "fragment"    # Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
            "<",
            "Landroid/location/Address;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p2, "listener":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<Landroid/location/Address;>;"
    invoke-direct {p0, p2}, Lcom/seeclickfix/ma/android/tasks/SafeTask;-><init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    .line 20
    new-instance v0, Landroid/location/Geocoder;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->geoCoder:Landroid/location/Geocoder;

    .line 21
    return-void
.end method

.method public static launch(Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
    .locals 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "latLng"    # Lcom/google/android/gms/maps/model/LatLng;
    .param p2, "fragment"    # Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/maps/model/LatLng;",
            "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
            "<",
            "Landroid/location/Address;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p3, "listener":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<Landroid/location/Address;>;"
    invoke-static {p0}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->cancel(Ljava/lang/String;)V

    .line 25
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;

    invoke-direct {v0, p2, p3}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;-><init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    .line 26
    .local v0, "task":Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;
    invoke-static {p0, v0}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->register(Ljava/lang/String;Lcom/seeclickfix/ma/android/tasks/SimpleTask;)Lcom/seeclickfix/ma/android/tasks/SimpleTask;

    .line 27
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/google/android/gms/maps/model/LatLng;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 28
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/google/android/gms/maps/model/LatLng;)Landroid/location/Address;
    .locals 10
    .param p1, "params"    # [Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    const/4 v9, 0x0

    .line 31
    const/4 v8, 0x0

    .line 32
    .local v8, "matches":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    aget-object v7, p1, v9

    .line 35
    .local v7, "location":Lcom/google/android/gms/maps/model/LatLng;
    :try_start_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->geoCoder:Landroid/location/Geocoder;

    iget-wide v2, v7, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    iget-wide v4, v7, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 41
    :goto_0
    invoke-static {v8}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->isNullOrEmpty(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 42
    const/4 v1, 0x0

    .line 44
    :goto_1
    return-object v1

    .line 36
    :catch_0
    move-exception v0

    .line 38
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->NETWORK_UNAVAILABLE:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->setErrorCode(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V

    goto :goto_0

    .line 44
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/Address;

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 14
    check-cast p1, [Lcom/google/android/gms/maps/model/LatLng;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->doInBackground([Lcom/google/android/gms/maps/model/LatLng;)Landroid/location/Address;

    move-result-object v0

    return-object v0
.end method
