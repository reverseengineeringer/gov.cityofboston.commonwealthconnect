.class abstract Lcom/seeclickfix/ma/android/dialogs/AbsDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "AbsDialog.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/DialogInstance;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v4/app/DialogFragment;",
        "Lcom/seeclickfix/ma/android/dialogs/DialogInstance;",
        "Landroid/content/DialogInterface$OnClickListener;"
    }
.end annotation


# instance fields
.field protected listener:Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;

.field val:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 9
    .local p0, "this":Lcom/seeclickfix/ma/android/dialogs/AbsDialog;, "Lcom/seeclickfix/ma/android/dialogs/AbsDialog<TT;>;"
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 37
    .local p0, "this":Lcom/seeclickfix/ma/android/dialogs/AbsDialog;, "Lcom/seeclickfix/ma/android/dialogs/AbsDialog<TT;>;"
    packed-switch p2, :pswitch_data_0

    .line 51
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->onPositiveClick()V

    .line 54
    :goto_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->dismiss()V

    .line 55
    return-void

    .line 39
    :pswitch_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->onPositiveClick()V

    goto :goto_0

    .line 43
    :pswitch_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->onNegativeClick()V

    goto :goto_0

    .line 47
    :pswitch_2
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->onPositiveClick()V

    goto :goto_0

    .line 37
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onNegativeClick()V
    .locals 1

    .prologue
    .line 30
    .local p0, "this":Lcom/seeclickfix/ma/android/dialogs/AbsDialog;, "Lcom/seeclickfix/ma/android/dialogs/AbsDialog<TT;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;->onNegativeClick()V

    .line 33
    :cond_0
    return-void
.end method

.method public onPositiveClick()V
    .locals 2

    .prologue
    .line 23
    .local p0, "this":Lcom/seeclickfix/ma/android/dialogs/AbsDialog;, "Lcom/seeclickfix/ma/android/dialogs/AbsDialog<TT;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;

    if-eqz v0, :cond_0

    .line 24
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->val:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;->onPositiveClick(Ljava/lang/Object;)V

    .line 26
    :cond_0
    return-void
.end method

.method public setClickListener(Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;

    .prologue
    .line 18
    .local p0, "this":Lcom/seeclickfix/ma/android/dialogs/AbsDialog;, "Lcom/seeclickfix/ma/android/dialogs/AbsDialog<TT;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;

    .line 19
    return-void
.end method
