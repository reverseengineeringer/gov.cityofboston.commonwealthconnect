.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;

.field final synthetic val$newArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

.field final synthetic val$parent:Landroid/widget/AdapterView;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Landroid/view/View;Landroid/widget/AdapterView;)V
    .locals 0

    .prologue
    .line 1396
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->val$newArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    iput-object p3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->val$view:Landroid/view/View;

    iput-object p4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->val$parent:Landroid/widget/AdapterView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNegativeClick()V
    .locals 2

    .prologue
    .line 1411
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->val$newArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getSelectedPosition()I

    move-result v0

    .line 1412
    .local v0, "pos":I
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->val$parent:Landroid/widget/AdapterView;

    invoke-virtual {v1, v0}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 1413
    return-void
.end method

.method public onPositiveClick()V
    .locals 3

    .prologue
    .line 1400
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupRow(Z)V

    .line 1403
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->val$newArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    # setter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$1002(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1404
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$1000(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setSelectedWatchAreaApiId(I)V

    .line 1406
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->val$view:Landroid/view/View;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17$1;->val$parent:Landroid/widget/AdapterView;

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setRequestTypeByView(Landroid/view/View;Landroid/widget/AdapterView;)V

    .line 1407
    return-void
.end method
