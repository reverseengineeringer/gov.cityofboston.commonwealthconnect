.class public final Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter;
.super Ldagger/internal/ProvidesBinding;
.source "LocDialogLauncherModule$$ModuleAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProvideDialogManagerProvidesAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/ProvidesBinding",
        "<",
        "Lcom/seeclickfix/ma/android/dialogs/DialogManager;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/dialogs/DialogManager;",
        ">;"
    }
.end annotation


# instance fields
.field private final module:Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;)V
    .locals 4
    .param p1, "module"    # Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    .prologue
    .line 48
    const-string/jumbo v0, "com.seeclickfix.ma.android.dialogs.DialogManager"

    const/4 v1, 0x1

    const-string/jumbo v2, "com.seeclickfix.ma.android.objects.modules.LocDialogLauncherModule"

    const-string/jumbo v3, "provideDialogManager"

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/ProvidesBinding;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 49
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter;->module:Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    .line 50
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter;->setLibrary(Z)V

    .line 51
    return-void
.end method


# virtual methods
.method public get()Lcom/seeclickfix/ma/android/dialogs/DialogManager;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter;->module:Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;->provideDialogManager()Lcom/seeclickfix/ma/android/dialogs/DialogManager;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter;->get()Lcom/seeclickfix/ma/android/dialogs/DialogManager;

    move-result-object v0

    return-object v0
.end method
