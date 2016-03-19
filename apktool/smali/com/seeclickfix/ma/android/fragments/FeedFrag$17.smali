.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;
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
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0

    .prologue
    .line 986
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 986
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    const/4 v4, 0x0

    .line 992
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    if-nez v2, :cond_0

    .line 1005
    :goto_0
    return-void

    .line 996
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    sget-object v3, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 998
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 999
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;>;"
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v0

    .line 1002
    .local v0, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    move-result-object v3

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/types/FeedItem;

    invoke-virtual {v3, v4, v2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->addFeedItemAt(ILcom/seeclickfix/ma/android/objects/types/FeedItem;)V

    .line 1004
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->startLoading()V

    goto :goto_0
.end method
