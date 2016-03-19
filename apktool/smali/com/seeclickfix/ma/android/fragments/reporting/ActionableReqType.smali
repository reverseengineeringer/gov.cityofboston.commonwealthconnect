.class public Lcom/seeclickfix/ma/android/fragments/reporting/ActionableReqType;
.super Ljava/lang/Object;
.source "ActionableReqType.java"


# static fields
.field public static final API_311_REQUEST_FAKE_ID:Ljava/lang/String; = "-311"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private contains(Ljava/util/List;Ljava/lang/String;)Z
    .locals 4
    .param p2, "apiId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    const/4 v2, 0x0

    .line 47
    if-nez p1, :cond_1

    .line 57
    :cond_0
    :goto_0
    return v2

    .line 51
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 52
    .local v1, "requestType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getApiId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 53
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public add311IfNeeded(Ljava/util/List;ILandroid/content/Context;)V
    .locals 4
    .param p2, "zoneId"    # I
    .param p3, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;I",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "typesList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    const-string/jumbo v3, "-311"

    invoke-direct {p0, p1, v3}, Lcom/seeclickfix/ma/android/fragments/reporting/ActionableReqType;->contains(Ljava/util/List;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 39
    :cond_0
    :goto_0
    return-void

    .line 25
    :cond_1
    invoke-static {p3}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 27
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getCall311Number()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p2, v0}, Lcom/seeclickfix/ma/android/fragments/reporting/FeatureFlagHelper;->isZoneEnabled(Ljava/lang/String;ILcom/seeclickfix/ma/android/objects/DedicatedApp;)Z

    move-result v2

    .line 29
    .local v2, "enabled":Z
    if-eqz v2, :cond_0

    .line 30
    new-instance v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;-><init>()V

    .line 31
    .local v1, "call311Section":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    const-string/jumbo v3, "req_type_button_view"

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setViewType(Ljava/lang/String;)V

    .line 32
    const-string/jumbo v3, "-311"

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setApiId(Ljava/lang/String;)V

    .line 33
    const-string/jumbo v3, "android.intent.action.DIAL"

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setAction(Ljava/lang/String;)V

    .line 34
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getCall311Number()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setActionData(Ljava/lang/String;)V

    .line 35
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getCall311HeaderTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setHeaderTitle(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getCall311Message()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setTitle(Ljava/lang/String;)V

    .line 37
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
