.class public final Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter;
.super Ldagger/internal/ProvidesBinding;
.source "AccountManagerModule$$ModuleAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProvideAccountManagerServiceProvidesAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/ProvidesBinding",
        "<",
        "Landroid/accounts/AccountManager;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Landroid/accounts/AccountManager;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final module:Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;)V
    .locals 4
    .param p1, "module"    # Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;

    .prologue
    const/4 v3, 0x0

    .line 55
    const-string/jumbo v0, "android.accounts.AccountManager"

    const-string/jumbo v1, "com.seeclickfix.ma.android.dagger.AccountManagerModule"

    const-string/jumbo v2, "provideAccountManagerService"

    invoke-direct {p0, v0, v3, v1, v2}, Ldagger/internal/ProvidesBinding;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 56
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter;->module:Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;

    .line 57
    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter;->setLibrary(Z)V

    .line 58
    return-void
.end method


# virtual methods
.method public attach(Ldagger/internal/Linker;)V
    .locals 3
    .param p1, "linker"    # Ldagger/internal/Linker;

    .prologue
    .line 67
    const-string/jumbo v0, "android.content.Context"

    const-class v1, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter;->context:Ldagger/internal/Binding;

    .line 68
    return-void
.end method

.method public get()Landroid/accounts/AccountManager;
    .locals 2

    .prologue
    .line 85
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter;->module:Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;

    iget-object v0, p0, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter;->context:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule;->provideAccountManagerService(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter;->get()Landroid/accounts/AccountManager;

    move-result-object v0

    return-object v0
.end method

.method public getDependencies(Ljava/util/Set;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ldagger/internal/Binding",
            "<*>;>;",
            "Ljava/util/Set",
            "<",
            "Ldagger/internal/Binding",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, "getBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    .local p2, "injectMembersBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dagger/AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter;->context:Ldagger/internal/Binding;

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 77
    return-void
.end method
