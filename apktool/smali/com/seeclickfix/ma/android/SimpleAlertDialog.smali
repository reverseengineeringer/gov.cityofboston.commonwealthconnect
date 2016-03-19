.class public Lcom/seeclickfix/ma/android/SimpleAlertDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "SimpleAlertDialog.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static create(I)Lcom/seeclickfix/ma/android/SimpleAlertDialog;
    .locals 1
    .param p0, "message"    # I

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-static {v0, p0, v0, v0, v0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->create(IIIII)Lcom/seeclickfix/ma/android/SimpleAlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static create(IIIII)Lcom/seeclickfix/ma/android/SimpleAlertDialog;
    .locals 2
    .param p0, "title"    # I
    .param p1, "message"    # I
    .param p2, "positiveButton"    # I
    .param p3, "negativeButton"    # I
    .param p4, "neutralButton"    # I

    .prologue
    .line 41
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 42
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz p0, :cond_0

    const-string/jumbo v1, "title_id"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 43
    :cond_0
    if-eqz p1, :cond_1

    const-string/jumbo v1, "message_id"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 44
    :cond_1
    if-eqz p2, :cond_2

    const-string/jumbo v1, "positiveButton_id"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 45
    :cond_2
    if-eqz p3, :cond_3

    const-string/jumbo v1, "negativeButton_id"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 46
    :cond_3
    if-eqz p4, :cond_4

    const-string/jumbo v1, "neutralButton_id"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 47
    :cond_4
    invoke-static {v0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->create(Landroid/os/Bundle;)Lcom/seeclickfix/ma/android/SimpleAlertDialog;

    move-result-object v1

    return-object v1
.end method

.method public static create(Landroid/os/Bundle;)Lcom/seeclickfix/ma/android/SimpleAlertDialog;
    .locals 1
    .param p0, "arguments"    # Landroid/os/Bundle;

    .prologue
    .line 18
    new-instance v0, Lcom/seeclickfix/ma/android/SimpleAlertDialog;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;-><init>()V

    .line 19
    .local v0, "instance":Lcom/seeclickfix/ma/android/SimpleAlertDialog;
    invoke-virtual {v0, p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->setArguments(Landroid/os/Bundle;)V

    .line 20
    return-object v0
.end method

.method public static create(Ljava/lang/String;)Lcom/seeclickfix/ma/android/SimpleAlertDialog;
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 24
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 25
    .local v0, "arguments":Landroid/os/Bundle;
    const-string/jumbo v1, "message"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    invoke-static {v0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->create(Landroid/os/Bundle;)Lcom/seeclickfix/ma/android/SimpleAlertDialog;

    move-result-object v1

    return-object v1
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lcom/seeclickfix/ma/android/SimpleAlertDialog;
    .locals 2
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "button"    # Ljava/lang/String;

    .prologue
    .line 30
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 31
    .local v0, "arguments":Landroid/os/Bundle;
    const-string/jumbo v1, "message"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    const-string/jumbo v1, "button"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    invoke-static {v0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->create(Landroid/os/Bundle;)Lcom/seeclickfix/ma/android/SimpleAlertDialog;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 55
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "message"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 56
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "message"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 57
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "button"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "positive":Ljava/lang/String;
    :cond_0
    :goto_0
    new-instance v2, Lcom/seeclickfix/ma/android/SimpleAlertDialog$1;

    invoke-direct {v2, p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog$1;-><init>(Lcom/seeclickfix/ma/android/SimpleAlertDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 72
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    return-object v2

    .line 59
    .end local v1    # "positive":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "message_id"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 60
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "button"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 62
    .restart local v1    # "positive":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 63
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "positiveButton_id"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
