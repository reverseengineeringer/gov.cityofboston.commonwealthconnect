.class public Lcom/seeclickfix/ma/android/fragments/ReportFragment$$ViewInjector;
.super Ljava/lang/Object;
.source "ReportFragment$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0a00fe

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131362046\' for field \'descriptionLabel\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionLabel:Landroid/widget/TextView;

    .line 15
    const v1, 0x7f0a00f3

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 16
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_1

    .line 17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131362035\' for field \'alertContainerView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->alertContainerView:Landroid/view/ViewGroup;

    .line 20
    const v1, 0x7f0a00f2

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 21
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_2

    .line 22
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131362034\' for field \'accuracyContainerView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 24
    :cond_2
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->accuracyContainerView:Landroid/view/ViewGroup;

    .line 25
    return-void
.end method

.method public static reset(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 1
    .param p0, "target"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionLabel:Landroid/widget/TextView;

    .line 29
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->alertContainerView:Landroid/view/ViewGroup;

    .line 30
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->accuracyContainerView:Landroid/view/ViewGroup;

    .line 31
    return-void
.end method
