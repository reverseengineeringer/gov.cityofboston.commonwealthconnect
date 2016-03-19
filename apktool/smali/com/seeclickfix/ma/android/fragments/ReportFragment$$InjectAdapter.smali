.class public final Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;
.super Ldagger/internal/Binding;
.source "ReportFragment$$InjectAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;
.implements Ldagger/MembersInjector;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/Binding",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/ReportFragment;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/ReportFragment;",
        ">;",
        "Ldagger/MembersInjector",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/ReportFragment;",
        ">;"
    }
.end annotation


# instance fields
.field private accuracyWarning:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;",
            ">;"
        }
    .end annotation
.end field

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

.field private mDefaultOtherZone:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;",
            ">;"
        }
    .end annotation
.end field

.field private mNonDedicatedReqTypes:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;",
            ">;"
        }
    .end annotation
.end field

.field private mReportProvider:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;",
            ">;"
        }
    .end annotation
.end field

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

.field private outsideAreaHelper:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;",
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
    .line 35
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.ReportFragment"

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.ReportFragment"

    const/4 v2, 0x0

    const-class v3, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/Binding;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 36
    return-void
.end method


# virtual methods
.method public attach(Ldagger/internal/Linker;)V
    .locals 6
    .param p1, "linker"    # Ldagger/internal/Linker;

    .prologue
    .line 45
    const-string/jumbo v0, "com.seeclickfix.ma.android.location.LocationAdapter"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->locationAdapter:Ldagger/internal/Binding;

    .line 46
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.map.MapHelper"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mapHelper:Ldagger/internal/Binding;

    .line 47
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->outsideAreaHelper:Ldagger/internal/Binding;

    .line 48
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZone"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mDefaultOtherZone:Ldagger/internal/Binding;

    .line 49
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.AccuracyWarn"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->accuracyWarning:Ldagger/internal/Binding;

    .line 50
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.ReportProvider"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mReportProvider:Ldagger/internal/Binding;

    .line 51
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.NonDedicatedReqTypes"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mNonDedicatedReqTypes:Ldagger/internal/Binding;

    .line 52
    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.base.BaseFrag"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;ZZ)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    .line 53
    return-void
.end method

.method public get()Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    .locals 1

    .prologue
    .line 77
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;-><init>()V

    .line 78
    .local v0, "result":Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    .line 79
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->get()Lcom/seeclickfix/ma/android/fragments/ReportFragment;

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
    .line 61
    .local p1, "getBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    .local p2, "injectMembersBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->locationAdapter:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 62
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mapHelper:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 63
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->outsideAreaHelper:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 64
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mDefaultOtherZone:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 65
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->accuracyWarning:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 66
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mReportProvider:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mNonDedicatedReqTypes:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 68
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 69
    return-void
.end method

.method public injectMembers(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 1
    .param p1, "object"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->locationAdapter:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/location/LocationAdapter;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    .line 89
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mapHelper:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    .line 90
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->outsideAreaHelper:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->outsideAreaHelper:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;

    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mDefaultOtherZone:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mDefaultOtherZone:Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;

    .line 92
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->accuracyWarning:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->accuracyWarning:Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;

    .line 93
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mReportProvider:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mReportProvider:Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

    .line 94
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->mNonDedicatedReqTypes:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mNonDedicatedReqTypes:Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;

    .line 95
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->supertype:Ldagger/internal/Binding;

    invoke-virtual {v0, p1}, Ldagger/internal/Binding;->injectMembers(Ljava/lang/Object;)V

    .line 96
    return-void
.end method

.method public bridge synthetic injectMembers(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 23
    check-cast p1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    return-void
.end method
