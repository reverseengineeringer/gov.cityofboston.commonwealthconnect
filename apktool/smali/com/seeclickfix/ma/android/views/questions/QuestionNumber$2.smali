.class Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$2;
.super Ljava/lang/Object;
.source "QuestionNumber.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;


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
    .line 68
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$2;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/seeclickfix/ma/android/dialogs/NumDialog;)V
    .locals 2
    .param p1, "numDialog"    # Lcom/seeclickfix/ma/android/dialogs/NumDialog;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$2;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->questionEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->access$100(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->getValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$2;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    # invokes: Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->updateAnswer()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->access$200(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)V

    .line 76
    return-void
.end method
