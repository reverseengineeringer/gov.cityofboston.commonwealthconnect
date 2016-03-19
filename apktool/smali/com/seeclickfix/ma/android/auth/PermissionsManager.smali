.class public Lcom/seeclickfix/ma/android/auth/PermissionsManager;
.super Ljava/lang/Object;
.source "PermissionsManager.java"


# static fields
.field static app:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

.field static appOptions:Lcom/seeclickfix/ma/android/objects/app/AppOptions;

.field static authUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

.field static isDedicated:Z


# instance fields
.field mContext:Landroid/content/Context;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-boolean v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->isDedicated:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iget-object v0, p0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->app:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .line 37
    sget-object v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->app:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v0

    sput-boolean v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->isDedicated:Z

    .line 38
    sget-object v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->app:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->appOptions:Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    .line 40
    return-void
.end method

.method private areActionsRestricted(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z
    .locals 1
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->closedIsFinal()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->isClosedOrArchived()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public closedIsFinal()Z
    .locals 1

    .prologue
    .line 66
    sget-boolean v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->isDedicated:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->appOptions:Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    iget-boolean v0, v0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->blockActionOnClosedIssues:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isActionableIssue(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    const/4 v0, 0x1

    .line 55
    const/4 v1, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 61
    :goto_1
    return v0

    .line 55
    :sswitch_0
    const-string/jumbo v2, "com.seeclickfix.actions.CHANGE_STATUS"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "com.seeclickfix.actions.COMMENT"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v1, v0

    goto :goto_0

    :sswitch_2
    const-string/jumbo v2, "com.seeclickfix.actions.VOTE"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    .line 59
    :pswitch_0
    invoke-direct {p0, p2}, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->areActionsRestricted(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z

    move-result v0

    goto :goto_1

    .line 55
    nop

    :sswitch_data_0
    .sparse-switch
        -0x3cd6b2aa -> :sswitch_2
        -0x2ad3558b -> :sswitch_0
        0x35ea5053 -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onLoginEvent(Lcom/seeclickfix/ma/android/events/LoginEvent;)V
    .locals 1
    .param p1, "loginEvent"    # Lcom/seeclickfix/ma/android/events/LoginEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 79
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LoginEvent;->getUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->authUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 80
    return-void
.end method

.method public onLogoutEvent(Lcom/seeclickfix/ma/android/events/LogoutEvent;)V
    .locals 1
    .param p1, "logoutEvent"    # Lcom/seeclickfix/ma/android/events/LogoutEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 84
    const/4 v0, 0x0

    sput-object v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->authUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 85
    return-void
.end method
