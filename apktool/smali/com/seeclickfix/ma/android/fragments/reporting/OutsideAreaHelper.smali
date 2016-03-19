.class public Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;
.super Ljava/lang/Object;
.source "OutsideAreaHelper.java"


# instance fields
.field context:Landroid/content/Context;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getButtonClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 75
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper$1;-><init>(Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;)V

    return-object v0
.end method


# virtual methods
.method public getAlertButtonUri()Ljava/lang/String;
    .locals 2

    .prologue
    .line 66
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 67
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getReportAlertButtonUri()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getAlertMsg()Ljava/lang/String;
    .locals 2

    .prologue
    .line 61
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 62
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getReportAlertMessage()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public hideAlert(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "containerView"    # Landroid/view/ViewGroup;

    .prologue
    .line 118
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 119
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 120
    return-void
.end method

.method public shouldShowButton()Z
    .locals 1

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->getAlertButtonUri()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public shouldShowWarning(Ljava/util/List;)Z
    .locals 6
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
    const/4 v4, 0x0

    .line 39
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 41
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v5

    if-nez v5, :cond_1

    move v2, v4

    .line 56
    :cond_0
    :goto_0
    return v2

    .line 45
    :cond_1
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getReportAlertMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 47
    .local v2, "hasAlertMessage":Z
    invoke-static {p1}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->isNotNullOrEmpty(Ljava/util/Collection;)Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz v2, :cond_0

    .line 48
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 49
    .local v1, "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getIncludesPoint()Z

    move-result v5

    if-eqz v5, :cond_2

    move v2, v4

    .line 50
    goto :goto_0
.end method

.method public showAlert(Landroid/view/ViewGroup;)V
    .locals 8
    .param p1, "containerView"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v7, 0x0

    .line 91
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-ne v5, v6, :cond_1

    .line 92
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 93
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 95
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->context:Landroid/content/Context;

    const v6, 0x7f030050

    invoke-static {v5, v6, p1}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 96
    .local v4, "warningView":Landroid/view/ViewGroup;
    const v5, 0x7f0a013e

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 97
    .local v3, "warningMsg":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->getAlertMsg()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->shouldShowButton()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 101
    const v5, 0x7f0a013f

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 102
    .local v1, "bodyText":Landroid/widget/TextView;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getReportAlertBodyText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 105
    const v5, 0x7f0a0140

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 106
    .local v2, "button":Landroid/widget/Button;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getReportAlertButtonText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 107
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->getButtonClickListener()Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    invoke-virtual {v2, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 111
    .end local v1    # "bodyText":Landroid/widget/TextView;
    .end local v2    # "button":Landroid/widget/Button;
    :cond_0
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 112
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 113
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/seeclickfix/ma/android/anim/Transitions;->fadeIn(Landroid/content/Context;)Landroid/view/animation/Animation;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->startAnimation(Landroid/view/animation/Animation;)V

    .line 115
    .end local v0    # "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .end local v3    # "warningMsg":Landroid/widget/TextView;
    .end local v4    # "warningView":Landroid/view/ViewGroup;
    :cond_1
    return-void
.end method
