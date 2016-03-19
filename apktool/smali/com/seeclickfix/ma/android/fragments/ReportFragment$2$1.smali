.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$2$1;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;)V
    .locals 0

    .prologue
    .line 511
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNegativeClick()V
    .locals 0

    .prologue
    .line 521
    return-void
.end method

.method public onPositiveClick()V
    .locals 1

    .prologue
    .line 515
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showMapFrag()V

    .line 516
    return-void
.end method
