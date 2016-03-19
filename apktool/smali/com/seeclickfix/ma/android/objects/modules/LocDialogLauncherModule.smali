.class public Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;
.super Ljava/lang/Object;
.source "LocDialogLauncherModule.java"


# annotations
.annotation runtime Ldagger/Module;
    injects = {
        Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;
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
.method provideDialogManager()Lcom/seeclickfix/ma/android/dialogs/DialogManager;
    .locals 1
    .annotation runtime Ldagger/Provides;
    .end annotation

    .annotation runtime Ljavax/inject/Singleton;
    .end annotation

    .prologue
    .line 18
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/DialogManager;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/DialogManager;-><init>()V

    return-object v0
.end method
