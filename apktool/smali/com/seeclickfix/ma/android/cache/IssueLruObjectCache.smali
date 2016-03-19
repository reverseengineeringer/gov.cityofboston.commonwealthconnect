.class public Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;
.super Landroid/support/v4/util/LruCache;
.source "IssueLruObjectCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/util/LruCache",
        "<",
        "Ljava/lang/Integer;",
        "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
        ">;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "IssueLruObjectCache"

.field private static singletonInstance:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;


# instance fields
.field private cacheTag:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 25
    const/16 v0, 0x12c

    invoke-direct {p0, v0}, Landroid/support/v4/util/LruCache;-><init>(I)V

    .line 26
    return-void
.end method

.method public static getInstance(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    .line 30
    sget-object v0, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->singletonInstance:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->singletonInstance:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    .line 32
    sget-object v0, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->singletonInstance:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    iput-object p0, v0, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->cacheTag:Ljava/lang/String;

    .line 37
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->singletonInstance:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    return-object v0
.end method


# virtual methods
.method public getCacheTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->cacheTag:Ljava/lang/String;

    return-object v0
.end method
