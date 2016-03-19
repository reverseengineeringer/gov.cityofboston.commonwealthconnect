.class public Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;
.super Ljava/lang/Object;
.source "GetCommentsTask.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GetMyCommentsTask"


# instance fields
.field private c:Landroid/content/Context;

.field private errorListener:Lcom/android/volley/Response$ErrorListener;

.field private id:I

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

.field private place:Lcom/seeclickfix/ma/android/objects/loc/Place;

.field private req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "id"    # I
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONArray;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->c:Landroid/content/Context;

    .line 41
    iput p2, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->id:I

    .line 42
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->listener:Lcom/android/volley/Response$Listener;

    .line 43
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 44
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    const-string/jumbo v1, "GetMyCommentsTask"

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 99
    return-void
.end method

.method public execute()V
    .locals 9

    .prologue
    .line 47
    new-instance v7, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->c:Landroid/content/Context;

    invoke-direct {v7, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 49
    .local v7, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    const-string/jumbo v0, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v7, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 52
    const/4 v8, 0x0

    .line 54
    .local v8, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v8

    .line 56
    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 62
    :goto_0
    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->getParamsMap()Ljava/util/Map;

    move-result-object v6

    .line 64
    .local v6, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->c:Landroid/content/Context;

    invoke-static {v6, v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v6

    .line 68
    const/4 v1, 0x0

    .line 70
    .local v1, "url":Ljava/lang/String;
    const-string/jumbo v0, "lat"

    invoke-interface {v6, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string/jumbo v0, "lng"

    invoke-interface {v6, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    const-string/jumbo v0, "zoom"

    invoke-interface {v6, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    const-string/jumbo v0, "exclude_activity"

    const-string/jumbo v3, "true"

    invoke-interface {v6, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getCommentsUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 78
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 80
    invoke-static {v1, v6}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->constructUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 82
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->getStandardHeaders(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    .line 87
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->listener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->c:Landroid/content/Context;

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    .line 88
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    new-instance v3, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;

    invoke-direct {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;-><init>()V

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 89
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    const-string/jumbo v3, "GetMyCommentsTask"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->add(Lcom/android/volley/Request;)V

    .line 94
    return-void

    .line 58
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const-string/jumbo v0, "nobody@example.com"

    invoke-virtual {v7, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    goto :goto_0
.end method
