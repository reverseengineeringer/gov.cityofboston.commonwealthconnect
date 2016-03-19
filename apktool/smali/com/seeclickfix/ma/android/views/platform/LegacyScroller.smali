.class public Lcom/seeclickfix/ma/android/views/platform/LegacyScroller;
.super Ljava/lang/Object;
.source "LegacyScroller.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/views/platform/SimpleScrollerCompat;


# instance fields
.field private scroller:Landroid/widget/Scroller;


# direct methods
.method public constructor <init>(Landroid/widget/Scroller;)V
    .locals 0
    .param p1, "scroller"    # Landroid/widget/Scroller;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/platform/LegacyScroller;->scroller:Landroid/widget/Scroller;

    .line 12
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
    .line 16
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/platform/LegacyScroller;->scroller:Landroid/widget/Scroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 17
    return-void
.end method
