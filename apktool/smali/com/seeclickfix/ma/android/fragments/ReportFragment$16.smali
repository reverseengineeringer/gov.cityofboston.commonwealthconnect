.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Lretrofit/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getFollowupQuestions(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/String;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lretrofit/Callback",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/seeclickfix/ma/android/objects/report/Question;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

.field final synthetic val$reqId:Ljava/lang/String;

.field final synthetic val$runner:Ljava/lang/Runnable;

.field final synthetic val$watchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1002
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$watchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    iput-object p3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$runner:Ljava/lang/Runnable;

    iput-object p4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$reqId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lretrofit/RetrofitError;)V
    .locals 6
    .param p1, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 1017
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1018
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 1019
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$900(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    move-result-object v0

    const v1, 0x7f0c0074

    const v2, 0x7f0c006b

    const v3, 0x7f020112

    const v4, 0x7f0c0072

    new-instance v5, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16$1;

    invoke-direct {v5, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16$1;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;)V

    invoke-virtual/range {v0 .. v5}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->showErrorPanel(IIIILjava/lang/Runnable;)V

    .line 1027
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;Lretrofit/client/Response;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lretrofit/client/Response;

    .prologue
    .line 1002
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->success(Ljava/util/List;Lretrofit/client/Response;)V

    return-void
.end method

.method public success(Ljava/util/List;Lretrofit/client/Response;)V
    .locals 2
    .param p2, "response"    # Lretrofit/client/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;",
            "Lretrofit/client/Response;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1006
    .local p1, "questions":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1007
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$watchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v0, p1, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupQuestions(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    .line 1008
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setQuestions(Ljava/util/List;)V

    .line 1009
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$runner:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 1010
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$runner:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 1013
    :cond_0
    return-void
.end method
