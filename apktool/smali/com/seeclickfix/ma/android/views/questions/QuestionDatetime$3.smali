.class Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;
.super Ljava/lang/Object;
.source "QuestionDatetime.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/CalendarDialog$OnCalendarSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V
    .locals 0

    .prologue
    .line 131
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDateSet(J)V
    .locals 5
    .param p1, "dateMS"    # J

    .prologue
    .line 135
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    # setter for: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateMilliseconds:J
    invoke-static {v2, p1, p2}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$202(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;J)J

    .line 137
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->getLocale(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object v1

    .line 139
    .local v1, "locale":Ljava/util/Locale;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-static {v2}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v0

    .line 144
    .local v0, "localDateFormat":Ljava/text/DateFormat;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    # setter for: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedDate:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$302(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;Ljava/lang/String;)Ljava/lang/String;

    .line 146
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->dateSelectionTextView:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$400(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    # getter for: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->formattedDate:Ljava/lang/String;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$300(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$3;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->attemptAnswer()V

    .line 149
    return-void
.end method
