.class public Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;
.super Ljava/lang/Object;
.source "AccuracyWarn.java"


# instance fields
.field context:Landroid/content/Context;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlertMsg()Ljava/lang/String;
    .locals 2

    .prologue
    .line 38
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 39
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getAccuracyLabelText()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public hideAlert(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "containerView"    # Landroid/view/ViewGroup;

    .prologue
    .line 61
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 62
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 63
    return-void
.end method

.method public shouldShowWarning()Z
    .locals 2

    .prologue
    .line 28
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 30
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v1

    if-nez v1, :cond_0

    .line 31
    const/4 v1, 0x0

    .line 34
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getAccuracyLabelText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    goto :goto_0
.end method

.method public showAlert(Landroid/view/ViewGroup;)V
    .locals 4
    .param p1, "containerView"    # Landroid/view/ViewGroup;

    .prologue
    .line 45
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_0

    .line 47
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 49
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;->context:Landroid/content/Context;

    const v3, 0x7f03004f

    invoke-static {v2, v3, p1}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 51
    .local v1, "warningView":Landroid/view/ViewGroup;
    const v2, 0x7f0a013d

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 52
    .local v0, "warningMsg":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;->getAlertMsg()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 55
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 56
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/seeclickfix/ma/android/anim/Transitions;->fadeIn(Landroid/content/Context;)Landroid/view/animation/Animation;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->startAnimation(Landroid/view/animation/Animation;)V

    .line 58
    .end local v0    # "warningMsg":Landroid/widget/TextView;
    .end local v1    # "warningView":Landroid/view/ViewGroup;
    :cond_0
    return-void
.end method
