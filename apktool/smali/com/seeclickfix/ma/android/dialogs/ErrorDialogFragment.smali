.class public Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "ErrorDialogFragment.java"


# instance fields
.field private mDialog:Landroid/app/Dialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 14
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;->setRetainInstance(Z)V

    .line 15
    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;->mDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method public setDialog(Landroid/app/Dialog;)V
    .locals 0
    .param p1, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialogFragment;->mDialog:Landroid/app/Dialog;

    .line 21
    return-void
.end method
