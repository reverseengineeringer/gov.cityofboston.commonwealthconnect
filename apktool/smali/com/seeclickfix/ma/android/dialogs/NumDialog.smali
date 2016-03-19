.class public Lcom/seeclickfix/ma/android/dialogs/NumDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "NumDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_NumDialog"


# instance fields
.field private ad:Landroid/app/AlertDialog;

.field private listener:Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;

.field private np:Lnet/simonvt/numberpicker/NumberPicker;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 94
    return-void
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->np:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v0

    return v0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 104
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 54
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 56
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f03001e

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 57
    .local v1, "view":Landroid/view/View;
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 59
    const v2, 0x104000a

    invoke-virtual {v0, v2, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 62
    const v2, 0x7f0a0057

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lnet/simonvt/numberpicker/NumberPicker;

    iput-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->np:Lnet/simonvt/numberpicker/NumberPicker;

    .line 63
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->np:Lnet/simonvt/numberpicker/NumberPicker;

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 64
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->np:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 65
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->np:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2, v5}, Lnet/simonvt/numberpicker/NumberPicker;->setFocusable(Z)V

    .line 66
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->np:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2, v5}, Lnet/simonvt/numberpicker/NumberPicker;->setFocusableInTouchMode(Z)V

    .line 68
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->np:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2, p0}, Lnet/simonvt/numberpicker/NumberPicker;->setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V

    .line 69
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->ad:Landroid/app/AlertDialog;

    .line 70
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->ad:Landroid/app/AlertDialog;

    return-object v2
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 76
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 80
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;

    invoke-interface {v0, p0}, Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;->onComplete(Lcom/seeclickfix/ma/android/dialogs/NumDialog;)V

    .line 81
    return-void
.end method

.method public onValueChange(Lnet/simonvt/numberpicker/NumberPicker;II)V
    .locals 0
    .param p1, "picker"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p2, "oldVal"    # I
    .param p3, "newVal"    # I

    .prologue
    .line 114
    return-void
.end method

.method public setListener(Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;

    .line 91
    return-void
.end method
