.class public Lcom/seeclickfix/ma/android/dialogs/FlagDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "FlagDialog.java"


# instance fields
.field dialogInput:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->dialogInput:Landroid/widget/EditText;

    return-void
.end method

.method public static newInstance(Ljava/lang/String;I)Lcom/seeclickfix/ma/android/dialogs/FlagDialog;
    .locals 3
    .param p0, "resourceType"    # Ljava/lang/String;
    .param p1, "resourceId"    # I

    .prologue
    .line 25
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;-><init>()V

    .line 26
    .local v1, "dialog":Lcom/seeclickfix/ma/android/dialogs/FlagDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 28
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "resource_type"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    const-string/jumbo v2, "resource_id"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 30
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->setArguments(Landroid/os/Bundle;)V

    .line 32
    return-object v1
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->dialogInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResourceId()I
    .locals 2

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "resource_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getResourceType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "resource_type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 50
    .local v1, "inflater":Landroid/view/LayoutInflater;
    const v3, 0x7f03001c

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 51
    .local v2, "v":Landroid/view/View;
    const v3, 0x7f0a0051

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->dialogInput:Landroid/widget/EditText;

    .line 53
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 54
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0c0082

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0c0080

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0c0013

    new-instance v5, Lcom/seeclickfix/ma/android/dialogs/FlagDialog$2;

    invoke-direct {v5, p0}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog$2;-><init>(Lcom/seeclickfix/ma/android/dialogs/FlagDialog;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0c0012

    new-instance v5, Lcom/seeclickfix/ma/android/dialogs/FlagDialog$1;

    invoke-direct {v5, p0}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog$1;-><init>(Lcom/seeclickfix/ma/android/dialogs/FlagDialog;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 70
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    return-object v3
.end method
