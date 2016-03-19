.class public Lcom/seeclickfix/ma/android/views/questions/QuestionNote;
.super Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;
.source "QuestionNote.java"


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p4, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 15
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .line 17
    invoke-virtual {p3}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f03004a

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 18
    .local v0, "questionContainer":Landroid/view/ViewGroup;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNote;->container:Landroid/view/ViewGroup;

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 20
    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNote;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v2

    .line 22
    .local v2, "text":Ljava/lang/String;
    const v3, 0x7f0a0133

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 23
    .local v1, "questionTextView":Landroid/widget/TextView;
    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNote;->getErrorString()Ljava/lang/String;

    move-result-object v2

    .end local v2    # "text":Ljava/lang/String;
    :cond_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    return-void
.end method
