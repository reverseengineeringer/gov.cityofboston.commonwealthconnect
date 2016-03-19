.class public Lcom/seeclickfix/ma/android/auth/AuthManager;
.super Ljava/lang/Object;
.source "AuthManager.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "AuthManager"

.field private static cookieExpiresMs:J

.field private static userObj:Lcom/seeclickfix/ma/android/objects/user/AuthUser;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 21
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/seeclickfix/ma/android/auth/AuthManager;->cookieExpiresMs:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->instance:Lcom/seeclickfix/ma/android/MyApplication;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/MyApplication;->currentUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v0

    return-object v0
.end method

.method public static isAuthenticated()Z
    .locals 2

    .prologue
    .line 24
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v0

    .line 26
    .local v0, "user":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    if-eqz v0, :cond_0

    .line 27
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->isAuthenticated()Z

    move-result v1

    .line 29
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static logout(Landroid/content/Context;)V
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 44
    sput-object v1, Lcom/seeclickfix/ma/android/auth/AuthManager;->userObj:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 46
    const-string/jumbo v0, "Pref:COOKIE_EXPIRES_MS"

    const-wide/16 v2, 0x0

    invoke-static {v0, v2, v3, p0}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putLong(Ljava/lang/String;JLandroid/content/Context;)V

    .line 48
    const-string/jumbo v0, "Pref:AUTH_USER_JSON"

    invoke-static {v0, v1, p0}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 50
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/seeclickfix/ma/android/auth/ProfileController;->clearUser(Landroid/content/Context;)V

    .line 52
    const-string/jumbo v0, "Pref:COOKIE"

    invoke-static {v0, v1, p0}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 55
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    new-instance v1, Lcom/seeclickfix/ma/android/events/LogoutEvent;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/events/LogoutEvent;-><init>()V

    invoke-virtual {v0, v1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 57
    return-void
.end method
