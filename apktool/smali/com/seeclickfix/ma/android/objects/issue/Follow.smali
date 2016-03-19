.class public Lcom/seeclickfix/ma/android/objects/issue/Follow;
.super Lcom/seeclickfix/ma/android/objects/issue/Comment;
.source "Follow.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Follow;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Follow$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/issue/Follow$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/issue/Follow;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/issue/Follow$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/Follow$1;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Follow;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 25
    const-string/jumbo v0, "Watcher Added"

    const-string/jumbo v1, ""

    invoke-direct {p0, v0, p1, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 26
    return-void
.end method


# virtual methods
.method public commentActionTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    const-string/jumbo v0, "com.seeclickfix.actions.ADD_WATCHER"

    return-object v0
.end method

.method public toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$FollowResultEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)",
            "Lcom/seeclickfix/ma/android/api/SCFService$FollowResultEvent;"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/api/SCFService$FollowResultEvent;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/api/SCFService$FollowResultEvent;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Follow;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V

    return-object v0
.end method

.method public bridge synthetic toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
    .locals 1
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    .prologue
    .line 14
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Follow;->toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$FollowResultEvent;

    move-result-object v0

    return-object v0
.end method

.method public updateCard(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "card"    # Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 50
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateCard(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 51
    invoke-interface {p1, p0, p2}, Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;->updateFollow(Lcom/seeclickfix/ma/android/objects/issue/Follow;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 52
    return-void
.end method

.method public updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 1
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 40
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 41
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setFollowing(Z)V

    .line 42
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 30
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->writeToParcel(Landroid/os/Parcel;I)V

    .line 31
    return-void
.end method
