.class Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;
.super Ljava/lang/Object;
.source "QuestionNumber.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)V
    .locals 0

    .prologue
    .line 79
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->questionEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->access$100(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3$1;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 101
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 88
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 83
    return-void
.end method
