.class public Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "ProgressWheelDialog.java"


# instance fields
.field private message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 14
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->message:Ljava/lang/String;

    return-object v0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 19
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 26
    .local v0, "pd":Landroid/app/ProgressDialog;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 27
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 28
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 29
    return-object v0
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->message:Ljava/lang/String;

    .line 39
    return-void
.end method
