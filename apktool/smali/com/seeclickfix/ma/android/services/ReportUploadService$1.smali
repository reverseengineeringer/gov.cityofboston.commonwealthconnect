.class Lcom/seeclickfix/ma/android/services/ReportUploadService$1;
.super Ljava/lang/Object;
.source "ReportUploadService.java"

# interfaces
.implements Lretrofit/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/services/ReportUploadService;->onHandleIntent(Landroid/content/Intent;)V
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
        "Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/services/ReportUploadService;

.field final synthetic val$report:Lcom/seeclickfix/ma/android/objects/report/Report;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/services/ReportUploadService;Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->this$0:Lcom/seeclickfix/ma/android/services/ReportUploadService;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->val$report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lretrofit/RetrofitError;)V
    .locals 2
    .param p1, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->val$report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const-string/jumbo v1, "ReportState:DRAFT"

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setState(Ljava/lang/String;)V

    .line 85
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->this$0:Lcom/seeclickfix/ma/android/services/ReportUploadService;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->val$report:Lcom/seeclickfix/ma/android/objects/report/Report;

    # invokes: Lcom/seeclickfix/ma/android/services/ReportUploadService;->saveReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->access$000(Lcom/seeclickfix/ma/android/services/ReportUploadService;Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 86
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->this$0:Lcom/seeclickfix/ma/android/services/ReportUploadService;

    new-instance v1, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;-><init>(Lretrofit/RetrofitError;)V

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->postEvent(Ljava/lang/Object;)V

    .line 87
    return-void
.end method

.method public success(Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;Lretrofit/client/Response;)V
    .locals 4
    .param p1, "issueV2"    # Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;
    .param p2, "response"    # Lretrofit/client/Response;

    .prologue
    .line 68
    iget-object v2, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->val$report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const-string/jumbo v3, "ReportState:SENT"

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setState(Ljava/lang/String;)V

    .line 69
    iget-object v2, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->this$0:Lcom/seeclickfix/ma/android/services/ReportUploadService;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->val$report:Lcom/seeclickfix/ma/android/objects/report/Report;

    # invokes: Lcom/seeclickfix/ma/android/services/ReportUploadService;->saveReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->access$000(Lcom/seeclickfix/ma/android/services/ReportUploadService;Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 71
    new-instance v0, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;

    invoke-direct {v0, p1, p2}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;-><init>(Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;Lretrofit/client/Response;)V

    .line 73
    .local v0, "event":Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->isCreated()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 74
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getIssue()Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v1

    .line 75
    .local v1, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->this$0:Lcom/seeclickfix/ma/android/services/ReportUploadService;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->create(Landroid/content/Context;)Z

    .line 76
    iget-object v2, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->this$0:Lcom/seeclickfix/ma/android/services/ReportUploadService;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->val$report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v1, v3}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->showSuccessNotification(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 79
    .end local v1    # "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->this$0:Lcom/seeclickfix/ma/android/services/ReportUploadService;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->postEvent(Ljava/lang/Object;)V

    .line 80
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;Lretrofit/client/Response;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lretrofit/client/Response;

    .prologue
    .line 64
    check-cast p1, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;->success(Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;Lretrofit/client/Response;)V

    return-void
.end method
