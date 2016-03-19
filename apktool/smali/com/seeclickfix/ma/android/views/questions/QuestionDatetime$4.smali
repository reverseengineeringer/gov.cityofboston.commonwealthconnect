.class Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;
.super Ljava/lang/Object;
.source "QuestionDatetime.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/TimeDialog$OnTimeValueSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mIs24Time:Z

.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V
    .locals 0

    .prologue
    .line 153
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimeSet(Ljava/util/Calendar;)V
    .locals 2
    .param p1, "cal"    # Ljava/util/Calendar;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->mIs24Time:Z

    .line 161
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->mIs24Time:Z

    if-eqz v0, :cond_0

    .line 162
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    const-string/jumbo v0, "k:mm"

    invoke-static {v0, p1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    # setter for: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$502(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;Ljava/lang/String;)Ljava/lang/String;

    .line 167
    :goto_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->timeSelectionTextView:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$600(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$500(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->attemptAnswer()V

    .line 170
    return-void

    .line 164
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$4;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    const-string/jumbo v0, "h:mm A"

    invoke-static {v0, p1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    # setter for: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedTime:Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$502(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method
