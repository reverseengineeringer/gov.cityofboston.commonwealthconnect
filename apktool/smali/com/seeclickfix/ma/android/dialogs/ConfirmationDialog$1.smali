.class final Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$1;
.super Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;
.source "ConfirmationDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->newInstance(IILjava/lang/String;Ljava/lang/Runnable;)Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$afterConfirm:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .prologue
    .line 34
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$1;->val$afterConfirm:Ljava/lang/Runnable;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterConfirm()Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog$1;->val$afterConfirm:Ljava/lang/Runnable;

    return-object v0
.end method
