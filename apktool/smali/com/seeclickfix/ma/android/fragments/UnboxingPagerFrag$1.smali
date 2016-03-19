.class Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$1;
.super Ljava/lang/Object;
.source "UnboxingPagerFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 122
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 126
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->skipBtn:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)Landroid/widget/TextView;

    move-result-object v1

    const-string/jumbo v2, "alpha"

    const/4 v3, 0x2

    new-array v3, v3, [F

    fill-array-data v3, :array_0

    invoke-static {v1, v2, v3}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 127
    .local v0, "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;
    const-wide/16 v2, 0x32

    invoke-virtual {v0, v2, v3}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;

    .line 128
    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 131
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->advanceToHome()V
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V

    .line 132
    return-void

    .line 126
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
