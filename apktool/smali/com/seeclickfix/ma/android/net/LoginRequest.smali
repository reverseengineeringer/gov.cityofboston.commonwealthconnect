.class public final Lcom/seeclickfix/ma/android/net/LoginRequest;
.super Ljava/lang/Object;
.source "LoginRequest.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field public static final POST:Ljava/lang/String; = "POST"

.field private static final TAG:Ljava/lang/String; = "LoginRequest"


# instance fields
.field private final c:Landroid/content/Context;

.field private final email:Ljava/lang/String;

.field private httpcall:Lorg/apache/http/client/methods/HttpPost;

.field private volatile isAborted:Z

.field private final pwd:Ljava/lang/String;

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "c"    # Landroid/content/Context;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/LoginRequest;->isAborted:Z

    .line 65
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/LoginRequest;->email:Ljava/lang/String;

    .line 66
    iput-object p2, p0, Lcom/seeclickfix/ma/android/net/LoginRequest;->pwd:Ljava/lang/String;

    .line 67
    iput-object p3, p0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    .line 68
    invoke-static {p3}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getLoginUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/LoginRequest;->url:Ljava/lang/String;

    .line 69
    return-void
.end method

.method private saveCookie(Lorg/apache/http/HttpResponse;)V
    .locals 22
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 155
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v13

    .line 158
    .local v13, "headers":[Lorg/apache/http/Header;
    move-object v4, v13

    .local v4, "arr$":[Lorg/apache/http/Header;
    array-length v15, v4

    .local v15, "len$":I
    const/4 v14, 0x0

    .local v14, "i$":I
    :goto_0
    if-ge v14, v15, :cond_2

    aget-object v12, v4, v14

    .line 163
    .local v12, "h":Lorg/apache/http/Header;
    invoke-interface {v12}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v17

    .line 165
    .local v17, "val":Ljava/lang/String;
    const-string/jumbo v18, "_scf_session_key"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 166
    const-string/jumbo v18, "="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    .line 167
    .local v8, "equalsSign":I
    const-string/jumbo v18, ";"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v16

    .line 169
    .local v16, "semicolon":I
    add-int/lit8 v18, v8, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 173
    .local v5, "cookieString":Ljava/lang/String;
    const-string/jumbo v18, "Pref:COOKIE"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v5, v1}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 176
    .end local v5    # "cookieString":Ljava/lang/String;
    .end local v8    # "equalsSign":I
    .end local v16    # "semicolon":I
    :cond_0
    const-string/jumbo v18, "expires="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 179
    const-string/jumbo v18, "expires="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v18

    add-int/lit8 v9, v18, 0x8

    .line 180
    .local v9, "expiresIndex":I
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v7

    .line 182
    .local v7, "endIndex":I
    move-object/from16 v0, v17

    invoke-virtual {v0, v9, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 186
    .local v10, "expiresString":Ljava/lang/String;
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string/jumbo v18, "EEE, dd-MMM-yyyy kk:mm:ss z"

    move-object/from16 v0, v18

    invoke-direct {v6, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 187
    .local v6, "df":Ljava/text/DateFormat;
    const/4 v11, 0x0

    .line 190
    .local v11, "expiryDate":Ljava/util/Date;
    :try_start_0
    invoke-virtual {v6, v10}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v11

    .line 191
    const-string/jumbo v18, "Pref:COOKIE_EXPIRES_MS"

    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    move-object/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putLong(Ljava/lang/String;JLandroid/content/Context;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    .end local v6    # "df":Ljava/text/DateFormat;
    .end local v7    # "endIndex":I
    .end local v9    # "expiresIndex":I
    .end local v10    # "expiresString":Ljava/lang/String;
    .end local v11    # "expiryDate":Ljava/util/Date;
    :cond_1
    :goto_1
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 202
    .end local v12    # "h":Lorg/apache/http/Header;
    .end local v17    # "val":Ljava/lang/String;
    :cond_2
    return-void

    .line 192
    .restart local v6    # "df":Ljava/text/DateFormat;
    .restart local v7    # "endIndex":I
    .restart local v9    # "expiresIndex":I
    .restart local v10    # "expiresString":Ljava/lang/String;
    .restart local v11    # "expiryDate":Ljava/util/Date;
    .restart local v12    # "h":Lorg/apache/http/Header;
    .restart local v17    # "val":Ljava/lang/String;
    :catch_0
    move-exception v18

    goto :goto_1
.end method


# virtual methods
.method public abort()V
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/LoginRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v0, :cond_0

    .line 75
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/LoginRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpPost;->abort()V

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/LoginRequest;->isAborted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :cond_0
    :goto_0
    return-void

    .line 77
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public authenticate()Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .locals 18

    .prologue
    .line 84
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0c0065

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 85
    .local v1, "authError":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0c0073

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 87
    .local v11, "statusCodeMsg":Ljava/lang/String;
    new-instance v12, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    invoke-direct {v12, v1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;-><init>(Ljava/lang/String;)V

    .line 88
    .local v12, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    new-instance v7, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v7}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 90
    .local v7, "localContext":Lorg/apache/http/protocol/HttpContext;
    const/4 v6, 0x0

    .line 91
    .local v6, "jsonResponse":Ljava/lang/String;
    new-instance v9, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v9}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 92
    .local v9, "params":Lorg/apache/http/params/HttpParams;
    new-instance v2, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v2}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    .line 93
    .local v2, "cookieStore":Lorg/apache/http/client/CookieStore;
    const-string/jumbo v14, "http.protocol.version"

    sget-object v15, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-interface {v9, v14, v15}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 94
    const-string/jumbo v14, "http.useragent"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    invoke-static {v15}, Lcom/seeclickfix/ma/android/config/AppBuild;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v9, v14, v15}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 95
    const-string/jumbo v14, "http.protocol.cookie-policy"

    const-string/jumbo v15, "compatibility"

    invoke-interface {v9, v14, v15}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 96
    new-instance v5, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v5, v9}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 99
    .local v5, "httpclient":Lorg/apache/http/client/HttpClient;
    new-instance v14, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->url:Ljava/lang/String;

    invoke-direct {v14, v15}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    .line 103
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v8, "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v14, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v15, "login"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->email:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-direct/range {v14 .. v16}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    new-instance v14, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v15, "password"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->pwd:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-direct/range {v14 .. v16}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance v14, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v15, "api_key"

    const-string/jumbo v16, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-direct/range {v14 .. v16}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    invoke-static {v14, v8}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addDeviceNameValues(Landroid/content/Context;Ljava/util/List;)V

    .line 113
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    new-instance v15, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v15, v8}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    invoke-virtual {v14, v15}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 114
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    invoke-static {v14, v15}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->setStandardHeadersOnPost(Lorg/apache/http/client/methods/HttpPost;Landroid/content/Context;)V

    .line 115
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    invoke-interface {v5, v14, v7}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    .line 119
    .local v10, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    .line 121
    .local v4, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v4, :cond_0

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->isAborted:Z

    if-nez v14, :cond_0

    .line 124
    invoke-static {v10}, Lcom/seeclickfix/ma/android/net/util/ResponseHelper;->wasSuccessful(Lorg/apache/http/HttpResponse;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 125
    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v6

    .line 126
    invoke-static {v6}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->from_json(Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v12

    .line 134
    :cond_0
    :goto_0
    invoke-virtual {v12}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->isAuthenticated()Z

    move-result v14

    if-eqz v14, :cond_1

    .line 138
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/seeclickfix/ma/android/net/LoginRequest;->saveCookie(Lorg/apache/http/HttpResponse;)V

    .line 140
    const-string/jumbo v14, "Pref:AUTH_USER_JSON"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    invoke-static {v14, v6, v15}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 150
    .end local v4    # "entity":Lorg/apache/http/HttpEntity;
    .end local v10    # "response":Lorg/apache/http/HttpResponse;
    :cond_1
    :goto_1
    return-object v12

    .line 128
    .restart local v4    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v10    # "response":Lorg/apache/http/HttpResponse;
    :cond_2
    new-instance v13, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    const-string/jumbo v14, "%s (%s: %d)"

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v1, v15, v16

    const/16 v16, 0x1

    aput-object v11, v15, v16

    const/16 v16, 0x2

    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v12    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .local v13, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    move-object v12, v13

    .end local v13    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .restart local v12    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    goto :goto_0

    .line 145
    .end local v4    # "entity":Lorg/apache/http/HttpEntity;
    .end local v10    # "response":Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v3

    .line 147
    .local v3, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/net/LoginRequest;->c:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0c006c

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->setResponse(Ljava/lang/String;)V

    goto :goto_1

    .line 143
    .end local v3    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v14

    goto :goto_1
.end method
