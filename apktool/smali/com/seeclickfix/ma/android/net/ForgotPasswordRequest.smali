.class public final Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;
.super Ljava/lang/Object;
.source "ForgotPasswordRequest.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field public static final POST:Ljava/lang/String; = "POST"

.field private static final TAG:Ljava/lang/String; = "ForgotPasswordRequest"


# instance fields
.field private final c:Landroid/content/Context;

.field private final email:Ljava/lang/String;

.field private httpcall:Lorg/apache/http/client/methods/HttpPost;

.field private volatile isAborted:Z

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->isAborted:Z

    .line 52
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->email:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->c:Landroid/content/Context;

    .line 54
    invoke-static {p2}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getForgotPasswordUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->url:Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public abort()V
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v0, :cond_0

    .line 61
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpPost;->abort()V

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->isAborted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :cond_0
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public sendEmail()Ljava/lang/String;
    .locals 10

    .prologue
    .line 70
    new-instance v3, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v3}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 72
    .local v3, "localContext":Lorg/apache/http/protocol/HttpContext;
    new-instance v5, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v5}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 73
    .local v5, "params":Lorg/apache/http/params/HttpParams;
    const-string/jumbo v7, "http.protocol.version"

    sget-object v8, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-interface {v5, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 74
    const-string/jumbo v7, "http.useragent"

    iget-object v8, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->c:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/config/AppBuild;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 75
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2, v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 77
    .local v2, "httpclient":Lorg/apache/http/client/HttpClient;
    new-instance v7, Lorg/apache/http/client/methods/HttpPost;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->url:Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    .line 79
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v4, "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v7, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v8, "user[login]"

    iget-object v9, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->email:Ljava/lang/String;

    invoke-direct {v7, v8, v9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    new-instance v7, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v8, "api_key"

    const-string/jumbo v9, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-direct {v7, v8, v9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->c:Landroid/content/Context;

    invoke-static {v7, v4}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addDeviceNameValues(Landroid/content/Context;Ljava/util/List;)V

    .line 88
    :try_start_0
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    new-instance v8, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v8, v4}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    invoke-virtual {v7, v8}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 89
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->c:Landroid/content/Context;

    invoke-static {v7, v8}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->setStandardHeadersOnPost(Lorg/apache/http/client/methods/HttpPost;Landroid/content/Context;)V

    .line 90
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    invoke-interface {v2, v7, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 94
    .local v6, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 96
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v1, :cond_0

    iget-boolean v7, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->isAborted:Z

    if-nez v7, :cond_0

    .line 97
    invoke-static {v6}, Lcom/seeclickfix/ma/android/net/util/ResponseHelper;->wasSuccessful(Lorg/apache/http/HttpResponse;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 98
    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 109
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    :goto_0
    return-object v7

    .line 104
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Ljava/io/IOException;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->c:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0c006c

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 102
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v7

    .line 109
    :cond_0
    const/4 v7, 0x0

    goto :goto_0
.end method
