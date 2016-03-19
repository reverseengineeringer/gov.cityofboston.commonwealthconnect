.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;
.super Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
.source "ReportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getRequestTypes(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

.field final synthetic val$runner:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V
    .locals 0

    .prologue
    .line 975
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->val$runner:Ljava/lang/Runnable;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
    .locals 6
    .param p1, "failureCode"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .prologue
    .line 988
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 989
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$900(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    move-result-object v0

    const v1, 0x7f0c0074

    const v2, 0x7f0c006b

    const v3, 0x7f020112

    const v4, 0x7f0c0072

    new-instance v5, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15$1;

    invoke-direct {v5, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15$1;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;)V

    invoke-virtual/range {v0 .. v5}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->showErrorPanel(IIIILjava/lang/Runnable;)V

    .line 995
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 975
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->onSuccess(Ljava/util/List;)V

    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 979
    .local p1, "zones":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showZones(Ljava/util/List;)V

    .line 980
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showDescriptionAndSummary()V

    .line 981
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->val$runner:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 982
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->val$runner:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 984
    :cond_0
    return-void
.end method
