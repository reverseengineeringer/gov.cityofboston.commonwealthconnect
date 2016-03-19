.class Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3$1;
.super Ljava/lang/Object;
.source "QuestionNumber.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;->afterTextChanged(Landroid/text/Editable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;)V
    .locals 0

    .prologue
    .line 94
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3$1;->this$1:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3$1;->this$1:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    # invokes: Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->updateAnswer()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->access$200(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)V

    .line 98
    return-void
.end method
