.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$19;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;
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
    .line 1480
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$19;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    const v1, 0x7f0a00f0

    .line 1487
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    if-ne v0, v1, :cond_1

    if-eqz p2, :cond_1

    .line 1489
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$19;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->editAddress()V

    .line 1496
    :cond_0
    :goto_0
    return-void

    .line 1490
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    if-ne v0, v1, :cond_0

    if-nez p2, :cond_0

    .line 1492
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$19;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->handleAddressEdit()V

    goto :goto_0
.end method
