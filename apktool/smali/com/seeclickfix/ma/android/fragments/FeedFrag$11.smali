.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$11;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0

    .prologue
    .line 732
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$11;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCommentCardClick(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 3
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 736
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$11;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;

    .line 738
    .local v0, "issueClickInterface":Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
    const/4 v1, 0x4

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;->onClickButton(ILjava/lang/Object;)V

    .line 739
    return-void
.end method
