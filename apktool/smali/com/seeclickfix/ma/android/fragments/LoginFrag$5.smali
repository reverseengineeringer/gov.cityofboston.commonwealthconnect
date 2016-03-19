.class Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;
.super Landroid/os/AsyncTask;
.source "LoginFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/LoginFrag;->doLogin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Lcom/seeclickfix/ma/android/objects/user/AuthUser;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V
    .locals 0

    .prologue
    .line 221
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .locals 4
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 225
    new-instance v0, Lcom/seeclickfix/ma/android/net/LoginRequest;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    const/4 v2, 0x1

    aget-object v2, p1, v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/LoginFrag;->c:Landroid/content/Context;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/seeclickfix/ma/android/net/LoginRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 226
    .local v0, "req":Lcom/seeclickfix/ma/android/net/LoginRequest;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/LoginRequest;->authenticate()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v1

    return-object v1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 221
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;->doInBackground([Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 3
    .param p1, "userObj"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    .line 232
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 244
    :goto_0
    return-void

    .line 236
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)Landroid/view/ViewGroup;

    move-result-object v1

    const v2, 0x7f0a00ae

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    .line 237
    .local v0, "progressWheel":Landroid/widget/ProgressBar;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 239
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->isAuthenticated()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 240
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->success(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    goto :goto_0

    .line 242
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->fail(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 221
    check-cast p1, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;->onPostExecute(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    return-void
.end method
