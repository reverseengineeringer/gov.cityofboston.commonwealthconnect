.class Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;
.super Ljava/lang/Object;
.source "IssueDetailsFrag.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONArray;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V
    .locals 0

    .prologue
    .line 457
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 457
    check-cast p1, Lorg/json/JSONArray;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->onResponse(Lorg/json/JSONArray;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;)V
    .locals 7
    .param p1, "response"    # Lorg/json/JSONArray;

    .prologue
    const/4 v6, 0x0

    .line 464
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v3

    if-nez v3, :cond_0

    .line 478
    :goto_0
    return-void

    .line 468
    :cond_0
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 469
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    const-class v4, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v1, v3, v4}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v0

    .line 471
    .local v0, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    # setter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v4, v3}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$002(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 472
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "issue_bundle"

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v5}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 473
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setupContent()V
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V

    .line 474
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v3

    invoke-virtual {v3, v6}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 476
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/view/ViewGroup;

    move-result-object v3

    const v4, 0x7f0a007f

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 477
    .local v2, "loadingView":Landroid/view/View;
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
