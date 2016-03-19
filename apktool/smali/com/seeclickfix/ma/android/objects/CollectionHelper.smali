.class public Lcom/seeclickfix/ma/android/objects/CollectionHelper;
.super Ljava/lang/Object;
.source "CollectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field public static final DB_COLLECTION:Ljava/lang/String; = "DB_COLLECTION"

.field private static final GLOBAL_DEBUG:Z = false

.field public static final LIST:Ljava/lang/String; = "LIST"

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "CollectionHelper"


# instance fields
.field private lastUpdatedCollection:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/CollectionHelper;, "Lcom/seeclickfix/ma/android/objects/CollectionHelper<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method private checkForData(Ljava/util/List;Lcom/j256/ormlite/dao/ForeignCollection;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TE;>;",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<TE;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/CollectionHelper;, "Lcom/seeclickfix/ma/android/objects/CollectionHelper<TE;>;"
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<TE;>;"
    .local p2, "collectionDB":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<TE;>;"
    const/4 v0, 0x0

    .line 76
    .local v0, "lastCollection":Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Lcom/j256/ormlite/dao/ForeignCollection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 77
    const-string/jumbo v0, "DB_COLLECTION"

    .line 84
    :cond_0
    :goto_0
    return-object v0

    .line 79
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {p2}, Lcom/j256/ormlite/dao/ForeignCollection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    const-string/jumbo v0, "LIST"

    goto :goto_0
.end method


# virtual methods
.method public update(Lcom/j256/ormlite/dao/ForeignCollection;Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .param p3, "mostRecent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<TE;>;",
            "Ljava/util/List",
            "<TE;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/CollectionHelper;, "Lcom/seeclickfix/ma/android/objects/CollectionHelper<TE;>;"
    .local p1, "collectionDB":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<TE;>;"
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<TE;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/CollectionHelper;->lastUpdatedCollection:Ljava/lang/String;

    if-nez v0, :cond_1

    if-nez p3, :cond_1

    .line 48
    invoke-direct {p0, p2, p1}, Lcom/seeclickfix/ma/android/objects/CollectionHelper;->checkForData(Ljava/util/List;Lcom/j256/ormlite/dao/ForeignCollection;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/CollectionHelper;->lastUpdatedCollection:Ljava/lang/String;

    .line 55
    :goto_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/CollectionHelper;->lastUpdatedCollection:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 68
    :cond_0
    :goto_1
    return-void

    .line 51
    :cond_1
    iput-object p3, p0, Lcom/seeclickfix/ma/android/objects/CollectionHelper;->lastUpdatedCollection:Ljava/lang/String;

    goto :goto_0

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/CollectionHelper;->lastUpdatedCollection:Ljava/lang/String;

    const-string/jumbo v1, "DB_COLLECTION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 60
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 61
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 62
    :cond_3
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/CollectionHelper;->lastUpdatedCollection:Ljava/lang/String;

    const-string/jumbo v1, "LIST"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    invoke-interface {p1}, Lcom/j256/ormlite/dao/ForeignCollection;->clear()V

    .line 64
    invoke-interface {p1, p2}, Lcom/j256/ormlite/dao/ForeignCollection;->addAll(Ljava/util/Collection;)Z

    goto :goto_1
.end method
