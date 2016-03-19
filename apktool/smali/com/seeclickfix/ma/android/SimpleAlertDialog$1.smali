.class Lcom/seeclickfix/ma/android/SimpleAlertDialog$1;
.super Ljava/lang/Object;
.source "SimpleAlertDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/SimpleAlertDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/SimpleAlertDialog;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/SimpleAlertDialog;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SimpleAlertDialog$1;->this$0:Lcom/seeclickfix/ma/android/SimpleAlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 69
    return-void
.end method
