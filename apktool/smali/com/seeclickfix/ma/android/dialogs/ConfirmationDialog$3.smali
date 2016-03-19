.class Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$3;
.super Ljava/lang/Object;
.source "ConfirmationDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$3;->this$0:Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 65
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 66
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$3;->this$0:Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->afterConfirm()Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 67
    return-void
.end method
