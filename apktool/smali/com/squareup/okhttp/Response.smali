.class public final Lcom/squareup/okhttp/Response;
.super Ljava/lang/Object;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/Response$1;,
        Lcom/squareup/okhttp/Response$Builder;
    }
.end annotation


# instance fields
.field private final body:Lcom/squareup/okhttp/ResponseBody;

.field private volatile cacheControl:Lcom/squareup/okhttp/CacheControl;

.field private cacheResponse:Lcom/squareup/okhttp/Response;

.field private final code:I

.field private final handshake:Lcom/squareup/okhttp/Handshake;

.field private final headers:Lcom/squareup/okhttp/Headers;

.field private final message:Ljava/lang/String;

.field private networkResponse:Lcom/squareup/okhttp/Response;

.field private final priorResponse:Lcom/squareup/okhttp/Response;

.field private final protocol:Lcom/squareup/okhttp/Protocol;

.field private final request:Lcom/squareup/okhttp/Request;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Response$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    # getter for: Lcom/squareup/okhttp/Response$Builder;->request:Lcom/squareup/okhttp/Request;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$000(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Request;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;

    .line 51
    # getter for: Lcom/squareup/okhttp/Response$Builder;->protocol:Lcom/squareup/okhttp/Protocol;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$100(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Protocol;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 52
    # getter for: Lcom/squareup/okhttp/Response$Builder;->code:I
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$200(Lcom/squareup/okhttp/Response$Builder;)I

    move-result v0

    iput v0, p0, Lcom/squareup/okhttp/Response;->code:I

    .line 53
    # getter for: Lcom/squareup/okhttp/Response$Builder;->message:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$300(Lcom/squareup/okhttp/Response$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;

    .line 54
    # getter for: Lcom/squareup/okhttp/Response$Builder;->handshake:Lcom/squareup/okhttp/Handshake;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$400(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 55
    # getter for: Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$500(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    .line 56
    # getter for: Lcom/squareup/okhttp/Response$Builder;->body:Lcom/squareup/okhttp/ResponseBody;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$600(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;

    .line 57
    # getter for: Lcom/squareup/okhttp/Response$Builder;->networkResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$700(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->networkResponse:Lcom/squareup/okhttp/Response;

    .line 58
    # getter for: Lcom/squareup/okhttp/Response$Builder;->cacheResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$800(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 59
    # getter for: Lcom/squareup/okhttp/Response$Builder;->priorResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$900(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 60
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Response$Builder;Lcom/squareup/okhttp/Response$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/squareup/okhttp/Response$Builder;
    .param p2, "x1"    # Lcom/squareup/okhttp/Response$1;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Response;-><init>(Lcom/squareup/okhttp/Response$Builder;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Request;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Protocol;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/squareup/okhttp/Response;)I
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget v0, p0, Lcom/squareup/okhttp/Response;->code:I

    return v0
.end method

.method static synthetic access$1400(Lcom/squareup/okhttp/Response;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Handshake;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->handshake:Lcom/squareup/okhttp/Handshake;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Headers;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/ResponseBody;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->networkResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->cacheResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .locals 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->priorResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method


# virtual methods
.method public body()Lcom/squareup/okhttp/ResponseBody;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;

    return-object v0
.end method

.method public cacheControl()Lcom/squareup/okhttp/CacheControl;
    .locals 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->cacheControl:Lcom/squareup/okhttp/CacheControl;

    .line 204
    .local v0, "result":Lcom/squareup/okhttp/CacheControl;
    if-eqz v0, :cond_0

    .end local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    :goto_0
    return-object v0

    .restart local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    :cond_0
    iget-object v1, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    invoke-static {v1}, Lcom/squareup/okhttp/CacheControl;->parse(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/CacheControl;

    move-result-object v0

    .end local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    iput-object v0, p0, Lcom/squareup/okhttp/Response;->cacheControl:Lcom/squareup/okhttp/CacheControl;

    goto :goto_0
.end method

.method public cacheResponse()Lcom/squareup/okhttp/Response;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->cacheResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method public challenges()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Challenge;",
            ">;"
        }
    .end annotation

    .prologue
    .line 188
    iget v1, p0, Lcom/squareup/okhttp/Response;->code:I

    const/16 v2, 0x191

    if-ne v1, v2, :cond_0

    .line 189
    const-string/jumbo v0, "WWW-Authenticate"

    .line 195
    .local v0, "responseField":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/squareup/okhttp/internal/http/OkHeaders;->parseChallenges(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .end local v0    # "responseField":Ljava/lang/String;
    :goto_1
    return-object v1

    .line 190
    :cond_0
    iget v1, p0, Lcom/squareup/okhttp/Response;->code:I

    const/16 v2, 0x197

    if-ne v1, v2, :cond_1

    .line 191
    const-string/jumbo v0, "Proxy-Authenticate"

    .restart local v0    # "responseField":Ljava/lang/String;
    goto :goto_0

    .line 193
    .end local v0    # "responseField":Ljava/lang/String;
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    goto :goto_1
.end method

.method public code()I
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lcom/squareup/okhttp/Response;->code:I

    return v0
.end method

.method public handshake()Lcom/squareup/okhttp/Handshake;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->handshake:Lcom/squareup/okhttp/Handshake;

    return-object v0
.end method

.method public header(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 120
    iget-object v1, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "result":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "result":Ljava/lang/String;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public headers()Lcom/squareup/okhttp/Headers;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    return-object v0
.end method

.method public headers(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public isRedirect()Z
    .locals 1

    .prologue
    .line 138
    iget v0, p0, Lcom/squareup/okhttp/Response;->code:I

    packed-switch v0, :pswitch_data_0

    .line 146
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 144
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 138
    nop

    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public isSuccessful()Z
    .locals 2

    .prologue
    .line 95
    iget v0, p0, Lcom/squareup/okhttp/Response;->code:I

    const/16 v1, 0xc8

    if-lt v0, v1, :cond_0

    iget v0, p0, Lcom/squareup/okhttp/Response;->code:I

    const/16 v1, 0x12c

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public message()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;

    return-object v0
.end method

.method public networkResponse()Lcom/squareup/okhttp/Response;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->networkResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method public newBuilder()Lcom/squareup/okhttp/Response$Builder;
    .locals 2

    .prologue
    .line 133
    new-instance v0, Lcom/squareup/okhttp/Response$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/Response$Builder;-><init>(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response$1;)V

    return-object v0
.end method

.method public priorResponse()Lcom/squareup/okhttp/Response;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->priorResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method public protocol()Lcom/squareup/okhttp/Protocol;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;

    return-object v0
.end method

.method public request()Lcom/squareup/okhttp/Request;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Response{protocol="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/squareup/okhttp/Response;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", message="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
