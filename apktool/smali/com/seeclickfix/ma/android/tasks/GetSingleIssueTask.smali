.class public Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;
.super Ljava/lang/Object;
.source "GetSingleIssueTask.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GetSingleIssueTask"


# instance fields
.field private c:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->c:Landroid/content/Context;

    .line 39
    return-void
.end method


# virtual methods
.method public buildUrl(Ljava/util/Map;I)Ljava/lang/String;
    .locals 8
    .param p2, "issueID"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "optionalParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->c:Landroid/content/Context;

    invoke-direct {v1, v4}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 58
    .local v1, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    const-string/jumbo v4, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 60
    const/4 v3, 0x0

    .line 62
    .local v3, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 63
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v3

    .line 64
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 69
    :goto_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->getParamsMap()Ljava/util/Map;

    move-result-object v0

    .line 70
    .local v0, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 71
    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->c:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    .line 73
    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getSingleIssueUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, "url":Ljava/lang/String;
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v2, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 75
    invoke-static {v2, v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->constructUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    .line 79
    return-object v2

    .line 66
    .end local v0    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "url":Ljava/lang/String;
    :cond_0
    const-string/jumbo v4, "nobody@example.com"

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    goto :goto_0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 90
    return-void
.end method

.method public execute(ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 1
    .param p1, "issueID"    # I
    .param p3, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 84
    .local p2, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONArray;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->execute(ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/util/Map;)V

    .line 85
    return-void
.end method

.method public execute(ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/util/Map;)V
    .locals 6
    .param p1, "issueID"    # I
    .param p3, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p2, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONArray;>;"
    .local p4, "optionalParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, p4, p1}, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->buildUrl(Ljava/util/Map;I)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->getStandardHeaders(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    .line 50
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->c:Landroid/content/Context;

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Landroid/content/Context;)V

    .line 51
    .local v0, "req":Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;
    invoke-virtual {v0, p0}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonArrayRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 53
    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->add(Lcom/android/volley/Request;)V

    .line 54
    return-void
.end method
