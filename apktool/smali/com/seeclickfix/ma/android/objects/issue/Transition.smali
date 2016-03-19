.class public Lcom/seeclickfix/ma/android/objects/issue/Transition;
.super Lcom/seeclickfix/ma/android/objects/issue/Comment;
.source "Transition.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Transition;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Transition$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/issue/Transition$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/issue/Transition;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/issue/Transition$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/Transition$1;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Transition;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V
    .locals 1
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "transition"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-static {p2}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStatusString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStateDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p2, p1, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "comment"    # Ljava/lang/String;
    .param p3, "transition"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p3, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method public static fromStatus(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/issue/Transition;
    .locals 3
    .param p0, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 39
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Transition;

    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStateDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getActionString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/objects/issue/Transition;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public commentActionTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    const-string/jumbo v0, "com.seeclickfix.actions.CHANGE_STATUS"

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public getIssueDetailsParams(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 77
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueDetailsParams(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    .line 78
    .local v0, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Transition;->getTransition()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setTransition(Ljava/lang/String;)V

    .line 80
    return-object v0
.end method

.method public getTransition()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Transition;->getCommentType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/api/SCFService$ChangeStatusEvent;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/api/SCFService$ChangeStatusEvent;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Transition;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V

    return-object v0
.end method

.method public updateCard(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "card"    # Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 72
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateCard(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 73
    invoke-interface {p1, p0, p2}, Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;->updateStatus(Lcom/seeclickfix/ma/android/objects/issue/Transition;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 74
    return-void
.end method

.method public updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 1
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 48
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 49
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;->getStatus()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setStatus(Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 63
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->writeToParcel(Landroid/os/Parcel;I)V

    .line 64
    return-void
.end method
