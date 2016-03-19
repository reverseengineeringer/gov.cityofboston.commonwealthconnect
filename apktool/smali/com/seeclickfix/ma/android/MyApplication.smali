.class public Lcom/seeclickfix/ma/android/MyApplication;
.super Landroid/app/Application;
.source "MyApplication.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "MyApplication"

.field private static deviceParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static instance:Lcom/seeclickfix/ma/android/MyApplication;

.field private static issueModel:Lcom/seeclickfix/ma/android/IssueModel;

.field protected static mEventBus:Lcom/squareup/otto/Bus;

.field private static objectGraph:Ldagger/ObjectGraph;

.field private static reportModel:Lcom/seeclickfix/ma/android/ReportModel;

.field public static res:Landroid/content/res/Resources;

.field public static scfV1:Lcom/seeclickfix/ma/android/api/SCFService$APIv1;

.field public static scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lcom/seeclickfix/ma/android/ReportModel;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/ReportModel;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/MyApplication;->reportModel:Lcom/seeclickfix/ma/android/ReportModel;

    .line 62
    new-instance v0, Lcom/seeclickfix/ma/android/IssueModel;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/IssueModel;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/MyApplication;->issueModel:Lcom/seeclickfix/ma/android/IssueModel;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static from(Landroid/content/Context;)Lcom/seeclickfix/ma/android/MyApplication;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 184
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/MyApplication;

    return-object v0
.end method

.method public static getDeviceParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->deviceParams:Ljava/util/Map;

    return-object v0
.end method

.method public static getEventBus()Lcom/squareup/otto/Bus;
    .locals 1

    .prologue
    .line 149
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->mEventBus:Lcom/squareup/otto/Bus;

    return-object v0
.end method

.method public static getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;
    .locals 1

    .prologue
    .line 81
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->issueModel:Lcom/seeclickfix/ma/android/IssueModel;

    return-object v0
.end method

.method public static getObjectGraph()Ldagger/ObjectGraph;
    .locals 1

    .prologue
    .line 180
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->objectGraph:Ldagger/ObjectGraph;

    return-object v0
.end method

.method public static getReportModel()Lcom/seeclickfix/ma/android/ReportModel;
    .locals 1

    .prologue
    .line 77
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->reportModel:Lcom/seeclickfix/ma/android/ReportModel;

    return-object v0
.end method

.method public static getScfV1()Lcom/seeclickfix/ma/android/api/SCFService$APIv1;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV1:Lcom/seeclickfix/ma/android/api/SCFService$APIv1;

    return-object v0
.end method

.method public static getScfV2()Lcom/seeclickfix/ma/android/api/SCFService$APIv2;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    return-object v0
.end method

.method public static inject(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "object":Ljava/lang/Object;, "TT;"
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->objectGraph:Ldagger/ObjectGraph;

    invoke-virtual {v0, p0}, Ldagger/ObjectGraph;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public createV1Service()V
    .locals 1

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/api/SCFService;->createV1Service(Landroid/content/Context;)Lcom/seeclickfix/ma/android/api/SCFService$APIv1;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV1:Lcom/seeclickfix/ma/android/api/SCFService$APIv1;

    .line 126
    return-void
.end method

.method public createV2Service()V
    .locals 1

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/api/SCFService;->createV2Service(Landroid/content/Context;)Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    .line 122
    return-void
.end method

.method public currentUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .locals 5

    .prologue
    .line 129
    const/4 v1, 0x0

    .line 131
    .local v1, "user":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    if-nez v1, :cond_0

    .line 132
    const-string/jumbo v2, "Pref:AUTH_USER_JSON"

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "authUserString":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 135
    new-instance v2, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v2}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    const-class v3, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    invoke-virtual {v2, v0, v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "user":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    check-cast v1, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 141
    .end local v0    # "authUserString":Ljava/lang/String;
    .restart local v1    # "user":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    :cond_0
    return-object v1
.end method

.method public getInstance()Lcom/seeclickfix/ma/android/MyApplication;
    .locals 1

    .prologue
    .line 118
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->instance:Lcom/seeclickfix/ma/android/MyApplication;

    return-object v0
.end method

.method protected getModules()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 156
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v0, "modules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/MainModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/modules/MainModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/ContextModule;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/objects/modules/ContextModule;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/LocationAdapterModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/modules/LocationAdapterModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/LocationEnabledModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/modules/LocationEnabledModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelperModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelperModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarningModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarningModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    new-instance v1, Lcom/seeclickfix/ma/android/auth/PermissionManagerModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/auth/PermissionManagerModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZoneModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZoneModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProviderInjector;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProviderInjector;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoaderModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoaderModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    new-instance v1, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypesMod;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypesMod;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 86
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 87
    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->onConfigurationChange(Landroid/content/res/Configuration;)V

    .line 88
    return-void
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 93
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 96
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->getModules()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ldagger/ObjectGraph;->create([Ljava/lang/Object;)Ldagger/ObjectGraph;

    move-result-object v1

    sput-object v1, Lcom/seeclickfix/ma/android/MyApplication;->objectGraph:Ldagger/ObjectGraph;

    .line 98
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->updateLocale(Landroid/app/Application;)V

    .line 100
    new-instance v1, Lcom/squareup/otto/Bus;

    sget-object v2, Lcom/squareup/otto/ThreadEnforcer;->MAIN:Lcom/squareup/otto/ThreadEnforcer;

    invoke-direct {v1, v2}, Lcom/squareup/otto/Bus;-><init>(Lcom/squareup/otto/ThreadEnforcer;)V

    sput-object v1, Lcom/seeclickfix/ma/android/MyApplication;->mEventBus:Lcom/squareup/otto/Bus;

    .line 102
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v0

    .line 104
    .local v0, "loginController":Lcom/seeclickfix/ma/android/auth/LoginStateController;
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/squareup/otto/Bus;->register(Ljava/lang/Object;)V

    .line 107
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->createV2Service()V

    .line 108
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->createV1Service()V

    .line 110
    new-instance v1, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v1}, Landroid/support/v4/util/ArrayMap;-><init>()V

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->addStaticParamsToMap(Ljava/util/Map;Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/seeclickfix/ma/android/MyApplication;->deviceParams:Ljava/util/Map;

    .line 112
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    .line 114
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sput-object v1, Lcom/seeclickfix/ma/android/MyApplication;->res:Landroid/content/res/Resources;

    .line 115
    sput-object p0, Lcom/seeclickfix/ma/android/MyApplication;->instance:Lcom/seeclickfix/ma/android/MyApplication;

    .line 116
    return-void
.end method
