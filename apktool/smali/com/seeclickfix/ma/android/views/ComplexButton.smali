.class public Lcom/seeclickfix/ma/android/views/ComplexButton;
.super Landroid/widget/RelativeLayout;
.source "ComplexButton.java"


# instance fields
.field private icon:Landroid/widget/ImageView;

.field private iconDrawable:Landroid/graphics/drawable/Drawable;

.field private text:Landroid/widget/TextView;

.field private textString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "ComplexButton requires an attribute set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/views/ComplexButton;->handleAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/views/ComplexButton;->handleAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method private handleAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 46
    const v4, 0x7f030017

    invoke-static {p1, v4, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 48
    sget-object v4, Lcom/seeclickfix/ma/android/R$styleable;->ComplexButton:[I

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 50
    .local v3, "typeAttrArry":Landroid/content/res/TypedArray;
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    .line 52
    .local v2, "numAttrs":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 53
    invoke-virtual {v3, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v0

    .line 55
    .local v0, "attributId":I
    packed-switch v0, :pswitch_data_0

    .line 52
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 57
    :pswitch_0
    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->iconDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_1

    .line 60
    :pswitch_1
    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->textString:Ljava/lang/String;

    goto :goto_1

    .line 64
    .end local v0    # "attributId":I
    :cond_0
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 66
    return-void

    .line 55
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 71
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 72
    const v0, 0x7f0a0049

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/views/ComplexButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->text:Landroid/widget/TextView;

    .line 73
    const v0, 0x7f0a0046

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/views/ComplexButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->icon:Landroid/widget/ImageView;

    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->text:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->textString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->icon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->iconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 78
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/ComplexButton;->text:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    return-void
.end method
