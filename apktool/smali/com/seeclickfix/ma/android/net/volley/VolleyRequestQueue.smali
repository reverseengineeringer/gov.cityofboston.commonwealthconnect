.class public Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;
.super Ljava/lang/Object;
.source "VolleyRequestQueue.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "VolleyRequestQueue"

.field private static singletonInstance:Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;


# instance fields
.field private c:Landroid/content/Context;

.field private mIconLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private mRequestQueue:Lcom/android/volley/RequestQueue;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->c:Landroid/content/Context;

    .line 39
    invoke-static {p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mRequestQueue:Lcom/android/volley/RequestQueue;

    .line 40
    new-instance v0, Lcom/android/volley/toolbox/ImageLoader;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mRequestQueue:Lcom/android/volley/RequestQueue;

    new-instance v2, Lcom/seeclickfix/ma/android/cache/LruImageCache;

    invoke-direct {v2}, Lcom/seeclickfix/ma/android/cache/LruImageCache;-><init>()V

    invoke-direct {v0, v1, v2}, Lcom/android/volley/toolbox/ImageLoader;-><init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/toolbox/ImageLoader$ImageCache;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 41
    new-instance v0, Lcom/android/volley/toolbox/ImageLoader;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mRequestQueue:Lcom/android/volley/RequestQueue;

    new-instance v2, Lcom/seeclickfix/ma/android/cache/LruImageCache;

    const/high16 v3, 0x100000

    invoke-direct {v2, v3}, Lcom/seeclickfix/ma/android/cache/LruImageCache;-><init>(I)V

    invoke-direct {v0, v1, v2}, Lcom/android/volley/toolbox/ImageLoader;-><init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/toolbox/ImageLoader$ImageCache;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mIconLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 43
    return-void
.end method

.method public static getInstance()Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->singletonInstance:Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 46
    sget-object v0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->singletonInstance:Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->singletonInstance:Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    .line 50
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->singletonInstance:Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    return-object v0
.end method


# virtual methods
.method public add(Lcom/android/volley/Request;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "req":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 68
    return-void
.end method

.method public cancelByTag(Ljava/lang/Object;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 88
    return-void
.end method

.method public getIconLoader()Lcom/android/volley/toolbox/ImageLoader;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mIconLoader:Lcom/android/volley/toolbox/ImageLoader;

    return-object v0
.end method

.method public getImageLoader()Lcom/android/volley/toolbox/ImageLoader;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    return-object v0
.end method

.method public getQueue()Lcom/android/volley/RequestQueue;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->mRequestQueue:Lcom/android/volley/RequestQueue;

    return-object v0
.end method
