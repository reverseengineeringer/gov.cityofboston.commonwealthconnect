.class public Lcom/seeclickfix/ma/android/auth/LoginStateController;
.super Ljava/lang/Object;
.source "LoginStateController.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "LoginStateMachine"

.field private static instance:Lcom/seeclickfix/ma/android/auth/LoginStateController;


# instance fields
.field private mUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

.field private onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    sput-object v0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->instance:Lcom/seeclickfix/ma/android/auth/LoginStateController;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->mUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 27
    return-void
.end method

.method public static getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->instance:Lcom/seeclickfix/ma/android/auth/LoginStateController;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lcom/seeclickfix/ma/android/auth/LoginStateController;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/auth/LoginStateController;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->instance:Lcom/seeclickfix/ma/android/auth/LoginStateController;

    .line 34
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->instance:Lcom/seeclickfix/ma/android/auth/LoginStateController;

    return-object v0
.end method


# virtual methods
.method public clearAuthCompleteParams()V
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 73
    return-void
.end method

.method public dispatchLoginEvent(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 4
    .param p1, "user"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->mUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 51
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    new-instance v1, Lcom/seeclickfix/ma/android/events/LoginEvent;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->mUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v1, v2, v3}, Lcom/seeclickfix/ma/android/events/LoginEvent;-><init>(Lcom/seeclickfix/ma/android/objects/user/AuthUser;Lcom/seeclickfix/ma/android/objects/PageParams;)V

    invoke-virtual {v0, v1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method public dispatchLoginSkipEvent()V
    .locals 3

    .prologue
    .line 63
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    new-instance v1, Lcom/seeclickfix/ma/android/events/LoginSkipEvent;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v1, v2}, Lcom/seeclickfix/ma/android/events/LoginSkipEvent;-><init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    invoke-virtual {v0, v1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 64
    return-void
.end method

.method public getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    return-object v0
.end method

.method public onAuthRequiredEvent(Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;)V
    .locals 1
    .param p1, "authEvent"    # Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;->getParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 69
    return-void
.end method

.method public produceLoginState()Lcom/seeclickfix/ma/android/events/LoginEvent;
    .locals 3
    .annotation runtime Lcom/squareup/otto/Produce;
    .end annotation

    .prologue
    .line 40
    iget-object v0, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->mUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    if-nez v0, :cond_0

    .line 41
    const/4 v0, 0x0

    .line 43
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/events/LoginEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->mUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/events/LoginEvent;-><init>(Lcom/seeclickfix/ma/android/objects/user/AuthUser;Lcom/seeclickfix/ma/android/objects/PageParams;)V

    goto :goto_0
.end method

.method public resetLoginState()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->mUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 58
    iput-object v0, p0, Lcom/seeclickfix/ma/android/auth/LoginStateController;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 59
    return-void
.end method
