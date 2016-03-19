.class public Lcom/seeclickfix/ma/android/services/CityLoadingService;
.super Landroid/app/Service;
.source "CityLoadingService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "CityLoadingService"


# instance fields
.field private c:Landroid/content/Context;

.field private dao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/City;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private loadCityThread:Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;

.field private sqlArray:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 72
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/services/CityLoadingService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/services/CityLoadingService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->readSql(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/services/CityLoadingService;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/services/CityLoadingService;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->executeInserts()V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/services/CityLoadingService;)Lcom/j256/ormlite/dao/Dao;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/services/CityLoadingService;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->dao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method private executeInserts()V
    .locals 18

    .prologue
    .line 123
    const-string/jumbo v14, "sqlArray "

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->sqlArray:Ljava/util/List;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 127
    .local v12, "start":J
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v14}, Lcom/j256/ormlite/dao/Dao;->countOf()J

    move-result-wide v6

    .line 129
    .local v6, "count":J
    const-string/jumbo v14, "countOf "

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "count:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " time:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    sub-long v16, v16, v12

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "ms"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->sqlArray:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    long-to-int v15, v6

    if-ge v14, v15, :cond_0

    .line 168
    .end local v6    # "count":J
    .end local v12    # "start":J
    :goto_0
    return-void

    .line 138
    .restart local v6    # "count":J
    .restart local v12    # "start":J
    :cond_0
    const/16 v3, 0x64

    .line 142
    .local v3, "chunkSize":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 143
    .local v4, "chunkedInsertList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->sqlArray:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v2

    .line 145
    .local v2, "N":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    if-ge v9, v2, :cond_1

    .line 146
    new-instance v14, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->sqlArray:Ljava/util/List;

    add-int v16, v9, v3

    move/from16 v0, v16

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v16

    move/from16 v0, v16

    invoke-interface {v15, v9, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v4, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    add-int/2addr v9, v3

    goto :goto_1

    .line 155
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    .line 156
    .local v11, "listChunk":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->dao:Lcom/j256/ormlite/dao/Dao;

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->getCallableForChunk(Ljava/util/List;)Ljava/util/concurrent/Callable;

    move-result-object v15

    invoke-interface {v14, v15}, Lcom/j256/ormlite/dao/Dao;->callBatchTasks(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 161
    .end local v2    # "N":I
    .end local v3    # "chunkSize":I
    .end local v4    # "chunkedInsertList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v6    # "count":J
    .end local v9    # "i":I
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "listChunk":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v12    # "start":J
    :catch_0
    move-exception v5

    .line 162
    .local v5, "e":Ljava/sql/SQLException;
    const-string/jumbo v14, "CityLoadingService"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 160
    .end local v5    # "e":Ljava/sql/SQLException;
    .restart local v2    # "N":I
    .restart local v3    # "chunkSize":I
    .restart local v4    # "chunkedInsertList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .restart local v6    # "count":J
    .restart local v9    # "i":I
    .restart local v10    # "i$":Ljava/util/Iterator;
    .restart local v12    # "start":J
    :cond_2
    :try_start_1
    const-string/jumbo v14, "Pref:CITY_DATA_LOADED"

    const/4 v15, 0x1

    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putBoolean(Ljava/lang/String;ZLandroid/content/Context;)V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 164
    .end local v2    # "N":I
    .end local v3    # "chunkSize":I
    .end local v4    # "chunkedInsertList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v6    # "count":J
    .end local v9    # "i":I
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v12    # "start":J
    :catch_1
    move-exception v8

    .line 165
    .local v8, "e1":Ljava/lang/Exception;
    const-string/jumbo v14, "CityLoadingService"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method private getCallableForChunk(Ljava/util/List;)Ljava/util/concurrent/Callable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .prologue
    .line 172
    .local p1, "chunkList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/services/CityLoadingService$1;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/services/CityLoadingService$1;-><init>(Lcom/seeclickfix/ma/android/services/CityLoadingService;Ljava/util/List;)V

    return-object v0
.end method

.method private initDatabase(Landroid/content/Context;)V
    .locals 3
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 113
    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p1, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 116
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :try_start_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getCityDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->dao:Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :goto_0
    return-void

    .line 117
    :catch_0
    move-exception v0

    .line 118
    .local v0, "e":Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method private readSql(Landroid/content/Context;)V
    .locals 7
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 89
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->sqlArray:Ljava/util/List;

    .line 93
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v6, 0x7f050000

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    .line 94
    .local v2, "is":Ljava/io/InputStream;
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 97
    .local v4, "reader":Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 99
    .local v0, "br":Ljava/io/BufferedReader;
    const-string/jumbo v3, ""

    .line 100
    .local v3, "line":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 101
    iget-object v5, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->sqlArray:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 106
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "reader":Ljava/io/InputStreamReader;
    :catch_0
    move-exception v1

    .line 107
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 109
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 105
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .restart local v2    # "is":Ljava/io/InputStream;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v4    # "reader":Ljava/io/InputStreamReader;
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private startCityLoad(Landroid/content/Context;)V
    .locals 2
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 66
    new-instance v0, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;-><init>(Lcom/seeclickfix/ma/android/services/CityLoadingService;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->loadCityThread:Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;

    .line 68
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->loadCityThread:Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;->setPriority(I)V

    .line 69
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->loadCityThread:Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;->start()V

    .line 70
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 43
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 49
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 50
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->c:Landroid/content/Context;

    .line 52
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/providers/DataProvider;->initCursor(Landroid/content/Context;)V

    .line 54
    const-string/jumbo v0, "Pref:CITY_DATA_LOADED"

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getBoolean(Ljava/lang/String;ZLandroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->c:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->initDatabase(Landroid/content/Context;)V

    .line 57
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService;->c:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->startCityLoad(Landroid/content/Context;)V

    .line 59
    :cond_0
    return-void
.end method
