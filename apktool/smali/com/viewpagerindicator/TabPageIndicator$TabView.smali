.class Lcom/viewpagerindicator/TabPageIndicator$TabView;
.super Landroid/widget/TextView;
.source "TabPageIndicator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/viewpagerindicator/TabPageIndicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TabView"
.end annotation


# instance fields
.field private mIndex:I

.field final synthetic this$0:Lcom/viewpagerindicator/TabPageIndicator;


# direct methods
.method public constructor <init>(Lcom/viewpagerindicator/TabPageIndicator;Landroid/content/Context;)V
    .locals 2
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 270
    iput-object p1, p0, Lcom/viewpagerindicator/TabPageIndicator$TabView;->this$0:Lcom/viewpagerindicator/TabPageIndicator;

    .line 271
    const/4 v0, 0x0

    sget v1, Lcom/viewpagerindicator/R$attr;->vpiTabPageIndicatorStyle:I

    invoke-direct {p0, p2, v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 272
    return-void
.end method

.method static synthetic access$302(Lcom/viewpagerindicator/TabPageIndicator$TabView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/viewpagerindicator/TabPageIndicator$TabView;
    .param p1, "x1"    # I

    .prologue
    .line 267
    iput p1, p0, Lcom/viewpagerindicator/TabPageIndicator$TabView;->mIndex:I

    return p1
.end method


# virtual methods
.method public getIndex()I
    .locals 1

    .prologue
    .line 286
    iget v0, p0, Lcom/viewpagerindicator/TabPageIndicator$TabView;->mIndex:I

    return v0
.end method

.method public onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 276
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 279
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator$TabView;->this$0:Lcom/viewpagerindicator/TabPageIndicator;

    # getter for: Lcom/viewpagerindicator/TabPageIndicator;->mMaxTabWidth:I
    invoke-static {v0}, Lcom/viewpagerindicator/TabPageIndicator;->access$400(Lcom/viewpagerindicator/TabPageIndicator;)I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/viewpagerindicator/TabPageIndicator$TabView;->getMeasuredWidth()I

    move-result v0

    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator$TabView;->this$0:Lcom/viewpagerindicator/TabPageIndicator;

    # getter for: Lcom/viewpagerindicator/TabPageIndicator;->mMaxTabWidth:I
    invoke-static {v1}, Lcom/viewpagerindicator/TabPageIndicator;->access$400(Lcom/viewpagerindicator/TabPageIndicator;)I

    move-result v1

    if-le v0, v1, :cond_0

    .line 280
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator$TabView;->this$0:Lcom/viewpagerindicator/TabPageIndicator;

    # getter for: Lcom/viewpagerindicator/TabPageIndicator;->mMaxTabWidth:I
    invoke-static {v0}, Lcom/viewpagerindicator/TabPageIndicator;->access$400(Lcom/viewpagerindicator/TabPageIndicator;)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-super {p0, v0, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 283
    :cond_0
    return-void
.end method
