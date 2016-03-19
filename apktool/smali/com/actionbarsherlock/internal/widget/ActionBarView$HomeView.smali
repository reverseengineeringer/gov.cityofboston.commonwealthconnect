.class public Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;
.super Landroid/widget/FrameLayout;
.source "ActionBarView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/actionbarsherlock/internal/widget/ActionBarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HomeView"
.end annotation


# instance fields
.field private mIconView:Landroid/widget/ImageView;

.field private mUpView:Landroid/view/View;

.field private mUpWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1215
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 1216
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 1219
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 1220
    return-void
.end method


# virtual methods
.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 1250
    invoke-virtual {p0, p1}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 1232
    invoke-virtual {p0, p1}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1233
    const/4 v0, 0x1

    return v0
.end method

.method public getLeftOffset()I
    .locals 2

    .prologue
    .line 1260
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpWidth:I

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 1

    .prologue
    .line 1255
    sget v0, Lcom/actionbarsherlock/R$id;->abs__up:I

    invoke-virtual {p0, v0}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    .line 1256
    sget v0, Lcom/actionbarsherlock/R$id;->abs__home:I

    invoke-virtual {p0, v0}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    .line 1257
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 15
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 1308
    sub-int v12, p5, p3

    div-int/lit8 v11, v12, 0x2

    .line 1310
    .local v11, "vCenter":I
    const/4 v8, 0x0

    .line 1311
    .local v8, "upOffset":I
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v12

    const/16 v13, 0x8

    if-eq v12, v13, :cond_0

    .line 1312
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 1313
    .local v7, "upLp":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    .line 1314
    .local v6, "upHeight":I
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    .line 1315
    .local v10, "upWidth":I
    div-int/lit8 v12, v6, 0x2

    sub-int v9, v11, v12

    .line 1316
    .local v9, "upTop":I
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    const/4 v13, 0x0

    add-int v14, v9, v6

    invoke-virtual {v12, v13, v9, v10, v14}, Landroid/view/View;->layout(IIII)V

    .line 1317
    iget v12, v7, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    add-int/2addr v12, v10

    iget v13, v7, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int v8, v12, v13

    .line 1319
    add-int p2, p2, v8

    .line 1321
    .end local v6    # "upHeight":I
    .end local v7    # "upLp":Landroid/widget/FrameLayout$LayoutParams;
    .end local v9    # "upTop":I
    .end local v10    # "upWidth":I
    :cond_0
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v12}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 1322
    .local v3, "iconLp":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v12}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v1

    .line 1323
    .local v1, "iconHeight":I
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v12}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v5

    .line 1324
    .local v5, "iconWidth":I
    sub-int v12, p4, p2

    div-int/lit8 v0, v12, 0x2

    .line 1325
    .local v0, "hCenter":I
    iget v12, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    div-int/lit8 v13, v5, 0x2

    sub-int v13, v0, v13

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v12

    add-int v2, v8, v12

    .line 1326
    .local v2, "iconLeft":I
    iget v12, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    div-int/lit8 v13, v1, 0x2

    sub-int v13, v11, v13

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1327
    .local v4, "iconTop":I
    iget-object v12, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    add-int v13, v2, v5

    add-int v14, v4, v1

    invoke-virtual {v12, v2, v4, v13, v14}, Landroid/widget/ImageView;->layout(IIII)V

    .line 1328
    return-void
.end method

.method protected onMeasure(II)V
    .locals 13
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1265
    iget-object v1, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v2, p1

    move v4, p2

    invoke-virtual/range {v0 .. v5}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 1266
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/widget/FrameLayout$LayoutParams;

    .line 1267
    .local v10, "upLp":Landroid/widget/FrameLayout$LayoutParams;
    iget v0, v10, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget-object v1, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, v10, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpWidth:I

    .line 1268
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v3, 0x0

    .line 1269
    .local v3, "width":I
    :goto_0
    iget v0, v10, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, v10, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int v6, v0, v1

    .line 1270
    .local v6, "height":I
    iget-object v1, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    const/4 v5, 0x0

    move-object v0, p0

    move v2, p1

    move v4, p2

    invoke-virtual/range {v0 .. v5}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 1271
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/widget/FrameLayout$LayoutParams;

    .line 1272
    .local v9, "iconLp":Landroid/widget/FrameLayout$LayoutParams;
    iget v0, v9, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget-object v1, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, v9, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int/2addr v0, v1

    add-int/2addr v3, v0

    .line 1273
    iget v0, v9, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, v9, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v1

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 1276
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v11

    .line 1277
    .local v11, "widthMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v7

    .line 1278
    .local v7, "heightMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v12

    .line 1279
    .local v12, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v8

    .line 1281
    .local v8, "heightSize":I
    sparse-switch v11, :sswitch_data_0

    .line 1292
    :goto_1
    sparse-switch v7, :sswitch_data_1

    .line 1303
    :goto_2
    invoke-virtual {p0, v3, v6}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->setMeasuredDimension(II)V

    .line 1304
    return-void

    .line 1268
    .end local v3    # "width":I
    .end local v6    # "height":I
    .end local v7    # "heightMode":I
    .end local v8    # "heightSize":I
    .end local v9    # "iconLp":Landroid/widget/FrameLayout$LayoutParams;
    .end local v11    # "widthMode":I
    .end local v12    # "widthSize":I
    :cond_0
    iget v3, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpWidth:I

    goto :goto_0

    .line 1283
    .restart local v3    # "width":I
    .restart local v6    # "height":I
    .restart local v7    # "heightMode":I
    .restart local v8    # "heightSize":I
    .restart local v9    # "iconLp":Landroid/widget/FrameLayout$LayoutParams;
    .restart local v11    # "widthMode":I
    .restart local v12    # "widthSize":I
    :sswitch_0
    invoke-static {v3, v12}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1284
    goto :goto_1

    .line 1286
    :sswitch_1
    move v3, v12

    .line 1287
    goto :goto_1

    .line 1294
    :sswitch_2
    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 1295
    goto :goto_2

    .line 1297
    :sswitch_3
    move v6, v8

    .line 1298
    goto :goto_2

    .line 1281
    nop

    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_0
        0x40000000 -> :sswitch_1
    .end sparse-switch

    .line 1292
    :sswitch_data_1
    .sparse-switch
        -0x80000000 -> :sswitch_2
        0x40000000 -> :sswitch_3
    .end sparse-switch
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 3
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 1238
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt v1, v2, :cond_0

    .line 1239
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1241
    :cond_0
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    .line 1242
    .local v0, "cdesc":Ljava/lang/CharSequence;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1243
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1245
    :cond_1
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 1227
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1228
    return-void
.end method

.method public setUp(Z)V
    .locals 2
    .param p1, "isUp"    # Z

    .prologue
    .line 1223
    iget-object v1, p0, Lcom/actionbarsherlock/internal/widget/ActionBarView$HomeView;->mUpView:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1224
    return-void

    .line 1223
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method
