.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;
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
    .line 499
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 504
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    # invokes: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hasLocation()Z
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$000(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    const-string/jumbo v2, "Pref:WARN_LOCATION_CHANGE"

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->shouldShowDialog(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 505
    const-string/jumbo v1, "Pref:WARN_LOCATION_CHANGE"

    const v2, 0x7f0c00f2

    const v3, 0x7f0c00f1

    const v4, 0x7f0c0050

    const v5, 0x7f0200df

    invoke-static {v1, v2, v3, v4, v5}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->newInstance(Ljava/lang/String;IIII)Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;

    move-result-object v0

    .line 511
    .local v0, "dialog":Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2$1;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;)V

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->setClickListener(Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;)V

    .line 524
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 528
    .end local v0    # "dialog":Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
    :goto_0
    return-void

    .line 526
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showMapFrag()V

    goto :goto_0
.end method
