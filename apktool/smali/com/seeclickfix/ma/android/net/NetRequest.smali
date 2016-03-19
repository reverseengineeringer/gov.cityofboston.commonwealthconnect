.class public final Lcom/seeclickfix/ma/android/net/NetRequest;
.super Ljava/lang/Object;
.source "NetRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/net/NetRequest$1;,
        Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field public static final ERROR_CODE_UKNOWN:I = -0x2a

.field public static final GET:Ljava/lang/String; = "GET"

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field public static final POST:Ljava/lang/String; = "POST"

.field private static final TAG:Ljava/lang/String; = "NetRequest"


# instance fields
.field private c:Landroid/content/Context;

.field private httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

.field private volatile isAborted:Z

.field private final method:Ljava/lang/String;

.field private paramsMap:Ljava/util/Map;
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

.field private final url:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->isAborted:Z

    .line 59
    # getter for: Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->url:Ljava/lang/String;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->access$000(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->url:Ljava/lang/String;

    .line 60
    # getter for: Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method:Ljava/lang/String;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->access$100(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->method:Ljava/lang/String;

    .line 61
    # getter for: Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->access$200(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    .line 62
    # getter for: Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->appContext:Landroid/content/Context;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->access$300(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->c:Landroid/content/Context;

    .line 68
    return-void
.end method

.method synthetic constructor <init>(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;Lcom/seeclickfix/ma/android/net/NetRequest$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/net/NetRequest$1;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/net/NetRequest;-><init>(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)V

    return-void
.end method

.method private addGetParams(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/client/methods/HttpUriRequest;
    .locals 9
    .param p1, "httpcall"    # Lorg/apache/http/client/methods/HttpUriRequest;

    .prologue
    .line 153
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .local v3, "sb":Ljava/lang/StringBuilder;
    const-string/jumbo v7, "?"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->size()I

    move-result v7

    if-lez v7, :cond_0

    .line 157
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 158
    .local v1, "key":Ljava/lang/String;
    const/4 v6, 0x0

    .line 160
    .local v6, "val":Ljava/lang/String;
    :try_start_0
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    invoke-interface {v7, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string/jumbo v8, "UTF-8"

    invoke-static {v7, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 161
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "&"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 162
    :catch_0
    move-exception v7

    goto :goto_0

    .line 169
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/lang/String;
    .end local v6    # "val":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 170
    .local v2, "params":Ljava/lang/String;
    const/4 v4, 0x0

    .line 173
    .local v4, "uri":Ljava/net/URI;
    :try_start_1
    new-instance v5, Ljava/net/URI;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v4    # "uri":Ljava/net/URI;
    .local v5, "uri":Ljava/net/URI;
    move-object v4, v5

    .end local v5    # "uri":Ljava/net/URI;
    .restart local v4    # "uri":Ljava/net/URI;
    :goto_1
    move-object v7, p1

    .line 178
    check-cast v7, Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {v7, v4}, Lorg/apache/http/client/methods/HttpGet;->setURI(Ljava/net/URI;)V

    .line 180
    return-object p1

    .line 174
    :catch_1
    move-exception v7

    goto :goto_1
.end method

.method private addPostParams(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/client/methods/HttpUriRequest;
    .locals 6
    .param p1, "httpcall"    # Lorg/apache/http/client/methods/HttpUriRequest;

    .prologue
    .line 186
    new-instance v0, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v0}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 188
    .local v0, "basicParams":Lorg/apache/http/params/HttpParams;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 189
    iget-object v4, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 190
    .local v2, "key":Ljava/lang/String;
    const/4 v3, 0x0

    .line 192
    .local v3, "val":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string/jumbo v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 193
    invoke-interface {v0, v2, v3}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 194
    :catch_0
    move-exception v4

    goto :goto_0

    .line 200
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "val":Ljava/lang/String;
    :cond_0
    invoke-interface {p1, v0}, Lorg/apache/http/client/methods/HttpUriRequest;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 202
    return-object p1
.end method

.method private addStaticParamsToMap()V
    .locals 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->c:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->paramsMap:Ljava/util/Map;

    .line 149
    return-void
.end method


# virtual methods
.method public abort()V
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    if-eqz v0, :cond_0

    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->isAborted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :cond_0
    :goto_0
    return-void

    .line 76
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public executeRequest()Ljava/lang/String;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    const/4 v6, 0x0

    .line 96
    .local v6, "result":Ljava/lang/String;
    new-instance v4, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 99
    .local v4, "params":Lorg/apache/http/params/HttpParams;
    const-string/jumbo v7, "http.protocol.version"

    sget-object v8, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-interface {v4, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 100
    const-string/jumbo v7, "http.useragent"

    iget-object v8, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->c:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/config/AppBuild;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 101
    const-string/jumbo v7, "http.protocol.cookie-policy"

    const-string/jumbo v8, "compatibility"

    invoke-interface {v4, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 103
    new-instance v1, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v1}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    .line 106
    .local v1, "cookieStore":Lorg/apache/http/client/CookieStore;
    new-instance v0, Lorg/apache/http/impl/cookie/BasicClientCookie;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->c:Landroid/content/Context;

    invoke-static {v7}, Lcom/seeclickfix/ma/android/config/AppBuild;->getCookieName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "Pref:COOKIE"

    const-string/jumbo v9, "Error No Cookie"

    iget-object v10, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->c:Landroid/content/Context;

    invoke-static {v8, v9, v10}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v7, v8}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .local v0, "cookie":Lorg/apache/http/impl/cookie/BasicClientCookie;
    const-string/jumbo v7, ".seeclickfix.com"

    invoke-virtual {v0, v7}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setDomain(Ljava/lang/String;)V

    .line 109
    const-string/jumbo v7, "/"

    invoke-virtual {v0, v7}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setPath(Ljava/lang/String;)V

    .line 111
    invoke-interface {v1, v0}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    .line 113
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 114
    .local v3, "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v3, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->setCookieStore(Lorg/apache/http/client/CookieStore;)V

    .line 116
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/net/NetRequest;->addStaticParamsToMap()V

    .line 118
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->method:Ljava/lang/String;

    const-string/jumbo v8, "POST"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 119
    new-instance v7, Lorg/apache/http/client/methods/HttpPost;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->url:Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 120
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-direct {p0, v7}, Lcom/seeclickfix/ma/android/net/NetRequest;->addPostParams(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v7

    iput-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 131
    :goto_0
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-virtual {v3, v7}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 135
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    .line 137
    .local v2, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v2, :cond_0

    iget-boolean v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->isAborted:Z

    if-nez v7, :cond_0

    .line 138
    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v6

    .line 141
    :cond_0
    return-object v6

    .line 124
    .end local v2    # "entity":Lorg/apache/http/HttpEntity;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    :cond_1
    new-instance v7, Lorg/apache/http/client/methods/HttpGet;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->url:Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 125
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-direct {p0, v7}, Lcom/seeclickfix/ma/android/net/NetRequest;->addGetParams(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v7

    iput-object v7, p0, Lcom/seeclickfix/ma/android/net/NetRequest;->httpcall:Lorg/apache/http/client/methods/HttpUriRequest;

    goto :goto_0
.end method

.method public executeRequest(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "defaultResult"    # Ljava/lang/String;

    .prologue
    .line 85
    move-object v0, p1

    .line 87
    .local v0, "result":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/NetRequest;->executeRequest()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 91
    :goto_0
    return-object v0

    .line 88
    :catch_0
    move-exception v1

    goto :goto_0
.end method
