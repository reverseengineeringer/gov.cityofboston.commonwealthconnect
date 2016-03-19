.class public Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;
.super Ljava/lang/Object;
.source "GetPlacesVolleyTask.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GetUserProfileTask"


# instance fields
.field private c:Landroid/content/Context;

.field private errorListener:Lcom/android/volley/Response$ErrorListener;

.field private listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;

.field private userId:I

.field private userObj:Lcom/seeclickfix/ma/android/objects/user/AuthUser;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "userId"    # I
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 45
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    .line 47
    iput p2, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->userId:I

    .line 48
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->listener:Lcom/android/volley/Response$Listener;

    .line 49
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "userId"    # I
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p5, "userObj"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            "Lcom/seeclickfix/ma/android/objects/user/AuthUser;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    .line 38
    iput p2, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->userId:I

    .line 39
    iput-object p5, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->userObj:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 40
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->listener:Lcom/android/volley/Response$Listener;

    .line 41
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 42
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 92
    return-void
.end method

.method public execute()V
    .locals 8

    .prologue
    .line 57
    new-instance v7, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    invoke-direct {v7, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 60
    .local v7, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    const-string/jumbo v0, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v7, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 63
    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->getParamsMap()Ljava/util/Map;

    move-result-object v6

    .line 65
    .local v6, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    invoke-static {v6, v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v6

    .line 68
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getUserProfileUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "url":Ljava/lang/String;
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->userId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 73
    invoke-static {v1, v6}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->constructUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->getStandardHeaders(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    .line 80
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->listener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;

    .line 82
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;

    invoke-virtual {v0, p0}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 84
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesVolleyTask;->req:Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->add(Lcom/android/volley/Request;)V

    .line 87
    return-void
.end method
