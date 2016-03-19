.class Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$1;
.super Ljava/lang/Object;
.source "ErrorDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->buildErrorPanel(IIILjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

.field final synthetic val$onRetry:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;Ljava/lang/Runnable;)V
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$1;->this$0:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$1;->val$onRetry:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$1;->val$onRetry:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 38
    return-void
.end method
