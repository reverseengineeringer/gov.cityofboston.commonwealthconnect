.class public Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;
.super Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;
.source "QuestionDatetime.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "QuestionDatetime"


# instance fields
.field private calDialog:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;

.field private calDialogListener:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;

.field private dateMilliseconds:J

.field dateQuestionBtnListener:Landroid/view/View$OnClickListener;

.field private dateSelectionTextView:Landroid/widget/TextView;

.field private formattedDate:Ljava/lang/String;

.field private formattedTime:Ljava/lang/String;

.field private timeDialog:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

.field timeQuestionBtnListener:Landroid/view/View$OnClickListener;

.field private timeSelectionTextView:Landroid/widget/TextView;

.field private timeSetListener:Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p4, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/seeclickfix/ma/android/views/questions/AbstractQuestion;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .line 101
    new-instance v1, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$1;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateQuestionBtnListener:Landroid/view/View$OnClickListener;

    .line 108
    new-instance v1, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$2;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$2;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeQuestionBtnListener:Landroid/view/View$OnClickListener;

    .line 131
    new-instance v1, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->calDialogListener:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;

    .line 153
    new-instance v1, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;-><init>(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeSetListener:Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;

    .line 51
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget-object v0, v1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 55
    .local v0, "currentLocale":Ljava/util/Locale;
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->setupQuestion()V

    .line 56
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->showCalendarDialog()V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->showTimeDialog()V

    return-void
.end method

.method static synthetic access$202(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;J)J
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;
    .param p1, "x1"    # J

    .prologue
    .line 26
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateMilliseconds:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedDate:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedDate:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateSelectionTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeSelectionTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method private setupQuestion()V
    .locals 8

    .prologue
    .line 61
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->container:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f030048

    iget-object v7, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->container:Landroid/view/ViewGroup;

    invoke-static {v5, v6, v7}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 62
    .local v1, "questionContianer":Landroid/view/ViewGroup;
    const v5, 0x7f0a012c

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 63
    .local v2, "questionTextView":Landroid/widget/TextView;
    const v5, 0x7f0a012e

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 64
    .local v0, "dateButton":Landroid/widget/Button;
    const v5, 0x7f0a0130

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 65
    .local v4, "timeButton":Landroid/widget/Button;
    const v5, 0x7f0a012d

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateSelectionTextView:Landroid/widget/TextView;

    .line 66
    const v5, 0x7f0a012f

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeSelectionTextView:Landroid/widget/TextView;

    .line 68
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->getErrorString()Ljava/lang/String;

    move-result-object v3

    .line 70
    .local v3, "text":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v3, v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->setQuestionText(Ljava/lang/String;Landroid/widget/TextView;)V

    .line 72
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 73
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateQuestionBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 75
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeQuestionBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->showSavedValues()V

    .line 79
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->container:Landroid/view/ViewGroup;

    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 80
    return-void

    .line 68
    .end local v3    # "text":Ljava/lang/String;
    :cond_0
    iget-object v5, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private showCalendarDialog()V
    .locals 4

    .prologue
    .line 117
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->calDialog:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;

    if-nez v0, :cond_0

    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;-><init>()V

    :goto_0
    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->calDialog:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;

    .line 118
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->calDialog:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateMilliseconds:J

    invoke-virtual {v0, v2, v3}, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->setPreviousDate(J)V

    .line 119
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->calDialog:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->calDialogListener:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->setDateSelectedListener(Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;)V

    .line 120
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->calDialog:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "CalendarDialog"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 122
    return-void

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->calDialog:Lcom/seeclickfix/ma/android/dialogs/CalendarDialog;

    goto :goto_0
.end method

.method private showSavedValues()V
    .locals 4

    .prologue
    .line 84
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v0

    .line 86
    .local v0, "prevAnswer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    if-eqz v0, :cond_0

    .line 87
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getDate()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateMilliseconds:J

    .line 89
    const-string/jumbo v1, "MMMM dd, yyyy"

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getDate()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedDate:Ljava/lang/String;

    .line 91
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getTime()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;

    .line 93
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateSelectionTextView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedDate:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeSelectionTextView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    :cond_0
    return-void
.end method

.method private showTimeDialog()V
    .locals 4

    .prologue
    .line 125
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeDialog:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->newInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeDialog:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    .line 126
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeDialog:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->setPreviousTime(Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeDialog:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeSetListener:Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->setOnTimeValueSetListener(Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;)V

    .line 128
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeDialog:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "TimeDialog"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 129
    return-void

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeDialog:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    goto :goto_0
.end method


# virtual methods
.method protected attemptAnswer()V
    .locals 4

    .prologue
    .line 175
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedDate:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 176
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    if-nez v0, :cond_0

    .line 177
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 178
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setPrimaryKey(Ljava/lang/String;)V

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setTime(Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateMilliseconds:J

    invoke-virtual {v0, v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setDate(J)V

    .line 183
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedDate:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setAnswer(Ljava/lang/String;)V

    .line 184
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->setSelectedAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 185
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->answer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->onSelectAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 188
    :cond_1
    return-void
.end method
