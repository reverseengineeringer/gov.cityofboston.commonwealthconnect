.class public Lcom/seeclickfix/ma/android/fragments/reporting/FeatureFlagHelper;
.super Ljava/lang/Object;
.source "FeatureFlagHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasEnabledZone(ZLjava/util/List;Lcom/seeclickfix/ma/android/objects/DedicatedApp;)Z
    .locals 5
    .param p0, "flag"    # Z
    .param p2, "app"    # Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;",
            "Lcom/seeclickfix/ma/android/objects/DedicatedApp;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 27
    .local p1, "zones":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    const/4 v0, 0x0

    .line 29
    .local v0, "hasArea":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 31
    .local v2, "zone":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v3

    .line 33
    .local v3, "zoneId":I
    invoke-static {v3, p2}, Lcom/seeclickfix/ma/android/fragments/reporting/FeatureFlagHelper;->hasZone(ILcom/seeclickfix/ma/android/objects/DedicatedApp;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 34
    const/4 v0, 0x1

    .line 38
    .end local v2    # "zone":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .end local v3    # "zoneId":I
    :cond_1
    if-eqz v0, :cond_2

    if-eqz p0, :cond_2

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public static hasZone(ILcom/seeclickfix/ma/android/objects/DedicatedApp;)Z
    .locals 5
    .param p0, "zoneId"    # I
    .param p1, "app"    # Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .prologue
    .line 63
    const/4 v2, 0x0

    .line 65
    .local v2, "hasZone":Z
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getAllowedZoneIds()Ljava/util/List;

    move-result-object v1

    .line 67
    .local v1, "allowedIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-nez v1, :cond_0

    .line 68
    const/4 v4, 0x0

    .line 78
    :goto_0
    return v4

    .line 71
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 73
    .local v0, "allowedId":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, p0, :cond_1

    .line 74
    const/4 v2, 0x1

    .end local v0    # "allowedId":Ljava/lang/Integer;
    :cond_2
    move v4, v2

    .line 78
    goto :goto_0
.end method

.method public static isZoneEnabled(Ljava/lang/String;ILcom/seeclickfix/ma/android/objects/DedicatedApp;)Z
    .locals 3
    .param p0, "stringFlag"    # Ljava/lang/String;
    .param p1, "zoneId"    # I
    .param p2, "app"    # Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .prologue
    .line 49
    invoke-static {p1, p2}, Lcom/seeclickfix/ma/android/fragments/reporting/FeatureFlagHelper;->hasZone(ILcom/seeclickfix/ma/android/objects/DedicatedApp;)Z

    move-result v0

    .line 51
    .local v0, "containsZone":Z
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    .line 53
    .local v1, "flagExists":Z
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
