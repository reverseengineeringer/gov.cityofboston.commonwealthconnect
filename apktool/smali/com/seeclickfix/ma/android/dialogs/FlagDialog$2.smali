.class Lcom/seeclickfix/ma/android/dialogs/FlagDialog$2;
.super Ljava/lang/Object;
.source "FlagDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/dialogs/FlagDialog;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/dialogs/FlagDialog;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/FlagDialog$2;->this$0:Lcom/seeclickfix/ma/android/dialogs/FlagDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 60
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    new-instance v1, Lcom/seeclickfix/ma/android/events/FlagContentEvent;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/FlagDialog$2;->this$0:Lcom/seeclickfix/ma/android/dialogs/FlagDialog;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->getResourceType()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/FlagDialog$2;->this$0:Lcom/seeclickfix/ma/android/dialogs/FlagDialog;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->getResourceId()I

    move-result v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/dialogs/FlagDialog$2;->this$0:Lcom/seeclickfix/ma/android/dialogs/FlagDialog;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/seeclickfix/ma/android/events/FlagContentEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 61
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 62
    return-void
.end method
