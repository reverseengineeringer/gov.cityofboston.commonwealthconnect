.class Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;
.super Ljava/lang/Object;
.source "IssueDetailsFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setupClickListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V
    .locals 0

    .prologue
    .line 549
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 557
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 613
    :goto_0
    return-void

    .line 559
    :sswitch_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$400(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a009f

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 560
    .local v7, "btn":Landroid/view/View;
    invoke-virtual {v7, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 561
    const/16 v0, 0x8

    invoke-virtual {v7, v0}, Landroid/view/View;->setVisibility(I)V

    .line 562
    invoke-static {p1}, Lcom/seeclickfix/ma/android/util/FormUtil;->hideKeyboard(Landroid/view/View;)V

    .line 563
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->buildComment()Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-result-object v1

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    goto :goto_0

    .line 566
    .end local v7    # "btn":Landroid/view/View;
    :sswitch_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$600(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 567
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->suitableVoteAction()Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-result-object v1

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    goto :goto_0

    .line 570
    :sswitch_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->starCheckbox:Landroid/widget/CheckBox;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$700(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 571
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    new-instance v1, Lcom/seeclickfix/ma/android/objects/issue/Follow;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/seeclickfix/ma/android/objects/issue/Follow;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    goto :goto_0

    .line 574
    :sswitch_3
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->doScrollToBottom()V

    goto :goto_0

    .line 577
    :sswitch_4
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->launchCamera()V

    goto :goto_0

    .line 580
    :sswitch_5
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->launchGallery()V

    goto :goto_0

    .line 583
    :sswitch_6
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->clearMedia()V

    goto :goto_0

    .line 586
    :sswitch_7
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .line 587
    .local v8, "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCommentImagePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getSmallCommentImagePath()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getComment()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getUser()Lcom/seeclickfix/ma/android/objects/user/User;

    move-result-object v5

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/user/User;->getAvatarSquareImage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getUser()Lcom/seeclickfix/ma/android/objects/user/User;

    move-result-object v6

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/user/User;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->launchImageViewer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 596
    .end local v8    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    :sswitch_8
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoLargeUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v2

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v4}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v4

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getDescription()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v6

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getReporterDisplay()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->launchImageViewer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 605
    :sswitch_9
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->showMapLarge()V

    goto/16 :goto_0

    .line 608
    :sswitch_a
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    const-string/jumbo v1, "issue"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v2

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFlagDialog(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 557
    :sswitch_data_0
    .sparse-switch
        0x7f0a0085 -> :sswitch_8
        0x7f0a0087 -> :sswitch_2
        0x7f0a008b -> :sswitch_3
        0x7f0a008c -> :sswitch_1
        0x7f0a008d -> :sswitch_a
        0x7f0a008f -> :sswitch_9
        0x7f0a0099 -> :sswitch_6
        0x7f0a009d -> :sswitch_4
        0x7f0a009e -> :sswitch_5
        0x7f0a009f -> :sswitch_0
        0x7f0a0143 -> :sswitch_7
    .end sparse-switch
.end method
