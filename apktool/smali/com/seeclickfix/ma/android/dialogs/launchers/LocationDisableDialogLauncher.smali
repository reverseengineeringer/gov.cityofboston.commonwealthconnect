.class public Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;
.super Ljava/lang/Object;
.source "LocationDisableDialogLauncher.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field dialogManager:Lcom/seeclickfix/ma/android/dialogs/DialogManager;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private fa:Landroid/support/v4/app/FragmentActivity;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getOptions()Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    .locals 1

    .prologue
    .line 32
    const-string/jumbo v0, "PreBakedDialogs::LOCATION_OFF"

    invoke-static {v0}, Lcom/seeclickfix/ma/android/dialogs/PreBakedDialogs;->getDialogOptions(Ljava/lang/String;)Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public onNegativeClick()V
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;->fa:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 48
    return-void
.end method

.method public bridge synthetic onPositiveClick(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 16
    check-cast p1, Ljava/lang/Void;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;->onPositiveClick(Ljava/lang/Void;)V

    return-void
.end method

.method public onPositiveClick(Ljava/lang/Void;)V
    .locals 2
    .param p1, "val"    # Ljava/lang/Void;

    .prologue
    .line 40
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.settings.LOCATION_SOURCE_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 41
    .local v0, "settingsIntent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 42
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;->fa:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v1, v0}, Landroid/support/v4/app/FragmentActivity;->startActivity(Landroid/content/Intent;)V

    .line 43
    return-void
.end method

.method public showDialog(Lcom/seeclickfix/ma/android/events/Event;Landroid/support/v4/app/FragmentActivity;)V
    .locals 2
    .param p1, "_unused"    # Lcom/seeclickfix/ma/android/events/Event;
    .param p2, "fa"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 25
    iput-object p2, p0, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;->fa:Landroid/support/v4/app/FragmentActivity;

    .line 27
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;->getOptions()Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    move-result-object v0

    .line 28
    .local v0, "opts":Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;->dialogManager:Lcom/seeclickfix/ma/android/dialogs/DialogManager;

    invoke-static {v0, p0, p2}, Lcom/seeclickfix/ma/android/dialogs/DialogManager;->showDialog(Lcom/seeclickfix/ma/android/dialogs/DialogOptions;Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;Landroid/support/v4/app/FragmentActivity;)V

    .line 29
    return-void
.end method
