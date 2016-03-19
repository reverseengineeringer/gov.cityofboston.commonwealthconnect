.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 0

    .prologue
    .line 1258
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRemoveAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 1
    .param p1, "answer"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 1267
    if-eqz p1, :cond_0

    .line 1269
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->removeAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 1273
    :cond_0
    return-void
.end method

.method public onSetAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 1
    .param p1, "answer"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 1262
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->addAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 1263
    return-void
.end method
