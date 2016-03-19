.class public final Lcom/seeclickfix/ma/android/net/PostComment;
.super Ljava/lang/Object;
.source "PostComment.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field public static final POST:Ljava/lang/String; = "POST"

.field private static final TAG:Ljava/lang/String; = "PostComment"


# instance fields
.field private c:Landroid/content/Context;

.field private data:Lcom/seeclickfix/ma/android/objects/issue/Comment;

.field private httpcall:Lorg/apache/http/client/methods/HttpPost;

.field private volatile isAborted:Z

.field private listener:Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Comment;Landroid/content/Context;)V
    .locals 1
    .param p1, "data"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->isAborted:Z

    .line 65
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/PostComment;->data:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .line 66
    iput-object p2, p0, Lcom/seeclickfix/ma/android/net/PostComment;->c:Landroid/content/Context;

    .line 67
    invoke-static {p2}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getCommentsUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->url:Ljava/lang/String;

    .line 68
    return-void
.end method

.method private addPostVarsToEntity(Lorg/apache/http/entity/mime/MultipartEntity;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 7
    .param p1, "multiEntity"    # Lorg/apache/http/entity/mime/MultipartEntity;
    .param p2, "data"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 182
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 184
    .local v2, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/seeclickfix/ma/android/net/PostComment;->c:Landroid/content/Context;

    invoke-static {v2, v4}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    .line 186
    const-string/jumbo v4, "api_key"

    const-string/jumbo v5, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    const-string/jumbo v4, "comment[comment]"

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getComment()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    const-string/jumbo v4, "comment[comment_type]"

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCommentType()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    const-string/jumbo v4, "comment[email]"

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getEmail()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const-string/jumbo v4, "comment[name]"

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string/jumbo v4, "comment[send_email]"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->isSubscribeEmailNotification()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string/jumbo v4, "issue_id"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
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

    .line 197
    .local v1, "key":Ljava/lang/String;
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 199
    .local v3, "val":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 203
    :try_start_0
    new-instance v4, Lorg/apache/http/entity/mime/content/StringBody;

    invoke-direct {v4, v3}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1, v4}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 205
    :catch_0
    move-exception v4

    goto :goto_0

    .line 210
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "val":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private fail()V
    .locals 3

    .prologue
    .line 225
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->listener:Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->listener:Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/seeclickfix/ma/android/net/PostComment;->data:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;->onCommentResult(ZLcom/seeclickfix/ma/android/objects/issue/Comment;)V

    .line 229
    :cond_0
    return-void
.end method

.method private succeed(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 2
    .param p1, "responseComment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 218
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->listener:Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->listener:Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;

    const/4 v1, 0x1

    invoke-interface {v0, v1, p1}, Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;->onCommentResult(ZLcom/seeclickfix/ma/android/objects/issue/Comment;)V

    .line 222
    :cond_0
    return-void
.end method


# virtual methods
.method public abort()V
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v0, :cond_0

    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpPost;->abort()V

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/net/PostComment;->isAborted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :cond_0
    :goto_0
    return-void

    .line 76
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public connect()Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .locals 23
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 84
    const/4 v14, 0x0

    .line 85
    .local v14, "reponseObj":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    new-instance v10, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v10}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 87
    .local v10, "localContext":Lorg/apache/http/protocol/HttpContext;
    const/16 v17, 0x0

    .line 88
    .local v17, "result":Ljava/lang/String;
    new-instance v13, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v13}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 96
    .local v13, "params":Lorg/apache/http/params/HttpParams;
    const-string/jumbo v18, "http.protocol.version"

    sget-object v19, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v13, v0, v1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 97
    const-string/jumbo v18, "http.useragent"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->c:Landroid/content/Context;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/seeclickfix/ma/android/config/AppBuild;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v13, v0, v1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 98
    const-string/jumbo v18, "http.protocol.cookie-policy"

    const-string/jumbo v19, "compatibility"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v13, v0, v1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 100
    new-instance v3, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v3}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    .line 103
    .local v3, "cookieStore":Lorg/apache/http/client/CookieStore;
    new-instance v2, Lorg/apache/http/impl/cookie/BasicClientCookie;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->c:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/seeclickfix/ma/android/config/AppBuild;->getCookieName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, "Pref:COOKIE"

    const-string/jumbo v20, "Error No Cookie"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->c:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-static/range {v19 .. v21}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v2, v0, v1}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .local v2, "cookie":Lorg/apache/http/impl/cookie/BasicClientCookie;
    const-string/jumbo v18, ".seeclickfix.com"

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setDomain(Ljava/lang/String;)V

    .line 106
    const-string/jumbo v18, "/"

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setPath(Ljava/lang/String;)V

    .line 108
    invoke-interface {v3, v2}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    .line 110
    new-instance v8, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v8, v13}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 111
    .local v8, "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v8, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->setCookieStore(Lorg/apache/http/client/CookieStore;)V

    .line 113
    sget-object v18, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->url:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->data:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-static/range {v18 .. v20}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 116
    .local v7, "formattedUrl":Ljava/lang/String;
    new-instance v18, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v18

    invoke-direct {v0, v7}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/seeclickfix/ma/android/net/PostComment;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    .line 121
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->c:Landroid/content/Context;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->setStandardHeadersOnPost(Lorg/apache/http/client/methods/HttpPost;Landroid/content/Context;)V

    .line 123
    new-instance v12, Lorg/apache/http/entity/mime/MultipartEntity;

    sget-object v18, Lorg/apache/http/entity/mime/HttpMultipartMode;->BROWSER_COMPATIBLE:Lorg/apache/http/entity/mime/HttpMultipartMode;

    move-object/from16 v0, v18

    invoke-direct {v12, v0}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>(Lorg/apache/http/entity/mime/HttpMultipartMode;)V

    .line 125
    .local v12, "multipartEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->data:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v12, v1}, Lcom/seeclickfix/ma/android/net/PostComment;->addPostVarsToEntity(Lorg/apache/http/entity/mime/MultipartEntity;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->data:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCommentImagePath()Ljava/lang/String;

    move-result-object v11

    .line 131
    .local v11, "localImagePath":Ljava/lang/String;
    if-eqz v11, :cond_0

    .line 133
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 134
    .local v9, "imageFile":Ljava/io/File;
    const-string/jumbo v18, "comment[comment_image_attributes][uploaded_data]"

    new-instance v19, Lorg/apache/http/entity/mime/content/FileBody;

    move-object/from16 v0, v19

    invoke-direct {v0, v9}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 138
    .end local v9    # "imageFile":Ljava/io/File;
    :cond_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 139
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->httpcall:Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v8, v0, v10}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v15

    .line 141
    .local v15, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v15}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    .line 143
    .local v6, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v6, :cond_1

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/seeclickfix/ma/android/net/PostComment;->isAborted:Z

    move/from16 v18, v0

    if-nez v18, :cond_1

    .line 144
    invoke-static {v6}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v17

    .line 150
    :cond_1
    const-string/jumbo v18, "{\"base\":[\"Comments are closed for the archived issue\"]}"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 152
    invoke-direct/range {p0 .. p0}, Lcom/seeclickfix/ma/android/net/PostComment;->fail()V

    .line 153
    const/16 v18, 0x0

    .line 177
    .end local v6    # "entity":Lorg/apache/http/HttpEntity;
    .end local v15    # "response":Lorg/apache/http/HttpResponse;
    :goto_0
    return-object v18

    .line 156
    .restart local v6    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v15    # "response":Lorg/apache/http/HttpResponse;
    :cond_2
    new-instance v4, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v4}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 157
    .local v4, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/issue/Comment;>;"
    const-class v18, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v4, v0, v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v16

    .line 158
    .local v16, "responseArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Comment;>;"
    const/16 v18, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-object v14, v0
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 175
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/seeclickfix/ma/android/net/PostComment;->succeed(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    move-object/from16 v18, v14

    .line 177
    goto :goto_0

    .line 161
    .end local v4    # "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/issue/Comment;>;"
    .end local v6    # "entity":Lorg/apache/http/HttpEntity;
    .end local v15    # "response":Lorg/apache/http/HttpResponse;
    .end local v16    # "responseArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Comment;>;"
    :catch_0
    move-exception v5

    .line 163
    .local v5, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-direct/range {p0 .. p0}, Lcom/seeclickfix/ma/android/net/PostComment;->fail()V

    .line 164
    const/16 v18, 0x0

    goto :goto_0

    .line 165
    .end local v5    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v5

    .line 167
    .local v5, "e":Ljava/io/IOException;
    invoke-direct/range {p0 .. p0}, Lcom/seeclickfix/ma/android/net/PostComment;->fail()V

    .line 168
    const/16 v18, 0x0

    goto :goto_0

    .line 169
    .end local v5    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v5

    .line 172
    .local v5, "e":Ljava/lang/Exception;
    invoke-direct/range {p0 .. p0}, Lcom/seeclickfix/ma/android/net/PostComment;->fail()V

    .line 173
    const/16 v18, 0x0

    goto :goto_0
.end method

.method public setOnResultListener(Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;

    .prologue
    .line 213
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/PostComment;->listener:Lcom/seeclickfix/ma/android/net/interfaces/OnCommentResultListener;

    .line 214
    return-void
.end method
