.class public Lcom/viewpagerindicator/TabPageIndicator;
.super Landroid/widget/HorizontalScrollView;
.source "TabPageIndicator.java"

# interfaces
.implements Lcom/viewpagerindicator/PageIndicator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/viewpagerindicator/TabPageIndicator$TabView;,
        Lcom/viewpagerindicator/TabPageIndicator$OnTabReselectedListener;
    }
.end annotation


# static fields
.field private static final EMPTY_TITLE:Ljava/lang/CharSequence;


# instance fields
.field private mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mMaxTabWidth:I

.field private mSelectedTabIndex:I

.field private final mTabClickListener:Landroid/view/View$OnClickListener;

.field private final mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

.field private mTabReselectedListener:Lcom/viewpagerindicator/TabPageIndicator$OnTabReselectedListener;

.field private mTabSelector:Ljava/lang/Runnable;

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-string/jumbo v0, ""

    sput-object v0, Lcom/viewpagerindicator/TabPageIndicator;->EMPTY_TITLE:Ljava/lang/CharSequence;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/viewpagerindicator/TabPageIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    new-instance v0, Lcom/viewpagerindicator/TabPageIndicator$1;

    invoke-direct {v0, p0}, Lcom/viewpagerindicator/TabPageIndicator$1;-><init>(Lcom/viewpagerindicator/TabPageIndicator;)V

    iput-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabClickListener:Landroid/view/View$OnClickListener;

    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/viewpagerindicator/TabPageIndicator;->setHorizontalScrollBarEnabled(Z)V

    .line 85
    new-instance v0, Lcom/viewpagerindicator/IcsLinearLayout;

    sget v1, Lcom/viewpagerindicator/R$attr;->vpiTabPageIndicatorStyle:I

    invoke-direct {v0, p1, v1}, Lcom/viewpagerindicator/IcsLinearLayout;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

    .line 86
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Lcom/viewpagerindicator/TabPageIndicator;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    return-void
.end method

.method static synthetic access$000(Lcom/viewpagerindicator/TabPageIndicator;)Landroid/support/v4/view/ViewPager;
    .locals 1
    .param p0, "x0"    # Lcom/viewpagerindicator/TabPageIndicator;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/viewpagerindicator/TabPageIndicator;)Lcom/viewpagerindicator/TabPageIndicator$OnTabReselectedListener;
    .locals 1
    .param p0, "x0"    # Lcom/viewpagerindicator/TabPageIndicator;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabReselectedListener:Lcom/viewpagerindicator/TabPageIndicator$OnTabReselectedListener;

    return-object v0
.end method

.method static synthetic access$202(Lcom/viewpagerindicator/TabPageIndicator;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lcom/viewpagerindicator/TabPageIndicator;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$400(Lcom/viewpagerindicator/TabPageIndicator;)I
    .locals 1
    .param p0, "x0"    # Lcom/viewpagerindicator/TabPageIndicator;

    .prologue
    .line 37
    iget v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mMaxTabWidth:I

    return v0
.end method

.method private addTab(ILjava/lang/CharSequence;I)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "iconResId"    # I

    .prologue
    const/4 v5, 0x0

    .line 159
    new-instance v0, Lcom/viewpagerindicator/TabPageIndicator$TabView;

    invoke-virtual {p0}, Lcom/viewpagerindicator/TabPageIndicator;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/viewpagerindicator/TabPageIndicator$TabView;-><init>(Lcom/viewpagerindicator/TabPageIndicator;Landroid/content/Context;)V

    .line 160
    .local v0, "tabView":Lcom/viewpagerindicator/TabPageIndicator$TabView;
    # setter for: Lcom/viewpagerindicator/TabPageIndicator$TabView;->mIndex:I
    invoke-static {v0, p1}, Lcom/viewpagerindicator/TabPageIndicator$TabView;->access$302(Lcom/viewpagerindicator/TabPageIndicator$TabView;I)I

    .line 161
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/viewpagerindicator/TabPageIndicator$TabView;->setFocusable(Z)V

    .line 162
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/viewpagerindicator/TabPageIndicator$TabView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    invoke-virtual {v0, p2}, Lcom/viewpagerindicator/TabPageIndicator$TabView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    if-eqz p3, :cond_0

    .line 166
    invoke-virtual {v0, p3, v5, v5, v5}, Lcom/viewpagerindicator/TabPageIndicator$TabView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 169
    :cond_0
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0, v2}, Lcom/viewpagerindicator/IcsLinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 170
    return-void
.end method

.method private animateToTab(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 127
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

    invoke-virtual {v1, p1}, Lcom/viewpagerindicator/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 128
    .local v0, "tabView":Landroid/view/View;
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 129
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/viewpagerindicator/TabPageIndicator;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 131
    :cond_0
    new-instance v1, Lcom/viewpagerindicator/TabPageIndicator$2;

    invoke-direct {v1, p0, v0}, Lcom/viewpagerindicator/TabPageIndicator$2;-><init>(Lcom/viewpagerindicator/TabPageIndicator;Landroid/view/View;)V

    iput-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    .line 138
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/viewpagerindicator/TabPageIndicator;->post(Ljava/lang/Runnable;)Z

    .line 139
    return-void
.end method


# virtual methods
.method public notifyDataSetChanged()V
    .locals 7

    .prologue
    .line 212
    iget-object v6, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

    invoke-virtual {v6}, Lcom/viewpagerindicator/IcsLinearLayout;->removeAllViews()V

    .line 213
    iget-object v6, p0, Lcom/viewpagerindicator/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v6}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 214
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    const/4 v3, 0x0

    .line 215
    .local v3, "iconAdapter":Lcom/viewpagerindicator/IconPagerAdapter;
    instance-of v6, v0, Lcom/viewpagerindicator/IconPagerAdapter;

    if-eqz v6, :cond_0

    move-object v3, v0

    .line 216
    check-cast v3, Lcom/viewpagerindicator/IconPagerAdapter;

    .line 218
    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    .line 219
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_3

    .line 220
    invoke-virtual {v0, v2}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v5

    .line 221
    .local v5, "title":Ljava/lang/CharSequence;
    if-nez v5, :cond_1

    .line 222
    sget-object v5, Lcom/viewpagerindicator/TabPageIndicator;->EMPTY_TITLE:Ljava/lang/CharSequence;

    .line 224
    :cond_1
    const/4 v4, 0x0

    .line 225
    .local v4, "iconResId":I
    if-eqz v3, :cond_2

    .line 226
    invoke-interface {v3, v2}, Lcom/viewpagerindicator/IconPagerAdapter;->getIconResId(I)I

    move-result v4

    .line 228
    :cond_2
    invoke-direct {p0, v2, v5, v4}, Lcom/viewpagerindicator/TabPageIndicator;->addTab(ILjava/lang/CharSequence;I)V

    .line 219
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 230
    .end local v4    # "iconResId":I
    .end local v5    # "title":Ljava/lang/CharSequence;
    :cond_3
    iget v6, p0, Lcom/viewpagerindicator/TabPageIndicator;->mSelectedTabIndex:I

    if-le v6, v1, :cond_4

    .line 231
    add-int/lit8 v6, v1, -0x1

    iput v6, p0, Lcom/viewpagerindicator/TabPageIndicator;->mSelectedTabIndex:I

    .line 233
    :cond_4
    iget v6, p0, Lcom/viewpagerindicator/TabPageIndicator;->mSelectedTabIndex:I

    invoke-virtual {p0, v6}, Lcom/viewpagerindicator/TabPageIndicator;->setCurrentItem(I)V

    .line 234
    invoke-virtual {p0}, Lcom/viewpagerindicator/TabPageIndicator;->requestLayout()V

    .line 235
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .prologue
    .line 143
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 144
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/viewpagerindicator/TabPageIndicator;->post(Ljava/lang/Runnable;)Z

    .line 148
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 152
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    .line 153
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/viewpagerindicator/TabPageIndicator;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 156
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 101
    const/4 v4, 0x0

    .line 102
    .local v4, "widthMode":I
    const/4 v1, 0x0

    .line 103
    .local v1, "lockedExpanded":Z
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/viewpagerindicator/TabPageIndicator;->setFillViewport(Z)V

    .line 105
    iget-object v5, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

    invoke-virtual {v5}, Lcom/viewpagerindicator/IcsLinearLayout;->getChildCount()I

    move-result v0

    .line 106
    .local v0, "childCount":I
    const/4 v5, 0x1

    if-le v0, v5, :cond_0

    .line 113
    :cond_0
    const/4 v5, -0x1

    iput v5, p0, Lcom/viewpagerindicator/TabPageIndicator;->mMaxTabWidth:I

    .line 116
    invoke-virtual {p0}, Lcom/viewpagerindicator/TabPageIndicator;->getMeasuredWidth()I

    move-result v3

    .line 117
    .local v3, "oldWidth":I
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 118
    invoke-virtual {p0}, Lcom/viewpagerindicator/TabPageIndicator;->getMeasuredWidth()I

    move-result v2

    .line 124
    .local v2, "newWidth":I
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 174
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    .line 177
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 1
    .param p1, "arg0"    # I
    .param p2, "arg1"    # F
    .param p3, "arg2"    # I

    .prologue
    .line 181
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 184
    :cond_0
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 188
    invoke-virtual {p0, p1}, Lcom/viewpagerindicator/TabPageIndicator;->setCurrentItem(I)V

    .line 189
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/viewpagerindicator/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 192
    :cond_0
    return-void
.end method

.method public setCurrentItem(I)V
    .locals 6
    .param p1, "item"    # I

    .prologue
    .line 245
    iget-object v4, p0, Lcom/viewpagerindicator/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-nez v4, :cond_0

    .line 246
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string/jumbo v5, "ViewPager has not been bound."

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 248
    :cond_0
    iput p1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mSelectedTabIndex:I

    .line 249
    iget-object v4, p0, Lcom/viewpagerindicator/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4, p1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 251
    iget-object v4, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

    invoke-virtual {v4}, Lcom/viewpagerindicator/IcsLinearLayout;->getChildCount()I

    move-result v3

    .line 252
    .local v3, "tabCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_3

    .line 253
    iget-object v4, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabLayout:Lcom/viewpagerindicator/IcsLinearLayout;

    invoke-virtual {v4, v1}, Lcom/viewpagerindicator/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 254
    .local v0, "child":Landroid/view/View;
    if-ne v1, p1, :cond_2

    const/4 v2, 0x1

    .line 255
    .local v2, "isSelected":Z
    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 256
    if-eqz v2, :cond_1

    .line 257
    invoke-direct {p0, p1}, Lcom/viewpagerindicator/TabPageIndicator;->animateToTab(I)V

    .line 252
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 254
    .end local v2    # "isSelected":Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 260
    .end local v0    # "child":Landroid/view/View;
    :cond_3
    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 265
    return-void
.end method

.method public setOnTabReselectedListener(Lcom/viewpagerindicator/TabPageIndicator$OnTabReselectedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/viewpagerindicator/TabPageIndicator$OnTabReselectedListener;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mTabReselectedListener:Lcom/viewpagerindicator/TabPageIndicator$OnTabReselectedListener;

    .line 92
    return-void
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;)V
    .locals 3
    .param p1, "view"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 196
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-ne v1, p1, :cond_0

    .line 209
    :goto_0
    return-void

    .line 199
    :cond_0
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v1, :cond_1

    .line 200
    iget-object v1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 202
    :cond_1
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 203
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    if-nez v0, :cond_2

    .line 204
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "ViewPager does not have adapter instance."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 206
    :cond_2
    iput-object p1, p0, Lcom/viewpagerindicator/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 207
    invoke-virtual {p1, p0}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 208
    invoke-virtual {p0}, Lcom/viewpagerindicator/TabPageIndicator;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;I)V
    .locals 0
    .param p1, "view"    # Landroid/support/v4/view/ViewPager;
    .param p2, "initialPosition"    # I

    .prologue
    .line 239
    invoke-virtual {p0, p1}, Lcom/viewpagerindicator/TabPageIndicator;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 240
    invoke-virtual {p0, p2}, Lcom/viewpagerindicator/TabPageIndicator;->setCurrentItem(I)V

    .line 241
    return-void
.end method
