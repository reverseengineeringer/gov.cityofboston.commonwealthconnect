.class public Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
.super Ljava/lang/Object;
.source "NetRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/net/NetRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private appContext:Landroid/content/Context;

.field private method:Ljava/lang/String;

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

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "appContext"    # Landroid/content/Context;

    .prologue
    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    const-string/jumbo v0, "GET"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method:Ljava/lang/String;

    .line 210
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    .line 220
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->appContext:Landroid/content/Context;

    .line 221
    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .prologue
    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    const-string/jumbo v0, "GET"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method:Ljava/lang/String;

    .line 210
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    .line 214
    iget-object v0, p1, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->url:Ljava/lang/String;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->url:Ljava/lang/String;

    .line 215
    iget-object v0, p1, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method:Ljava/lang/String;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method:Ljava/lang/String;

    .line 216
    iget-object v0, p1, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->appContext:Landroid/content/Context;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->appContext:Landroid/content/Context;

    .line 217
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->url:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->appContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;

    .prologue
    .line 303
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    return-object p0
.end method

.method public apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 2
    .param p1, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 234
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "api_key"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    return-object p0
.end method

.method public at(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 293
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "at"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    return-object p0
.end method

.method public create()Lcom/seeclickfix/ma/android/net/NetRequest;
    .locals 2

    .prologue
    .line 309
    new-instance v0, Lcom/seeclickfix/ma/android/net/NetRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/net/NetRequest;-><init>(Lcom/seeclickfix/ma/android/net/NetRequest$Builder;Lcom/seeclickfix/ma/android/net/NetRequest$1;)V

    return-object v0
.end method

.method public email(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 269
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "email"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    return-object p0
.end method

.method public getParamsMap()Ljava/util/Map;
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

    .prologue
    .line 313
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    return-object v0
.end method

.method public lat(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 3
    .param p1, "lat"    # D

    .prologue
    .line 249
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "lat"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    return-object p0
.end method

.method public lat(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 2
    .param p1, "lat"    # Ljava/lang/String;

    .prologue
    .line 239
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "lat"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    return-object p0
.end method

.method public lng(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 3
    .param p1, "lng"    # D

    .prologue
    .line 254
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "lng"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    return-object p0
.end method

.method public lng(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 2
    .param p1, "lng"    # Ljava/lang/String;

    .prologue
    .line 244
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "lng"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    return-object p0
.end method

.method public method(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 0
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method:Ljava/lang/String;

    .line 230
    return-object p0
.end method

.method public numResults(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 3
    .param p1, "number"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "num_results"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    return-object p0
.end method

.method public page(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 3
    .param p1, "number"    # I

    .prologue
    .line 280
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "page"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    return-object p0
.end method

.method public paramsMap(Ljava/util/Map;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/seeclickfix/ma/android/net/NetRequest$Builder;"
        }
    .end annotation

    .prologue
    .line 298
    .local p1, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    .line 299
    return-object p0
.end method

.method public placeUrl(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 2
    .param p1, "placeUrl"    # Ljava/lang/String;

    .prologue
    .line 285
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "place_url"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    return-object p0
.end method

.method public url(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 224
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->url:Ljava/lang/String;

    .line 225
    return-object p0
.end method

.method public zoom(F)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 3
    .param p1, "zoom"    # F

    .prologue
    .line 264
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "zoom"

    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    return-object p0
.end method

.method public zoom(I)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    .locals 3
    .param p1, "zoom"    # I

    .prologue
    .line 259
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->paramsMap:Ljava/util/Map;

    const-string/jumbo v1, "zoom"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    return-object p0
.end method
