.class public Lcom/seeclickfix/ma/android/fragments/reporting/BlankReqType;
.super Ljava/lang/Object;
.source "BlankReqType.java"


# static fields
.field public static final API_BLANK_REQUEST_FAKE_ID:Ljava/lang/String; = "-1"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
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

    .line 32
    if-nez p1, :cond_1

    .line 42
    :cond_0
    :goto_0
    return v2

    .line 36
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

    .line 37
    .local v1, "requestType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getApiId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 38
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addIfNeeded(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "typesList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    const-string/jumbo v1, "-1"

    invoke-direct {p0, p1, v1}, Lcom/seeclickfix/ma/android/fragments/reporting/BlankReqType;->contains(Ljava/util/List;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 24
    :goto_0
    return-void

    .line 20
    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestType;-><init>()V

    .line 21
    .local v0, "blank":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    const-string/jumbo v1, "req_type_blank_view"

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setViewType(Ljava/lang/String;)V

    .line 22
    const-string/jumbo v1, "-1"

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setApiId(Ljava/lang/String;)V

    .line 23
    const/4 v1, 0x0

    invoke-interface {p1, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0
.end method
