.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$16$1;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;->onIssueStarClick(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;)V
    .locals 0

    .prologue
    .line 885
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 888
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    new-instance v1, Lcom/seeclickfix/ma/android/objects/issue/Follow;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/seeclickfix/ma/android/objects/issue/Follow;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1400(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    .line 889
    return-void
.end method
