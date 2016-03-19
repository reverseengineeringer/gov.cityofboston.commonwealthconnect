.class Lcom/seeclickfix/ma/android/views/questions/QuestionText$1;
.super Ljava/lang/Object;
.source "QuestionText.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/questions/QuestionText;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionText;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/questions/QuestionText;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionText;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->questionEditText:Landroid/widget/EditText;

    new-instance v1, Lcom/seeclickfix/ma/android/views/questions/QuestionText$1$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionText$1$1;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionText$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 64
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 51
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 46
    return-void
.end method
