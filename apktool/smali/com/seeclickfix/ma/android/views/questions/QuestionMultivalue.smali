.class public Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;
.super Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;
.source "QuestionMultivalue.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "QuestionMultivalue"


# instance fields
.field btnListener:Landroid/view/View$OnClickListener;

.field private selectedAnswerValues:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


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

    .line 30
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->selectedAnswerValues:Ljava/util/Set;

    .line 115
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue$1;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->btnListener:Landroid/view/View$OnClickListener;

    .line 34
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->setupQuestion()V

    .line 35
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->selectedAnswerValues:Ljava/util/Set;

    return-object v0
.end method

.method private addRowsToMultivalueContainer(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;)V
    .locals 10
    .param p1, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .param p2, "multivalContainer"    # Landroid/view/ViewGroup;

    .prologue
    .line 70
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getAnswerList()Ljava/util/List;

    move-result-object v1

    .line 72
    .local v1, "answerList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 73
    .local v0, "a":Lcom/seeclickfix/ma/android/objects/report/Answer;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->container:Landroid/view/ViewGroup;

    invoke-virtual {v8}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f030057

    invoke-static {v8, v9, p2}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 74
    .local v5, "row":Landroid/view/ViewGroup;
    const v8, 0x7f0a0160

    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 75
    .local v7, "textView":Landroid/widget/TextView;
    const v8, 0x7f0a0161

    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    .line 77
    .local v3, "checkbox":Landroid/widget/CheckBox;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v6

    .line 79
    .local v6, "selectedAnswer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    if-eqz v6, :cond_0

    .line 80
    iput-object v6, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 85
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getAnswer()Ljava/lang/String;

    move-result-object v2

    .line 87
    .local v2, "answerString":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getAnswer()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 92
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 94
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->selectedAnswerValues:Ljava/util/Set;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getAnswer()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    .end local v2    # "answerString":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getDisplayText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 102
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->btnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    invoke-virtual {p2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 107
    .end local v0    # "a":Lcom/seeclickfix/ma/android/objects/report/Answer;
    .end local v3    # "checkbox":Landroid/widget/CheckBox;
    .end local v5    # "row":Landroid/view/ViewGroup;
    .end local v6    # "selectedAnswer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    .end local v7    # "textView":Landroid/widget/TextView;
    :cond_1
    return-void
.end method

.method private serializeAnswers()Ljava/lang/String;
    .locals 4

    .prologue
    .line 156
    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->selectedAnswerValues:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 158
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .local v2, "sb":Ljava/lang/StringBuilder;
    const-string/jumbo v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 164
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 165
    .local v1, "s":Ljava/lang/String;
    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 170
    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 173
    .end local v1    # "s":Ljava/lang/String;
    :cond_1
    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private setupQuestion()V
    .locals 7

    .prologue
    .line 46
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->container:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f030049

    iget-object v6, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->container:Landroid/view/ViewGroup;

    invoke-static {v4, v5, v6}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 47
    .local v1, "questionContainer":Landroid/view/ViewGroup;
    const v4, 0x7f0a0132

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 48
    .local v0, "multivalContainer":Landroid/view/ViewGroup;
    const v4, 0x7f0a0131

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 49
    .local v2, "questionTextView":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->getErrorString()Ljava/lang/String;

    move-result-object v3

    .line 52
    .local v3, "text":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v3, v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->setQuestionText(Ljava/lang/String;Landroid/widget/TextView;)V

    .line 55
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-direct {p0, v4, v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->addRowsToMultivalueContainer(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;)V

    .line 58
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->container:Landroid/view/ViewGroup;

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 59
    return-void

    .line 49
    .end local v3    # "text":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method


# virtual methods
.method public getAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    return-object v0
.end method

.method protected setMultivalAnswer()V
    .locals 3

    .prologue
    .line 143
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    if-nez v1, :cond_0

    .line 144
    new-instance v1, Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/report/Answer;-><init>()V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 145
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setPrimaryKey(Ljava/lang/String;)V

    .line 148
    :cond_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->serializeAnswers()Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "answerString":Ljava/lang/String;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setAnswer(Ljava/lang/String;)V

    .line 152
    return-void
.end method
