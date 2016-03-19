.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 0

    .prologue
    .line 1382
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 11
    .param p2, "view"    # Landroid/view/View;
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
    .line 1388
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    if-gtz p3, :cond_0

    .line 1389
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->onNothingSelected(Landroid/widget/AdapterView;)V

    .line 1467
    :goto_0
    return-void

    .line 1392
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 1394
    .local v5, "requestType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1396
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1397
    .local v3, "parentArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getSelectedPosition()I

    move-result v4

    .line 1398
    .local v4, "pos":I
    invoke-virtual {p1, v4}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 1400
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.DIAL"

    invoke-direct {v0, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1401
    .local v0, "callIntent":Landroid/content/Intent;
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getActionData()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1402
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/support/v4/app/FragmentActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1407
    .end local v0    # "callIntent":Landroid/content/Intent;
    .end local v3    # "parentArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .end local v4    # "pos":I
    :cond_1
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$1000(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 1408
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1409
    .local v2, "newArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 1411
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v6, p2, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isRequestTypeSwitch(Landroid/view/View;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1412
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    const-string/jumbo v7, "Pref:warn_watch_area"

    invoke-virtual {v6, v7}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->shouldShowDialog(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1414
    const-string/jumbo v6, "Pref:warn_watch_area"

    const v7, 0x7f0c00f0

    const v8, 0x7f0c00ef

    const v9, 0x7f0c0050

    const v10, 0x7f0200df

    invoke-static {v6, v7, v8, v9, v10}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->newInstance(Ljava/lang/String;IIII)Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;

    move-result-object v1

    .line 1422
    .local v1, "dialog":Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
    new-instance v6, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18$1;

    invoke-direct {v6, p0, v2, p2, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18$1;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Landroid/view/View;Landroid/widget/AdapterView;)V

    invoke-virtual {v1, v6}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->setClickListener(Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;)V

    .line 1442
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1444
    .end local v1    # "dialog":Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
    :cond_2
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v6, p2, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setRequestTypeByView(Landroid/view/View;Landroid/widget/AdapterView;)V

    goto/16 :goto_0

    .line 1449
    :cond_3
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v7

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v7

    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-static {v8}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$1000(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupQuestions(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    goto/16 :goto_0

    .line 1453
    .end local v2    # "newArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    :cond_4
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1454
    .restart local v2    # "newArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 1455
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # setter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-static {v6, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$1002(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1456
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v6

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$1000(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-result-object v7

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->setSelectedWatchAreaApiId(I)V

    .line 1457
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getApiId()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v7

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->getRequestTypeId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1459
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v7

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v7

    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-static {v8}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$1000(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupQuestions(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    .line 1460
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/seeclickfix/ma/android/objects/report/Report;->setRequestType(Lcom/seeclickfix/ma/android/objects/report/RequestType;)V

    goto/16 :goto_0

    .line 1462
    :cond_5
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v6, p2, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setRequestTypeByView(Landroid/view/View;Landroid/widget/AdapterView;)V

    goto/16 :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1471
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1473
    .local v0, "watchArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getIsFromDraft()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1474
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getSelectedPosition()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 1476
    :cond_0
    return-void
.end method
