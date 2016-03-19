.class Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$1;
.super Ljava/lang/Object;
.source "QuestionDatetime.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 101
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;

    # invokes: Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->showCalendarDialog()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;->access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionDatetime;)V

    .line 105
    return-void
.end method
