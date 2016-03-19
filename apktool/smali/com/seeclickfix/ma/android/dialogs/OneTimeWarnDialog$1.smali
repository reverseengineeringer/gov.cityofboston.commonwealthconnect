.class Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$1;
.super Ljava/lang/Object;
.source "OneTimeWarnDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;)V
    .locals 0

    .prologue
    .line 111
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$1;->this$0:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$1;->this$0:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->doNegativeClick()V

    .line 115
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 116
    return-void
.end method
