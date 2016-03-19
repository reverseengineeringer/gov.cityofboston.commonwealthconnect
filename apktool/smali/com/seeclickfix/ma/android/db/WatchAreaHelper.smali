.class public Lcom/seeclickfix/ma/android/db/WatchAreaHelper;
.super Ljava/lang/Object;
.source "WatchAreaHelper.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ReportLoadHelper"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLocalWatchAreas(Lcom/seeclickfix/ma/android/objects/report/Report;)Ljava/util/List;
    .locals 2
    .param p0, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .local v0, "watchAreasCache":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-static {}, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->getReport()Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 29
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getWatchAreas()Ljava/util/List;

    move-result-object v0

    .line 35
    :goto_0
    return-object v0

    .line 32
    :cond_0
    invoke-static {p0}, Lcom/seeclickfix/ma/android/db/WatchAreaHelper;->getWatchAreasFromDb(Lcom/seeclickfix/ma/android/objects/report/Report;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method private static getWatchAreasFromDb(Lcom/seeclickfix/ma/android/objects/report/Report;)Ljava/util/List;
    .locals 9
    .param p0, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v7, "watchAreasList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getWatchAreasDb()Lcom/j256/ormlite/dao/ForeignCollection;

    move-result-object v3

    .line 44
    .local v3, "dbWatchAreas":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    if-eqz v3, :cond_1

    .line 45
    invoke-interface {v3}, Lcom/j256/ormlite/dao/ForeignCollection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 47
    .local v4, "dbWatchAreasIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 48
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 50
    .local v0, "areaFromDb":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v5, "reqTypeList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getRequestTypesDb()Lcom/j256/ormlite/dao/ForeignCollection;

    move-result-object v2

    .line 54
    .local v2, "dbReqTypes":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    invoke-interface {v2}, Lcom/j256/ormlite/dao/ForeignCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 56
    .local v1, "dbReqTypeIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 59
    .local v6, "requestType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 62
    .end local v6    # "requestType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    :cond_0
    invoke-virtual {v0, v5}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setRequestTypes(Ljava/util/List;)V

    .line 64
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 68
    .end local v0    # "areaFromDb":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .end local v1    # "dbReqTypeIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    .end local v2    # "dbReqTypes":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    .end local v4    # "dbWatchAreasIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    .end local v5    # "reqTypeList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    :cond_1
    return-object v7
.end method
