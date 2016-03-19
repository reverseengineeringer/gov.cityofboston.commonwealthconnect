.class Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$2;
.super Ljava/lang/Object;
.source "UnboxingPagerFrag.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V
    .locals 0

    .prologue
    .line 135
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 163
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 158
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 141
    if-gtz p1, :cond_1

    .line 143
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    const/4 v1, 0x0

    # setter for: Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->access$202(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;I)I

    .line 153
    :cond_0
    :goto_0
    return-void

    .line 145
    :cond_1
    const/4 v0, 0x3

    if-ge p1, v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I
    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->access$202(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;I)I

    goto :goto_0
.end method
