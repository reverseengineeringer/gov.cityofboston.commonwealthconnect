.class public Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IssueActionEvent"
.end annotation


# instance fields
.field protected final comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;

.field protected final issueActionResult:Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Comment;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V
    .locals 0
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/issue/Comment;",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 482
    .local p2, "issueActionResult":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 483
    iput-object p1, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .line 484
    iput-object p2, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->issueActionResult:Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    .line 485
    return-void
.end method


# virtual methods
.method public getComment()Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .locals 1

    .prologue
    .line 492
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->comment:Lcom/seeclickfix/ma/android/objects/issue/Comment;

    return-object v0
.end method

.method public getIssueActionResult()Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;"
        }
    .end annotation

    .prologue
    .line 488
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->issueActionResult:Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    return-object v0
.end method
