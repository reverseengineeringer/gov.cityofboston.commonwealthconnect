.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$21;
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


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0

    .prologue
    .line 1169
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$21;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1172
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$21;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$21;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v1

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pushIssueToAdapter(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1500(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 1173
    return-void
.end method
