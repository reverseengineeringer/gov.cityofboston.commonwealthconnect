.class public Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;
.super Ljava/lang/Object;
.source "GetPlaceBySearchTask.java"

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

.field private static final TAG:Ljava/lang/String; = "GetIssuesTask"


# instance fields
.field private c:Landroid/content/Context;

.field private location:Landroid/location/Location;

.field private name:Ljava/lang/String;

.field private req:Lcom/seeclickfix/ma/android/net/PlaceRequest;

.field private shouldRun:Lcom/seeclickfix/ma/android/tasks/ShouldRun;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/tasks/ShouldRun;Landroid/location/Location;Ljava/lang/String;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "shouldRun"    # Lcom/seeclickfix/ma/android/tasks/ShouldRun;
    .param p3, "location"    # Landroid/location/Location;
    .param p4, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->c:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->shouldRun:Lcom/seeclickfix/ma/android/tasks/ShouldRun;

    .line 35
    iput-object p3, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->location:Landroid/location/Location;

    .line 36
    iput-object p4, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->name:Ljava/lang/String;

    .line 37
    return-void
.end method

.method private callNetRequest()Ljava/util/List;
    .locals 9
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
    .line 49
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    :try_start_0
    new-instance v5, Lcom/seeclickfix/ma/android/net/PlaceRequest;

    invoke-direct {v5}, Lcom/seeclickfix/ma/android/net/PlaceRequest;-><init>()V

    iput-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->req:Lcom/seeclickfix/ma/android/net/PlaceRequest;

    .line 53
    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->req:Lcom/seeclickfix/ma/android/net/PlaceRequest;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->name:Ljava/lang/String;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->location:Landroid/location/Location;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->c:Landroid/content/Context;

    invoke-virtual {v5, v6, v7, v8}, Lcom/seeclickfix/ma/android/net/PlaceRequest;->getPlacebyName(Ljava/lang/String;Landroid/location/Location;Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 54
    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->c:Landroid/content/Context;

    const-class v6, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {v5, v6}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 55
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getPlaceDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 57
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 60
    .local v4, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-interface {v0, v4}, Lcom/j256/ormlite/dao/Dao;->createIfNotExists(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 63
    .end local v0    # "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    .end local v1    # "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :catch_0
    move-exception v5

    .line 67
    :cond_0
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->c:Landroid/content/Context;

    .line 69
    return-object v3
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
    .line 17
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->call()Ljava/util/List;

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
    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->callNetRequest()Ljava/util/List;

    move-result-object v0

    .line 43
    return-object v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->req:Lcom/seeclickfix/ma/android/net/PlaceRequest;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/PlaceRequest;->cancel()V

    .line 75
    return-void
.end method
