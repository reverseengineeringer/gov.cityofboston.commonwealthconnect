.class public Lcom/seeclickfix/ma/android/objects/OtherWatchAreaFactory;
.super Ljava/lang/Object;
.source "OtherWatchAreaFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOtherArea(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/report/Report;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .locals 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 17
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;-><init>()V

    .line 18
    .local v0, "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0c0120

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setTitle(Ljava/lang/String;)V

    .line 20
    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setId(I)V

    .line 22
    new-instance v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;-><init>()V

    .line 24
    .local v1, "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    const-string/jumbo v3, "other"

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setApiId(Ljava/lang/String;)V

    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0c0121

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setTitle(Ljava/lang/String;)V

    .line 28
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setWatchArea(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    .line 30
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setNumQuestions(I)V

    .line 32
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .local v2, "reqTypes":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    invoke-virtual {v0, v2}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setRequestTypes(Ljava/util/List;)V

    .line 38
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 40
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setDefault(Z)V

    .line 42
    return-object v0
.end method
