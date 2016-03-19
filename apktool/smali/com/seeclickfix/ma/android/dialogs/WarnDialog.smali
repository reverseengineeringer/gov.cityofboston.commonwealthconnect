.class public Lcom/seeclickfix/ma/android/dialogs/WarnDialog;
.super Lcom/seeclickfix/ma/android/dialogs/AbsDialog;
.source "WarnDialog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/dialogs/AbsDialog",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "WarnDialog"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;-><init>()V

    .line 26
    return-void
.end method

.method public static newInstance(Lcom/seeclickfix/ma/android/dialogs/DialogOptions;)Lcom/seeclickfix/ma/android/dialogs/WarnDialog;
    .locals 3
    .param p0, "options"    # Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    .prologue
    .line 37
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;-><init>()V

    .line 38
    .local v1, "dlg":Lcom/seeclickfix/ma/android/dialogs/WarnDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 39
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "dialog_options"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 40
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->setArguments(Landroid/os/Bundle;)V

    .line 41
    iget-boolean v2, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->retainInstance:Z

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->setRetainInstance(Z)V

    .line 42
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->setCancelable(Z)V

    .line 43
    return-object v1
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 74
    return-void
.end method

.method public bridge synthetic onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "x0"    # Landroid/content/DialogInterface;
    .param p2, "x1"    # I

    .prologue
    .line 16
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->onClick(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "dialog_options"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    .line 51
    .local v5, "options":Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-direct {v2, v6}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 52
    .local v2, "frameView":Landroid/widget/FrameLayout;
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget v7, v5, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->titleTextId:I

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    iget v7, v5, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->positiveButtonTextId:I

    invoke-virtual {v6, v7, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    iget v7, v5, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->negativeButtonTextId:I

    invoke-virtual {v6, v7, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 60
    .local v0, "ad":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 62
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v6, 0x7f030021

    invoke-virtual {v3, v6, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 64
    .local v1, "dialogLayout":Landroid/view/ViewGroup;
    const v6, 0x7f0a0058

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 66
    .local v4, "msgTextView":Landroid/widget/TextView;
    iget v6, v5, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->msgTextId:I

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(I)V

    .line 68
    return-object v0
.end method

.method public bridge synthetic onNegativeClick()V
    .locals 0

    .prologue
    .line 16
    invoke-super {p0}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->onNegativeClick()V

    return-void
.end method

.method public bridge synthetic onPositiveClick()V
    .locals 0

    .prologue
    .line 16
    invoke-super {p0}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->onPositiveClick()V

    return-void
.end method

.method public bridge synthetic setClickListener(Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;)V
    .locals 0
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;

    .prologue
    .line 16
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/dialogs/AbsDialog;->setClickListener(Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;)V

    return-void
.end method
