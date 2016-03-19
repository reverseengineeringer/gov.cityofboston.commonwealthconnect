.class Lnet/simonvt/timepicker/TimePicker$3;
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
    .line 180
    iput-object p1, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueChange(Lnet/simonvt/numberpicker/NumberPicker;II)V
    .locals 7
    .param p1, "spinner"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p2, "oldVal"    # I
    .param p3, "newVal"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 182
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->updateInputState()V
    invoke-static {v5}, Lnet/simonvt/timepicker/TimePicker;->access$000(Lnet/simonvt/timepicker/TimePicker;)V

    .line 183
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;
    invoke-static {v5}, Lnet/simonvt/timepicker/TimePicker;->access$400(Lnet/simonvt/timepicker/TimePicker;)Lnet/simonvt/numberpicker/NumberPicker;

    move-result-object v5

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getMinValue()I

    move-result v1

    .line 184
    .local v1, "minValue":I
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mMinuteSpinner:Lnet/simonvt/numberpicker/NumberPicker;
    invoke-static {v5}, Lnet/simonvt/timepicker/TimePicker;->access$400(Lnet/simonvt/timepicker/TimePicker;)Lnet/simonvt/numberpicker/NumberPicker;

    move-result-object v5

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getMaxValue()I

    move-result v0

    .line 185
    .local v0, "maxValue":I
    if-ne p2, v0, :cond_3

    if-ne p3, v1, :cond_3

    .line 186
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;
    invoke-static {v5}, Lnet/simonvt/timepicker/TimePicker;->access$500(Lnet/simonvt/timepicker/TimePicker;)Lnet/simonvt/numberpicker/NumberPicker;

    move-result-object v5

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v5

    add-int/lit8 v2, v5, 0x1

    .line 187
    .local v2, "newHour":I
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v5}, Lnet/simonvt/timepicker/TimePicker;->is24HourView()Z

    move-result v5

    if-nez v5, :cond_0

    const/16 v5, 0xc

    if-ne v2, v5, :cond_0

    .line 188
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    iget-object v6, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z
    invoke-static {v6}, Lnet/simonvt/timepicker/TimePicker;->access$100(Lnet/simonvt/timepicker/TimePicker;)Z

    move-result v6

    if-nez v6, :cond_2

    :goto_0
    # setter for: Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z
    invoke-static {v5, v3}, Lnet/simonvt/timepicker/TimePicker;->access$102(Lnet/simonvt/timepicker/TimePicker;Z)Z

    .line 189
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->updateAmPmControl()V
    invoke-static {v3}, Lnet/simonvt/timepicker/TimePicker;->access$200(Lnet/simonvt/timepicker/TimePicker;)V

    .line 191
    :cond_0
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;
    invoke-static {v3}, Lnet/simonvt/timepicker/TimePicker;->access$500(Lnet/simonvt/timepicker/TimePicker;)Lnet/simonvt/numberpicker/NumberPicker;

    move-result-object v3

    invoke-virtual {v3, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 200
    .end local v2    # "newHour":I
    :cond_1
    :goto_1
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->onTimeChanged()V
    invoke-static {v3}, Lnet/simonvt/timepicker/TimePicker;->access$300(Lnet/simonvt/timepicker/TimePicker;)V

    .line 201
    return-void

    .restart local v2    # "newHour":I
    :cond_2
    move v3, v4

    .line 188
    goto :goto_0

    .line 192
    .end local v2    # "newHour":I
    :cond_3
    if-ne p2, v1, :cond_1

    if-ne p3, v0, :cond_1

    .line 193
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;
    invoke-static {v5}, Lnet/simonvt/timepicker/TimePicker;->access$500(Lnet/simonvt/timepicker/TimePicker;)Lnet/simonvt/numberpicker/NumberPicker;

    move-result-object v5

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .line 194
    .restart local v2    # "newHour":I
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    invoke-virtual {v5}, Lnet/simonvt/timepicker/TimePicker;->is24HourView()Z

    move-result v5

    if-nez v5, :cond_4

    const/16 v5, 0xb

    if-ne v2, v5, :cond_4

    .line 195
    iget-object v5, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    iget-object v6, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z
    invoke-static {v6}, Lnet/simonvt/timepicker/TimePicker;->access$100(Lnet/simonvt/timepicker/TimePicker;)Z

    move-result v6

    if-nez v6, :cond_5

    :goto_2
    # setter for: Lnet/simonvt/timepicker/TimePicker;->mIsAm:Z
    invoke-static {v5, v3}, Lnet/simonvt/timepicker/TimePicker;->access$102(Lnet/simonvt/timepicker/TimePicker;Z)Z

    .line 196
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # invokes: Lnet/simonvt/timepicker/TimePicker;->updateAmPmControl()V
    invoke-static {v3}, Lnet/simonvt/timepicker/TimePicker;->access$200(Lnet/simonvt/timepicker/TimePicker;)V

    .line 198
    :cond_4
    iget-object v3, p0, Lnet/simonvt/timepicker/TimePicker$3;->this$0:Lnet/simonvt/timepicker/TimePicker;

    # getter for: Lnet/simonvt/timepicker/TimePicker;->mHourSpinner:Lnet/simonvt/numberpicker/NumberPicker;
    invoke-static {v3}, Lnet/simonvt/timepicker/TimePicker;->access$500(Lnet/simonvt/timepicker/TimePicker;)Lnet/simonvt/numberpicker/NumberPicker;

    move-result-object v3

    invoke-virtual {v3, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    goto :goto_1

    :cond_5
    move v3, v4

    .line 195
    goto :goto_2
.end method
