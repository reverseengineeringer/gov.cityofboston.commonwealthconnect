.class public Lcom/seeclickfix/ma/android/db/CityMatrixCursor;
.super Landroid/database/MatrixCursor;
.source "CityMatrixCursor.java"


# static fields
.field public static final COLUMNS:[Ljava/lang/String;

.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final MAX_RESULTS:J = 0x5L

.field private static final TAG:Ljava/lang/String; = "SCFAPP_CityMatrixCursor"


# instance fields
.field private final c:Landroid/content/Context;

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

.field private preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/City;",
            ">;"
        }
    .end annotation
.end field

.field private queryArg:Lcom/j256/ormlite/stmt/SelectArg;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 32
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "suggest_text_1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "suggest_text_2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "suggest_icon_1"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "suggest_intent_action"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "suggest_intent_data"

    aput-object v2, v0, v1

    sput-object v0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Landroid/content/Context;)V
    .locals 4
    .param p1, "columnNames"    # [Ljava/lang/String;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 52
    sget-object v1, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->COLUMNS:[Ljava/lang/String;

    invoke-direct {p0, v1}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 53
    iput-object p2, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->c:Landroid/content/Context;

    .line 55
    const-class v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p2, v1}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 57
    .local v0, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    new-instance v1, Lcom/j256/ormlite/stmt/SelectArg;

    invoke-direct {v1}, Lcom/j256/ormlite/stmt/SelectArg;-><init>()V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->queryArg:Lcom/j256/ormlite/stmt/SelectArg;

    .line 61
    :try_start_0
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getCityDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->dao:Lcom/j256/ormlite/dao/Dao;

    .line 62
    iget-object v1, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v1}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v1

    const-wide/16 v2, 0x5

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/j256/ormlite/stmt/QueryBuilder;->limit(Ljava/lang/Long;)Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/j256/ormlite/stmt/QueryBuilder;->distinct()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v1

    const-string/jumbo v2, "name"

    iget-object v3, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->queryArg:Lcom/j256/ormlite/stmt/SelectArg;

    invoke-virtual {v1, v2, v3}, Lcom/j256/ormlite/stmt/Where;->like(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    move-result-object v1

    invoke-virtual {v1}, Lcom/j256/ormlite/stmt/Where;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :goto_0
    return-void

    .line 70
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private convertAndAddRows(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/City;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p1, "filteredList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/City;>;"
    const/4 v1, 0x0

    .line 88
    .local v1, "id":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/loc/City;

    .line 90
    .local v2, "obj":Lcom/seeclickfix/ma/android/objects/loc/City;
    const/4 v4, 0x6

    new-array v3, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, v2, Lcom/seeclickfix/ma/android/objects/loc/City;->name:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget-object v5, v2, Lcom/seeclickfix/ma/android/objects/loc/City;->state:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const v5, 0x7f02014e

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string/jumbo v5, "com.seeclickfix.actions.SEARCH_SELECTION"

    aput-object v5, v3, v4

    const/4 v4, 0x5

    iget v5, v2, Lcom/seeclickfix/ma/android/objects/loc/City;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    .line 98
    .local v3, "row":[Ljava/lang/Object;
    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 100
    add-int/lit8 v1, v1, 0x1

    .line 101
    goto :goto_0

    .line 102
    .end local v2    # "obj":Lcom/seeclickfix/ma/android/objects/loc/City;
    .end local v3    # "row":[Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method private getPermissions(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "constraint"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/City;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    const/4 v1, 0x0

    .line 110
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/City;>;"
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->queryArg:Lcom/j256/ormlite/stmt/SelectArg;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/j256/ormlite/stmt/SelectArg;->setValue(Ljava/lang/Object;)V

    .line 112
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->dao:Lcom/j256/ormlite/dao/Dao;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->preparedQuery:Lcom/j256/ormlite/stmt/PreparedQuery;

    invoke-interface {v2, v3}, Lcom/j256/ormlite/dao/Dao;->query(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 117
    :goto_0
    return-object v1

    .line 113
    :catch_0
    move-exception v0

    .line 114
    .local v0, "e":Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getSearchSuggestionCursor(Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->getPermissions(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 81
    .local v0, "filteredList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/City;>;"
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->convertAndAddRows(Ljava/util/List;)V

    .line 82
    return-object p0
.end method
