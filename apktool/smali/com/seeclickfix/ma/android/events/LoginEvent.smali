.class public Lcom/seeclickfix/ma/android/events/LoginEvent;
.super Ljava/lang/Object;
.source "LoginEvent.java"


# instance fields
.field private onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field private user:Lcom/seeclickfix/ma/android/objects/user/AuthUser;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/user/AuthUser;Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 1
    .param p1, "user"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .param p2, "onAuthCompleteParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/LoginEvent;->user:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 15
    if-eqz p2, :cond_0

    .line 16
    iput-object p2, p0, Lcom/seeclickfix/ma/android/events/LoginEvent;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 20
    :goto_0
    return-void

    .line 18
    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/events/LoginEvent;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    goto :goto_0
.end method


# virtual methods
.method public getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/LoginEvent;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    return-object v0
.end method

.method public getUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/LoginEvent;->user:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    return-object v0
.end method

.method public setUser(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 0
    .param p1, "user"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/LoginEvent;->user:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .line 29
    return-void
.end method
