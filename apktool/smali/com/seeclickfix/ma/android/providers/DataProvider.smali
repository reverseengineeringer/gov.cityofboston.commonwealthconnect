.class public Lcom/seeclickfix/ma/android/providers/DataProvider;
.super Landroid/content/ContentProvider;
.source "DataProvider.java"


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = ".providers.DataProvider"

.field private static final D:Z = false

.field private static final GET_CITY:I = 0x1

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final SEARCH_CITIES:I = 0x0

.field private static final SEARCH_SUGGEST:I = 0x2

.field public static final SEARCH_TABLE:Ljava/lang/String; = "search"

.field private static final TAG:Ljava/lang/String; = "DataProvider"

.field private static matrixCursor:Lcom/seeclickfix/ma/android/db/CityMatrixCursor;

.field private static searchCitiesUri:Landroid/net/Uri;

.field private static uriMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    sput-object v0, Lcom/seeclickfix/ma/android/providers/DataProvider;->matrixCursor:Lcom/seeclickfix/ma/android/db/CityMatrixCursor;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method protected static buildUriMatcher(Landroid/content/Context;)Landroid/content/UriMatcher;
    .locals 5
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x2

    .line 38
    new-instance v1, Landroid/content/UriMatcher;

    const/4 v2, -0x1

    invoke-direct {v1, v2}, Landroid/content/UriMatcher;-><init>(I)V

    .line 39
    .local v1, "matcher":Landroid/content/UriMatcher;
    invoke-static {p0}, Lcom/seeclickfix/ma/android/providers/DataProvider;->getAuthorityUri(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "authorityUri":Ljava/lang/String;
    const-string/jumbo v2, "search"

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 42
    const-string/jumbo v2, "search/#"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 43
    const-string/jumbo v2, "search_suggest_query"

    invoke-virtual {v1, v0, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 44
    const-string/jumbo v2, "search_suggest_query/*"

    invoke-virtual {v1, v0, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 46
    return-object v1
.end method

.method protected static getAuthorityUri(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/AppBuild;->getPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 57
    .local v1, "packageName":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".providers.DataProvider"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "authorityUri":Ljava/lang/String;
    return-object v0
.end method

.method public static getSearchCitiesUri(Landroid/content/Context;)Landroid/net/Uri;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "content://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/providers/DataProvider;->getAuthorityUri(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "search_suggest_query"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/providers/DataProvider;->searchCitiesUri:Landroid/net/Uri;

    .line 52
    sget-object v0, Lcom/seeclickfix/ma/android/providers/DataProvider;->searchCitiesUri:Landroid/net/Uri;

    return-object v0
.end method

.method public static initCursor(Landroid/content/Context;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 73
    new-instance v0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;-><init>([Ljava/lang/String;Landroid/content/Context;)V

    sput-object v0, Lcom/seeclickfix/ma/android/providers/DataProvider;->matrixCursor:Lcom/seeclickfix/ma/android/db/CityMatrixCursor;

    .line 74
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 142
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 79
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 126
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public onCreate()Z
    .locals 1

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/providers/DataProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/providers/DataProvider;->buildUriMatcher(Landroid/content/Context;)Landroid/content/UriMatcher;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/providers/DataProvider;->uriMatcher:Landroid/content/UriMatcher;

    .line 69
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 85
    sget-object v1, Lcom/seeclickfix/ma/android/providers/DataProvider;->uriMatcher:Landroid/content/UriMatcher;

    if-nez v1, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/providers/DataProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/providers/DataProvider;->buildUriMatcher(Landroid/content/Context;)Landroid/content/UriMatcher;

    .line 89
    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/providers/DataProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;-><init>([Ljava/lang/String;Landroid/content/Context;)V

    .line 91
    .local v0, "returnCursor":Lcom/seeclickfix/ma/android/db/CityMatrixCursor;
    sget-object v1, Lcom/seeclickfix/ma/android/providers/DataProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 110
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unknown Uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :pswitch_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/db/CityMatrixCursor;->getSearchSuggestionCursor(Ljava/lang/String;)Landroid/database/Cursor;

    .line 113
    :pswitch_1
    return-object v0

    .line 91
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 134
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
