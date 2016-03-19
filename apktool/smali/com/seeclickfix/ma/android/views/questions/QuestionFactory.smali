.class public Lcom/seeclickfix/ma/android/views/questions/QuestionFactory;
.super Ljava/lang/Object;
.source "QuestionFactory.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "QuestionFactory"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getQuestionWidget(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;)Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    .locals 4
    .param p0, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "fragActivity"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    const/4 v3, 0x0

    .line 29
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionType()Ljava/lang/String;

    move-result-object v1

    .line 30
    .local v1, "type":Ljava/lang/String;
    const/4 v0, 0x0

    .line 34
    .local v0, "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    const-string/jumbo v2, "number"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 35
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    .end local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    invoke-direct {v0, p0, p1, p2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .line 56
    .restart local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    :cond_0
    :goto_0
    return-object v0

    .line 36
    :cond_1
    const-string/jumbo v2, "text"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 37
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionText;

    .end local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    invoke-direct {v0, p0, p1, p2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionText;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .restart local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    goto :goto_0

    .line 38
    :cond_2
    const-string/jumbo v2, "textarea"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 39
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionTextArea;

    .end local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    invoke-direct {v0, p0, p1, p2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionTextArea;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .restart local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    goto :goto_0

    .line 40
    :cond_3
    const-string/jumbo v2, "note"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 41
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionNote;

    .end local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    invoke-direct {v0, p0, p1, p2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionNote;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .restart local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    goto :goto_0

    .line 42
    :cond_4
    const-string/jumbo v2, "select"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 43
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;

    .end local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    invoke-direct {v0, p0, p1, p2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionSelect;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .restart local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    goto :goto_0

    .line 44
    :cond_5
    const-string/jumbo v2, "multivaluelist"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 45
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;

    .end local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    invoke-direct {v0, p0, p1, p2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionMultivalue;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .restart local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    goto :goto_0

    .line 46
    :cond_6
    const-string/jumbo v2, "datetime"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 47
    new-instance v0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    .end local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    invoke-direct {v0, p0, p1, p2, v3}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;-><init>(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;Landroid/os/Bundle;)V

    .restart local v0    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    goto :goto_0

    .line 48
    :cond_7
    const-string/jumbo v2, "hidden"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method
