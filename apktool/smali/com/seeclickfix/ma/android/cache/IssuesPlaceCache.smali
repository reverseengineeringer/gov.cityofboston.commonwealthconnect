.class public Lcom/seeclickfix/ma/android/cache/IssuesPlaceCache;
.super Ljava/lang/Object;
.source "IssuesPlaceCache.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "IssuesPlaceCache"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static invalidatePlaceCache(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 4
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 71
    invoke-static {p0}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getPlaceDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 73
    .local v0, "placeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    const-wide/16 v2, 0x0

    invoke-virtual {p1, v2, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setLastSuccessfulListQuery(J)V

    .line 76
    :try_start_0
    invoke-interface {v0, p1}, Lcom/j256/ormlite/dao/Dao;->update(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :goto_0
    return-void

    .line 77
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static isCacheStale(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)Z
    .locals 9
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    const/4 v8, 0x1

    .line 47
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getLastSuccessfulListQuery()J

    move-result-wide v0

    .line 48
    .local v0, "lastUpdate":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 49
    .local v2, "now":J
    const-wide/32 v4, 0x1b7740

    .line 57
    .local v4, "validTime":J
    sub-long v6, v2, v0

    cmp-long v6, v6, v4

    if-gtz v6, :cond_0

    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-nez v6, :cond_0

    .line 63
    :cond_0
    return v8
.end method
