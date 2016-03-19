.class public Lcom/seeclickfix/ma/android/api/SCFService$FollowResultEvent;
.super Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FollowResultEvent"
.end annotation


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Follow;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V
    .locals 0
    .param p1, "follow"    # Lcom/seeclickfix/ma/android/objects/issue/Follow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/issue/Follow;",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 531
    .local p2, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Comment;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V

    .line 532
    return-void
.end method
