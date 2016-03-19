.class public abstract Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;
.super Ljava/lang/Object;
.source "AbstractQuestion.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;


# instance fields
.field protected activity:Landroid/support/v4/app/FragmentActivity;

.field protected answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

.field protected callback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

.field protected container:Landroid/view/ViewGroup;

.field protected question:Lcom/seeclickfix/ma/android/objects/report/Question;

.field protected savedInstance:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p4, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 27
    iput-object p2, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->container:Landroid/view/ViewGroup;

    .line 28
    iput-object p3, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->activity:Landroid/support/v4/app/FragmentActivity;

    .line 29
    iput-object p4, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->savedInstance:Landroid/os/Bundle;

    .line 30
    return-void
.end method


# virtual methods
.method protected appendRequiredString(Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-static {p1, p2, v0}, Lcom/seeclickfix/ma/android/style/StyleUtil;->appendRequiredString(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V

    .line 111
    return-void
.end method

.method public getAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    return-object v0
.end method

.method protected getErrorString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->activity:Landroid/support/v4/app/FragmentActivity;

    const v1, 0x7f0c00da

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getQuestionContainer()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 114
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onRemovewAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 1
    .param p1, "answer"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->callback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->callback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

    invoke-interface {v0, p1}, Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;->onRemoveAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 83
    :cond_0
    return-void
.end method

.method protected onSelectAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 1
    .param p1, "answer"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->callback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->callback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

    invoke-interface {v0, p1}, Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;->onSetAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 69
    :cond_0
    return-void
.end method

.method public setOnAnswerCallback(Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->callback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

    .line 54
    return-void
.end method

.method protected setQuestionText(Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "questionTextView"    # Landroid/widget/TextView;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Question;->isRequired()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 121
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Question;->willDisplayAnswer()Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-static {p1, p2, v0}, Lcom/seeclickfix/ma/android/style/StyleUtil;->appendReqAndNotPub(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V

    .line 131
    :goto_0
    return-void

    .line 124
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->appendRequiredString(Ljava/lang/String;Landroid/widget/TextView;)V

    goto :goto_0

    .line 126
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Question;->willDisplayAnswer()Z

    move-result v0

    if-nez v0, :cond_2

    .line 127
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-static {p1, p2, v0}, Lcom/seeclickfix/ma/android/style/StyleUtil;->appendNotPublicString(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V

    goto :goto_0

    .line 129
    :cond_2
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
