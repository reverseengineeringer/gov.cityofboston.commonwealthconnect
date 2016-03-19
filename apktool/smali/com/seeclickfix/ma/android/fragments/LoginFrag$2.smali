.class Lcom/seeclickfix/ma/android/fragments/LoginFrag$2;
.super Ljava/lang/Object;
.source "LoginFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/LoginFrag;->onResume()V
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
    .line 120
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 123
    invoke-static {p1}, Lcom/seeclickfix/ma/android/util/FormUtil;->hideKeyboard(Landroid/view/View;)V

    .line 124
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/LoginFrag;->doLogin()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V

    .line 125
    return-void
.end method
