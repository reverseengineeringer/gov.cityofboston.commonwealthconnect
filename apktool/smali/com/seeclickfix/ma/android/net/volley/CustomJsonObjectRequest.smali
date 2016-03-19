.class public Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;
.super Lcom/android/volley/Request;
.source "CustomJsonObjectRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/volley/Request",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field private c:Landroid/content/Context;

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

.field private mPriority:Lcom/android/volley/Request$Priority;

.field private params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 1
    .param p1, "method"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p5, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    .local p3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p4, "reponseListener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    invoke-direct {p0, p1, p2, p5}, Lcom/android/volley/Request;-><init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V

    .line 68
    sget-object v0, Lcom/android/volley/Request$Priority;->HIGH:Lcom/android/volley/Request$Priority;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->mPriority:Lcom/android/volley/Request$Priority;

    .line 39
    iput-object p4, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->listener:Lcom/android/volley/Response$Listener;

    .line 40
    iput-object p3, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->params:Ljava/util/Map;

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Landroid/content/Context;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p5, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "reponseListener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p4}, Lcom/android/volley/Request;-><init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V

    .line 68
    sget-object v0, Lcom/android/volley/Request$Priority;->HIGH:Lcom/android/volley/Request$Priority;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->mPriority:Lcom/android/volley/Request$Priority;

    .line 31
    iput-object p3, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->listener:Lcom/android/volley/Response$Listener;

    .line 32
    iput-object p2, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->params:Ljava/util/Map;

    .line 33
    iput-object p5, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->c:Landroid/content/Context;

    .line 34
    return-void
.end method


# virtual methods
.method protected bridge synthetic deliverResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 22
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->deliverResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method protected deliverResponse(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->listener:Lcom/android/volley/Response$Listener;

    invoke-interface {v0, p1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    .line 65
    return-void
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 3
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 82
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "User-agent"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->c:Landroid/content/Context;

    invoke-static {v2}, Lcom/seeclickfix/ma/android/config/AppBuild;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    return-object v0
.end method

.method protected getParams()Ljava/util/Map;
    .locals 1
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->params:Ljava/util/Map;

    return-object v0
.end method

.method public getPriority()Lcom/android/volley/Request$Priority;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->mPriority:Lcom/android/volley/Request$Priority;

    return-object v0
.end method

.method protected parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .locals 5
    .param p1, "response"    # Lcom/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    :try_start_0
    new-instance v2, Ljava/lang/String;

    iget-object v3, p1, Lcom/android/volley/NetworkResponse;->data:[B

    iget-object v4, p1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v4}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 53
    .local v2, "jsonString":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/volley/Response;->success(Ljava/lang/Object;Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Response;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 58
    .end local v2    # "jsonString":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lcom/android/volley/ParseError;

    invoke-direct {v3, v0}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v3}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v3

    goto :goto_0

    .line 57
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v1

    .line 58
    .local v1, "je":Lorg/json/JSONException;
    new-instance v3, Lcom/android/volley/ParseError;

    invoke-direct {v3, v1}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v3}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v3

    goto :goto_0
.end method

.method public setPriority(Lcom/android/volley/Request$Priority;)V
    .locals 0
    .param p1, "priority"    # Lcom/android/volley/Request$Priority;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/volley/CustomJsonObjectRequest;->mPriority:Lcom/android/volley/Request$Priority;

    .line 77
    return-void
.end method
