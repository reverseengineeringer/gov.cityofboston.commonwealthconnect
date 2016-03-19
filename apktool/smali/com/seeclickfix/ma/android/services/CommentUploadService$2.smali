.class Lcom/seeclickfix/ma/android/services/CommentUploadService$2;
.super Ljava/lang/Object;
.source "CommentUploadService.java"

# interfaces
.implements Lretrofit/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/services/CommentUploadService;->buildCommentCallback(Lcom/seeclickfix/ma/android/objects/issue/Comment;)Lretrofit/Callback;
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
        "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/services/CommentUploadService;

.field final synthetic val$comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/services/CommentUploadService;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 0

    .prologue
    .line 133
    iput-object p1, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->this$0:Lcom/seeclickfix/ma/android/services/CommentUploadService;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->val$comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lretrofit/RetrofitError;)V
    .locals 3
    .param p1, "error"    # Lretrofit/RetrofitError;

    .prologue
    .line 145
    new-instance v0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    invoke-direct {v0, p1}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;-><init>(Lretrofit/RetrofitError;)V

    .line 147
    .local v0, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    iget-object v1, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->val$comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->synch(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V

    .line 148
    iget-object v1, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->this$0:Lcom/seeclickfix/ma/android/services/CommentUploadService;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->val$comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->postEvent(Ljava/lang/Object;)V

    .line 149
    return-void
.end method

.method public success(Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;Lretrofit/client/Response;)V
    .locals 3
    .param p1, "issueActionReceipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;
    .param p2, "response"    # Lretrofit/client/Response;

    .prologue
    .line 137
    new-instance v0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    invoke-direct {v0, p1, p2}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;-><init>(Ljava/lang/Object;Lretrofit/client/Response;)V

    .line 139
    .local v0, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    iget-object v1, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->val$comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->synch(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V

    .line 140
    iget-object v1, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->this$0:Lcom/seeclickfix/ma/android/services/CommentUploadService;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->val$comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->postEvent(Ljava/lang/Object;)V

    .line 141
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;Lretrofit/client/Response;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lretrofit/client/Response;

    .prologue
    .line 133
    check-cast p1, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;->success(Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;Lretrofit/client/Response;)V

    return-void
.end method
