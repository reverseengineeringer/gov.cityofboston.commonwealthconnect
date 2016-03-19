.class public Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;
.super Ljava/lang/Object;
.source "MainActivityModule.java"


# annotations
.annotation runtime Ldagger/Module;
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/LocationAdapterModule;,
        Lcom/seeclickfix/ma/android/dagger/LoginOnStartupModule;
    }
    injects = {
        Lcom/seeclickfix/ma/android/SeeclickfixActivity;
    }
    library = true
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method
