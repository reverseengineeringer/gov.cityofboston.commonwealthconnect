.class public Lcom/seeclickfix/ma/android/config/AppBuild;
.super Ljava/lang/Object;
.source "AppBuild.java"


# static fields
.field public static final API_KEY:Ljava/lang/String; = "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

.field private static final APP_NAME_SUFFIX:Ljava/lang/String; = "-Android"

.field private static final COOKIE_INT:Ljava/lang/String; = "_scf_session_key_app_int"

.field private static final COOKIE_PROD:Ljava/lang/String; = "_scf_session_key"

.field private static final COOKIE_TEST:Ljava/lang/String; = "_scf_session_key_app_test"

.field public static final CUSTOM:Ljava/lang/String; = "ENVIRONMENT.CUSTOM"

.field private static final D:Z = false

.field public static final DEBUGGING:Z = false

.field public static DEFAULT_ENVIRONMENT:Ljava/lang/String; = null

.field private static final GLOBAL_DEBUG:Z = false

.field public static final INT:Ljava/lang/String; = "ENVIRONMENT.INT"

.field private static final LOCAL_DEBUG:Z = true

.field public static final PROD:Ljava/lang/String; = "ENVIRONMENT.PROD"

.field private static final TAG:Ljava/lang/String; = "AppBuild"

.field public static final TAG_PREFIX:Ljava/lang/String; = "SCFAPP_"

.field public static final TEST:Ljava/lang/String; = "ENVIRONMENT.TEST"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string/jumbo v0, "ENVIRONMENT.PROD"

    sput-object v0, Lcom/seeclickfix/ma/android/config/AppBuild;->DEFAULT_ENVIRONMENT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAppName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 129
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->name:Ljava/lang/String;

    return-object v0
.end method

.method public static final getCookieName(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 63
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/AppBuild;->getEnvironment(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "env":Ljava/lang/String;
    const-string/jumbo v1, "ENVIRONMENT.TEST"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    const-string/jumbo v1, "_scf_session_key_app_test"

    .line 73
    :goto_0
    return-object v1

    .line 69
    :cond_0
    const-string/jumbo v1, "ENVIRONMENT.INT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 70
    const-string/jumbo v1, "_scf_session_key_app_int"

    goto :goto_0

    .line 73
    :cond_1
    const-string/jumbo v1, "_scf_session_key"

    goto :goto_0
.end method

.method public static final getEnvironment(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/AppBuild;->getHostname(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 29
    .local v0, "env":Ljava/lang/String;
    const-string/jumbo v1, "ENVIRONMENT.PROD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "ENVIRONMENT.INT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "ENVIRONMENT.TEST"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 32
    .end local v0    # "env":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .restart local v0    # "env":Ljava/lang/String;
    :cond_1
    const-string/jumbo v0, "ENVIRONMENT.CUSTOM"

    goto :goto_0
.end method

.method public static final getHostname(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 37
    const-string/jumbo v0, "PrefNames:ENVIRONMENT"

    sget-object v1, Lcom/seeclickfix/ma/android/config/AppBuild;->DEFAULT_ENVIRONMENT:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPackageName(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 117
    const-string/jumbo v0, ""

    .line 120
    .local v0, "returnString":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 125
    :goto_0
    return-object v0

    .line 121
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static getUserAgent(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getAppId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "-Android"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/AppBuild;->getVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/AppBuild;->getVersionCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVersionCode(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 103
    const-string/jumbo v1, ""

    .line 106
    .local v1, "returnString":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 107
    .local v0, "pi":Landroid/content/pm/PackageInfo;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 112
    .end local v0    # "pi":Landroid/content/pm/PackageInfo;
    :goto_0
    return-object v1

    .line 108
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getVersionName(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 90
    const-string/jumbo v2, ""

    .line 93
    .local v2, "returnString":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 94
    .local v1, "pi":Landroid/content/pm/PackageInfo;
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .end local v1    # "pi":Landroid/content/pm/PackageInfo;
    :goto_0
    return-object v2

    .line 95
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static final setEnvironment(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p0, "env"    # Ljava/lang/String;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 41
    const-string/jumbo v0, "PrefNames:ENVIRONMENT"

    invoke-static {v0, p0, p1}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 42
    return-void
.end method
