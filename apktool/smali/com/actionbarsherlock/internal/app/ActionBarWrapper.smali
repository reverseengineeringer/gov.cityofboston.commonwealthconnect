.class public Lcom/actionbarsherlock/internal/app/ActionBarWrapper;
.super Lcom/actionbarsherlock/app/ActionBar;
.source "ActionBarWrapper.java"

# interfaces
.implements Landroid/app/ActionBar$OnNavigationListener;
.implements Landroid/app/ActionBar$OnMenuVisibilityListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;
    }
.end annotation


# instance fields
.field private final mActionBar:Landroid/app/ActionBar;

.field private final mActivity:Landroid/app/Activity;

.field private mFragmentTransaction:Landroid/support/v4/app/FragmentTransaction;

.field private mMenuVisibilityListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;",
            ">;"
        }
    .end annotation
.end field

.field private mNavigationListener:Lcom/actionbarsherlock/app/ActionBar$OnNavigationListener;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x1

    .line 26
    invoke-direct {p0}, Lcom/actionbarsherlock/app/ActionBar;-><init>()V

    .line 22
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v2, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mMenuVisibilityListeners:Ljava/util/Set;

    .line 27
    iput-object p1, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActivity:Landroid/app/Activity;

    .line 28
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    iput-object v2, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    .line 29
    iget-object v2, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    if-eqz v2, :cond_0

    .line 30
    iget-object v2, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v2, p0}, Landroid/app/ActionBar;->addOnMenuVisibilityListener(Landroid/app/ActionBar$OnMenuVisibilityListener;)V

    .line 33
    iget-object v2, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v2}, Landroid/app/ActionBar;->getDisplayOptions()I

    move-result v0

    .line 34
    .local v0, "displayOptions":I
    iget-object v2, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    and-int/lit8 v3, v0, 0x4

    if-eqz v3, :cond_1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 36
    .end local v0    # "displayOptions":I
    :cond_0
    return-void

    .line 34
    .restart local v0    # "displayOptions":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/actionbarsherlock/internal/app/ActionBarWrapper;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/app/ActionBarWrapper;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$100(Lcom/actionbarsherlock/internal/app/ActionBarWrapper;)Landroid/support/v4/app/FragmentTransaction;
    .locals 1
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/app/ActionBarWrapper;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mFragmentTransaction:Landroid/support/v4/app/FragmentTransaction;

    return-object v0
.end method

.method static synthetic access$102(Lcom/actionbarsherlock/internal/app/ActionBarWrapper;Landroid/support/v4/app/FragmentTransaction;)Landroid/support/v4/app/FragmentTransaction;
    .locals 0
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/app/ActionBarWrapper;
    .param p1, "x1"    # Landroid/support/v4/app/FragmentTransaction;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mFragmentTransaction:Landroid/support/v4/app/FragmentTransaction;

    return-object p1
.end method


# virtual methods
.method public addOnMenuVisibilityListener(Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;

    .prologue
    .line 499
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mMenuVisibilityListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 500
    return-void
.end method

.method public addTab(Lcom/actionbarsherlock/app/ActionBar$Tab;)V
    .locals 2
    .param p1, "tab"    # Lcom/actionbarsherlock/app/ActionBar$Tab;

    .prologue
    .line 422
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    check-cast p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;

    .end local p1    # "tab":Lcom/actionbarsherlock/app/ActionBar$Tab;
    iget-object v1, p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;->mNativeTab:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 423
    return-void
.end method

.method public addTab(Lcom/actionbarsherlock/app/ActionBar$Tab;I)V
    .locals 2
    .param p1, "tab"    # Lcom/actionbarsherlock/app/ActionBar$Tab;
    .param p2, "position"    # I

    .prologue
    .line 432
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    check-cast p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;

    .end local p1    # "tab":Lcom/actionbarsherlock/app/ActionBar$Tab;
    iget-object v1, p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;->mNativeTab:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1, p2}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;I)V

    .line 433
    return-void
.end method

.method public addTab(Lcom/actionbarsherlock/app/ActionBar$Tab;IZ)V
    .locals 2
    .param p1, "tab"    # Lcom/actionbarsherlock/app/ActionBar$Tab;
    .param p2, "position"    # I
    .param p3, "setSelected"    # Z

    .prologue
    .line 437
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    check-cast p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;

    .end local p1    # "tab":Lcom/actionbarsherlock/app/ActionBar$Tab;
    iget-object v1, p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;->mNativeTab:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1, p2, p3}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;IZ)V

    .line 438
    return-void
.end method

.method public addTab(Lcom/actionbarsherlock/app/ActionBar$Tab;Z)V
    .locals 2
    .param p1, "tab"    # Lcom/actionbarsherlock/app/ActionBar$Tab;
    .param p2, "setSelected"    # Z

    .prologue
    .line 427
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    check-cast p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;

    .end local p1    # "tab":Lcom/actionbarsherlock/app/ActionBar$Tab;
    iget-object v1, p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;->mNativeTab:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1, p2}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;Z)V

    .line 428
    return-void
.end method

.method public getCustomView()Landroid/view/View;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayOptions()I
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getDisplayOptions()I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 479
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getHeight()I

    move-result v0

    return v0
.end method

.method public getNavigationItemCount()I
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getNavigationItemCount()I

    move-result v0

    return v0
.end method

.method public getNavigationMode()I
    .locals 1

    .prologue
    .line 244
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getNavigationMode()I

    move-result v0

    return v0
.end method

.method public getSelectedNavigationIndex()I
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getSelectedNavigationIndex()I

    move-result v0

    return v0
.end method

.method public getSelectedTab()Lcom/actionbarsherlock/app/ActionBar$Tab;
    .locals 2

    .prologue
    .line 462
    iget-object v1, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v1}, Landroid/app/ActionBar;->getSelectedTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    .line 463
    .local v0, "selected":Landroid/app/ActionBar$Tab;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/ActionBar$Tab;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/app/ActionBar$Tab;

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTabAt(I)Lcom/actionbarsherlock/app/ActionBar$Tab;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 468
    iget-object v1, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v1, p1}, Landroid/app/ActionBar;->getTabAt(I)Landroid/app/ActionBar$Tab;

    move-result-object v0

    .line 469
    .local v0, "selected":Landroid/app/ActionBar$Tab;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/ActionBar$Tab;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/app/ActionBar$Tab;

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getTabCount()I
    .locals 1

    .prologue
    .line 474
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getTabCount()I

    move-result v0

    return v0
.end method

.method public getThemedContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public hide()V
    .locals 1

    .prologue
    .line 489
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->hide()V

    .line 490
    return-void
.end method

.method public isShowing()Z
    .locals 1

    .prologue
    .line 494
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->isShowing()Z

    move-result v0

    return v0
.end method

.method public newTab()Lcom/actionbarsherlock/app/ActionBar$Tab;
    .locals 2

    .prologue
    .line 417
    new-instance v0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;

    iget-object v1, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;-><init>(Lcom/actionbarsherlock/internal/app/ActionBarWrapper;Landroid/app/ActionBar$Tab;)V

    return-object v0
.end method

.method public onMenuVisibilityChanged(Z)V
    .locals 3
    .param p1, "isVisible"    # Z

    .prologue
    .line 509
    iget-object v2, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mMenuVisibilityListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;

    .line 510
    .local v1, "listener":Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;
    invoke-interface {v1, p1}, Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;->onMenuVisibilityChanged(Z)V

    goto :goto_0

    .line 512
    .end local v1    # "listener":Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;
    :cond_0
    return-void
.end method

.method public onNavigationItemSelected(IJ)Z
    .locals 2
    .param p1, "itemPosition"    # I
    .param p2, "itemId"    # J

    .prologue
    .line 100
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mNavigationListener:Lcom/actionbarsherlock/app/ActionBar$OnNavigationListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/actionbarsherlock/app/ActionBar$OnNavigationListener;->onNavigationItemSelected(IJ)Z

    move-result v0

    return v0
.end method

.method public removeAllTabs()V
    .locals 1

    .prologue
    .line 452
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->removeAllTabs()V

    .line 453
    return-void
.end method

.method public removeOnMenuVisibilityListener(Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/actionbarsherlock/app/ActionBar$OnMenuVisibilityListener;

    .prologue
    .line 504
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mMenuVisibilityListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 505
    return-void
.end method

.method public removeTab(Lcom/actionbarsherlock/app/ActionBar$Tab;)V
    .locals 2
    .param p1, "tab"    # Lcom/actionbarsherlock/app/ActionBar$Tab;

    .prologue
    .line 442
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    check-cast p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;

    .end local p1    # "tab":Lcom/actionbarsherlock/app/ActionBar$Tab;
    iget-object v1, p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;->mNativeTab:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->removeTab(Landroid/app/ActionBar$Tab;)V

    .line 443
    return-void
.end method

.method public removeTabAt(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 447
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->removeTabAt(I)V

    .line 448
    return-void
.end method

.method public selectTab(Lcom/actionbarsherlock/app/ActionBar$Tab;)V
    .locals 2
    .param p1, "tab"    # Lcom/actionbarsherlock/app/ActionBar$Tab;

    .prologue
    .line 457
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    check-cast p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;

    .end local p1    # "tab":Lcom/actionbarsherlock/app/ActionBar$Tab;
    iget-object v1, p1, Lcom/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper;->mNativeTab:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 458
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 183
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 184
    return-void
.end method

.method public setCustomView(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 67
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setCustomView(I)V

    .line 68
    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 52
    return-void
.end method

.method public setCustomView(Landroid/view/View;Lcom/actionbarsherlock/app/ActionBar$LayoutParams;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "layoutParams"    # Lcom/actionbarsherlock/app/ActionBar$LayoutParams;

    .prologue
    .line 56
    new-instance v0, Landroid/app/ActionBar$LayoutParams;

    invoke-direct {v0, p2}, Landroid/app/ActionBar$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .local v0, "lp":Landroid/app/ActionBar$LayoutParams;
    iget v1, p2, Lcom/actionbarsherlock/app/ActionBar$LayoutParams;->gravity:I

    iput v1, v0, Landroid/app/ActionBar$LayoutParams;->gravity:I

    .line 58
    iget v1, p2, Lcom/actionbarsherlock/app/ActionBar$LayoutParams;->bottomMargin:I

    iput v1, v0, Landroid/app/ActionBar$LayoutParams;->bottomMargin:I

    .line 59
    iget v1, p2, Lcom/actionbarsherlock/app/ActionBar$LayoutParams;->topMargin:I

    iput v1, v0, Landroid/app/ActionBar$LayoutParams;->topMargin:I

    .line 60
    iget v1, p2, Lcom/actionbarsherlock/app/ActionBar$LayoutParams;->leftMargin:I

    iput v1, v0, Landroid/app/ActionBar$LayoutParams;->leftMargin:I

    .line 61
    iget v1, p2, Lcom/actionbarsherlock/app/ActionBar$LayoutParams;->rightMargin:I

    iput v1, v0, Landroid/app/ActionBar$LayoutParams;->rightMargin:I

    .line 62
    iget-object v1, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v1, p1, v0}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 63
    return-void
.end method

.method public setDisplayHomeAsUpEnabled(Z)V
    .locals 1
    .param p1, "showHomeAsUp"    # Z

    .prologue
    .line 168
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 169
    return-void
.end method

.method public setDisplayOptions(I)V
    .locals 2
    .param p1, "options"    # I

    .prologue
    .line 140
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setDisplayOptions(I)V

    .line 143
    iget-object v1, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 144
    return-void

    .line 143
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setDisplayOptions(II)V
    .locals 2
    .param p1, "options"    # I
    .param p2, "mask"    # I

    .prologue
    .line 148
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 151
    and-int/lit8 v0, p2, 0x4

    if-eqz v0, :cond_0

    .line 152
    iget-object v1, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 154
    :cond_0
    return-void

    .line 152
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setDisplayShowCustomEnabled(Z)V
    .locals 1
    .param p1, "showCustom"    # Z

    .prologue
    .line 178
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    .line 179
    return-void
.end method

.method public setDisplayShowHomeEnabled(Z)V
    .locals 1
    .param p1, "showHome"    # Z

    .prologue
    .line 163
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 164
    return-void
.end method

.method public setDisplayShowTitleEnabled(Z)V
    .locals 1
    .param p1, "showTitle"    # Z

    .prologue
    .line 173
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 174
    return-void
.end method

.method public setDisplayUseLogoEnabled(Z)V
    .locals 1
    .param p1, "useLogo"    # Z

    .prologue
    .line 158
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setDisplayUseLogoEnabled(Z)V

    .line 159
    return-void
.end method

.method public setHomeActionContentDescription(I)V
    .locals 0
    .param p1, "contentResId"    # I

    .prologue
    .line 225
    return-void
.end method

.method public setHomeAsUpIndicator(Landroid/graphics/drawable/Drawable;)V
    .locals 9
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const v8, 0x102002c

    .line 199
    iget-object v7, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActivity:Landroid/app/Activity;

    invoke-virtual {v7, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 200
    .local v2, "home":Landroid/view/View;
    if-nez v2, :cond_1

    .line 221
    :cond_0
    :goto_0
    return-void

    .line 205
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 206
    .local v3, "parent":Landroid/view/ViewGroup;
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 207
    .local v0, "childCount":I
    const/4 v7, 0x2

    if-ne v0, v7, :cond_0

    .line 212
    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 213
    .local v1, "first":Landroid/view/View;
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 214
    .local v4, "second":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v7

    if-ne v7, v8, :cond_2

    move-object v5, v4

    .line 216
    .local v5, "up":Landroid/view/View;
    :goto_1
    instance-of v7, v5, Landroid/widget/ImageView;

    if-eqz v7, :cond_0

    move-object v6, v5

    .line 218
    check-cast v6, Landroid/widget/ImageView;

    .line 219
    .local v6, "upIndicatorView":Landroid/widget/ImageView;
    invoke-virtual {v6, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .end local v5    # "up":Landroid/view/View;
    .end local v6    # "upIndicatorView":Landroid/widget/ImageView;
    :cond_2
    move-object v5, v1

    .line 214
    goto :goto_1
.end method

.method public setHomeButtonEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 41
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 42
    return-void
.end method

.method public setIcon(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 72
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setIcon(I)V

    .line 73
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 78
    return-void
.end method

.method public setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Lcom/actionbarsherlock/app/ActionBar$OnNavigationListener;)V
    .locals 1
    .param p1, "adapter"    # Landroid/widget/SpinnerAdapter;
    .param p2, "callback"    # Lcom/actionbarsherlock/app/ActionBar$OnNavigationListener;

    .prologue
    .line 92
    iput-object p2, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mNavigationListener:Lcom/actionbarsherlock/app/ActionBar$OnNavigationListener;

    .line 93
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    if-eqz p2, :cond_0

    .end local p0    # "this":Lcom/actionbarsherlock/internal/app/ActionBarWrapper;
    :goto_0
    invoke-virtual {v0, p1, p0}, Landroid/app/ActionBar;->setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Landroid/app/ActionBar$OnNavigationListener;)V

    .line 94
    return-void

    .line 93
    .restart local p0    # "this":Lcom/actionbarsherlock/internal/app/ActionBarWrapper;
    :cond_0
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public setLogo(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 82
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setLogo(I)V

    .line 83
    return-void
.end method

.method public setLogo(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "logo"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    .line 88
    return-void
.end method

.method public setNavigationMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 249
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 250
    return-void
.end method

.method public setSelectedNavigationItem(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 106
    return-void
.end method

.method public setSplitBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setSplitBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 194
    return-void
.end method

.method public setStackedBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 188
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setStackedBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 189
    return-void
.end method

.method public setSubtitle(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 135
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setSubtitle(I)V

    .line 136
    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 131
    return-void
.end method

.method public setTitle(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 125
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setTitle(I)V

    .line 126
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 121
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 484
    iget-object v0, p0, Lcom/actionbarsherlock/internal/app/ActionBarWrapper;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->show()V

    .line 485
    return-void
.end method
