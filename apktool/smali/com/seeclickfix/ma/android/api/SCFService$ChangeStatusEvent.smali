.class public Lcom/seeclickfix/ma/android/api/SCFService$ChangeStatusEvent;
.super Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChangeStatusEvent"
.end annotation


# instance fields
.field private final eventType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Transition;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V
    .locals 1
    .param p1, "transition"    # Lcom/seeclickfix/ma/android/objects/issue/Transition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/issue/Transition;",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 501
    .local p2, "issueActionResult":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Comment;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V

    .line 502
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Transition;->getCommentType()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$ChangeStatusEvent;->eventType:Ljava/lang/String;

    .line 503
    return-void
.end method


# virtual methods
.method public getEventType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 506
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$ChangeStatusEvent;->eventType:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 510
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$ChangeStatusEvent;->getEventType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStatusString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
