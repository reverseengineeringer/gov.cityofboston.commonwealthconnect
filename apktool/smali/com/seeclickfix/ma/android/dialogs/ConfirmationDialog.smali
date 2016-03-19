.class public abstract Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "ConfirmationDialog.java"


# instance fields
.field private titleResId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(IILjava/lang/String;Ljava/lang/Runnable;)Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;
    .locals 3
    .param p0, "titleResId"    # I
    .param p1, "msgResId"    # I
    .param p2, "message2"    # Ljava/lang/String;
    .param p3, "afterConfirm"    # Ljava/lang/Runnable;

    .prologue
    .line 34
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$1;

    invoke-direct {v1, p3}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$1;-><init>(Ljava/lang/Runnable;)V

    .line 41
    .local v1, "dlg":Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 43
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "title"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 44
    const-string/jumbo v2, "message"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 45
    const-string/jumbo v2, "message2"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->setArguments(Landroid/os/Bundle;)V

    .line 49
    return-object v1
.end method

.method public static show(IILjava/lang/String;Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;)V
    .locals 3
    .param p0, "titleResId"    # I
    .param p1, "msgResId"    # I
    .param p2, "message2"    # Ljava/lang/String;
    .param p3, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p4, "afterConfirm"    # Ljava/lang/Runnable;

    .prologue
    .line 91
    invoke-static {p0, p1, p2, p4}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->newInstance(IILjava/lang/String;Ljava/lang/Runnable;)Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;

    move-result-object v0

    .line 92
    .local v0, "dialog":Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;
    invoke-virtual {p3}, Landroid/support/v4/app/Fragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method public static showNotice(Landroid/support/v4/app/Fragment;Lcom/seeclickfix/ma/android/fragments/NoticeItem;Ljava/lang/Runnable;)V
    .locals 3
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "item"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .param p2, "afterConfirm"    # Ljava/lang/Runnable;

    .prologue
    .line 96
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getTitle()I

    move-result v0

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getBody()I

    move-result v1

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getExtra()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, p0, p2}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->show(IILjava/lang/String;Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;)V

    .line 97
    return-void
.end method


# virtual methods
.method protected abstract afterConfirm()Ljava/lang/Runnable;
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "title"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 55
    .local v6, "titleResource":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "message"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 56
    .local v5, "msgResource":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "message2"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 58
    .local v4, "message2":Ljava/lang/String;
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v2, v7}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 59
    .local v2, "frameView":Landroid/widget/FrameLayout;
    new-instance v7, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f0c00cf

    new-instance v9, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$3;

    invoke-direct {v9, p0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$3;-><init>(Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    new-instance v8, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$2;

    invoke-direct {v8, p0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$2;-><init>(Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;)V

    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 79
    .local v0, "ad":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 80
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v7, 0x7f03001b

    invoke-virtual {v3, v7, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 82
    .local v1, "dialogLayout":Landroid/view/ViewGroup;
    const v7, 0x7f0a004e

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(I)V

    .line 83
    const v7, 0x7f0a004f

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    return-object v0
.end method
