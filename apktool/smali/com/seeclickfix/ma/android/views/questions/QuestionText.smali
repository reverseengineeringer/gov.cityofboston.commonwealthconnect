.class public Lcom/seeclickfix/ma/android/views/questions/QuestionText;
.super Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;
.source "QuestionText.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "QuestionText"


# instance fields
.field private isRecreatingAPreviousAnswer:Z

.field protected questionEditText:Landroid/widget/EditText;

.field private textWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p4, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->isRecreatingAPreviousAnswer:Z

    .line 34
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->setupListeners()V

    .line 35
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->setupQuestion()V

    .line 36
    return-void
.end method

.method private showPreviousAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 2
    .param p1, "prevAnswer"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->questionEditText:Landroid/widget/EditText;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getAnswer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 122
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->isRecreatingAPreviousAnswer:Z

    .line 123
    return-void
.end method


# virtual methods
.method protected setupListeners()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionText$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionText$1;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionText;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->textWatcher:Landroid/text/TextWatcher;

    .line 67
    return-void
.end method

.method protected setupQuestion()V
    .locals 7

    .prologue
    .line 96
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->container:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f03004d

    iget-object v6, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->container:Landroid/view/ViewGroup;

    invoke-static {v4, v5, v6}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 97
    .local v1, "questionContianer":Landroid/view/ViewGroup;
    const v4, 0x7f0a0139

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 98
    .local v2, "questionTextView":Landroid/widget/TextView;
    const v4, 0x7f0a013a

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    iput-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->questionEditText:Landroid/widget/EditText;

    .line 99
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->getErrorString()Ljava/lang/String;

    move-result-object v3

    .line 101
    .local v3, "text":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v3, v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->setQuestionText(Ljava/lang/String;Landroid/widget/TextView;)V

    .line 103
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v0

    .line 105
    .local v0, "prevAnswer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    if-eqz v0, :cond_0

    .line 107
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->isRecreatingAPreviousAnswer:Z

    .line 108
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->showPreviousAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 111
    :cond_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->questionEditText:Landroid/widget/EditText;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->activity:Landroid/support/v4/app/FragmentActivity;

    const v6, 0x7f0c0107

    invoke-virtual {v5, v6}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x2d6

    invoke-virtual {v4, v5, v6}, Landroid/widget/EditText;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 113
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->questionEditText:Landroid/widget/EditText;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->textWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 115
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->container:Landroid/view/ViewGroup;

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 116
    return-void

    .line 99
    .end local v0    # "prevAnswer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    .end local v3    # "text":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method protected updateAnswer()V
    .locals 3

    .prologue
    .line 74
    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->isRecreatingAPreviousAnswer:Z

    if-nez v1, :cond_1

    .line 75
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    if-nez v1, :cond_0

    .line 76
    new-instance v1, Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/report/Answer;-><init>()V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 78
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setPrimaryKey(Ljava/lang/String;)V

    .line 80
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setDisplayText(Ljava/lang/String;)V

    .line 83
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->questionEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "answerString":Ljava/lang/String;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setAnswer(Ljava/lang/String;)V

    .line 88
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->setSelectedAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 89
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/views/questions/QuestionText;->onSelectAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 92
    .end local v0    # "answerString":Ljava/lang/String;
    :cond_1
    return-void
.end method
