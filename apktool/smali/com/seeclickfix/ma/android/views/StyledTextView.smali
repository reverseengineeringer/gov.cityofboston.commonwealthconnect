.class public Lcom/seeclickfix/ma/android/views/StyledTextView;
.super Landroid/widget/TextView;
.source "StyledTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 32
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/StyledTextView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 33
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/StyleUtil;->getTypeFace(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/views/StyledTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 35
    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/StyledTextView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/views/StyledTextView;->setCustomFont(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/StyledTextView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/views/StyledTextView;->setCustomFont(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    :cond_0
    return-void
.end method

.method private setCustomFont(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 39
    if-nez p2, :cond_0

    .line 40
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/StyleUtil;->getTypeFace(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/views/StyledTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 58
    :goto_0
    return-void

    .line 44
    :cond_0
    const-string/jumbo v1, "http://schemas.android.com/apk/res/android"

    const-string/jumbo v2, "textStyle"

    invoke-interface {p2, v1, v2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 47
    .local v0, "textStyle":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 50
    const-string/jumbo v1, "0x1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 51
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/StyleUtil;->getTypeFaceBold(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/views/StyledTextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0

    .line 53
    :cond_1
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/StyleUtil;->getTypeFace(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/views/StyledTextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0

    .line 56
    :cond_2
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/StyleUtil;->getTypeFace(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/views/StyledTextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0
.end method
