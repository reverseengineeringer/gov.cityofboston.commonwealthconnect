.class public Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;
.super Ljava/lang/Object;
.source "DefaultOtherZone.java"


# instance fields
.field c:Landroid/content/Context;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getIsOtherAdded(Ljava/util/List;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    const/4 v9, 0x1

    .line 41
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;->c:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 42
    .local v8, "res":Landroid/content/res/Resources;
    const v10, 0x7f0c0121

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 43
    .local v4, "otherTitle":Ljava/lang/String;
    const-string/jumbo v3, "Other"

    .line 45
    .local v3, "other":Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 47
    .local v0, "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getRequestTypes()Ljava/util/List;

    move-result-object v7

    .line 49
    .local v7, "reqTypesList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 51
    .local v5, "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getTitle()Ljava/lang/String;

    move-result-object v6

    .line 53
    .local v6, "reqTypeTitle":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 57
    invoke-virtual {v6, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 67
    .end local v0    # "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v5    # "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    .end local v6    # "reqTypeTitle":Ljava/lang/String;
    .end local v7    # "reqTypesList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    :goto_0
    return v9

    .line 61
    .restart local v0    # "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v5    # "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    .restart local v6    # "reqTypeTitle":Ljava/lang/String;
    .restart local v7    # "reqTypesList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    :cond_2
    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    goto :goto_0

    .line 67
    .end local v0    # "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v5    # "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    .end local v6    # "reqTypeTitle":Ljava/lang/String;
    .end local v7    # "reqTypesList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    :cond_3
    const/4 v9, 0x0

    goto :goto_0
.end method

.method private getShouldBlockOther(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;->c:Landroid/content/Context;

    invoke-static {v2}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 75
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v1

    .line 77
    .local v1, "appOptions":Lcom/seeclickfix/ma/android/objects/app/AppOptions;
    iget-boolean v2, v1, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->blockOtherCategory:Z

    invoke-static {v2, p1, v0}, Lcom/seeclickfix/ma/android/fragments/reporting/FeatureFlagHelper;->hasEnabledZone(ZLjava/util/List;Lcom/seeclickfix/ma/android/objects/DedicatedApp;)Z

    move-result v2

    return v2
.end method


# virtual methods
.method public addOtherIfNeeded(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 4
    .param p2, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            ")V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;->getIsOtherAdded(Ljava/util/List;)Z

    move-result v1

    .line 30
    .local v1, "isOtherAdded":Z
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;->getShouldBlockOther(Ljava/util/List;)Z

    move-result v2

    .line 32
    .local v2, "shouldBlockOther":Z
    if-nez v1, :cond_0

    if-nez v2, :cond_0

    .line 33
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;->c:Landroid/content/Context;

    invoke-static {v3, p2}, Lcom/seeclickfix/ma/android/objects/OtherWatchAreaFactory;->getOtherArea(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/report/Report;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-result-object v0

    .line 34
    .local v0, "defaultArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .end local v0    # "defaultArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    :cond_0
    return-void
.end method
