.class public Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;
.super Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;
.source "QuestionSelect.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "QuestionSelect"


# instance fields
.field private questionSpinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private showingPreviousAnswer:Z


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p4, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z

    .line 37
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->setupQuestion()V

    .line 38
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z

    return v0
.end method

.method static synthetic access$002(Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;
    .param p1, "x1"    # Z

    .prologue
    .line 22
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z

    return p1
.end method

.method private getListener()Landroid/widget/AdapterView$OnItemSelectedListener;
    .locals 1

    .prologue
    .line 122
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect$1;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->questionSpinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 187
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->questionSpinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    return-object v0
.end method

.method private setupQuestion()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 47
    iput-object v11, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->questionSpinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 51
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->container:Landroid/view/ViewGroup;

    invoke-virtual {v8}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f03004c

    iget-object v10, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->container:Landroid/view/ViewGroup;

    invoke-static {v8, v9, v10}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 52
    .local v3, "questionContianer":Landroid/view/ViewGroup;
    const v8, 0x7f0a0137

    invoke-virtual {v3, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 53
    .local v4, "questionTextView":Landroid/widget/TextView;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->getErrorString()Ljava/lang/String;

    move-result-object v7

    .line 55
    .local v7, "text":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v7, v4}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->setQuestionText(Ljava/lang/String;Landroid/widget/TextView;)V

    .line 58
    new-instance v5, Landroid/widget/Spinner;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-direct {v5, v8}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 60
    .local v5, "spinner":Landroid/widget/Spinner;
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x2

    invoke-direct {v2, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 66
    .local v2, "lllp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v5, v2}, Landroid/widget/Spinner;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Question;->getAnswerList()Ljava/util/List;

    move-result-object v1

    .line 70
    .local v1, "answersArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    new-instance v0, Landroid/widget/ArrayAdapter;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->activity:Landroid/support/v4/app/FragmentActivity;

    const v9, 0x7f030051

    invoke-direct {v0, v8, v9, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 74
    .local v0, "answersAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    invoke-virtual {v5, v7}, Landroid/widget/Spinner;->setPrompt(Ljava/lang/CharSequence;)V

    .line 76
    invoke-virtual {v5, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 80
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v5, v8}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    .line 83
    const v8, 0x7f0a0138

    invoke-virtual {v3, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 85
    .local v6, "spinnerContainer":Landroid/view/ViewGroup;
    invoke-virtual {v5, v11}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 87
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 89
    if-eqz v3, :cond_0

    .line 90
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->container:Landroid/view/ViewGroup;

    invoke-virtual {v8, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 93
    :cond_0
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 96
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z

    .line 98
    invoke-direct {p0, v5}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showPreviousAnswer(Landroid/widget/Spinner;)V

    .line 104
    :goto_1
    return-void

    .line 53
    .end local v0    # "answersAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    .end local v1    # "answersArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    .end local v2    # "lllp":Landroid/widget/LinearLayout$LayoutParams;
    .end local v5    # "spinner":Landroid/widget/Spinner;
    .end local v6    # "spinnerContainer":Landroid/view/ViewGroup;
    .end local v7    # "text":Ljava/lang/String;
    :cond_1
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 100
    .restart local v0    # "answersAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    .restart local v1    # "answersArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    .restart local v2    # "lllp":Landroid/widget/LinearLayout$LayoutParams;
    .restart local v5    # "spinner":Landroid/widget/Spinner;
    .restart local v6    # "spinnerContainer":Landroid/view/ViewGroup;
    .restart local v7    # "text":Ljava/lang/String;
    :cond_2
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->getListener()Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    goto :goto_1
.end method

.method private showPreviousAnswer(Landroid/widget/Spinner;)V
    .locals 2
    .param p1, "spinner"    # Landroid/widget/Spinner;

    .prologue
    .line 108
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v0

    .line 110
    .local v0, "prevAnswer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    if-eqz v0, :cond_0

    .line 111
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getSelectedPosition()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 112
    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 115
    :cond_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->getListener()Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 117
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->showingPreviousAnswer:Z

    .line 118
    return-void
.end method


# virtual methods
.method public getAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    return-object v0
.end method
