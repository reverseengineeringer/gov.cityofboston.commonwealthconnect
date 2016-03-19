.class public Lcom/seeclickfix/ma/android/views/CustomScrollView;
.super Landroid/widget/ScrollView;
.source "CustomScrollView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "CustomScrollView"


# instance fields
.field private layoutListener:Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;

.field private myScroller:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 36
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->init()V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->init()V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->init()V

    .line 27
    return-void
.end method

.method private init()V
    .locals 6

    .prologue
    .line 80
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 82
    .local v2, "parent":Ljava/lang/Class;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    .line 83
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "android.widget.ScrollView"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 85
    const-string/jumbo v3, "Scroller"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "class: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const-string/jumbo v3, "mScroller"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 87
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 88
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p0, Lcom/seeclickfix/ma/android/views/CustomScrollView;->myScroller:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 97
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "parent":Ljava/lang/Class;
    :goto_0
    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    goto :goto_0

    .line 92
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :catch_1
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 94
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_2
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public customSmoothScrollBy(II)V
    .locals 12
    .param p1, "dx"    # I
    .param p2, "dy"    # I

    .prologue
    const/4 v5, 0x0

    .line 100
    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/CustomScrollView;->myScroller:Ljava/lang/Object;

    if-nez v3, :cond_1

    .line 101
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->smoothScrollBy(II)V

    .line 125
    :cond_0
    :goto_0
    return-void

    .line 105
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getChildCount()I

    move-result v3

    if-eqz v3, :cond_0

    .line 108
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getPaddingLeft()I

    move-result v4

    sub-int v11, v3, v4

    .line 109
    .local v11, "width":I
    invoke-virtual {p0, v5}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v10

    .line 110
    .local v10, "right":I
    sub-int v3, v10, v11

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 111
    .local v8, "maxX":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getScrollX()I

    move-result v1

    .line 113
    .local v1, "scrollX":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getPaddingBottom()I

    move-result v4

    sub-int v7, v3, v4

    .line 114
    .local v7, "height":I
    invoke-virtual {p0, v5}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v6

    .line 115
    .local v6, "bottom":I
    sub-int v3, v6, v7

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 116
    .local v9, "maxY":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getScrollY()I

    move-result v2

    .line 117
    .local v2, "scrollY":I
    add-int v3, v1, p1

    invoke-static {v3, v8}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    sub-int p1, v3, v1

    .line 118
    add-int v3, v2, p2

    invoke-static {v3, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    sub-int p2, v3, v2

    .line 121
    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/CustomScrollView;->myScroller:Ljava/lang/Object;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/views/platform/PlatformSpecificScrollerFactory;->getPlatformScroller(Ljava/lang/Object;)Lcom/seeclickfix/ma/android/views/platform/SimpleScrollerCompat;

    move-result-object v0

    .line 123
    .local v0, "compatScroller":Lcom/seeclickfix/ma/android/views/platform/SimpleScrollerCompat;
    const/16 v5, 0x5dc

    move v3, p1

    move v4, p2

    invoke-interface/range {v0 .. v5}, Lcom/seeclickfix/ma/android/views/platform/SimpleScrollerCompat;->startScroll(IIIII)V

    .line 124
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->invalidate()V

    goto :goto_0
.end method

.method public customSmoothScrollTo(II)V
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getScrollX()I

    move-result v0

    sub-int v0, p1, v0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->getScrollY()I

    move-result v1

    sub-int v1, p2, v1

    invoke-virtual {p0, v0, v1}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->customSmoothScrollBy(II)V

    .line 132
    return-void
.end method

.method public getLayoutListener()Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/CustomScrollView;->layoutListener:Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .locals 1
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 52
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/CustomScrollView;->layoutListener:Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/CustomScrollView;->layoutListener:Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;->onChangeLayout()V

    .line 56
    :cond_0
    invoke-super/range {p0 .. p5}, Landroid/widget/ScrollView;->onLayout(ZIIII)V

    .line 57
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasWindowFocus"    # Z

    .prologue
    .line 45
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->onWindowFocusChanged(Z)V

    .line 46
    return-void
.end method

.method public setLayoutListener(Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;)V
    .locals 0
    .param p1, "layoutListener"    # Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/CustomScrollView;->layoutListener:Lcom/seeclickfix/ma/android/views/CustomScrollView$LayoutChangedListener;

    .line 66
    return-void
.end method
