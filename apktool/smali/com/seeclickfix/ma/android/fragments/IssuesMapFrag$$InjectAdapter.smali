.class public final Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;
.super Ldagger/internal/Binding;
.source "IssuesMapFrag$$InjectAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;
.implements Ldagger/MembersInjector;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/Binding",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;",
        ">;",
        "Ldagger/MembersInjector",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;",
        ">;"
    }
.end annotation


# instance fields
.field private mapHelper:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/fragments/map/MapHelper;",
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
    .line 29
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.IssuesMapFrag"

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.IssuesMapFrag"

    const/4 v2, 0x0

    const-class v3, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/Binding;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 30
    return-void
.end method


# virtual methods
.method public attach(Ldagger/internal/Linker;)V
    .locals 6
    .param p1, "linker"    # Ldagger/internal/Linker;

    .prologue
    .line 39
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.map.MapHelper"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->mapHelper:Ldagger/internal/Binding;

    .line 40
    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.base.BaseFrag"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;ZZ)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    .line 41
    return-void
.end method

.method public get()Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .locals 1

    .prologue
    .line 59
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;-><init>()V

    .line 60
    .local v0, "result":Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    .line 61
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->get()Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

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
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->mapHelper:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 50
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public injectMembers(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V
    .locals 1
    .param p1, "object"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->mapHelper:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    .line 71
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    invoke-virtual {v0, p1}, Ldagger/internal/Binding;->injectMembers(Ljava/lang/Object;)V

    .line 72
    return-void
.end method

.method public bridge synthetic injectMembers(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 23
    check-cast p1, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    return-void
.end method
