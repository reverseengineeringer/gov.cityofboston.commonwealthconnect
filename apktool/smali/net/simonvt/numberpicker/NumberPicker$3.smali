.class Lnet/simonvt/numberpicker/NumberPicker$3;
.super Ljava/lang/Object;
.source "NumberPicker.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/simonvt/numberpicker/NumberPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnet/simonvt/numberpicker/NumberPicker;


# direct methods
.method constructor <init>(Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 0

    .prologue
    .line 682
    iput-object p1, p0, Lnet/simonvt/numberpicker/NumberPicker$3;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    const/4 v1, 0x0

    .line 684
    if-eqz p2, :cond_0

    .line 685
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$3;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    .line 690
    :goto_0
    return-void

    .line 687
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$3;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/widget/EditText;->setSelection(II)V

    .line 688
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$3;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->validateInputTextView(Landroid/view/View;)V
    invoke-static {v0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->access$400(Lnet/simonvt/numberpicker/NumberPicker;Landroid/view/View;)V

    goto :goto_0
.end method
