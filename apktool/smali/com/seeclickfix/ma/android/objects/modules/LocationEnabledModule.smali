.class public Lcom/seeclickfix/ma/android/objects/modules/LocationEnabledModule;
.super Ljava/lang/Object;
.source "LocationEnabledModule.java"


# annotations
.annotation runtime Ldagger/Module;
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/ContextModule;
    }
    injects = {
        Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method provideLocationManagerService(Landroid/content/Context;)Landroid/location/LocationManager;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation runtime Ldagger/Provides;
    .end annotation

    .prologue
    .line 18
    const-string/jumbo v0, "location"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    return-object v0
.end method
