.class public final Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;
.super Ldagger/internal/Binding;
.source "FeedFrag$$InjectAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;
.implements Ldagger/MembersInjector;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/Binding",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/FeedFrag;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/FeedFrag;",
        ">;",
        "Ldagger/MembersInjector",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/FeedFrag;",
        ">;"
    }
.end annotation


# instance fields
.field private locationAdapter:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/location/LocationAdapter;",
            ">;"
        }
    .end annotation
.end field

.field private mPermissionsManager:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/auth/PermissionsManager;",
            ">;"
        }
    .end annotation
.end field

.field private supertype:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 30
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.FeedFrag"

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.FeedFrag"

    const/4 v2, 0x0

    const-class v3, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/Binding;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 31
    return-void
.end method


# virtual methods
.method public attach(Ldagger/internal/Linker;)V
    .locals 6
    .param p1, "linker"    # Ldagger/internal/Linker;

    .prologue
    .line 40
    const-string/jumbo v0, "com.seeclickfix.ma.android.location.LocationAdapter"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->locationAdapter:Ldagger/internal/Binding;

    .line 41
    const-string/jumbo v0, "com.seeclickfix.ma.android.auth.PermissionsManager"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->mPermissionsManager:Ldagger/internal/Binding;

    .line 42
    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.base.BaseFrag"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;ZZ)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    .line 43
    return-void
.end method

.method public get()Lcom/seeclickfix/ma/android/fragments/FeedFrag;
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;-><init>()V

    .line 63
    .local v0, "result":Lcom/seeclickfix/ma/android/fragments/FeedFrag;
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    .line 64
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->get()Lcom/seeclickfix/ma/android/fragments/FeedFrag;

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
    .line 51
    .local p1, "getBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    .local p2, "injectMembersBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->locationAdapter:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 52
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->mPermissionsManager:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 53
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 54
    return-void
.end method

.method public injectMembers(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 1
    .param p1, "object"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->locationAdapter:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/location/LocationAdapter;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    .line 74
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->mPermissionsManager:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    invoke-virtual {v0, p1}, Ldagger/internal/Binding;->injectMembers(Ljava/lang/Object;)V

    .line 76
    return-void
.end method

.method public bridge synthetic injectMembers(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 23
    check-cast p1, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    return-void
.end method
