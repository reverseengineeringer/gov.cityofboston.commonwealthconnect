.class public Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
.super Ljava/lang/Object;
.source "GetIssuesMapTask.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final REQUEST_TAG_1:Ljava/lang/String; = "REQUEST_TAG_1"

.field private static final REQUEST_TAG_2:Ljava/lang/String; = "REQUEST_TAG_2"

.field private static final REQUEST_TAG_3:Ljava/lang/String; = "REQUEST_TAG_3"

.field private static final REQUEST_TAG_4:Ljava/lang/String; = "REQUEST_TAG_4"

.field private static final REQUEST_TAG_5:Ljava/lang/String; = "REQUEST_TAG_5"

.field private static final TAG:Ljava/lang/String; = "GetIssuesMapTask"


# instance fields
.field private c:Landroid/content/Context;

.field private errorListener:Lcom/android/volley/Response$ErrorListener;

.field private lat:D

.field private latMax:D

.field private latMin:D

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

.field private lng:D

.field private lngMax:D

.field private lngMin:D

.field private page:I

.field private place:Lcom/seeclickfix/ma/android/objects/loc/Place;

.field private zoom:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;DDFDDDDI)V
    .locals 2
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p5, "lat"    # D
    .param p7, "lng"    # D
    .param p9, "zoom"    # F
    .param p10, "latMin"    # D
    .param p12, "latMax"    # D
    .param p14, "lngMin"    # D
    .param p16, "lngMax"    # D
    .param p18, "page"    # I
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
            "DDFDDDDI)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONArray;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    .line 67
    iput-object p2, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 68
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->listener:Lcom/android/volley/Response$Listener;

    .line 69
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 70
    iput-wide p5, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->lat:D

    .line 71
    iput-wide p7, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->lng:D

    .line 72
    iput p9, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->zoom:F

    .line 73
    iput-wide p10, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->latMin:D

    .line 74
    iput-wide p12, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->latMax:D

    .line 75
    move-wide/from16 v0, p14

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->lngMin:D

    .line 76
    move-wide/from16 v0, p16

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->lngMax:D

    .line 77
    move/from16 v0, p18

    iput v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;DDFI)V
    .locals 1
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p5, "lat"    # D
    .param p7, "lng"    # D
    .param p9, "zoom"    # F
    .param p10, "page"    # I
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
            "DDFI)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONArray;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    .line 91
    iput-object p2, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 92
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->listener:Lcom/android/volley/Response$Listener;

    .line 93
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 94
    iput-wide p5, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->lat:D

    .line 95
    iput-wide p7, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->lng:D

    .line 96
    iput p9, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->zoom:F

    .line 97
    iput p10, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    .line 98
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 192
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    const-string/jumbo v1, "REQUEST_TAG_1"

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 193
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    const-string/jumbo v1, "REQUEST_TAG_2"

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 194
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    const-string/jumbo v1, "REQUEST_TAG_3"

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 195
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    const-string/jumbo v1, "REQUEST_TAG_4"

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 196
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    const-string/jumbo v1, "REQUEST_TAG_5"

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :goto_0
    return-void

    .line 197
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public execute()V
    .locals 12

    .prologue
    const/4 v11, 0x5

    const/4 v10, 0x1

    .line 101
    new-instance v8, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-direct {v8, v3}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 106
    .local v8, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->lat:D

    invoke-virtual {v8, v4, v5}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lat(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 107
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->lng:D

    invoke-virtual {v8, v4, v5}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lng(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 109
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->zoom:F

    invoke-virtual {v8, v3}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->zoom(F)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 110
    const-string/jumbo v3, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v8, v3}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 111
    invoke-virtual {v8, v11}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->numResults(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 113
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 114
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v9

    .line 115
    .local v9, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-virtual {v9}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 121
    .end local v9    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    :goto_0
    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->getParamsMap()Ljava/util/Map;

    move-result-object v7

    .line 123
    .local v7, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v7, v3}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v7

    .line 125
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v6

    .line 127
    .local v6, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIssueFilter()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v7, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 129
    const-string/jumbo v3, "placeCacheKey"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v7, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    if-lez v3, :cond_0

    .line 139
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    invoke-virtual {v8, v3}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->page(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 150
    :cond_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getIssueListUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 153
    .local v1, "url":Ljava/lang/String;
    invoke-static {v1, v7}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->constructUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 157
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->getStandardHeaders(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    .line 159
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->listener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Landroid/content/Context;)V

    .line 161
    .local v0, "req":Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    if-ne v3, v10, :cond_4

    .line 162
    const-string/jumbo v3, "REQUEST_TAG_1"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 174
    :cond_1
    :goto_1
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    if-ne v3, v10, :cond_2

    .line 176
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v3

    const-string/jumbo v4, "REQUEST_TAG_1"

    invoke-virtual {v3, v4}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 177
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v3

    const-string/jumbo v4, "REQUEST_TAG_2"

    invoke-virtual {v3, v4}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 178
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v3

    const-string/jumbo v4, "REQUEST_TAG_3"

    invoke-virtual {v3, v4}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 179
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v3

    const-string/jumbo v4, "REQUEST_TAG_4"

    invoke-virtual {v3, v4}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 180
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v3

    const-string/jumbo v4, "REQUEST_TAG_5"

    invoke-virtual {v3, v4}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 183
    :cond_2
    new-instance v3, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;

    invoke-direct {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;-><init>()V

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 185
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->add(Lcom/android/volley/Request;)V

    .line 188
    return-void

    .line 117
    .end local v0    # "req":Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .end local v7    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    const-string/jumbo v3, "nobody@example.com"

    invoke-virtual {v8, v3}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    goto/16 :goto_0

    .line 163
    .restart local v0    # "req":Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;
    .restart local v1    # "url":Ljava/lang/String;
    .restart local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .restart local v7    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_5

    .line 164
    const-string/jumbo v3, "REQUEST_TAG_2"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    goto :goto_1

    .line 165
    :cond_5
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_6

    .line 166
    const-string/jumbo v3, "REQUEST_TAG_3"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    goto/16 :goto_1

    .line 167
    :cond_6
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_7

    .line 168
    const-string/jumbo v3, "REQUEST_TAG_4"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    goto/16 :goto_1

    .line 169
    :cond_7
    iget v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->page:I

    if-ne v3, v11, :cond_1

    .line 170
    const-string/jumbo v3, "REQUEST_TAG_5"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    goto/16 :goto_1
.end method
