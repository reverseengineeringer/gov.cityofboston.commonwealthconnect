.class Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$1;
.super Ljava/lang/Object;
.source "IssueDetailsFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;)V
    .locals 0

    .prologue
    .line 1091
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$1;->this$1:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1093
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$1;->this$1:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$1;->this$1:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$1;->this$1:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->newStatus:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/objects/issue/Transition;->fromStatus(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/issue/Transition;

    move-result-object v1

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    return-void
.end method
