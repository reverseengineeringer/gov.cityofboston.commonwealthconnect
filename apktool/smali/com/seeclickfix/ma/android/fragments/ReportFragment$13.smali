.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;
.super Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
.source "ReportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->reverseGeocode(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
        "<",
        "Landroid/location/Address;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

.field final synthetic val$callback:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V
    .locals 0

    .prologue
    .line 897
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;->val$callback:Ljava/lang/Runnable;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
    .locals 6
    .param p1, "status"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .prologue
    .line 906
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 907
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$900(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    move-result-object v0

    const v1, 0x7f0c0074

    const v2, 0x7f0c006b

    const v3, 0x7f020112

    const v4, 0x7f0c0072

    new-instance v5, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13$1;

    invoke-direct {v5, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13$1;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;)V

    invoke-virtual/range {v0 .. v5}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->showErrorPanel(IIIILjava/lang/Runnable;)V

    .line 914
    return-void
.end method

.method public onSuccess(Landroid/location/Address;)V
    .locals 1
    .param p1, "bestMatch"    # Landroid/location/Address;

    .prologue
    .line 899
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showGeocodedAddress(Landroid/location/Address;)V

    .line 900
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;->val$callback:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 901
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;->val$callback:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 903
    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 897
    check-cast p1, Landroid/location/Address;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;->onSuccess(Landroid/location/Address;)V

    return-void
.end method
