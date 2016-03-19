.class public Lcom/seeclickfix/ma/android/db/InsertPlaces;
.super Ljava/lang/Object;
.source "InsertPlaces.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "InsertPlaces"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private clearOldJoins(Lcom/seeclickfix/ma/android/objects/loc/Place;Landroid/content/Context;)V
    .locals 2
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 72
    invoke-static {p2, p1}, Lcom/seeclickfix/ma/android/cache/IssuesPlaceCache;->invalidatePlaceCache(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 74
    new-instance v0, Lcom/seeclickfix/ma/android/db/DeleteJoins;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/db/DeleteJoins;-><init>()V

    .line 76
    .local v0, "deleter":Lcom/seeclickfix/ma/android/db/DeleteJoins;
    invoke-virtual {v0, p1, p2}, Lcom/seeclickfix/ma/android/db/DeleteJoins;->deletePlaceJoins(Lcom/seeclickfix/ma/android/objects/loc/Place;Landroid/content/Context;)I

    .line 78
    new-instance v1, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;-><init>()V

    .line 80
    .local v1, "zoneDeleter":Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;
    invoke-virtual {v1, p1, p2}, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;->deletePlaceJoins(Lcom/seeclickfix/ma/android/objects/loc/Place;Landroid/content/Context;)I

    .line 82
    return-void
.end method


# virtual methods
.method public setPlaces(Ljava/util/List;Landroid/content/Context;)V
    .locals 5
    .param p2, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 27
    .local p1, "passedList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 66
    :cond_0
    :goto_0
    return-void

    .line 38
    :cond_1
    :try_start_0
    const-class v4, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p2, v4}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 39
    .local v0, "dbHelper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getPlaceDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v3

    .line 41
    .local v3, "placeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 43
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 45
    .local v2, "place":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-direct {p0, v2, p2}, Lcom/seeclickfix/ma/android/db/InsertPlaces;->clearOldJoins(Lcom/seeclickfix/ma/android/objects/loc/Place;Landroid/content/Context;)V

    .line 47
    invoke-static {p2, v2}, Lcom/seeclickfix/ma/android/db/InsertSinglePlace;->creatOrUpdate(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 62
    .end local v0    # "dbHelper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "place":Lcom/seeclickfix/ma/android/objects/loc/Place;
    .end local v3    # "placeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    :catch_0
    move-exception v4

    goto :goto_0
.end method
