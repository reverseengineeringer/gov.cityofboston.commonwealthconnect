.class public Lcom/seeclickfix/ma/android/util/IssueUri;
.super Ljava/lang/Object;
.source "IssueUri.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getId(Ljava/lang/String;)I
    .locals 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 29
    const/4 v0, -0x1

    .line 31
    .local v0, "issueId":I
    if-nez p1, :cond_0

    move v1, v0

    .line 41
    .end local v0    # "issueId":I
    .local v1, "issueId":I
    :goto_0
    return v1

    .line 33
    .end local v1    # "issueId":I
    .restart local v0    # "issueId":I
    :cond_0
    const-string/jumbo v3, "-"

    invoke-static {p1, v3}, Lorg/apache/commons/lang3/StringUtils;->substringBefore(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 34
    .local v2, "issueIdString":Ljava/lang/String;
    const-string/jumbo v3, "?"

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/StringUtils;->substringBefore(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 35
    const-string/jumbo v3, "/issues/"

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/StringUtils;->substringAfterLast(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 37
    invoke-static {v2}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {v2}, Lorg/apache/commons/lang3/StringUtils;->isNumeric(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 38
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :cond_1
    move v1, v0

    .line 41
    .end local v0    # "issueId":I
    .restart local v1    # "issueId":I
    goto :goto_0
.end method

.method public getUrlParams(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 6
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 49
    .local v3, "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_1

    .line 57
    :cond_0
    return-object v3

    .line 51
    :cond_1
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    const-string/jumbo v5, "UTF-8"

    invoke-static {v4, v5}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 53
    .local v1, "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/NameValuePair;

    .line 54
    .local v2, "nvp":Lorg/apache/http/NameValuePair;
    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
