.class Lcom/seeclickfix/ma/android/fragments/LoginFrag$6;
.super Ljava/lang/Object;
.source "LoginFrag.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/LoginFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V
    .locals 0

    .prologue
    .line 250
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 253
    const/4 v0, 0x6

    if-ne p2, v0, :cond_0

    .line 254
    invoke-static {p1}, Lcom/seeclickfix/ma/android/util/FormUtil;->hideKeyboard(Landroid/view/View;)V

    .line 255
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/LoginFrag;->doLogin()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V

    .line 256
    const/4 v0, 0x1

    .line 258
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
