.class public final Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;
.super Ldagger/internal/ModuleAdapter;
.source "LocDialogLauncherModule$$ModuleAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/ModuleAdapter",
        "<",
        "Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;",
        ">;"
    }
.end annotation


# static fields
.field private static final INCLUDES:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final INJECTS:[Ljava/lang/String;

.field private static final STATIC_INJECTIONS:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 14
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.dialogs.launchers.LocationDisableDialogLauncher"

    aput-object v1, v0, v2

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;->INJECTS:[Ljava/lang/String;

    .line 15
    new-array v0, v2, [Ljava/lang/Class;

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;->STATIC_INJECTIONS:[Ljava/lang/Class;

    .line 16
    new-array v0, v2, [Ljava/lang/Class;

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;->INCLUDES:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 19
    const-class v1, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    sget-object v2, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;->INJECTS:[Ljava/lang/String;

    sget-object v3, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;->STATIC_INJECTIONS:[Ljava/lang/Class;

    sget-object v5, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;->INCLUDES:[Ljava/lang/Class;

    const/4 v6, 0x1

    move-object v0, p0

    move v7, v4

    invoke-direct/range {v0 .. v7}, Ldagger/internal/ModuleAdapter;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Ljava/lang/Class;Z[Ljava/lang/Class;ZZ)V

    .line 20
    return-void
.end method


# virtual methods
.method public getBindings(Ldagger/internal/BindingsGroup;Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;)V
    .locals 2
    .param p1, "bindings"    # Ldagger/internal/BindingsGroup;
    .param p2, "module"    # Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    .prologue
    .line 33
    const-string/jumbo v0, "com.seeclickfix.ma.android.dialogs.DialogManager"

    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter;

    invoke-direct {v1, p2}, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter;-><init>(Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;)V

    invoke-virtual {p1, v0, v1}, Ldagger/internal/BindingsGroup;->contributeProvidesBinding(Ljava/lang/String;Ldagger/internal/ProvidesBinding;)Ldagger/internal/Binding;

    .line 34
    return-void
.end method

.method public bridge synthetic getBindings(Ldagger/internal/BindingsGroup;Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ldagger/internal/BindingsGroup;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 13
    check-cast p2, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;->getBindings(Ldagger/internal/BindingsGroup;Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;)V

    return-void
.end method

.method public newModule()Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;-><init>()V

    return-object v0
.end method

.method public bridge synthetic newModule()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 13
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule$$ModuleAdapter;->newModule()Lcom/seeclickfix/ma/android/objects/modules/LocDialogLauncherModule;

    move-result-object v0

    return-object v0
.end method
