.class public Lgov/cityofboston/commonwealthconnect/DedicatedActivity$DedicatedActivityModule;
.super Ljava/lang/Object;
.source "DedicatedActivity.java"


# annotations
.annotation runtime Ldagger/Module;
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;
    }
    injects = {
        Lgov/cityofboston/commonwealthconnect/DedicatedActivity;
    }
    library = true
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lgov/cityofboston/commonwealthconnect/DedicatedActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DedicatedActivityModule"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
