.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$6;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 0

    .prologue
    .line 552
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$6;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 556
    invoke-static {p1}, Lcom/seeclickfix/ma/android/util/FormUtil;->hideKeyboard(Landroid/view/View;)V

    .line 558
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$6;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isEditingAddress:Z
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$100(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 559
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$6;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->handleAddressEdit()V

    .line 560
    const/4 v0, 0x1

    .line 562
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
