.class public Lcom/seeclickfix/ma/android/objects/issue/Nop;
.super Lcom/seeclickfix/ma/android/objects/issue/Comment;
.source "Nop.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Nop;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Nop$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/issue/Nop$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/issue/Nop;->CREATOR:Landroid/os/Parcelable$Creator;

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

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/issue/Nop$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/Nop$1;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Nop;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 26
    const-string/jumbo v0, "Nop"

    const-string/jumbo v1, ""

    invoke-direct {p0, v0, p1, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 27
    return-void
.end method


# virtual methods
.method public commentActionTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    const-string/jumbo v0, "com.seeclickfix.actions.NOP"

    return-object v0
.end method

.method public executeAction()V
    .locals 0

    .prologue
    .line 54
    return-void
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
    .line 46
    .local p1, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    const/4 v0, 0x0

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
    return-void
.end method

.method public updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 41
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 42
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 31
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->writeToParcel(Landroid/os/Parcel;I)V

    .line 32
    return-void
.end method
