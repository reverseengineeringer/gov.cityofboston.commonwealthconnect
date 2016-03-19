.class Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$1;
.super Ljava/lang/Object;
.source "QuestionNumber.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber$1;->this$0:Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;

    # invokes: Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->showNumPickerDialog(Landroid/view/View;)V
    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;->access$000(Lcom/seeclickfix/ma/android/views/questions/QuestionNumber;Landroid/view/View;)V

    .line 65
    return-void
.end method
