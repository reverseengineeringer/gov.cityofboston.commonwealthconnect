.class Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$1;
.super Ljava/lang/Object;
.source "NamePlaceDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;)V
    .locals 0

    .prologue
    .line 97
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$1;->this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 99
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$1;->this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->doNegativeClick()V

    .line 100
    return-void
.end method
