.class public Lcom/seeclickfix/ma/android/dialogs/DialogManager;
.super Ljava/lang/Object;
.source "DialogManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showDialog(Lcom/seeclickfix/ma/android/dialogs/DialogOptions;Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;Landroid/support/v4/app/FragmentActivity;)V
    .locals 3
    .param p0, "options"    # Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    .param p2, "fragmentActivity"    # Landroid/support/v4/app/FragmentActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/dialogs/DialogOptions;",
            "Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener",
            "<*>;",
            "Landroid/support/v4/app/FragmentActivity;",
            ")V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "clickListener":Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;, "Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener<*>;"
    invoke-virtual {p2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 20
    .local v1, "fm":Landroid/support/v4/app/FragmentManager;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->fragmentTag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;

    .line 22
    .local v0, "dialog":Lcom/seeclickfix/ma/android/dialogs/WarnDialog;
    if-nez v0, :cond_0

    .line 23
    invoke-static {p0}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->newInstance(Lcom/seeclickfix/ma/android/dialogs/DialogOptions;)Lcom/seeclickfix/ma/android/dialogs/WarnDialog;

    move-result-object v0

    .line 24
    iget-boolean v2, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->retainInstance:Z

    invoke-virtual {v0, v2}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->setRetainInstance(Z)V

    .line 27
    :cond_0
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->setClickListener(Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;)V

    .line 29
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->isAdded()Z

    move-result v2

    if-nez v2, :cond_1

    .line 30
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->fragmentTag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/WarnDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 32
    :cond_1
    return-void
.end method
