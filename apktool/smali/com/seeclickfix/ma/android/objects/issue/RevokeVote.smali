.class public Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;
.super Lcom/seeclickfix/ma/android/objects/issue/Comment;
.source "RevokeVote.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "comments"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/RevokeVote$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/issue/RevokeVote$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>()V

    .line 44
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/issue/RevokeVote$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/RevokeVote$1;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 47
    const-string/jumbo v0, "Issue Revoked Vote For"

    const-string/jumbo v1, ""

    invoke-direct {p0, v0, p1, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 48
    return-void
.end method


# virtual methods
.method public commentActionTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    const-string/jumbo v0, "com.seeclickfix.actions.VOTE"

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
    .locals 1
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;->toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$RevokeVoteResultEvent;

    move-result-object v0

    return-object v0
.end method

.method public toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$RevokeVoteResultEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)",
            "Lcom/seeclickfix/ma/android/api/SCFService$RevokeVoteResultEvent;"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/api/SCFService$RevokeVoteResultEvent;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/api/SCFService$RevokeVoteResultEvent;-><init>(Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V

    return-object v0
.end method

.method public updateCard(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "card"    # Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 67
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateCard(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 68
    invoke-interface {p1, p0, p2}, Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;->revokeVote(Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 69
    return-void
.end method

.method public updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 57
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 58
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updateVote()V

    .line 59
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 39
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->writeToParcel(Landroid/os/Parcel;I)V

    .line 40
    return-void
.end method
