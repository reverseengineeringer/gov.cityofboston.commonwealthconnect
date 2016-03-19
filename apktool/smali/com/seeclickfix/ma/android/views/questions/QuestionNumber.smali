.class public Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;
.super Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;
.source "QuestionNumber.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "QuestionNumber"


# instance fields
.field private btnListener:Landroid/view/View$OnClickListener;

.field private numberPickedListener:Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;

.field private questionEditText:Landroid/widget/EditText;

.field private textWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p4, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .line 38
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->setupListeners()V

    .line 39
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->setupQuestion()V

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->showNumPickerDialog(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->questionEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->updateAnswer()V

    return-void
.end method

.method private setupListeners()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$1;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->btnListener:Landroid/view/View$OnClickListener;

    .line 68
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$2;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->numberPickedListener:Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;

    .line 79
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$3;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->textWatcher:Landroid/text/TextWatcher;

    .line 103
    return-void
.end method

.method private setupQuestion()V
    .locals 7

    .prologue
    .line 44
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->container:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f03004b

    iget-object v6, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->container:Landroid/view/ViewGroup;

    invoke-static {v4, v5, v6}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 45
    .local v1, "questionContianer":Landroid/view/ViewGroup;
    const v4, 0x7f0a0134

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 46
    .local v2, "questionTextView":Landroid/widget/TextView;
    const v4, 0x7f0a0136

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 47
    .local v0, "questionBtn":Landroid/widget/ImageButton;
    const v4, 0x7f0a0135

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    iput-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->questionEditText:Landroid/widget/EditText;

    .line 48
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->getErrorString()Ljava/lang/String;

    move-result-object v3

    .line 50
    .local v3, "text":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v3, v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->setQuestionText(Ljava/lang/String;Landroid/widget/TextView;)V

    .line 52
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->btnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->questionEditText:Landroid/widget/EditText;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->textWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 55
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->container:Landroid/view/ViewGroup;

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 56
    return-void

    .line 48
    .end local v3    # "text":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private showNumPickerDialog(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 107
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/NumDialog;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/NumDialog;-><init>()V

    .line 108
    .local v0, "numDiag":Lcom/seeclickfix/ma/android/dialogs/NumDialog;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "NumPickerDialog"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 109
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->numberPickedListener:Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/NumDialog;->setListener(Lcom/seeclickfix/ma/android/dialogs/NumDialog$OnNumCompleteListener;)V

    .line 110
    return-void
.end method

.method private updateAnswer()V
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    if-nez v0, :cond_0

    .line 114
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 116
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setPrimaryKey(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setDisplayText(Ljava/lang/String;)V

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->questionEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setAnswer(Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->onSelectAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 123
    return-void
.end method
