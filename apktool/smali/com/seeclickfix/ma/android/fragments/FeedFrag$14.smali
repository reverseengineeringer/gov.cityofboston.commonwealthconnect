.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$14;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setupListeners()V
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
    .line 855
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVoteClick(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 859
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1202(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 861
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setScrollData()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1300(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    .line 863
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->suitableVoteAction()Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-result-object v1

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1400(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    .line 864
    return-void
.end method
