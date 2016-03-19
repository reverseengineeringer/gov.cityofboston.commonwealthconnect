.class public Lcom/seeclickfix/ma/android/SeeclickfixActivity$$ViewInjector;
.super Ljava/lang/Object;
.source "SeeclickfixActivity$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/seeclickfix/ma/android/SeeclickfixActivity;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0a0043

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361859\' for field \'mNavBtnAbout\' and method \'showAbout\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    move-object v1, v0

    .line 14
    check-cast v1, Landroid/widget/Button;

    iput-object v1, p1, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mNavBtnAbout:Landroid/widget/Button;

    .line 15
    new-instance v1, Lcom/seeclickfix/ma/android/SeeclickfixActivity$$ViewInjector$1;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$$ViewInjector$1;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    const v1, 0x7f0a0042

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361858\' for field \'mNavBtnHelp\' and method \'showHelp\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    move-object v1, v0

    .line 27
    check-cast v1, Landroid/widget/Button;

    iput-object v1, p1, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mNavBtnHelp:Landroid/widget/Button;

    .line 28
    new-instance v1, Lcom/seeclickfix/ma/android/SeeclickfixActivity$$ViewInjector$2;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$$ViewInjector$2;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    const v1, 0x7f0a0040

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361856\' for field \'mDrawerContainer\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 40
    :cond_2
    check-cast v0, Landroid/widget/RelativeLayout;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerContainer:Landroid/widget/RelativeLayout;

    .line 41
    return-void
.end method

.method public static reset(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 1
    .param p0, "target"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    .prologue
    const/4 v0, 0x0

    .line 44
    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mNavBtnAbout:Landroid/widget/Button;

    .line 45
    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mNavBtnHelp:Landroid/widget/Button;

    .line 46
    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerContainer:Landroid/widget/RelativeLayout;

    .line 47
    return-void
.end method
