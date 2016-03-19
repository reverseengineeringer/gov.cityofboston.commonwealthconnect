.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$13;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;


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
    .line 844
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$13;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIssueClick(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 848
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$13;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v1, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1202(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 849
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$13;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setScrollData()V
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1300(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    .line 850
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$13;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/IssueListFragInterface;

    .line 851
    .local v0, "btnInerface":Lcom/seeclickfix/ma/android/fragments/interfaces/IssueListFragInterface;
    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/IssueListFragInterface;->onSelectIssueListItem(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 852
    return-void
.end method
