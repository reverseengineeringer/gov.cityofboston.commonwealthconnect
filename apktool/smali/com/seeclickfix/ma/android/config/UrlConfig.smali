.class public Lcom/seeclickfix/ma/android/config/UrlConfig;
.super Ljava/lang/Object;
.source "UrlConfig.java"


# static fields
.field private static final BASE:Ljava/lang/String; = "/"

.field public static final CATEGORY_ICONS_128:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/category_icons/128/"

.field public static final CATEGORY_ICONS_256:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/category_icons/256/"

.field public static final CATEGORY_ICONS_28:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/category_icons/28/"

.field public static final CATEGORY_ICONS_36:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/category_icons/36/"

.field public static final CATEGORY_ICONS_48:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/category_icons/48/"

.field public static final CATEGORY_ICONS_512:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/category_icons/512/"

.field public static final CATEGORY_ICONS_96:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/category_icons/96/"

.field private static final CATEGORY_ICONS_BASE:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/category_icons/"

.field private static final COMMENT:Ljava/lang/String; = "/api/issues/%d/comments.json"

.field private static final COMMENTS_BY_USER_LIST:Ljava/lang/String; = "/api/users/%d/comments.json"

.field private static final FOLLOW_UP_QUESTIONS:Ljava/lang/String; = "/api/request_types/%s/request_type_questions.json"

.field private static final FORGOT_PASSWORD:Ljava/lang/String; = "/api/forgot_password.json"

.field private static final GEOCODE:Ljava/lang/String; = "/geocodings/latlng_to_address.json"

.field public static final HTTP:Ljava/lang/String; = "http://"

.field public static final HTTPS:Ljava/lang/String; = "https://"

.field public static final INT:Ljava/lang/String; = "int.seeclickfix.com"

.field private static final ISSUE:Ljava/lang/String; = "/api/issues/%d.json"

.field private static final ISSUES_BY_USER_LIST:Ljava/lang/String; = "/api/users/%d/reported.json"

.field private static final ISSUE_LIST:Ljava/lang/String; = "/api/issues.json"

.field private static final ISSUE_SHARE:Ljava/lang/String; = "/issues/"

.field private static final LOGIN:Ljava/lang/String; = "/api/session.json"

.field private static final PLACES:Ljava/lang/String; = "/places/nearby.json"

.field public static final PREFIX:Ljava/lang/String; = "http://"

.field public static final PRODUCTION:Ljava/lang/String; = "seeclickfix.com"

.field private static final REGISTER:Ljava/lang/String; = "/api/users.json"

.field private static final REPORT:Ljava/lang/String; = "/issues.json"

.field private static final REQUEST_TYPES:Ljava/lang/String; = "/api/enhanced_watch_areas/at.json"

.field public static final SECURE_PREFIX:Ljava/lang/String; = "https://"

.field public static final TERMS_OF_USE:Ljava/lang/String; = "http://seeclickfix.com/legal/terms-of-use"

.field public static final TEST:Ljava/lang/String; = "test.seeclickfix.com"

.field private static final USER_PROFILE:Ljava/lang/String; = "/api/users/%d.json"

.field private static final ZONES:Ljava/lang/String; = "/api/enhanced_watch_areas/nearby_with_place.json"

.field public static final ZONE_ICONS_28:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/custom_buttons/28/"

.field public static final ZONE_ICONS_36:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/custom_buttons/36/"

.field public static final ZONE_ICONS_48:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/custom_buttons/48/"

.field public static final ZONE_ICONS_72:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/custom_buttons/72/"

.field public static final ZONE_ICONS_96:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/custom_buttons/96/"

.field private static final ZONE_ICONS_BASE:Ljava/lang/String; = "http://cdn.seeclickfix.com/images/custom_buttons/"

.field private static final ZONE_SINGLE:Ljava/lang/String; = "/api/enhanced_watch_areas/%d/app_config.json"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBaseUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCommentsUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 148
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/issues/%d/comments.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCommentsbyUserUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/users/%d/comments.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getEndpoint(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getPrefix(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getForgotPasswordUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getPrefix(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/forgot_password.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getGoogleGeocodeUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 152
    const-string/jumbo v0, "https://maps.googleapis.com/maps/api/geocode/json"

    return-object v0
.end method

.method public static getIssueListUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/issues.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getIssueShareUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/issues/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getIssuesbyUserUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/users/%d/reported.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLoginUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getPrefix(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/session.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPlacesNearbyUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/places/nearby.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getPrefix(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 172
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/AppBuild;->getEnvironment(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "ENVIRONMENT.CUSTOM"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 173
    const-string/jumbo v0, "https://"

    .line 175
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "http://"

    goto :goto_0
.end method

.method public static getRegisterUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getPrefix(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/users.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getReportUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/issues.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRequestTypesUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/enhanced_watch_areas/at.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSecondaryQuestionUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/request_types/%s/request_type_questions.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getServer(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/AppBuild;->getHostname(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "env":Ljava/lang/String;
    move-object v1, v0

    .line 28
    .local v1, "server":Ljava/lang/String;
    const-string/jumbo v2, "ENVIRONMENT.PROD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 29
    const-string/jumbo v1, "seeclickfix.com"

    .line 31
    :cond_0
    const-string/jumbo v2, "ENVIRONMENT.TEST"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 32
    const-string/jumbo v1, "test.seeclickfix.com"

    .line 34
    :cond_1
    const-string/jumbo v2, "ENVIRONMENT.INT"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 35
    const-string/jumbo v1, "int.seeclickfix.com"

    .line 38
    :cond_2
    return-object v1
.end method

.method public static getSingleIssueUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/issues/%d.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserProfileUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/users/%d.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getZoneSingleUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/enhanced_watch_areas/%d/app_config.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getZonesNearbyWithPlaceUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/enhanced_watch_areas/nearby_with_place.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
