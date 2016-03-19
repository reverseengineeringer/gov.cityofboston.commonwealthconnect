.class public Lcom/seeclickfix/ma/android/objects/report/ReportQuestionJoin;
.super Ljava/lang/Object;
.source "ReportQuestionJoin.java"


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "report_question_join"
.end annotation


# instance fields
.field private id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        generatedId = true
    .end annotation
.end field

.field private question:Lcom/seeclickfix/ma/android/objects/report/Question;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
    .end annotation
.end field

.field private report:Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getId()I
    .locals 1

    .prologue
    .line 24
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportQuestionJoin;->id:I

    return v0
.end method

.method public getQuestion()Lcom/seeclickfix/ma/android/objects/report/Question;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportQuestionJoin;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    return-object v0
.end method

.method public getReport()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportQuestionJoin;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-object v0
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/ReportQuestionJoin;->id:I

    .line 29
    return-void
.end method

.method public setQuestion(Lcom/seeclickfix/ma/android/objects/report/Question;)V
    .locals 0
    .param p1, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/ReportQuestionJoin;->question:Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 45
    return-void
.end method

.method public setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/ReportQuestionJoin;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 37
    return-void
.end method
