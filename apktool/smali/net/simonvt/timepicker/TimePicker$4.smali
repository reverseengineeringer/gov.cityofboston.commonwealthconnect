.class Lnet/simonvt/timepicker/TimePicker$4;
.super Ljava/lang/Object;
.source "TimePicker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/simonvt/timepicker/TimePicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnet/simonvt/timepicker/TimePicker;


# direct methods
.method constructor <init>(Lnet/simonvt/timepicker/TimePicker;)V
    .locals 0

    .prologue
    .line 215
    iput-object p1, p0, Lnet/simonvt/timepicker/TimePicker$4;->this$0:Lnet/simonvt/timepicker/TimePicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "button"    # Landroid/view/View;

    .prologue
    .line 217
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 218
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker$4;->this$0:Lnet/simonvt/timepicker/TimePicker;

    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker$4;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z
    invoke-static {v0}, Lnet/simonvt/timepicker/TimePicker;->access$100(Lnet/simonvt/timepicker/TimePicker;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    # setter for: Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z
    invoke-static {v1, v0}, Lnet/simonvt/timepicker/TimePicker;->access$102(Lnet/simonvt/timepicker/TimePicker;Z)Z

    .line 219
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker$4;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->updateAmPmControl()V
    invoke-static {v0}, Lnet/simonvt/timepicker/TimePicker;->access$200(Lnet/simonvt/timepicker/TimePicker;)V

    .line 220
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker$4;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->onTimeChanged()V
    invoke-static {v0}, Lnet/simonvt/timepicker/TimePicker;->access$300(Lnet/simonvt/timepicker/TimePicker;)V

    .line 221
    return-void

    .line 218
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
