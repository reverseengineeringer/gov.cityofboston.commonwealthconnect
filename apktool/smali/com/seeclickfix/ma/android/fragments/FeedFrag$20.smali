.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$20;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;->onStatusChange(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

.field final synthetic val$newStatus:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1163
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$20;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$20;->val$newStatus:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1166
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$20;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$20;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$20;->val$newStatus:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/objects/issue/Transition;->fromStatus(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/issue/Transition;

    move-result-object v1

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1400(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    .line 1167
    return-void
.end method
