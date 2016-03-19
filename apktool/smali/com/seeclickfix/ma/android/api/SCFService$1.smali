.class final Lcom/seeclickfix/ma/android/api/SCFService$1;
.super Ljava/lang/Object;
.source "SCFService.java"

# interfaces
.implements Lretrofit/RequestInterceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/api/SCFService;->interceptor(Landroid/content/Context;)Lretrofit/RequestInterceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$appContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 160
    iput-object p1, p0, Lcom/seeclickfix/ma/android/api/SCFService$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public intercept(Lretrofit/RequestInterceptor$RequestFacade;)V
    .locals 5
    .param p1, "request"    # Lretrofit/RequestInterceptor$RequestFacade;

    .prologue
    .line 163
    new-instance v0, Ljava/net/HttpCookie;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/api/SCFService$1;->val$appContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/config/AppBuild;->getCookieName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "Pref:COOKIE"

    const-string/jumbo v3, ""

    iget-object v4, p0, Lcom/seeclickfix/ma/android/api/SCFService$1;->val$appContext:Landroid/content/Context;

    invoke-static {v2, v3, v4}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/net/HttpCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .local v0, "authCookie":Ljava/net/HttpCookie;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/HttpCookie;->setVersion(I)V

    .line 169
    const-string/jumbo v1, "User-Agent"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/api/SCFService$1;->val$appContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/seeclickfix/ma/android/config/AppBuild;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Lretrofit/RequestInterceptor$RequestFacade;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    const-string/jumbo v1, "Accept-Language"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/api/SCFService$1;->val$appContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->getLanguage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Lretrofit/RequestInterceptor$RequestFacade;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    const-string/jumbo v1, "Cookie"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Lretrofit/RequestInterceptor$RequestFacade;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    const-string/jumbo v1, "Accept"

    const-string/jumbo v2, "application/json"

    invoke-interface {p1, v1, v2}, Lretrofit/RequestInterceptor$RequestFacade;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    return-void
.end method
