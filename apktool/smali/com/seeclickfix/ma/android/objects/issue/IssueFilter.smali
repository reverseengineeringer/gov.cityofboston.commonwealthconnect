.class public Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;
.super Ljava/lang/Object;
.source "IssueFilter.java"


# instance fields
.field private mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

.field private mParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mZoneIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/DedicatedApp;)V
    .locals 1
    .param p1, "app"    # Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mParams:Ljava/util/Map;

    .line 30
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .line 31
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->initAppFilters()V

    .line 32
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->addAnyRequestTags()V

    .line 33
    return-void
.end method

.method private addAnyRequestTags()V
    .locals 7

    .prologue
    .line 41
    const-string/jumbo v2, "request_tags"

    .line 43
    .local v2, "requestTagKey":Ljava/lang/String;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mZoneIds:Ljava/util/List;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mZoneIds:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 45
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .local v4, "zonesToFilter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string/jumbo v1, "plus_watch_area_"

    .line 48
    .local v1, "prefix":Ljava/lang/String;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mZoneIds:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 49
    .local v3, "zoneId":Ljava/lang/Integer;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 52
    .end local v3    # "zoneId":Ljava/lang/Integer;
    :cond_0
    iget-object v5, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mParams:Ljava/util/Map;

    const-string/jumbo v6, ","

    invoke-static {v4, v6}, Lorg/apache/commons/lang3/StringUtils;->join(Ljava/lang/Iterable;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "prefix":Ljava/lang/String;
    .end local v4    # "zonesToFilter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    return-void
.end method

.method private initAppFilters()V
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->showOnlyCustomerIssues:Z

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getAllowedZoneIds()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mZoneIds:Ljava/util/List;

    .line 61
    :cond_0
    return-void
.end method


# virtual methods
.method public get()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->mParams:Ljava/util/Map;

    return-object v0
.end method
