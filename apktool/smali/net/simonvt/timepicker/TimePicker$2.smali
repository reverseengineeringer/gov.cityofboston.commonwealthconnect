.class Lnet/simonvt/timepicker/TimePicker$2;
.super Ljava/lang/Object;
.source "TimePicker.java"

# interfaces
.implements Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;


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
    .line 152
    iput-object p1, p0, Lnet/simonvt/timepicker/TimePicker$2;->this$0:Lnet/simonvt/timepicker/TimePicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueChange(Lnet/simonvt/numberpicker/NumberPicker;II)V
    .locals 3
    .param p1, "spinner"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p2, "oldVal"    # I
    .param p3, "newVal"    # I

    .prologue
    const/16 v2, 0xc

    const/16 v1, 0xb

    .line 154
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker$2;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->updateInputState()V
    invoke-static {v0}, Lnet/simonvt/timepicker/TimePicker;->access$000(Lnet/simonvt/timepicker/TimePicker;)V

    .line 155
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker$2;->this$0:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v0}, Lnet/simonvt/timepicker/TimePicker;->is24HourView()Z

    move-result v0

    if-nez v0, :cond_2

    .line 156
    if-ne p2, v1, :cond_0

    if-eq p3, v2, :cond_1

    :cond_0
    if-ne p2, v2, :cond_2

    if-ne p3, v1, :cond_2

    .line 158
    :cond_1
    iget-object v1, p0, Lnet/simonvt/timepicker/TimePicker$2;->this$0:Lnet/simonvt/timepicker/TimePicker;

    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker$2;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z
    invoke-static {v0}, Lnet/simonvt/timepicker/TimePicker;->access$100(Lnet/simonvt/timepicker/TimePicker;)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x1

    :goto_0
    # setter for: Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z
    invoke-static {v1, v0}, Lnet/simonvt/timepicker/TimePicker;->access$102(Lnet/simonvt/timepicker/TimePicker;Z)Z

    .line 159
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker$2;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->updateAmPmControl()V
    invoke-static {v0}, Lnet/simonvt/timepicker/TimePicker;->access$200(Lnet/simonvt/timepicker/TimePicker;)V

    .line 162
    :cond_2
    iget-object v0, p0, Lnet/simonvt/timepicker/TimePicker$2;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->onTimeChanged()V
    invoke-static {v0}, Lnet/simonvt/timepicker/TimePicker;->access$300(Lnet/simonvt/timepicker/TimePicker;)V

    .line 163
    return-void

    .line 158
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method
