.class Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;
.super Ljava/lang/Object;
.source "IssueDetailsFrag.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field newStatus:Ljava/lang/String;

.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V
    .locals 0

    .prologue
    .line 1072
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 1079
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1102
    :cond_0
    :goto_0
    return-void

    .line 1083
    :cond_1
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->newStatus:Ljava/lang/String;

    .line 1085
    const-string/jumbo v0, "Archived"

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1087
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->newStatus:Ljava/lang/String;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1090
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$1;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;)V

    new-instance v2, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$2;

    invoke-direct {v2, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$2;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;)V

    invoke-static {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->statusChangeWarning(Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1106
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
