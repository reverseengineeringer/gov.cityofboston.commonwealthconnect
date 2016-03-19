.class public Lcom/seeclickfix/ma/android/auth/LoginOnStartupFlag;
.super Ljava/lang/Object;
.source "LoginOnStartupFlag.java"


# instance fields
.field mContext:Landroid/content/Context;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldPromptForLogin(Lcom/seeclickfix/ma/android/objects/DedicatedApp;)Z
    .locals 6
    .param p1, "app"    # Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .prologue
    const/4 v3, 0x0

    .line 21
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v4

    iget-boolean v2, v4, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->loginOnStartup:Z

    .line 24
    .local v2, "loginOnStartup":Z
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v1

    .line 28
    .local v1, "isLoggedIn":Z
    const-string/jumbo v4, "PrefNames:SKIPPED_LOGIN"

    iget-object v5, p0, Lcom/seeclickfix/ma/android/auth/LoginOnStartupFlag;->mContext:Landroid/content/Context;

    invoke-static {v4, v3, v5}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getBoolean(Ljava/lang/String;ZLandroid/content/Context;)Z

    move-result v0

    .line 33
    .local v0, "hasSkipped":Z
    if-eqz v2, :cond_0

    if-nez v1, :cond_0

    if-nez v0, :cond_0

    .line 34
    const/4 v3, 0x1

    .line 37
    :cond_0
    return v3
.end method
