.class public Lcom/seeclickfix/ma/android/dagger/LoginOnStartupModule;
.super Ljava/lang/Object;
.source "LoginOnStartupModule.java"


# annotations
.annotation runtime Ldagger/Module;
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/ContextModule;
    }
    injects = {
        Lcom/seeclickfix/ma/android/auth/LoginOnStartupFlag;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
