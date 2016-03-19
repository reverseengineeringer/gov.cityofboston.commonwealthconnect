.class Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;
.super Ljava/lang/Object;
.source "SeeclickfixActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

.field final synthetic val$focusedChild:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 395
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;->val$focusedChild:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 398
    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 399
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;->val$focusedChild:Landroid/view/View;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 400
    return-void
.end method
