.class public Lcom/seeclickfix/ma/android/db/InsertSinglePlace;
.super Ljava/lang/Object;
.source "InsertSinglePlace.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "InsertSinglePlace"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static creatOrUpdate(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-static {p0}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getPlaceDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    .line 32
    .local v2, "placeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    invoke-interface {v2}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v3

    const-string/jumbo v4, "api_id"

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getApiId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    move-result-object v3

    invoke-virtual {v3}, Lcom/j256/ormlite/stmt/Where;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v1

    .line 34
    .local v1, "existingPlaceQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-interface {v2, v1}, Lcom/j256/ormlite/dao/Dao;->queryForFirst(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 36
    .local v0, "existingPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    if-eqz v0, :cond_0

    .line 37
    invoke-interface {v2, p1}, Lcom/j256/ormlite/dao/Dao;->update(Ljava/lang/Object;)I

    .line 48
    :goto_0
    return-void

    .line 43
    :cond_0
    invoke-interface {v2, p1}, Lcom/j256/ormlite/dao/Dao;->create(Ljava/lang/Object;)I

    goto :goto_0
.end method

.method public static update(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-static {p0}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getPlaceDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 55
    .local v0, "placeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    invoke-interface {v0, p1}, Lcom/j256/ormlite/dao/Dao;->update(Ljava/lang/Object;)I

    .line 60
    return-void
.end method
