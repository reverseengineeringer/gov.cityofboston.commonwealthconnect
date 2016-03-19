.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$7;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 568
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$7;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 573
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$7;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isEditingAddress:Z
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$100(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 574
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$7;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->handleAddressEdit()V

    .line 578
    :goto_0
    return-void

    .line 576
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$7;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->editAddress()V

    goto :goto_0
.end method
