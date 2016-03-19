.class public Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "CityCursorAdapter.java"

# interfaces
.implements Landroid/widget/Filterable;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "CityCursorAdapter"


# instance fields
.field private constraint:Ljava/lang/CharSequence;

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


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/database/Cursor;I)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "cur"    # Landroid/database/Cursor;
    .param p3, "flags"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 46
    const-class v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {p1, v1}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 49
    .local v0, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :try_start_0
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getCityDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->dao:Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :goto_0
    return-void

    .line 50
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private getOrmCursor(Ljava/lang/String;)Landroid/database/Cursor;
    .locals 5
    .param p1, "args"    # Ljava/lang/String;

    .prologue
    .line 118
    const/4 v0, 0x0

    .line 119
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v1, 0x0

    .line 121
    .local v1, "iterator":Lcom/j256/ormlite/dao/CloseableIterator;, "Lcom/j256/ormlite/dao/CloseableIterator<Lcom/seeclickfix/ma/android/objects/loc/City;>;"
    :try_start_0
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->getPreparedQuery(Ljava/lang/String;)Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v2

    .line 122
    .local v2, "pq":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/City;>;"
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v4, v2}, Lcom/j256/ormlite/dao/Dao;->iterator(Lcom/j256/ormlite/stmt/PreparedQuery;)Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v1

    .line 124
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->getRawResults()Lcom/j256/ormlite/support/DatabaseResults;

    move-result-object v3

    check-cast v3, Lcom/j256/ormlite/android/AndroidDatabaseResults;

    .line 125
    .local v3, "results":Lcom/j256/ormlite/android/AndroidDatabaseResults;
    invoke-virtual {v3}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->getRawCursor()Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 138
    .end local v2    # "pq":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/City;>;"
    .end local v3    # "results":Lcom/j256/ormlite/android/AndroidDatabaseResults;
    :goto_0
    return-object v0

    .line 127
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private getPreparedQuery(Ljava/lang/String;)Lcom/j256/ormlite/stmt/PreparedQuery;
    .locals 4
    .param p1, "args"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/City;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    const/4 v0, 0x0

    .line 145
    .local v0, "pq":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/City;>;"
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v2}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v1

    .line 146
    .local v1, "qb":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/loc/City;Ljava/lang/Integer;>;"
    invoke-virtual {v1}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v2

    const-string/jumbo v3, "name"

    invoke-virtual {v2, v3, p1}, Lcom/j256/ormlite/stmt/Where;->like(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 147
    invoke-virtual {v1}, Lcom/j256/ormlite/stmt/QueryBuilder;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 152
    .end local v1    # "qb":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/loc/City;Ljava/lang/Integer;>;"
    :goto_0
    return-object v0

    .line 148
    :catch_0
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 58
    const v4, 0x7f0a0141

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 59
    .local v3, "suggestionTextView":Landroid/widget/TextView;
    const-string/jumbo v4, ""

    invoke-direct {p0, v4}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->getPreparedQuery(Ljava/lang/String;)Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v9

    .line 60
    .local v9, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/City;>;"
    const/4 v7, 0x0

    .line 62
    .local v7, "dto":Lcom/seeclickfix/ma/android/objects/loc/City;
    :try_start_0
    new-instance v4, Lcom/j256/ormlite/android/AndroidDatabaseResults;

    const/4 v5, 0x0

    invoke-direct {v4, p3, v5}, Lcom/j256/ormlite/android/AndroidDatabaseResults;-><init>(Landroid/database/Cursor;Lcom/j256/ormlite/dao/ObjectCache;)V

    invoke-interface {v9, v4}, Lcom/j256/ormlite/stmt/PreparedQuery;->mapRow(Lcom/j256/ormlite/support/DatabaseResults;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/City;

    move-object v7, v0
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :goto_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->constraint:Ljava/lang/CharSequence;

    if-eqz v4, :cond_0

    .line 68
    iget-object v4, v7, Lcom/seeclickfix/ma/android/objects/loc/City;->name:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->constraint:Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 69
    .local v8, "matchLength":I
    new-instance v1, Ljava/lang/String;

    iget-object v4, v7, Lcom/seeclickfix/ma/android/objects/loc/City;->name:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 71
    .local v1, "matchedCharacters":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v7, Lcom/seeclickfix/ma/android/objects/loc/City;->name:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v7, Lcom/seeclickfix/ma/android/objects/loc/City;->state:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 73
    .local v2, "remainingChars":Ljava/lang/String;
    const/high16 v5, -0x1000000

    const v6, -0xbbbbbc

    move-object v4, p2

    invoke-static/range {v1 .. v6}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setTwoColorsBoldTextStrings(Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;II)V

    .line 78
    .end local v1    # "matchedCharacters":Ljava/lang/String;
    .end local v2    # "remainingChars":Ljava/lang/String;
    .end local v8    # "matchLength":I
    :cond_0
    invoke-virtual {p1, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 80
    return-void

    .line 63
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public getFilterQueryProvider()Landroid/widget/FilterQueryProvider;
    .locals 1

    .prologue
    .line 90
    invoke-super {p0}, Landroid/support/v4/widget/CursorAdapter;->getFilterQueryProvider()Landroid/widget/FilterQueryProvider;

    move-result-object v0

    return-object v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 84
    const v1, 0x7f030052

    invoke-static {p1, v1, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 85
    .local v0, "v":Landroid/view/View;
    return-object v0
.end method

.method public runQueryOnBackgroundThread(Ljava/lang/CharSequence;)Landroid/database/Cursor;
    .locals 4
    .param p1, "constraint"    # Ljava/lang/CharSequence;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->constraint:Ljava/lang/CharSequence;

    .line 98
    const/4 v1, 0x0

    .line 100
    .local v1, "currentCursor":Landroid/database/Cursor;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->getFilterQueryProvider()Landroid/widget/FilterQueryProvider;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 101
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->getFilterQueryProvider()Landroid/widget/FilterQueryProvider;

    move-result-object v2

    invoke-interface {v2, p1}, Landroid/widget/FilterQueryProvider;->runQuery(Ljava/lang/CharSequence;)Landroid/database/Cursor;

    move-result-object v2

    .line 112
    :goto_0
    return-object v2

    .line 104
    :cond_0
    const-string/jumbo v0, ""

    .line 106
    .local v0, "args":Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 107
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 110
    :cond_1
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->getOrmCursor(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    move-object v2, v1

    .line 112
    goto :goto_0
.end method
