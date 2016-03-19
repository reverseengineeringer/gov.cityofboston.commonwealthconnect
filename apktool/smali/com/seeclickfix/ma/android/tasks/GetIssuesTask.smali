.class public Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;
.super Ljava/lang/Object;
.source "GetIssuesTask.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GetIssuesTask"


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
    .line 43
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONArray;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    .line 45
    iput-object p2, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 46
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->listener:Lcom/android/volley/Response$Listener;

    .line 47
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 48
    iput p5, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->page:I

    .line 50
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    const-string/jumbo v1, "GetIssuesTask"

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 147
    return-void
.end method

.method public execute()V
    .locals 15

    .prologue
    const/4 v5, 0x0

    .line 53
    new-instance v13, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-direct {v13, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 55
    .local v13, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v8

    .line 56
    .local v8, "lat":D
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v10

    .line 58
    .local v10, "lng":D
    invoke-virtual {v13, v8, v9}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lat(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 59
    invoke-virtual {v13, v10, v11}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lng(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 61
    const/16 v0, 0xc

    invoke-virtual {v13, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->zoom(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 62
    const-string/jumbo v0, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v13, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 63
    const/16 v0, 0xa

    invoke-virtual {v13, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->numResults(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 65
    iget v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->page:I

    if-lez v0, :cond_0

    .line 66
    iget v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->page:I

    invoke-virtual {v13, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->page(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 69
    :cond_0
    const/4 v14, 0x0

    .line 71
    .local v14, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 72
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v14

    .line 73
    invoke-virtual {v14}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 79
    :goto_0
    invoke-virtual {v13}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->getParamsMap()Ljava/util/Map;

    move-result-object v12

    .line 81
    .local v12, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-static {v12, v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v12

    .line 83
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v6

    .line 84
    .local v6, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    new-instance v7, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;

    invoke-direct {v7, v6}, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;-><init>(Lcom/seeclickfix/ma/android/objects/DedicatedApp;)V

    .line 86
    .local v7, "issueFilter":Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;
    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->get()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v12, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 88
    const-string/jumbo v0, "placeCacheKey"

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v12, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const/4 v1, 0x0

    .line 92
    .local v1, "url":Ljava/lang/String;
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 93
    if-eqz v14, :cond_3

    .line 95
    const-string/jumbo v0, "lat"

    invoke-interface {v12, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    const-string/jumbo v0, "lng"

    invoke-interface {v12, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    const-string/jumbo v0, "zoom"

    invoke-interface {v12, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    const-string/jumbo v0, "sort"

    const-string/jumbo v3, "issues.created_at"

    invoke-interface {v12, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getIssuesbyUserUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 103
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v14}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getUserID()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 113
    :goto_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getShouldReload()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 116
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0, v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setShouldReload(Z)V

    .line 120
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/volley/RequestQueue;->getCache()Lcom/android/volley/Cache;

    move-result-object v0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getCacheKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/android/volley/Cache;->remove(Ljava/lang/String;)V

    .line 124
    :cond_1
    invoke-static {v1, v12}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->constructUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 126
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->getStandardHeaders(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    .line 131
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->listener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    .line 133
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    const-string/jumbo v3, "GetIssuesTask"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 137
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->getCacheKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setCacheKey(Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->add(Lcom/android/volley/Request;)V

    .line 142
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_2
    return-void

    .line 75
    .end local v1    # "url":Ljava/lang/String;
    .end local v6    # "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .end local v7    # "issueFilter":Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;
    .end local v12    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    const-string/jumbo v0, "nobody@example.com"

    invoke-virtual {v13, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    goto/16 :goto_0

    .line 105
    .restart local v1    # "url":Ljava/lang/String;
    .restart local v6    # "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .restart local v7    # "issueFilter":Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;
    .restart local v12    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    new-instance v3, Lcom/android/volley/VolleyError;

    const-string/jumbo v4, "NOT_LOGGED_IN_MY_REPORTS"

    invoke-direct {v3, v4}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v3}, Lcom/android/volley/Response$ErrorListener;->onErrorResponse(Lcom/android/volley/VolleyError;)V

    goto :goto_2

    .line 109
    :cond_4
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getIssueListUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method
