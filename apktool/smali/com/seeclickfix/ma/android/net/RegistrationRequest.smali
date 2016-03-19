.class public final Lcom/seeclickfix/ma/android/net/RegistrationRequest;
.super Ljava/lang/Object;
.source "RegistrationRequest.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field public static final POST:Ljava/lang/String; = "POST"

.field private static final TAG:Ljava/lang/String; = "RegistrationRequest"


# instance fields
.field private final c:Landroid/content/Context;

.field private httpcall:Lorg/apache/http/client/methods/HttpPost;

.field private volatile isAborted:Z

.field private response:Lorg/apache/http/HttpResponse;

.field private final url:Ljava/lang/String;

.field private final userRegObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/user/UserReg;Landroid/content/Context;)V
    .locals 1
    .param p1, "userRegObj"    # Lcom/seeclickfix/ma/android/objects/user/UserReg;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->isAborted:Z

    .line 67
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->userRegObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    .line 68
    iput-object p2, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->c:Landroid/content/Context;

    .line 69
    invoke-static {p2}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getRegisterUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->url:Ljava/lang/String;

    .line 70
    return-void
.end method

.method private addPostVarsToEntity(Lorg/apache/http/entity/mime/MultipartEntity;Lcom/seeclickfix/ma/android/objects/user/UserReg;)V
    .locals 6
    .param p1, "multiEntity"    # Lorg/apache/http/entity/mime/MultipartEntity;
    .param p2, "userRegObj"    # Lcom/seeclickfix/ma/android/objects/user/UserReg;

    .prologue
    .line 217
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 219
    .local v2, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->c:Landroid/content/Context;

    invoke-static {v2, v4}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    .line 221
    const-string/jumbo v4, "api_key"

    const-string/jumbo v5, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    const-string/jumbo v4, "user[email]"

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->getEmail()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    const-string/jumbo v4, "user[name]"

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    const-string/jumbo v4, "user[password]"

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->getPassword()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    const-string/jumbo v4, "user[password_confirmation]"

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->getPasswordConfirm()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    const-string/jumbo v4, "user[registration_source]"

    iget-object v5, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->c:Landroid/content/Context;

    invoke-static {v5}, Lcom/seeclickfix/ma/android/config/AppBuild;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 230
    .local v1, "key":Ljava/lang/String;
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 232
    .local v3, "val":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 237
    :try_start_0
    new-instance v4, Lorg/apache/http/entity/mime/content/StringBody;

    invoke-direct {v4, v3}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1, v4}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 238
    :catch_0
    move-exception v4

    goto :goto_0

    .line 243
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "val":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private saveCookie(Lorg/apache/http/HttpResponse;)V
    .locals 22
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 163
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v13

    .line 166
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

    .line 171
    .local v12, "h":Lorg/apache/http/Header;
    invoke-interface {v12}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v17

    .line 173
    .local v17, "val":Ljava/lang/String;
    const-string/jumbo v18, "_scf_session_key"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 174
    const-string/jumbo v18, "="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    .line 175
    .local v8, "equalsSign":I
    const-string/jumbo v18, ";"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v16

    .line 177
    .local v16, "semicolon":I
    add-int/lit8 v18, v8, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 181
    .local v5, "cookieString":Ljava/lang/String;
    const-string/jumbo v18, "Pref:COOKIE"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->c:Landroid/content/Context;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v5, v1}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 184
    .end local v5    # "cookieString":Ljava/lang/String;
    .end local v8    # "equalsSign":I
    .end local v16    # "semicolon":I
    :cond_0
    const-string/jumbo v18, "expires="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 187
    const-string/jumbo v18, "expires="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v18

    add-int/lit8 v9, v18, 0x8

    .line 188
    .local v9, "expiresIndex":I
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v7

    .line 190
    .local v7, "endIndex":I
    move-object/from16 v0, v17

    invoke-virtual {v0, v9, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 197
    .local v10, "expiresString":Ljava/lang/String;
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string/jumbo v18, "EEE, dd-MMM-yyyy kk:mm:ss z"

    move-object/from16 v0, v18

    invoke-direct {v6, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 198
    .local v6, "df":Ljava/text/DateFormat;
    const/4 v11, 0x0

    .line 201
    .local v11, "expiryDate":Ljava/util/Date;
    :try_start_0
    invoke-virtual {v6, v10}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v11

    .line 202
    const-string/jumbo v18, "Pref:COOKIE_EXPIRES_MS"

    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->c:Landroid/content/Context;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    move-object/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putLong(Ljava/lang/String;JLandroid/content/Context;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .end local v6    # "df":Ljava/text/DateFormat;
    .end local v7    # "endIndex":I
    .end local v9    # "expiresIndex":I
    .end local v10    # "expiresString":Ljava/lang/String;
    .end local v11    # "expiryDate":Ljava/util/Date;
    :cond_1
    :goto_1
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 213
    .end local v12    # "h":Lorg/apache/http/Header;
    .end local v17    # "val":Ljava/lang/String;
    :cond_2
    return-void

    .line 203
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
    .line 74
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v0, :cond_0

    .line 76
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpPost;->abort()V

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->isAborted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 78
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public connect()Ljava/lang/String;
    .locals 14

    .prologue
    .line 96
    new-instance v5, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v5}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 98
    .local v5, "localContext":Lorg/apache/http/protocol/HttpContext;
    const/4 v9, 0x0

    .line 99
    .local v9, "result":Ljava/lang/String;
    new-instance v8, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v8}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 100
    .local v8, "params":Lorg/apache/http/params/HttpParams;
    new-instance v0, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    .line 101
    .local v0, "cookieStore":Lorg/apache/http/client/CookieStore;
    const-string/jumbo v12, "http.protocol.version"

    sget-object v13, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-interface {v8, v12, v13}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 102
    const-string/jumbo v12, "http.useragent"

    iget-object v13, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->c:Landroid/content/Context;

    invoke-static {v13}, Lcom/seeclickfix/ma/android/config/AppBuild;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v8, v12, v13}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 103
    const-string/jumbo v12, "http.protocol.cookie-policy"

    const-string/jumbo v13, "compatibility"

    invoke-interface {v8, v12, v13}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 104
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4, v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 106
    .local v4, "httpclient":Lorg/apache/http/client/HttpClient;
    new-instance v12, Lorg/apache/http/client/methods/HttpPost;

    iget-object v13, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->url:Ljava/lang/String;

    invoke-direct {v12, v13}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    iput-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    .line 107
    iget-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    iget-object v13, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->c:Landroid/content/Context;

    invoke-static {v12, v13}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->setStandardHeadersOnPost(Lorg/apache/http/client/methods/HttpPost;Landroid/content/Context;)V

    .line 109
    new-instance v7, Lorg/apache/http/entity/mime/MultipartEntity;

    sget-object v12, Lorg/apache/http/entity/mime/HttpMultipartMode;->BROWSER_COMPATIBLE:Lorg/apache/http/entity/mime/HttpMultipartMode;

    invoke-direct {v7, v12}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>(Lorg/apache/http/entity/mime/HttpMultipartMode;)V

    .line 111
    .local v7, "multipartEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    iget-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->userRegObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    invoke-direct {p0, v7, v12}, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->addPostVarsToEntity(Lorg/apache/http/entity/mime/MultipartEntity;Lcom/seeclickfix/ma/android/objects/user/UserReg;)V

    .line 113
    iget-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->userRegObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    invoke-virtual {v12}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->getAvatarImagePath()Ljava/lang/String;

    move-result-object v6

    .line 115
    .local v6, "localImagePath":Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 123
    :cond_0
    :try_start_0
    iget-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v12, v7}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 124
    iget-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    invoke-interface {v4, v12, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v12

    iput-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->response:Lorg/apache/http/HttpResponse;

    .line 126
    iget-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v12}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    .line 128
    .local v3, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v3, :cond_1

    iget-boolean v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->isAborted:Z

    if-nez v12, :cond_1

    .line 129
    invoke-static {v3}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v9

    .line 134
    :cond_1
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 135
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    const-class v12, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    invoke-virtual {v1, v9, v12}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v11

    .line 136
    .local v11, "userObjArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    const/4 v12, 0x0

    invoke-interface {v11, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 138
    .local v10, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    if-eqz v10, :cond_2

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->isAuthenticated()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 142
    iget-object v12, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->response:Lorg/apache/http/HttpResponse;

    invoke-direct {p0, v12}, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->saveCookie(Lorg/apache/http/HttpResponse;)V

    .line 143
    const-string/jumbo v12, "Pref:AUTH_USER_JSON"

    iget-object v13, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->c:Landroid/content/Context;

    invoke-static {v12, v9, v13}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    .end local v1    # "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    .end local v3    # "entity":Lorg/apache/http/HttpEntity;
    .end local v10    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .end local v11    # "userObjArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    :cond_2
    :goto_0
    return-object v9

    .line 150
    :catch_0
    move-exception v2

    .line 153
    .local v2, "e":Ljava/lang/Exception;
    if-eqz v9, :cond_2

    goto :goto_0

    .line 148
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v12

    goto :goto_0

    .line 146
    :catch_2
    move-exception v12

    goto :goto_0
.end method

.method public getHttpCode()I
    .locals 2

    .prologue
    .line 85
    iget-object v1, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->response:Lorg/apache/http/HttpResponse;

    if-eqz v1, :cond_0

    .line 86
    iget-object v1, p0, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    .line 88
    .local v0, "statusLine":Lorg/apache/http/StatusLine;
    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 91
    .end local v0    # "statusLine":Lorg/apache/http/StatusLine;
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public wasSuccessful()Z
    .locals 2

    .prologue
    .line 247
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->getHttpCode()I

    move-result v0

    .line 249
    .local v0, "httpCode":I
    const/16 v1, 0xc8

    if-lt v0, v1, :cond_0

    const/16 v1, 0x12c

    if-ge v0, v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
