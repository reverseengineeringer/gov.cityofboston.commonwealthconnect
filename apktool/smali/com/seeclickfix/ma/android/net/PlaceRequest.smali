.class public Lcom/seeclickfix/ma/android/net/PlaceRequest;
.super Ljava/lang/Object;
.source "PlaceRequest.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/tasks/CancellableTask;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/seeclickfix/ma/android/tasks/CancellableTask",
        "<",
        "Lcom/seeclickfix/ma/android/objects/loc/Place;",
        ">;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "PlaceRequest"


# instance fields
.field private req:Lcom/seeclickfix/ma/android/net/NetRequest;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/seeclickfix/ma/android/objects/loc/Place;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 131
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/PlaceRequest;->call()Lcom/seeclickfix/ma/android/objects/loc/Place;

    move-result-object v0

    return-object v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/PlaceRequest;->req:Lcom/seeclickfix/ma/android/net/NetRequest;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/PlaceRequest;->req:Lcom/seeclickfix/ma/android/net/NetRequest;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/NetRequest;->abort()V

    .line 139
    :cond_0
    return-void
.end method

.method public getPlaceListByLocation(Landroid/location/Location;Landroid/content/Context;)Ljava/util/List;
    .locals 16
    .param p1, "location"    # Landroid/location/Location;
    .param p2, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/location/Location;",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    new-instance v9, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    move-object/from16 v0, p2

    invoke-direct {v9, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 47
    .local v9, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    invoke-static/range {p2 .. p2}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getPlacesNearbyUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->url(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 49
    const-string/jumbo v11, "GET"

    invoke-virtual {v9, v11}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 50
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v14

    invoke-virtual {v9, v14, v15}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lat(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 51
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v14

    invoke-virtual {v9, v14, v15}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lng(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 52
    const-string/jumbo v11, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v9, v11}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 53
    const/4 v11, 0x5

    invoke-virtual {v9, v11}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->numResults(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 55
    invoke-virtual {v9}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->create()Lcom/seeclickfix/ma/android/net/NetRequest;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/seeclickfix/ma/android/net/PlaceRequest;->req:Lcom/seeclickfix/ma/android/net/NetRequest;

    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 57
    .local v12, "time":J
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/net/PlaceRequest;->req:Lcom/seeclickfix/ma/android/net/NetRequest;

    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Lcom/seeclickfix/ma/android/net/NetRequest;->executeRequest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 58
    .local v10, "response":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long v4, v14, v12

    .line 62
    .local v4, "elapsed":J
    new-instance v3, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 63
    .local v3, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    const-class v11, Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v3, v10, v11}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v2

    .line 64
    .local v2, "deserializedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-static/range {p1 .. p2}, Lcom/seeclickfix/ma/android/location/MyPlaceFactory;->create(Landroid/location/Location;Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/loc/Place;

    move-result-object v7

    .line 66
    .local v7, "myPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    const/4 v11, 0x0

    invoke-virtual {v2, v11, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 69
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 70
    .local v8, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v14

    invoke-virtual {v8, v14, v15}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setOrigLat(D)V

    .line 71
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v14

    invoke-virtual {v8, v14, v15}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setOrigLat(D)V

    goto :goto_0

    .line 74
    .end local v8    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :cond_0
    return-object v2
.end method

.method public getPlacebyName(Ljava/lang/String;Landroid/location/Location;Landroid/content/Context;)Ljava/util/List;
    .locals 18
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "loc"    # Landroid/location/Location;
    .param p3, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/location/Location;",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    new-instance v10, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    move-object/from16 v0, p3

    invoke-direct {v10, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 93
    .local v10, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    invoke-static/range {p3 .. p3}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getZonesNearbyWithPlaceUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v10, v15}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->url(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 95
    const-string/jumbo v15, "GET"

    invoke-virtual {v10, v15}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 96
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->at(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 97
    const-string/jumbo v15, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v10, v15}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 98
    const/4 v15, 0x1

    invoke-virtual {v10, v15}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->numResults(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 100
    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->create()Lcom/seeclickfix/ma/android/net/NetRequest;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/seeclickfix/ma/android/net/PlaceRequest;->req:Lcom/seeclickfix/ma/android/net/NetRequest;

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 102
    .local v12, "time":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/net/PlaceRequest;->req:Lcom/seeclickfix/ma/android/net/NetRequest;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/seeclickfix/ma/android/net/NetRequest;->executeRequest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 103
    .local v11, "response":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    sub-long v4, v16, v12

    .line 107
    .local v4, "elapsed":J
    new-instance v3, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 108
    .local v3, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;>;"
    const-class v15, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    invoke-virtual {v3, v11, v15}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v2

    .line 110
    .local v2, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;>;"
    const/4 v15, 0x0

    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    .line 112
    .local v14, "zw":Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;
    invoke-virtual {v14}, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->getApiPlace()Lcom/seeclickfix/ma/android/objects/loc/Place;

    move-result-object v7

    .line 114
    .local v7, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .local v9, "places":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    if-eqz p2, :cond_0

    .line 118
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 119
    .local v8, "pl":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual/range {p2 .. p2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v8, v0, v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setOrigLat(D)V

    .line 120
    invoke-virtual/range {p2 .. p2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v8, v0, v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setOrigLat(D)V

    goto :goto_0

    .line 125
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "pl":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :cond_0
    return-object v9
.end method
