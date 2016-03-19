.class public Lcom/seeclickfix/ma/android/views/platform/PlatformSpecificScrollerFactory;
.super Ljava/lang/Object;
.source "PlatformSpecificScrollerFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPlatformScroller(Ljava/lang/Object;)Lcom/seeclickfix/ma/android/views/platform/SimpleScrollerCompat;
    .locals 1
    .param p0, "scroller"    # Ljava/lang/Object;

    .prologue
    .line 36
    sget-boolean v0, Lcom/seeclickfix/ma/android/constants/ApiLevel;->SUPPORTS_GINGERBREAD:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/seeclickfix/ma/android/views/platform/GingerbreadScroller;

    check-cast p0, Landroid/widget/OverScroller;

    .end local p0    # "scroller":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/platform/GingerbreadScroller;-><init>(Landroid/widget/OverScroller;)V

    :goto_0
    return-object v0

    .restart local p0    # "scroller":Ljava/lang/Object;
    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/views/platform/LegacyScroller;

    check-cast p0, Landroid/widget/Scroller;

    .end local p0    # "scroller":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/platform/LegacyScroller;-><init>(Landroid/widget/Scroller;)V

    goto :goto_0
.end method
