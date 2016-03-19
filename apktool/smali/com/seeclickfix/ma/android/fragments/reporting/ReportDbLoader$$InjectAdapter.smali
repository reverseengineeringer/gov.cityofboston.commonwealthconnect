.class public final Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader$$InjectAdapter;
.super Ldagger/internal/Binding;
.source "ReportDbLoader$$InjectAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;
.implements Ldagger/MembersInjector;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/Binding",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;",
        ">;",
        "Ldagger/MembersInjector",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;",
        ">;"
    }
.end annotation


# instance fields
.field private c:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 28
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.ReportDbLoader"

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.reporting.ReportDbLoader"

    const/4 v2, 0x1

    const-class v3, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

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
    const-string/jumbo v0, "android.content.Context"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Ldagger/internal/Linker;->requestBinding(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ClassLoader;)Ldagger/internal/Binding;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader$$InjectAdapter;->c:Ldagger/internal/Binding;

    .line 39
    return-void
.end method

.method public get()Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;-><init>()V

    .line 57
    .local v0, "result":Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;)V

    .line 58
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader$$InjectAdapter;->get()Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

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
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader$$InjectAdapter;->c:Ldagger/internal/Binding;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 48
    return-void
.end method

.method public injectMembers(Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;)V
    .locals 1
    .param p1, "object"    # Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader$$InjectAdapter;->c:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;->c:Landroid/content/Context;

    .line 68
    return-void
.end method

.method public bridge synthetic injectMembers(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 23
    check-cast p1, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader$$InjectAdapter;->injectMembers(Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;)V

    return-void
.end method
