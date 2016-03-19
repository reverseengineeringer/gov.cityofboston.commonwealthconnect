.class Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$2;
.super Ljava/lang/Object;
.source "ErrorDialog.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$2;->this$0:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 45
    const/4 v0, 0x1

    return v0
.end method
