.class Lcom/seeclickfix/ma/android/auth/ProfileController$1;
.super Ljava/lang/Object;
.source "ProfileController.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/auth/ProfileController;
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
.field final synthetic this$0:Lcom/seeclickfix/ma/android/auth/ProfileController;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/auth/ProfileController;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lcom/seeclickfix/ma/android/auth/ProfileController$1;->this$0:Lcom/seeclickfix/ma/android/auth/ProfileController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 70
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/auth/ProfileController$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 77
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 79
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/User;>;"
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v0

    .line 81
    .local v0, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/User;>;"
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController$1;->this$0:Lcom/seeclickfix/ma/android/auth/ProfileController;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/user/User;

    # setter for: Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;
    invoke-static {v3, v2}, Lcom/seeclickfix/ma/android/auth/ProfileController;->access$002(Lcom/seeclickfix/ma/android/auth/ProfileController;Lcom/seeclickfix/ma/android/objects/user/User;)Lcom/seeclickfix/ma/android/objects/user/User;

    .line 84
    :try_start_0
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v2

    new-instance v3, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/auth/ProfileController$1;->this$0:Lcom/seeclickfix/ma/android/auth/ProfileController;

    # getter for: Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;
    invoke-static {v4}, Lcom/seeclickfix/ma/android/auth/ProfileController;->access$000(Lcom/seeclickfix/ma/android/auth/ProfileController;)Lcom/seeclickfix/ma/android/objects/user/User;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;-><init>(Lcom/seeclickfix/ma/android/objects/user/User;)V

    invoke-virtual {v2, v3}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 86
    const-string/jumbo v2, "user_profile_json"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/auth/ProfileController$1;->this$0:Lcom/seeclickfix/ma/android/auth/ProfileController;

    # getter for: Lcom/seeclickfix/ma/android/auth/ProfileController;->c:Landroid/content/Context;
    invoke-static {v4}, Lcom/seeclickfix/ma/android/auth/ProfileController;->access$100(Lcom/seeclickfix/ma/android/auth/ProfileController;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :goto_0
    return-void

    .line 87
    :catch_0
    move-exception v2

    goto :goto_0
.end method
