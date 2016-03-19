.class Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;
.super Ljava/lang/Object;
.source "QuestionSelect.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->getListener()Landroid/widget/AdapterView$OnItemSelectedListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;)V
    .locals 0

    .prologue
    .line 122
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 137
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z
    invoke-static {v1}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 139
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 141
    .local v0, "answerAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    invoke-virtual {v0, p3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/Answer;

    iput-object v1, v2, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 142
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v1, p3}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setSelectedPosition(I)V

    .line 152
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->onSelectAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 155
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    const/4 v2, 0x0

    # setter for: Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z
    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->access$002(Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;Z)Z

    .line 157
    .end local v0    # "answerAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    :cond_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v3, 0x0

    .line 163
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z
    invoke-static {v1}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 166
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 168
    .local v0, "answerAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    invoke-virtual {v0, v3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/Answer;

    iput-object v1, v2, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 169
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setSelectedPosition(I)V

    .line 179
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->onSelectAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 181
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    # setter for: Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z
    invoke-static {v1, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->access$002(Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;Z)Z

    .line 184
    .end local v0    # "answerAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    :cond_0
    return-void
.end method
