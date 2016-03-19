.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$7;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
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
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V
    .locals 0

    .prologue
    .line 493
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 493
    check-cast p1, Lorg/json/JSONArray;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$7;->onResponse(Lorg/json/JSONArray;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "response"    # Lorg/json/JSONArray;

    .prologue
    .line 499
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v2

    if-nez v2, :cond_0

    .line 512
    :goto_0
    return-void

    .line 505
    :cond_0
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 506
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v0

    .line 508
    .local v0, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$900(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->appendList(Ljava/util/List;)V

    .line 510
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handleListLoaded()V
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1000(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    goto :goto_0
.end method
