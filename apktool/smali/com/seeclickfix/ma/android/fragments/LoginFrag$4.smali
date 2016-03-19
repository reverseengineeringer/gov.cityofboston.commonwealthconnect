.class Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;
.super Landroid/os/AsyncTask;
.source "LoginFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/LoginFrag;->doForgotPassword()V
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
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

.field final synthetic val$emailString:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 160
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->val$emailString:Ljava/lang/String;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 160
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 164
    new-instance v0, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/LoginFrag;->c:Landroid/content/Context;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 165
    .local v0, "req":Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/ForgotPasswordRequest;->sendEmail()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 160
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 178
    :goto_0
    return-void

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;->val$emailString:Ljava/lang/String;

    invoke-virtual {v1, p1, v2}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->resultForgotPassword(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method
