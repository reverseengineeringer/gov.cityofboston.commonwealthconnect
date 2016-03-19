.class public Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;
.super Ljava/lang/Object;
.source "GetPlacesTask.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/tasks/CancellableTask;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/seeclickfix/ma/android/tasks/CancellableTask",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/seeclickfix/ma/android/objects/loc/Place;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GetPlacesTask"


# instance fields
.field private c:Landroid/content/Context;

.field private location:Landroid/location/Location;

.field private req:Lcom/seeclickfix/ma/android/net/PlaceRequest;

.field private shouldRun:Lcom/seeclickfix/ma/android/tasks/ShouldRun;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/tasks/ShouldRun;Landroid/location/Location;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "shouldRun"    # Lcom/seeclickfix/ma/android/tasks/ShouldRun;
    .param p3, "location"    # Landroid/location/Location;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->c:Landroid/content/Context;

    .line 39
    iput-object p2, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->shouldRun:Lcom/seeclickfix/ma/android/tasks/ShouldRun;

    .line 40
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->location:Landroid/location/Location;

    .line 41
    return-void
.end method

.method private callNetRequest()Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v9, "netList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v5, "dbList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    :try_start_0
    new-instance v15, Lcom/seeclickfix/ma/android/net/PlaceRequest;

    invoke-direct {v15}, Lcom/seeclickfix/ma/android/net/PlaceRequest;-><init>()V

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->req:Lcom/seeclickfix/ma/android/net/PlaceRequest;

    .line 71
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->req:Lcom/seeclickfix/ma/android/net/PlaceRequest;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->location:Landroid/location/Location;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->c:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v15 .. v17}, Lcom/seeclickfix/ma/android/net/PlaceRequest;->getPlaceListByLocation(Landroid/location/Location;Landroid/content/Context;)Ljava/util/List;

    move-result-object v9

    .line 72
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->c:Landroid/content/Context;

    invoke-static {v15}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getPlaceDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    .line 74
    .local v4, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 76
    .local v2, "currentTime":J
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 77
    .local v12, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual {v12, v2, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setLastPlaceUpdateFromApi(J)V

    .line 79
    invoke-interface {v4}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v15

    invoke-virtual {v15}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v15

    const-string/jumbo v16, "api_id"

    invoke-virtual {v12}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getApiId()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v15 .. v17}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    move-result-object v15

    invoke-virtual {v15}, Lcom/j256/ormlite/stmt/Where;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v7

    .line 81
    .local v7, "existingPlaceQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-interface {v4, v7}, Lcom/j256/ormlite/dao/Dao;->queryForFirst(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 86
    .local v6, "dbPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    if-eqz v6, :cond_0

    .line 88
    move-object v12, v6

    .line 89
    invoke-virtual {v12, v2, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setLastPlaceUpdateFromApi(J)V

    .line 95
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->c:Landroid/content/Context;

    invoke-static {v15, v12}, Lcom/seeclickfix/ma/android/db/InsertSinglePlace;->creatOrUpdate(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 112
    .end local v2    # "currentTime":J
    .end local v4    # "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    .end local v6    # "dbPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    .end local v7    # "existingPlaceQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v12    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :catch_0
    move-exception v15

    .line 120
    :goto_1
    invoke-static {v5}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 122
    return-object v5

    .line 99
    .restart local v2    # "currentTime":J
    .restart local v4    # "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    invoke-interface {v4}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v14

    .line 100
    .local v14, "qb":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    const-wide/32 v16, 0xdbba0

    sub-long v10, v2, v16

    .line 102
    .local v10, "oldestValidTime":J
    const-wide/16 v16, 0x1e

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/j256/ormlite/stmt/QueryBuilder;->limit(Ljava/lang/Long;)Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v15

    invoke-virtual {v15}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v15

    const-string/jumbo v16, "selected"

    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v17

    invoke-virtual/range {v15 .. v17}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    move-result-object v15

    invoke-virtual {v15}, Lcom/j256/ormlite/stmt/Where;->or()Lcom/j256/ormlite/stmt/Where;

    move-result-object v15

    const-string/jumbo v16, "last_api_update"

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    invoke-virtual/range {v15 .. v17}, Lcom/j256/ormlite/stmt/Where;->gt(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    move-result-object v15

    invoke-virtual {v15}, Lcom/j256/ormlite/stmt/Where;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v13

    .line 109
    .local v13, "pq":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-interface {v4, v13}, Lcom/j256/ormlite/dao/Dao;->query(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/util/List;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_1
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->callNetRequest()Ljava/util/List;

    move-result-object v0

    .line 59
    return-object v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;->req:Lcom/seeclickfix/ma/android/net/PlaceRequest;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/PlaceRequest;->cancel()V

    .line 128
    return-void
.end method
