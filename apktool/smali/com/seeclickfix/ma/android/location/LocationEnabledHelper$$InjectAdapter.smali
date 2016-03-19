.class public final Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;
.super Ldagger/internal/Binding;
.source "LocationEnabledHelper$$InjectAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;
.implements Ldagger/MembersInjector;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/Binding",
        "<",
        "Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;",
        ">;",
        "Ldagger/MembersInjector",
        "<",
        "Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;",
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

.field private locationManager:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Landroid/location/LocationManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 29
    const-string/jumbo v0, "com.seeclickfix.ma.android.location.LocationEnabledHelper"

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.location.LocationEnabledHelper"

    const/4 v2, 0x1

    const-class v3, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/Binding;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 30
    return-void
.end method


# virtual methods
.method public attach(Ldagger/internal/Linker;)V
    .locals 3
    .param p1, "linker"    # Ldagger/internal/Linker;

    .prologue
    .line 39
    const-string/jumbo v0, "android.location.LocationManager"

    const-class v1, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->locationManager:Ldagger/internal/Binding;

    .line 40
    const-string/jumbo v0, "android.content.Context"

    const-class v1, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->context:Ldagger/internal/Binding;

    .line 41
    return-void
.end method

.method public get()Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;
    .locals 1

    .prologue
    .line 59
    new-instance v0, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;-><init>()V

    .line 60
    .local v0, "result":Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;)V

    .line 61
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->get()Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;

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
    .line 49
    .local p1, "getBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    .local p2, "injectMembersBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->locationManager:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 50
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->context:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public injectMembers(Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;)V
    .locals 1
    .param p1, "object"    # Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->locationManager:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;->locationManager:Landroid/location/LocationManager;

    .line 71
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->context:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;->context:Landroid/content/Context;

    .line 72
    return-void
.end method

.method public bridge synthetic injectMembers(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 23
    check-cast p1, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;)V

    return-void
.end method
