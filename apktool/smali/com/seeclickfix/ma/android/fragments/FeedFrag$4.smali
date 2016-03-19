.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;
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
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0

    .prologue
    .line 540
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 540
    check-cast p1, Lorg/json/JSONArray;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;->onResponse(Lorg/json/JSONArray;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "response"    # Lorg/json/JSONArray;

    .prologue
    .line 546
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 547
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v0

    .line 549
    .local v0, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->addItemsToAdapter(Ljava/util/List;)V

    .line 551
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 552
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->postNoIssueItem()V

    .line 555
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handleListLoaded()V
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$400(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    .line 556
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    const/4 v3, 0x0

    # setter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z
    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$102(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Z)Z

    .line 557
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    sget-object v3, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 558
    return-void
.end method
