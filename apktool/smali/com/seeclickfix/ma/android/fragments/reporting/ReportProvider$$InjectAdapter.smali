.class public final Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider$$InjectAdapter;
.super Ldagger/internal/Binding;
.source "ReportProvider$$InjectAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;
.implements Ldagger/MembersInjector;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/Binding",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;",
        ">;",
        "Ldagger/MembersInjector",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;",
        ">;"
    }
.end annotation


# instance fields
.field private mReportDbLoader:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 28
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.ReportProvider"

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.reporting.ReportProvider"

    const/4 v2, 0x1

    const-class v3, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/Binding;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 29
    return-void
.end method


# virtual methods
.method public attach(Ldagger/internal/Linker;)V
    .locals 3
    .param p1, "linker"    # Ldagger/internal/Linker;

    .prologue
    .line 38
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.ReportDbLoader"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider$$InjectAdapter;->mReportDbLoader:Ldagger/internal/Binding;

    .line 39
    return-void
.end method

.method public get()Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;-><init>()V

    .line 57
    .local v0, "result":Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;)V

    .line 58
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider$$InjectAdapter;->get()Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

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
    .line 47
    .local p1, "getBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    .local p2, "injectMembersBindings":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider$$InjectAdapter;->mReportDbLoader:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 48
    return-void
.end method

.method public injectMembers(Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;)V
    .locals 1
    .param p1, "object"    # Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider$$InjectAdapter;->mReportDbLoader:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;->mReportDbLoader:Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

    .line 68
    return-void
.end method

.method public bridge synthetic injectMembers(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 23
    check-cast p1, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;)V

    return-void
.end method
