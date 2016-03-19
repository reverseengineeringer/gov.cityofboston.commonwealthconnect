.class public abstract Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;
.super Ljava/lang/Object;
.source "ZoneTaskAbstract.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/tasks/ZoneTaskInterface;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ZoneTaskAbstract"


# instance fields
.field protected PLACE_TAG:Ljava/lang/String;

.field protected c:Landroid/content/Context;

.field protected errorListener:Lcom/android/volley/Response$ErrorListener;

.field protected listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field protected place:Lcom/seeclickfix/ma/android/objects/loc/Place;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 2
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
    .line 37
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->c:Landroid/content/Context;

    .line 39
    iput-object p2, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 40
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->listener:Lcom/android/volley/Response$Listener;

    .line 41
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ZoneTaskAbstract"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->PLACE_TAG:Ljava/lang/String;

    .line 43
    return-void
.end method


# virtual methods
.method public buildParams()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v7, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v0

    .line 49
    .local v0, "lat":D
    iget-object v7, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v2

    .line 51
    .local v2, "lng":D
    new-instance v5, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->c:Landroid/content/Context;

    invoke-direct {v5, v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 52
    .local v5, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    invoke-virtual {v5, v0, v1}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lat(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 53
    invoke-virtual {v5, v2, v3}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lng(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 54
    const-string/jumbo v7, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v5, v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 56
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 57
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v6

    .line 58
    .local v6, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 63
    .end local v6    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    :goto_0
    iget-object v7, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getShouldReload()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 64
    iget-object v7, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->c:Landroid/content/Context;

    invoke-static {v7}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v7

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/volley/RequestQueue;->getCache()Lcom/android/volley/Cache;

    move-result-object v7

    iget-object v8, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getZoneCacheKey()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/android/volley/Cache;->remove(Ljava/lang/String;)V

    .line 67
    :cond_0
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->getParamsMap()Ljava/util/Map;

    move-result-object v4

    .line 69
    .local v4, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v7, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->c:Landroid/content/Context;

    invoke-static {v4, v7}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v4

    .line 71
    const-string/jumbo v7, "placeCacheKey"

    iget-object v8, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    return-object v4

    .line 60
    .end local v4    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    const-string/jumbo v7, "nobody@example.com"

    invoke-virtual {v5, v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    goto :goto_0
.end method

.method public cancel()V
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->PLACE_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 81
    return-void
.end method

.method protected performRequest(Ljava/lang/String;Ljava/util/Map;)V
    .locals 6
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->listener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->c:Landroid/content/Context;

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Landroid/content/Context;)V

    .line 88
    .local v0, "req":Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;
    new-instance v1, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;-><init>()V

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 89
    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->PLACE_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 91
    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->getCacheKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setZoneCacheKey(Ljava/lang/String;)V

    .line 93
    iget-object v1, p0, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->add(Lcom/android/volley/Request;)V

    .line 94
    return-void
.end method
