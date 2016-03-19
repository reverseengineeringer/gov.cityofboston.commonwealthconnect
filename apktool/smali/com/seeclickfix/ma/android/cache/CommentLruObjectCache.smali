.class public Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;
.super Landroid/support/v4/util/LruCache;
.source "CommentLruObjectCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/util/LruCache",
        "<",
        "Ljava/lang/Integer;",
        "Lcom/seeclickfix/ma/android/objects/issue/Comment;",
        ">;"
    }
.end annotation


# static fields
.field private static singletonInstance:Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 14
    const/16 v0, 0x12c

    invoke-direct {p0, v0}, Landroid/support/v4/util/LruCache;-><init>(I)V

    .line 15
    return-void
.end method

.method public static getInstance()Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;->singletonInstance:Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;->singletonInstance:Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

    .line 23
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;->singletonInstance:Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

    return-object v0
.end method
