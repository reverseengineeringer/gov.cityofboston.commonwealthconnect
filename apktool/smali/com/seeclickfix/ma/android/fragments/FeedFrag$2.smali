.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;
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
    .line 500
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 500
    check-cast p1, Lorg/json/JSONArray;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->onResponse(Lorg/json/JSONArray;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;)V
    .locals 6
    .param p1, "response"    # Lorg/json/JSONArray;

    .prologue
    const/4 v4, 0x0

    .line 506
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 507
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v0

    .line 510
    .local v0, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 513
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    const/4 v3, 0x1

    # setter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadedAllIssues:Z
    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$002(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Z)Z

    .line 514
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z
    invoke-static {v2, v4}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$102(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Z)Z

    .line 515
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 526
    :goto_0
    return-void

    .line 517
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setOnScrollListener(Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;)V

    .line 518
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->appendList(Ljava/util/List;)V

    .line 519
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->notifyDataSetChanged()V

    .line 521
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z
    invoke-static {v2, v4}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$102(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Z)Z

    .line 522
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 523
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handler:Landroid/os/Handler;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    iget-object v3, v3, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->resetScrollListener:Ljava/lang/Runnable;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
