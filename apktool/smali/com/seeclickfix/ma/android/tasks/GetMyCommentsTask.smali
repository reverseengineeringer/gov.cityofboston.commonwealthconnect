.class public Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;
.super Ljava/lang/Object;
.source "GetMyCommentsTask.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GetMyCommentsTask"


# instance fields
.field private c:Landroid/content/Context;

.field private errorListener:Lcom/android/volley/Response$ErrorListener;

.field private listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private page:I

.field private place:Lcom/seeclickfix/ma/android/objects/loc/Place;

.field private req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;I)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p5, "page"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONArray;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->c:Landroid/content/Context;

    .line 43
    iput-object p2, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 44
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->listener:Lcom/android/volley/Response$Listener;

    .line 45
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 46
    iput p5, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->page:I

    .line 48
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->cancel()V

    .line 49
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    const-string/jumbo v1, "GetMyCommentsTask"

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 125
    return-void
.end method

.method public execute()V
    .locals 13

    .prologue
    .line 52
    new-instance v11, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->c:Landroid/content/Context;

    invoke-direct {v11, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 54
    .local v11, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v6

    .line 55
    .local v6, "lat":D
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v8

    .line 57
    .local v8, "lng":D
    invoke-virtual {v11, v6, v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lat(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 58
    invoke-virtual {v11, v8, v9}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lng(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 60
    const/16 v0, 0xc

    invoke-virtual {v11, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->zoom(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 61
    const-string/jumbo v0, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v11, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 62
    const/16 v0, 0xa

    invoke-virtual {v11, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->numResults(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 64
    iget v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->page:I

    if-lez v0, :cond_0

    .line 65
    iget v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->page:I

    invoke-virtual {v11, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->page(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 68
    :cond_0
    const/4 v12, 0x0

    .line 70
    .local v12, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v12

    .line 72
    invoke-virtual {v12}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 78
    :goto_0
    invoke-virtual {v11}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->getParamsMap()Ljava/util/Map;

    move-result-object v10

    .line 80
    .local v10, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->c:Landroid/content/Context;

    invoke-static {v10, v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v10

    .line 82
    const-string/jumbo v0, "placeCacheKey"

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    const/4 v1, 0x0

    .line 86
    .local v1, "url":Ljava/lang/String;
    if-eqz v12, :cond_2

    .line 88
    const-string/jumbo v0, "lat"

    invoke-interface {v10, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string/jumbo v0, "lng"

    invoke-interface {v10, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const-string/jumbo v0, "zoom"

    invoke-interface {v10, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string/jumbo v0, "email"

    invoke-interface {v10, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string/jumbo v0, "sort"

    const-string/jumbo v3, "comments.updated_at"

    invoke-interface {v10, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getCommentsbyUserUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 98
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v12}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getUserID()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 105
    invoke-static {v1, v10}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->constructUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 107
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->getStandardHeaders(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    .line 112
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->listener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->c:Landroid/content/Context;

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    .line 114
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    new-instance v3, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;

    invoke-direct {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;-><init>()V

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 115
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    const-string/jumbo v3, "GetMyCommentsTask"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 117
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->add(Lcom/android/volley/Request;)V

    .line 120
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_1
    return-void

    .line 74
    .end local v1    # "url":Ljava/lang/String;
    .end local v10    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    const-string/jumbo v0, "nobody@example.com"

    invoke-virtual {v11, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    goto/16 :goto_0

    .line 100
    .restart local v1    # "url":Ljava/lang/String;
    .restart local v10    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    new-instance v3, Lcom/android/volley/VolleyError;

    const-string/jumbo v4, "NOT_LOGGED_IN_MY_COMMENTS"

    invoke-direct {v3, v4}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v3}, Lcom/android/volley/Response$ErrorListener;->onErrorResponse(Lcom/android/volley/VolleyError;)V

    goto :goto_1
.end method
