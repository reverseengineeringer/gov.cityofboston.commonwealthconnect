.class public Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;
.super Ljava/lang/Object;
.source "ErrorDialog.java"


# instance fields
.field private final errorView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1, "errorView"    # Landroid/view/View;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->errorView:Landroid/view/View;

    .line 20
    return-void
.end method

.method private buildErrorPanel(IIILjava/lang/Runnable;)V
    .locals 5
    .param p1, "messageId"    # I
    .param p2, "iconId"    # I
    .param p3, "buttonTextId"    # I
    .param p4, "onRetry"    # Ljava/lang/Runnable;

    .prologue
    const/4 v4, 0x0

    .line 28
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->errorView:Landroid/view/View;

    const v3, 0x7f0a0150

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 29
    .local v1, "errorTextView":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->errorView:Landroid/view/View;

    const v3, 0x7f0a0151

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 31
    .local v0, "errorBtn":Landroid/widget/Button;
    invoke-virtual {v0, p2, v4, v4, v4}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 32
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setText(I)V

    .line 33
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    .line 35
    new-instance v2, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$1;

    invoke-direct {v2, p0, p4}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$1;-><init>(Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    iget-object v2, p0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->errorView:Landroid/view/View;

    new-instance v3, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$2;

    invoke-direct {v3, p0}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog$2;-><init>(Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 48
    return-void
.end method


# virtual methods
.method public showErrorPanel(IIIILjava/lang/Runnable;)V
    .locals 2
    .param p1, "titleId"    # I
    .param p2, "messageId"    # I
    .param p3, "iconId"    # I
    .param p4, "buttonTextId"    # I
    .param p5, "onRetry"    # Ljava/lang/Runnable;

    .prologue
    .line 24
    const v0, 0x7f020112

    const v1, 0x7f0c0072

    invoke-direct {p0, p2, v0, v1, p5}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->buildErrorPanel(IIILjava/lang/Runnable;)V

    .line 25
    return-void
.end method
