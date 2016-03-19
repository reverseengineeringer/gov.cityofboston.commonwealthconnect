.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;
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
    .line 1009
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 1009
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    const/4 v5, 0x0

    .line 1013
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v3

    if-nez v3, :cond_0

    .line 1037
    :goto_0
    return-void

    .line 1019
    :cond_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    sget-object v4, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 1020
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 1021
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;>;"
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-class v4, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    invoke-virtual {v1, v3, v4}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v2

    .line 1023
    .local v2, "wrappers":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1024
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->getWatchAreas()Ljava/util/List;

    move-result-object v0

    .line 1025
    .local v0, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1026
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    move-result-object v4

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/types/FeedItem;

    invoke-virtual {v4, v5, v3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->addFeedItemAt(ILcom/seeclickfix/ma/android/objects/types/FeedItem;)V

    .line 1031
    .end local v0    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;>;"
    :cond_1
    :try_start_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->startLoading()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1032
    :catch_0
    move-exception v3

    goto :goto_0
.end method
