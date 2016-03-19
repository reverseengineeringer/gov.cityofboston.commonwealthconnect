.class public Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;
.super Ljava/lang/Object;
.source "SideNavHelper.java"


# instance fields
.field private mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/DedicatedApp;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "dApp"    # Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    if-nez p2, :cond_0

    .line 16
    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object p2

    .line 18
    :cond_0
    iput-object p2, p0, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .line 19
    return-void
.end method

.method public static getHelpUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 47
    new-instance v0, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/DedicatedApp;)V

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->getHelpUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hideHelpButtonFromView(Landroid/content/Context;Landroid/widget/Button;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "navHelpBtn"    # Landroid/widget/Button;

    .prologue
    .line 43
    new-instance v0, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/DedicatedApp;)V

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->hideHelpButtonFromView(Landroid/widget/Button;)V

    .line 44
    return-void
.end method


# virtual methods
.method public getHelpUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 33
    iget-object v1, p0, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v0

    .line 35
    .local v0, "opts":Lcom/seeclickfix/ma/android/objects/app/AppOptions;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 36
    iget-object v1, v0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->helpLink:Ljava/lang/String;

    .line 39
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public hideHelpButtonFromView(Landroid/widget/Button;)V
    .locals 2
    .param p1, "navHelpBtn"    # Landroid/widget/Button;

    .prologue
    .line 23
    iget-object v1, p0, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v0

    .line 25
    .local v0, "opts":Lcom/seeclickfix/ma/android/objects/app/AppOptions;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->mDedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 26
    iget-object v1, v0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->helpLink:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 27
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 30
    :cond_0
    return-void
.end method
