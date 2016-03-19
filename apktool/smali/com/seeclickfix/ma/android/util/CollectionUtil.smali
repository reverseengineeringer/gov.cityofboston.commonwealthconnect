.class public Lcom/seeclickfix/ma/android/util/CollectionUtil;
.super Ljava/lang/Object;
.source "CollectionUtil.java"


# static fields
.field private static final EMPTY_ARRAY:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/seeclickfix/ma/android/util/CollectionUtil;->EMPTY_ARRAY:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isNotNullOrEmpty(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-static {p0}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->isNullOrEmpty(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 32
    .local v0, "isNotNullOrEmpty":Z
    :goto_0
    return v0

    .line 30
    .end local v0    # "isNotNullOrEmpty":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNullOrEmpty(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v0, 0x1

    .line 8
    if-nez p0, :cond_1

    .line 15
    :cond_0
    :goto_0
    return v0

    .line 10
    :cond_1
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 12
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 15
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static nullToEmpty([Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p0, "array"    # [Ljava/lang/String;

    .prologue
    .line 22
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 23
    :cond_0
    sget-object p0, Lcom/seeclickfix/ma/android/util/CollectionUtil;->EMPTY_ARRAY:[Ljava/lang/String;

    .line 25
    .end local p0    # "array":[Ljava/lang/String;
    :cond_1
    return-object p0
.end method
