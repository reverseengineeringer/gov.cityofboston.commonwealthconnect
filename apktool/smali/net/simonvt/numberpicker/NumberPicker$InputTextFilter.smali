.class Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;
.super Landroid/text/method/NumberKeyListener;
.source "NumberPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/simonvt/numberpicker/NumberPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InputTextFilter"
.end annotation


# instance fields
.field final synthetic this$0:Lnet/simonvt/numberpicker/NumberPicker;


# direct methods
.method constructor <init>(Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 0

    .prologue
    .line 1985
    iput-object p1, p0, Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-direct {p0}, Landroid/text/method/NumberKeyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 13
    .param p1, "source"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "dest"    # Landroid/text/Spanned;
    .param p5, "dstart"    # I
    .param p6, "dend"    # I

    .prologue
    .line 2001
    iget-object v10, p0, Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;
    invoke-static {v10}, Lnet/simonvt/numberpicker/NumberPicker;->access$1000(Lnet/simonvt/numberpicker/NumberPicker;)[Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_3

    .line 2002
    invoke-super/range {p0 .. p6}, Landroid/text/method/NumberKeyListener;->filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;

    move-result-object v3

    .line 2003
    .local v3, "filtered":Ljava/lang/CharSequence;
    if-nez v3, :cond_0

    .line 2004
    invoke-interface/range {p1 .. p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    .line 2007
    :cond_0
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v11, 0x0

    move-object/from16 v0, p4

    move/from16 v1, p5

    invoke-interface {v0, v11, v1}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface/range {p4 .. p4}, Landroid/text/Spanned;->length()I

    move-result v11

    move-object/from16 v0, p4

    move/from16 v1, p6

    invoke-interface {v0, v1, v11}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2010
    .local v6, "result":Ljava/lang/String;
    const-string/jumbo v10, ""

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 2040
    .end local v6    # "result":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 2013
    .restart local v6    # "result":Ljava/lang/String;
    :cond_1
    iget-object v10, p0, Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->getSelectedPos(Ljava/lang/String;)I
    invoke-static {v10, v6}, Lnet/simonvt/numberpicker/NumberPicker;->access$1100(Lnet/simonvt/numberpicker/NumberPicker;Ljava/lang/String;)I

    move-result v8

    .line 2020
    .local v8, "val":I
    iget-object v10, p0, Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I
    invoke-static {v10}, Lnet/simonvt/numberpicker/NumberPicker;->access$1200(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v10

    if-le v8, v10, :cond_2

    .line 2021
    const-string/jumbo v6, ""

    goto :goto_0

    :cond_2
    move-object v6, v3

    .line 2023
    goto :goto_0

    .line 2026
    .end local v3    # "filtered":Ljava/lang/CharSequence;
    .end local v6    # "result":Ljava/lang/String;
    .end local v8    # "val":I
    :cond_3
    invoke-interface/range {p1 .. p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 2027
    .restart local v3    # "filtered":Ljava/lang/CharSequence;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 2028
    const-string/jumbo v6, ""

    goto :goto_0

    .line 2030
    :cond_4
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v11, 0x0

    move-object/from16 v0, p4

    move/from16 v1, p5

    invoke-interface {v0, v11, v1}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface/range {p4 .. p4}, Landroid/text/Spanned;->length()I

    move-result v11

    move-object/from16 v0, p4

    move/from16 v1, p6

    invoke-interface {v0, v1, v11}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2032
    .restart local v6    # "result":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 2033
    .local v7, "str":Ljava/lang/String;
    iget-object v10, p0, Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;
    invoke-static {v10}, Lnet/simonvt/numberpicker/NumberPicker;->access$1000(Lnet/simonvt/numberpicker/NumberPicker;)[Ljava/lang/String;

    move-result-object v2

    .local v2, "arr$":[Ljava/lang/String;
    array-length v5, v2

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v5, :cond_6

    aget-object v8, v2, v4

    .line 2034
    .local v8, "val":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    .line 2035
    .local v9, "valLowerCase":Ljava/lang/String;
    invoke-virtual {v9, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 2036
    iget-object v10, p0, Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v12

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->postSetSelectionCommand(II)V
    invoke-static {v10, v11, v12}, Lnet/simonvt/numberpicker/NumberPicker;->access$1300(Lnet/simonvt/numberpicker/NumberPicker;II)V

    .line 2037
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    move/from16 v0, p5

    invoke-virtual {v8, v0, v10}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    goto/16 :goto_0

    .line 2033
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2040
    .end local v8    # "val":Ljava/lang/String;
    .end local v9    # "valLowerCase":Ljava/lang/String;
    :cond_6
    const-string/jumbo v6, ""

    goto/16 :goto_0
.end method

.method protected getAcceptedChars()[C
    .locals 1

    .prologue
    .line 1995
    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->DIGIT_CHARACTERS:[C
    invoke-static {}, Lnet/simonvt/numberpicker/NumberPicker;->access$900()[C

    move-result-object v0

    return-object v0
.end method

.method public getInputType()I
    .locals 1

    .prologue
    .line 1990
    const/4 v0, 0x1

    return v0
.end method
