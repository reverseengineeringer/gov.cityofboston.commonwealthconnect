.class Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;
.super Landroid/view/accessibility/AccessibilityNodeProvider;
.source "NumberPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/simonvt/numberpicker/NumberPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AccessibilityNodeProviderImpl"
.end annotation


# static fields
.field private static final UNDEFINED:I = -0x80000000

.field private static final VIRTUAL_VIEW_ID_DECREMENT:I = 0x3

.field private static final VIRTUAL_VIEW_ID_INCREMENT:I = 0x1

.field private static final VIRTUAL_VIEW_ID_INPUT:I = 0x2


# instance fields
.field private mAccessibilityFocusedView:I

.field private final mTempArray:[I

.field private final mTempRect:Landroid/graphics/Rect;

.field final synthetic this$0:Lnet/simonvt/numberpicker/NumberPicker;


# direct methods
.method constructor <init>(Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 1

    .prologue
    .line 2233
    iput-object p1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-direct {p0}, Landroid/view/accessibility/AccessibilityNodeProvider;-><init>()V

    .line 2242
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mTempRect:Landroid/graphics/Rect;

    .line 2244
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mTempArray:[I

    .line 2246
    const/high16 v0, -0x80000000

    iput v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    return-void
.end method

.method private createAccessibilityNodeInfoForNumberPicker(IIII)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 2571
    invoke-static {}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    .line 2572
    .local v0, "info":Landroid/view/accessibility/AccessibilityNodeInfo;
    const-class v1, Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 2573
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setPackageName(Ljava/lang/CharSequence;)V

    .line 2574
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setSource(Landroid/view/View;)V

    .line 2576
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->hasVirtualDecrementButton()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2577
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;I)V

    .line 2579
    :cond_0
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;I)V

    .line 2580
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->hasVirtualIncrementButton()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2581
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, v1, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;I)V

    .line 2584
    :cond_1
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getParentForAccessibility()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setParent(Landroid/view/View;)V

    .line 2585
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setEnabled(Z)V

    .line 2586
    invoke-virtual {v0, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setScrollable(Z)V

    .line 2607
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-eq v1, v3, :cond_2

    .line 2608
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2610
    :cond_2
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-ne v1, v3, :cond_3

    .line 2611
    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2613
    :cond_3
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 2614
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getWrapSelectorWheel()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getMaxValue()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 2615
    :cond_4
    const/16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2617
    :cond_5
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getWrapSelectorWheel()Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getMinValue()I

    move-result v2

    if-le v1, v2, :cond_7

    .line 2618
    :cond_6
    const/16 v1, 0x2000

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2622
    :cond_7
    return-object v0
.end method

.method private createAccessibilityNodeInfoForVirtualButton(ILjava/lang/String;IIII)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 6
    .param p1, "virtualViewId"    # I
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "left"    # I
    .param p4, "top"    # I
    .param p5, "right"    # I
    .param p6, "bottom"    # I

    .prologue
    const/4 v5, 0x1

    .line 2537
    invoke-static {}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    .line 2538
    .local v2, "info":Landroid/view/accessibility/AccessibilityNodeInfo;
    const-class v4, Landroid/widget/Button;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 2539
    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setPackageName(Ljava/lang/CharSequence;)V

    .line 2540
    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2, v4, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setSource(Landroid/view/View;I)V

    .line 2541
    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setParent(Landroid/view/View;)V

    .line 2542
    invoke-virtual {v2, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setText(Ljava/lang/CharSequence;)V

    .line 2543
    invoke-virtual {v2, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClickable(Z)V

    .line 2544
    invoke-virtual {v2, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLongClickable(Z)V

    .line 2545
    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v4

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setEnabled(Z)V

    .line 2546
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mTempRect:Landroid/graphics/Rect;

    .line 2547
    .local v0, "boundsInParent":Landroid/graphics/Rect;
    invoke-virtual {v0, p3, p4, p5, p6}, Landroid/graphics/Rect;->set(IIII)V

    .line 2549
    invoke-virtual {v2, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInParent(Landroid/graphics/Rect;)V

    .line 2550
    move-object v1, v0

    .line 2551
    .local v1, "boundsInScreen":Landroid/graphics/Rect;
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mTempArray:[I

    .line 2552
    .local v3, "locationOnScreen":[I
    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4, v3}, Lnet/simonvt/numberpicker/NumberPicker;->getLocationOnScreen([I)V

    .line 2553
    const/4 v4, 0x0

    aget v4, v3, v4

    aget v5, v3, v5

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 2554
    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInScreen(Landroid/graphics/Rect;)V

    .line 2556
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-eq v4, p1, :cond_0

    .line 2557
    const/16 v4, 0x40

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2559
    :cond_0
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-ne v4, p1, :cond_1

    .line 2560
    const/16 v4, 0x80

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2562
    :cond_1
    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2563
    const/16 v4, 0x10

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2566
    :cond_2
    return-object v2
.end method

.method private createAccessibiltyNodeInfoForInputText()Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 3

    .prologue
    const/4 v2, 0x2

    .line 2524
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    .line 2525
    .local v0, "info":Landroid/view/accessibility/AccessibilityNodeInfo;
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setSource(Landroid/view/View;I)V

    .line 2526
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-eq v1, v2, :cond_0

    .line 2527
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2529
    :cond_0
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-ne v1, v2, :cond_1

    .line 2530
    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2532
    :cond_1
    return-object v0
.end method

.method private findAccessibilityNodeInfosByTextInChild(Ljava/lang/String;ILjava/util/List;)V
    .locals 4
    .param p1, "searchedLowerCase"    # Ljava/lang/String;
    .param p2, "virtualViewId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "outResult":Ljava/util/List;, "Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    const/4 v3, 0x2

    .line 2491
    packed-switch p2, :pswitch_data_0

    .line 2521
    :cond_0
    :goto_0
    return-void

    .line 2493
    :pswitch_0
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->getVirtualDecrementButtonText()Ljava/lang/String;

    move-result-object v1

    .line 2494
    .local v1, "text":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2496
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2500
    .end local v1    # "text":Ljava/lang/String;
    :pswitch_1
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 2501
    .local v1, "text":Ljava/lang/CharSequence;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2503
    invoke-virtual {p0, v3}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2506
    :cond_1
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 2507
    .local v0, "contentDesc":Ljava/lang/CharSequence;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2509
    invoke-virtual {p0, v3}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2514
    .end local v0    # "contentDesc":Ljava/lang/CharSequence;
    .end local v1    # "text":Ljava/lang/CharSequence;
    :pswitch_2
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->getVirtualIncrementButtonText()Ljava/lang/String;

    move-result-object v1

    .line 2515
    .local v1, "text":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2517
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 2491
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getVirtualDecrementButtonText()Ljava/lang/String;
    .locals 3

    .prologue
    .line 2634
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mValue:I
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$2200(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 2635
    .local v0, "value":I
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$2300(Lnet/simonvt/numberpicker/NumberPicker;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2636
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->getWrappedSelectorIndex(I)I
    invoke-static {v1, v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$2400(Lnet/simonvt/numberpicker/NumberPicker;I)I

    move-result v0

    .line 2638
    :cond_0
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$2500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 2639
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1000(Lnet/simonvt/numberpicker/NumberPicker;)[Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->formatNumber(I)Ljava/lang/String;
    invoke-static {v1, v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$2600(Lnet/simonvt/numberpicker/NumberPicker;I)Ljava/lang/String;

    move-result-object v1

    .line 2642
    :goto_0
    return-object v1

    .line 2639
    :cond_1
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1000(Lnet/simonvt/numberpicker/NumberPicker;)[Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$2500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v2

    sub-int v2, v0, v2

    aget-object v1, v1, v2

    goto :goto_0

    .line 2642
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getVirtualIncrementButtonText()Ljava/lang/String;
    .locals 3

    .prologue
    .line 2646
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mValue:I
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$2200(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 2647
    .local v0, "value":I
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$2300(Lnet/simonvt/numberpicker/NumberPicker;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2648
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->getWrappedSelectorIndex(I)I
    invoke-static {v1, v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$2400(Lnet/simonvt/numberpicker/NumberPicker;I)I

    move-result v0

    .line 2650
    :cond_0
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1200(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v1

    if-gt v0, v1, :cond_2

    .line 2651
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1000(Lnet/simonvt/numberpicker/NumberPicker;)[Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->formatNumber(I)Ljava/lang/String;
    invoke-static {v1, v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$2600(Lnet/simonvt/numberpicker/NumberPicker;I)Ljava/lang/String;

    move-result-object v1

    .line 2654
    :goto_0
    return-object v1

    .line 2651
    :cond_1
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1000(Lnet/simonvt/numberpicker/NumberPicker;)[Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$2500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v2

    sub-int v2, v0, v2

    aget-object v1, v1, v2

    goto :goto_0

    .line 2654
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private hasVirtualDecrementButton()Z
    .locals 2

    .prologue
    .line 2626
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getWrapSelectorWheel()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v0

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getMinValue()I

    move-result v1

    if-le v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private hasVirtualIncrementButton()Z
    .locals 2

    .prologue
    .line 2630
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getWrapSelectorWheel()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v0

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getMaxValue()I

    move-result v1

    if-ge v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private sendAccessibilityEventForVirtualButton(IILjava/lang/String;)V
    .locals 3
    .param p1, "virtualViewId"    # I
    .param p2, "eventType"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 2478
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "accessibility"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2479
    invoke-static {p2}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v0

    .line 2480
    .local v0, "event":Landroid/view/accessibility/AccessibilityEvent;
    const-class v1, Landroid/widget/Button;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 2481
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityEvent;->setPackageName(Ljava/lang/CharSequence;)V

    .line 2482
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2483
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityEvent;->setEnabled(Z)V

    .line 2484
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, v1, p1}, Landroid/view/accessibility/AccessibilityEvent;->setSource(Landroid/view/View;I)V

    .line 2485
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1, v2, v0}, Lnet/simonvt/numberpicker/NumberPicker;->requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 2487
    .end local v0    # "event":Landroid/view/accessibility/AccessibilityEvent;
    :cond_0
    return-void
.end method

.method private sendAccessibilityEventForVirtualText(I)V
    .locals 3
    .param p1, "eventType"    # I

    .prologue
    .line 2467
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "accessibility"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2468
    invoke-static {p1}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v0

    .line 2469
    .local v0, "event":Landroid/view/accessibility/AccessibilityEvent;
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2470
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2471
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityEvent;->setSource(Landroid/view/View;I)V

    .line 2472
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1, v2, v0}, Lnet/simonvt/numberpicker/NumberPicker;->requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 2474
    .end local v0    # "event":Landroid/view/accessibility/AccessibilityEvent;
    :cond_0
    return-void
.end method


# virtual methods
.method public createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 8
    .param p1, "virtualViewId"    # I

    .prologue
    .line 2250
    packed-switch p1, :pswitch_data_0

    .line 2267
    :pswitch_0
    invoke-super {p0, p1}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    :goto_0
    return-object v0

    .line 2252
    :pswitch_1
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollX()I

    move-result v0

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollY()I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollX()I

    move-result v2

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v3

    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4}, Lnet/simonvt/numberpicker/NumberPicker;->getLeft()I

    move-result v4

    sub-int/2addr v3, v4

    add-int/2addr v2, v3

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollY()I

    move-result v3

    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v4

    iget-object v5, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getTop()I

    move-result v5

    sub-int/2addr v4, v5

    add-int/2addr v3, v4

    invoke-direct {p0, v0, v1, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->createAccessibilityNodeInfoForNumberPicker(IIII)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    goto :goto_0

    .line 2255
    :pswitch_2
    const/4 v1, 0x3

    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->getVirtualDecrementButtonText()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollX()I

    move-result v3

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollY()I

    move-result v4

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollX()I

    move-result v0

    iget-object v5, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v5

    iget-object v6, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v6}, Lnet/simonvt/numberpicker/NumberPicker;->getLeft()I

    move-result v6

    sub-int/2addr v5, v6

    add-int/2addr v5, v0

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I
    invoke-static {v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$1700(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v0

    iget-object v6, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividerHeight:I
    invoke-static {v6}, Lnet/simonvt/numberpicker/NumberPicker;->access$2100(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v6

    add-int/2addr v6, v0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->createAccessibilityNodeInfoForVirtualButton(ILjava/lang/String;IIII)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    goto :goto_0

    .line 2260
    :pswitch_3
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->createAccessibiltyNodeInfoForInputText()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    goto :goto_0

    .line 2262
    :pswitch_4
    const/4 v1, 0x1

    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->getVirtualIncrementButtonText()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollX()I

    move-result v3

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I
    invoke-static {v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$1500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v0

    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividerHeight:I
    invoke-static {v4}, Lnet/simonvt/numberpicker/NumberPicker;->access$2100(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v4

    sub-int v4, v0, v4

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollX()I

    move-result v0

    iget-object v5, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v5

    iget-object v6, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v6}, Lnet/simonvt/numberpicker/NumberPicker;->getLeft()I

    move-result v6

    sub-int/2addr v5, v6

    add-int/2addr v5, v0

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->getScrollY()I

    move-result v0

    iget-object v6, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v6}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v6

    iget-object v7, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v7}, Lnet/simonvt/numberpicker/NumberPicker;->getTop()I

    move-result v7

    sub-int/2addr v6, v7

    add-int/2addr v6, v0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->createAccessibilityNodeInfoForVirtualButton(ILjava/lang/String;IIII)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    goto/16 :goto_0

    .line 2250
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public findAccessibilityNodeInfosByText(Ljava/lang/String;I)Ljava/util/List;
    .locals 3
    .param p1, "searched"    # Ljava/lang/String;
    .param p2, "virtualViewId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2273
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2274
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 2296
    :goto_0
    return-object v0

    .line 2276
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 2277
    .local v1, "searchedLowerCase":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2278
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    packed-switch p2, :pswitch_data_0

    .line 2296
    :pswitch_0
    invoke-super {p0, p1, p2}, Landroid/view/accessibility/AccessibilityNodeProvider;->findAccessibilityNodeInfosByText(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 2280
    :pswitch_1
    const/4 v2, 0x3

    invoke-direct {p0, v1, v2, v0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->findAccessibilityNodeInfosByTextInChild(Ljava/lang/String;ILjava/util/List;)V

    .line 2282
    const/4 v2, 0x2

    invoke-direct {p0, v1, v2, v0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->findAccessibilityNodeInfosByTextInChild(Ljava/lang/String;ILjava/util/List;)V

    .line 2284
    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, v0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->findAccessibilityNodeInfosByTextInChild(Ljava/lang/String;ILjava/util/List;)V

    goto :goto_0

    .line 2291
    :pswitch_2
    invoke-direct {p0, v1, p2, v0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->findAccessibilityNodeInfosByTextInChild(Ljava/lang/String;ILjava/util/List;)V

    goto :goto_0

    .line 2278
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public performAction(IILandroid/os/Bundle;)Z
    .locals 6
    .param p1, "virtualViewId"    # I
    .param p2, "action"    # I
    .param p3, "arguments"    # Landroid/os/Bundle;

    .prologue
    const/high16 v5, 0x10000

    const v4, 0x8000

    const/high16 v3, -0x80000000

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 2301
    packed-switch p1, :pswitch_data_0

    .line 2443
    :goto_0
    :pswitch_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/accessibility/AccessibilityNodeProvider;->performAction(IILandroid/os/Bundle;)Z

    move-result v0

    :cond_0
    :goto_1
    return v0

    .line 2303
    :pswitch_1
    sparse-switch p2, :sswitch_data_0

    goto :goto_0

    .line 2305
    :sswitch_0
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-eq v2, p1, :cond_0

    .line 2306
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    .line 2308
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    const/16 v3, 0x40

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move v0, v1

    .line 2309
    goto :goto_1

    .line 2313
    :sswitch_1
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-ne v2, p1, :cond_0

    .line 2314
    iput v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    .line 2316
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    const/16 v3, 0x80

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move v0, v1

    .line 2317
    goto :goto_1

    .line 2322
    :sswitch_2
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getWrapSelectorWheel()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v2

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getMaxValue()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 2324
    :cond_1
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->changeValueByOne(Z)V
    invoke-static {v2, v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$200(Lnet/simonvt/numberpicker/NumberPicker;Z)V

    move v0, v1

    .line 2325
    goto :goto_1

    .line 2329
    :sswitch_3
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getWrapSelectorWheel()Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v2

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getMinValue()I

    move-result v3

    if-le v2, v3, :cond_0

    .line 2331
    :cond_2
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->changeValueByOne(Z)V
    invoke-static {v2, v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$200(Lnet/simonvt/numberpicker/NumberPicker;Z)V

    move v0, v1

    .line 2332
    goto :goto_1

    .line 2338
    :pswitch_2
    sparse-switch p2, :sswitch_data_1

    .line 2377
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Landroid/widget/EditText;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result v0

    goto :goto_1

    .line 2340
    :sswitch_4
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->isFocused()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2341
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    move-result v0

    goto/16 :goto_1

    .line 2345
    :sswitch_5
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->isFocused()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2346
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->clearFocus()V

    move v0, v1

    .line 2347
    goto/16 :goto_1

    .line 2352
    :sswitch_6
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2353
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->showSoftInput()V
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$1900(Lnet/simonvt/numberpicker/NumberPicker;)V

    move v0, v1

    .line 2354
    goto/16 :goto_1

    .line 2359
    :sswitch_7
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-eq v2, p1, :cond_0

    .line 2360
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    .line 2361
    invoke-virtual {p0, p1, v4}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualView(II)V

    .line 2363
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->invalidate()V

    move v0, v1

    .line 2364
    goto/16 :goto_1

    .line 2368
    :sswitch_8
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-ne v2, p1, :cond_0

    .line 2369
    iput v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    .line 2370
    invoke-virtual {p0, p1, v5}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualView(II)V

    .line 2372
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;
    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->invalidate()V

    move v0, v1

    .line 2373
    goto/16 :goto_1

    .line 2382
    :pswitch_3
    sparse-switch p2, :sswitch_data_2

    goto/16 :goto_1

    .line 2384
    :sswitch_9
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2385
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->changeValueByOne(Z)V
    invoke-static {v2, v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$200(Lnet/simonvt/numberpicker/NumberPicker;Z)V

    .line 2386
    invoke-virtual {p0, p1, v1}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualView(II)V

    move v0, v1

    .line 2388
    goto/16 :goto_1

    .line 2392
    :sswitch_a
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-eq v2, p1, :cond_0

    .line 2393
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    .line 2394
    invoke-virtual {p0, p1, v4}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualView(II)V

    .line 2396
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I
    invoke-static {v3}, Lnet/simonvt/numberpicker/NumberPicker;->access$1500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v3

    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v4

    iget-object v5, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v5

    invoke-virtual {v2, v0, v3, v4, v5}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    move v0, v1

    .line 2397
    goto/16 :goto_1

    .line 2401
    :sswitch_b
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-ne v2, p1, :cond_0

    .line 2402
    iput v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    .line 2403
    invoke-virtual {p0, p1, v5}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualView(II)V

    .line 2405
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I
    invoke-static {v3}, Lnet/simonvt/numberpicker/NumberPicker;->access$1500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v3

    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v4

    iget-object v5, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v5}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v5

    invoke-virtual {v2, v0, v3, v4, v5}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    move v0, v1

    .line 2406
    goto/16 :goto_1

    .line 2412
    :pswitch_4
    sparse-switch p2, :sswitch_data_3

    goto/16 :goto_1

    .line 2414
    :sswitch_c
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2415
    if-ne p1, v1, :cond_3

    move v0, v1

    .line 2416
    .local v0, "increment":Z
    :cond_3
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # invokes: Lnet/simonvt/numberpicker/NumberPicker;->changeValueByOne(Z)V
    invoke-static {v2, v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$200(Lnet/simonvt/numberpicker/NumberPicker;Z)V

    .line 2417
    invoke-virtual {p0, p1, v1}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualView(II)V

    move v0, v1

    .line 2419
    goto/16 :goto_1

    .line 2423
    .end local v0    # "increment":Z
    :sswitch_d
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-eq v2, p1, :cond_0

    .line 2424
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    .line 2425
    invoke-virtual {p0, p1, v4}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualView(II)V

    .line 2427
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v3

    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I
    invoke-static {v4}, Lnet/simonvt/numberpicker/NumberPicker;->access$1700(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v4

    invoke-virtual {v2, v0, v0, v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    move v0, v1

    .line 2428
    goto/16 :goto_1

    .line 2432
    :sswitch_e
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    if-ne v2, p1, :cond_0

    .line 2433
    iput v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->mAccessibilityFocusedView:I

    .line 2434
    invoke-virtual {p0, p1, v5}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualView(II)V

    .line 2436
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v3

    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    # getter for: Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I
    invoke-static {v4}, Lnet/simonvt/numberpicker/NumberPicker;->access$1700(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v4

    invoke-virtual {v2, v0, v0, v3, v4}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    move v0, v1

    .line 2437
    goto/16 :goto_1

    .line 2301
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_4
    .end packed-switch

    .line 2303
    :sswitch_data_0
    .sparse-switch
        0x40 -> :sswitch_0
        0x80 -> :sswitch_1
        0x1000 -> :sswitch_2
        0x2000 -> :sswitch_3
    .end sparse-switch

    .line 2338
    :sswitch_data_1
    .sparse-switch
        0x1 -> :sswitch_4
        0x2 -> :sswitch_5
        0x10 -> :sswitch_6
        0x40 -> :sswitch_7
        0x80 -> :sswitch_8
    .end sparse-switch

    .line 2382
    :sswitch_data_2
    .sparse-switch
        0x10 -> :sswitch_9
        0x40 -> :sswitch_a
        0x80 -> :sswitch_b
    .end sparse-switch

    .line 2412
    :sswitch_data_3
    .sparse-switch
        0x10 -> :sswitch_c
        0x40 -> :sswitch_d
        0x80 -> :sswitch_e
    .end sparse-switch
.end method

.method public sendAccessibilityEventForVirtualView(II)V
    .locals 1
    .param p1, "virtualViewId"    # I
    .param p2, "eventType"    # I

    .prologue
    .line 2447
    packed-switch p1, :pswitch_data_0

    .line 2464
    :cond_0
    :goto_0
    return-void

    .line 2449
    :pswitch_0
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->hasVirtualDecrementButton()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2450
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->getVirtualDecrementButtonText()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualButton(IILjava/lang/String;)V

    goto :goto_0

    .line 2455
    :pswitch_1
    invoke-direct {p0, p2}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualText(I)V

    goto :goto_0

    .line 2458
    :pswitch_2
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->hasVirtualIncrementButton()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2459
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->getVirtualIncrementButtonText()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;->sendAccessibilityEventForVirtualButton(IILjava/lang/String;)V

    goto :goto_0

    .line 2447
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
