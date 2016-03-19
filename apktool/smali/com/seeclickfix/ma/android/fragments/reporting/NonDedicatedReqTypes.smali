.class public Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;
.super Ljava/lang/Object;
.source "NonDedicatedReqTypes.java"


# annotations
.annotation runtime Ljavax/inject/Singleton;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method


# virtual methods
.method public filterIfNeeded(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/DedicatedApp;)Ljava/util/List;
    .locals 4
    .param p2, "app"    # Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;",
            "Lcom/seeclickfix/ma/android/objects/DedicatedApp;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    .local p1, "zones":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v3

    iget-boolean v3, v3, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->hideNonDedicatedRequestTypes:Z

    if-nez v3, :cond_0

    .line 52
    .end local p1    # "zones":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    :goto_0
    return-object p1

    .line 44
    .restart local p1    # "zones":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v0, "filteredZones":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 47
    .local v2, "zone":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v3

    invoke-static {v3, p2}, Lcom/seeclickfix/ma/android/fragments/reporting/FeatureFlagHelper;->hasZone(ILcom/seeclickfix/ma/android/objects/DedicatedApp;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 48
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .end local v2    # "zone":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    :cond_2
    move-object p1, v0

    .line 52
    goto :goto_0
.end method
