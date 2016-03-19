.class public Lcom/seeclickfix/ma/android/api/SCFService;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/api/SCFService$2;,
        Lcom/seeclickfix/ma/android/api/SCFService$FollowResultEvent;,
        Lcom/seeclickfix/ma/android/api/SCFService$RevokeVoteResultEvent;,
        Lcom/seeclickfix/ma/android/api/SCFService$VoteResultEvent;,
        Lcom/seeclickfix/ma/android/api/SCFService$ChangeStatusEvent;,
        Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;,
        Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;,
        Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;,
        Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;,
        Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;,
        Lcom/seeclickfix/ma/android/api/SCFService$IssueStub;,
        Lcom/seeclickfix/ma/android/api/SCFService$Metadata;,
        Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;,
        Lcom/seeclickfix/ma/android/api/SCFService$APIv1;,
        Lcom/seeclickfix/ma/android/api/SCFService$APIv2;
    }
.end annotation


# static fields
.field private static debugLevel:Lretrofit/RestAdapter$LogLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lretrofit/RestAdapter$LogLevel;->BASIC:Lretrofit/RestAdapter$LogLevel;

    sput-object v0, Lcom/seeclickfix/ma/android/api/SCFService;->debugLevel:Lretrofit/RestAdapter$LogLevel;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 528
    return-void
.end method

.method public static createV1Service(Landroid/content/Context;)Lcom/seeclickfix/ma/android/api/SCFService$APIv1;
    .locals 4
    .param p0, "appContext"    # Landroid/content/Context;

    .prologue
    .line 144
    new-instance v2, Lcom/google/gson/GsonBuilder;

    invoke-direct {v2}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-string/jumbo v3, "yyyy-MM-dd\'T\'HH:mm:ssZZZZZ"

    invoke-virtual {v2, v3}, Lcom/google/gson/GsonBuilder;->setDateFormat(Ljava/lang/String;)Lcom/google/gson/GsonBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    .line 148
    .local v0, "gson":Lcom/google/gson/Gson;
    new-instance v2, Lretrofit/RestAdapter$Builder;

    invoke-direct {v2}, Lretrofit/RestAdapter$Builder;-><init>()V

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getEndpoint(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lretrofit/RestAdapter$Builder;->setEndpoint(Ljava/lang/String;)Lretrofit/RestAdapter$Builder;

    move-result-object v2

    invoke-static {p0}, Lcom/seeclickfix/ma/android/api/SCFService;->interceptor(Landroid/content/Context;)Lretrofit/RequestInterceptor;

    move-result-object v3

    invoke-virtual {v2, v3}, Lretrofit/RestAdapter$Builder;->setRequestInterceptor(Lretrofit/RequestInterceptor;)Lretrofit/RestAdapter$Builder;

    move-result-object v2

    new-instance v3, Lretrofit/converter/GsonConverter;

    invoke-direct {v3, v0}, Lretrofit/converter/GsonConverter;-><init>(Lcom/google/gson/Gson;)V

    invoke-virtual {v2, v3}, Lretrofit/RestAdapter$Builder;->setConverter(Lretrofit/converter/Converter;)Lretrofit/RestAdapter$Builder;

    move-result-object v2

    sget-object v3, Lcom/seeclickfix/ma/android/api/SCFService;->debugLevel:Lretrofit/RestAdapter$LogLevel;

    invoke-virtual {v2, v3}, Lretrofit/RestAdapter$Builder;->setLogLevel(Lretrofit/RestAdapter$LogLevel;)Lretrofit/RestAdapter$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lretrofit/RestAdapter$Builder;->build()Lretrofit/RestAdapter;

    move-result-object v1

    .line 155
    .local v1, "restAdapter":Lretrofit/RestAdapter;
    const-class v2, Lcom/seeclickfix/ma/android/api/SCFService$APIv1;

    invoke-virtual {v1, v2}, Lretrofit/RestAdapter;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/api/SCFService$APIv1;

    return-object v2
.end method

.method public static createV2Service(Landroid/content/Context;)Lcom/seeclickfix/ma/android/api/SCFService$APIv2;
    .locals 4
    .param p0, "appContext"    # Landroid/content/Context;

    .prologue
    .line 129
    new-instance v2, Lcom/google/gson/GsonBuilder;

    invoke-direct {v2}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-string/jumbo v3, "yyyy-MM-dd\'T\'HH:mm:ssZZZZZ"

    invoke-virtual {v2, v3}, Lcom/google/gson/GsonBuilder;->setDateFormat(Ljava/lang/String;)Lcom/google/gson/GsonBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    .line 133
    .local v0, "gson":Lcom/google/gson/Gson;
    new-instance v2, Lretrofit/RestAdapter$Builder;

    invoke-direct {v2}, Lretrofit/RestAdapter$Builder;-><init>()V

    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getEndpoint(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lretrofit/RestAdapter$Builder;->setEndpoint(Ljava/lang/String;)Lretrofit/RestAdapter$Builder;

    move-result-object v2

    invoke-static {p0}, Lcom/seeclickfix/ma/android/api/SCFService;->interceptor(Landroid/content/Context;)Lretrofit/RequestInterceptor;

    move-result-object v3

    invoke-virtual {v2, v3}, Lretrofit/RestAdapter$Builder;->setRequestInterceptor(Lretrofit/RequestInterceptor;)Lretrofit/RestAdapter$Builder;

    move-result-object v2

    new-instance v3, Lretrofit/converter/GsonConverter;

    invoke-direct {v3, v0}, Lretrofit/converter/GsonConverter;-><init>(Lcom/google/gson/Gson;)V

    invoke-virtual {v2, v3}, Lretrofit/RestAdapter$Builder;->setConverter(Lretrofit/converter/Converter;)Lretrofit/RestAdapter$Builder;

    move-result-object v2

    sget-object v3, Lcom/seeclickfix/ma/android/api/SCFService;->debugLevel:Lretrofit/RestAdapter$LogLevel;

    invoke-virtual {v2, v3}, Lretrofit/RestAdapter$Builder;->setLogLevel(Lretrofit/RestAdapter$LogLevel;)Lretrofit/RestAdapter$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lretrofit/RestAdapter$Builder;->build()Lretrofit/RestAdapter;

    move-result-object v1

    .line 140
    .local v1, "restAdapter":Lretrofit/RestAdapter;
    const-class v2, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v1, v2}, Lretrofit/RestAdapter;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    return-object v2
.end method

.method public static interceptor(Landroid/content/Context;)Lretrofit/RequestInterceptor;
    .locals 1
    .param p0, "appContext"    # Landroid/content/Context;

    .prologue
    .line 160
    new-instance v0, Lcom/seeclickfix/ma/android/api/SCFService$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/api/SCFService$1;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
