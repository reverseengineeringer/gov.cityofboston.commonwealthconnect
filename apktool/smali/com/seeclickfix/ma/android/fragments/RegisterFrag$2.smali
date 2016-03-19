.class Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;
.super Landroid/os/AsyncTask;
.source "RegisterFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->sendRegistration()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/seeclickfix/ma/android/objects/user/UserReg;",
        "Ljava/lang/Void;",
        "Lcom/seeclickfix/ma/android/objects/user/AuthUser;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)V
    .locals 0

    .prologue
    .line 182
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/seeclickfix/ma/android/objects/user/UserReg;)Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .locals 13
    .param p1, "params"    # [Lcom/seeclickfix/ma/android/objects/user/UserReg;

    .prologue
    const v12, 0x7f0c0071

    const/4 v11, 0x0

    .line 187
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v10

    if-nez v10, :cond_0

    .line 188
    const/4 v8, 0x0

    .line 224
    :goto_0
    return-object v8

    .line 191
    :cond_0
    new-instance v6, Lcom/seeclickfix/ma/android/net/RegistrationRequest;

    aget-object v10, p1, v11

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->c:Landroid/content/Context;
    invoke-static {v11}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Landroid/content/Context;

    move-result-object v11

    invoke-direct {v6, v10, v11}, Lcom/seeclickfix/ma/android/net/RegistrationRequest;-><init>(Lcom/seeclickfix/ma/android/objects/user/UserReg;Landroid/content/Context;)V

    .line 193
    .local v6, "req":Lcom/seeclickfix/ma/android/net/RegistrationRequest;
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->connect()Ljava/lang/String;

    move-result-object v7

    .line 196
    .local v7, "result":Ljava/lang/String;
    const/4 v8, 0x0

    .line 198
    .local v8, "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/net/RegistrationRequest;->wasSuccessful()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 199
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 200
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    const-class v10, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    invoke-virtual {v1, v7, v10}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v9

    .line 203
    .local v9, "userObjArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    const/4 v10, 0x0

    :try_start_0
    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-object v8, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 208
    .end local v1    # "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    .end local v9    # "userObjArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    :cond_1
    new-instance v8, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .end local v8    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-direct {v8}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;-><init>()V

    .line 211
    .restart local v8    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    :try_start_1
    new-instance v2, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v2}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 212
    .local v2, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/UserError;>;"
    const-class v10, Lcom/seeclickfix/ma/android/objects/user/UserError;

    invoke-virtual {v2, v7, v10}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v5

    .line 213
    .local v5, "errorObjArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/UserError;>;"
    const/4 v10, 0x0

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/user/UserError;

    .line 215
    .local v4, "errorObj":Lcom/seeclickfix/ma/android/objects/user/UserError;
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->c:Landroid/content/Context;
    invoke-static {v10}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Landroid/content/Context;

    move-result-object v10

    const v11, 0x7f0c0071

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->c:Landroid/content/Context;
    invoke-static {v11}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Lcom/seeclickfix/ma/android/objects/user/UserError;->getAllErrors(Ljava/lang/String;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->setResponse(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 216
    .end local v2    # "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/UserError;>;"
    .end local v4    # "errorObj":Lcom/seeclickfix/ma/android/objects/user/UserError;
    .end local v5    # "errorObjArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/UserError;>;"
    :catch_0
    move-exception v3

    .line 218
    .local v3, "e":Ljava/lang/Exception;
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->c:Landroid/content/Context;
    invoke-static {v10}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->setResponse(Ljava/lang/String;)V

    goto :goto_0

    .line 204
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v1    # "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    .restart local v9    # "userObjArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    :catch_1
    move-exception v10

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 182
    check-cast p1, [Lcom/seeclickfix/ma/android/objects/user/UserReg;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->doInBackground([Lcom/seeclickfix/ma/android/objects/user/UserReg;)Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 3
    .param p1, "userObj"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    .line 230
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 256
    :goto_0
    return-void

    .line 234
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Landroid/view/ViewGroup;

    move-result-object v1

    const v2, 0x7f0a00e4

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    .line 236
    .local v0, "progressWheel":Landroid/widget/ProgressBar;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 238
    if-nez p1, :cond_1

    .line 239
    new-instance p1, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .end local p1    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-direct {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;-><init>()V

    .line 240
    .restart local p1    # "userObj":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    const v2, 0x7f0c0075

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->setResponse(Ljava/lang/String;)V

    .line 241
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->fail(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    goto :goto_0

    .line 248
    :cond_1
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->isAuthenticated()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 249
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->success(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    goto :goto_0

    .line 254
    :cond_2
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->fail(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 182
    check-cast p1, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;->onPostExecute(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    return-void
.end method
