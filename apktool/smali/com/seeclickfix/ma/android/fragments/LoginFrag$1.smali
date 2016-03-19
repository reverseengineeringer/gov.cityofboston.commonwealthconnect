.class Lcom/seeclickfix/ma/android/fragments/LoginFrag$1;
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
    .line 108
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 111
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;

    .line 112
    .local v0, "btnsActivity":Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
    const/16 v1, 0xf

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;->onClickButton(ILjava/lang/Object;)V

    .line 113
    return-void
.end method
