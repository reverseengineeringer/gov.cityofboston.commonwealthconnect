.class public Lcom/seeclickfix/ma/android/views/platform/GingerbreadScroller;
.super Ljava/lang/Object;
.source "GingerbreadScroller.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/views/platform/SimpleScrollerCompat;


# instance fields
.field private scroller:Landroid/widget/OverScroller;


# direct methods
.method public constructor <init>(Landroid/widget/OverScroller;)V
    .locals 0
    .param p1, "scroller"    # Landroid/widget/OverScroller;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/platform/GingerbreadScroller;->scroller:Landroid/widget/OverScroller;

    .line 13
    return-void
.end method


# virtual methods
.method public startScroll(IIIII)V
    .locals 6
    .param p1, "scrollX"    # I
    .param p2, "scrollY"    # I
    .param p3, "dx"    # I
    .param p4, "dy"    # I
    .param p5, "durationMillis"    # I

    .prologue
    .line 17
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/platform/GingerbreadScroller;->scroller:Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 18
    return-void
.end method
