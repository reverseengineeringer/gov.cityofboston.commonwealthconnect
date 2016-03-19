.class Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;
.super Ljava/lang/Object;
.source "QuestionMultivalue.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 119
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 120
    .local v0, "a":Lcom/seeclickfix/ma/android/objects/report/Answer;
    const v2, 0x7f0a0161

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 122
    .local v1, "checkbox":Landroid/widget/CheckBox;
    invoke-virtual {v1}, Landroid/widget/CheckBox;->toggle()V

    .line 124
    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 125
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->selectedAnswerValues:Ljava/util/Set;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getAnswer()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 126
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->setMultivalAnswer()V

    .line 127
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    iget-object v3, v3, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->onSelectAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 129
    :cond_1
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    iget-object v3, v3, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->onRemovewAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 131
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->selectedAnswerValues:Ljava/util/Set;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getAnswer()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 133
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->selectedAnswerValues:Ljava/util/Set;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 135
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->setMultivalAnswer()V

    .line 136
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    iget-object v3, v3, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->onSelectAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    goto :goto_0
.end method
