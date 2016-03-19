.class public Lcom/seeclickfix/ma/android/tasks/GetZonesTask;
.super Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;
.source "GetZonesTask.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GetZonesTask"


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 30
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 6

    .prologue
    .line 35
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/GetZonesTask;->buildParams()Ljava/util/Map;

    move-result-object v2

    .line 38
    .local v2, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetZonesTask;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 40
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetZonesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 41
    const-string/jumbo v4, "enhanced_watch_area_ids"

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getAllowedIdsString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    :cond_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetZonesTask;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getZonesNearbyWithPlaceUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 46
    .local v3, "url":Ljava/lang/String;
    invoke-static {v3, v2}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->constructUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    .line 48
    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetZonesTask;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->getStandardHeaders(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    .line 50
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, v3, v1}, Lcom/seeclickfix/ma/android/tasks/GetZonesTask;->performRequest(Ljava/lang/String;Ljava/util/Map;)V

    .line 51
    return-void
.end method
