.class public Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;
.super Ljava/lang/Object;
.source "AccountManagerModule.java"


# annotations
.annotation runtime Ldagger/Module;
    complete = false
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/ContextModule;
    }
    injects = {
        Lcom/seeclickfix/ma/android/fragments/LoginFrag;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method provideAccountManagerService(Landroid/content/Context;)Landroid/accounts/AccountManager;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation runtime Ldagger/Provides;
    .end annotation

    .prologue
    .line 19
    const-string/jumbo v0, "account"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/accounts/AccountManager;

    return-object v0
.end method
