.class public final Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes$$InjectAdapter;
.super Ldagger/internal/Binding;
.source "NonDedicatedReqTypes$$InjectAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/Binding",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 18
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.reporting.NonDedicatedReqTypes"

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.reporting.NonDedicatedReqTypes"

    const/4 v2, 0x1

    const-class v3, Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/Binding;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 19
    return-void
.end method


# virtual methods
.method public get()Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;
    .locals 1

    .prologue
    .line 27
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;-><init>()V

    .line 28
    .local v0, "result":Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 14
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes$$InjectAdapter;->get()Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;

    move-result-object v0

    return-object v0
.end method
