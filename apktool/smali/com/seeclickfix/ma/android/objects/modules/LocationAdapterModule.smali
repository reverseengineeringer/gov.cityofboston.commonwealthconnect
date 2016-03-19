.class public Lcom/seeclickfix/ma/android/objects/modules/LocationAdapterModule;
.super Ljava/lang/Object;
.source "LocationAdapterModule.java"


# annotations
.annotation runtime Ldagger/Module;
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/ContextModule;,
        Lcom/seeclickfix/ma/android/objects/modules/LocationEnabledModule;
    }
    injects = {
        Lcom/seeclickfix/ma/android/location/LocationAdapter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
