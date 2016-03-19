.class Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$1;
.super Landroid/os/Handler;
.source "DbUpgradeHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->setupHandler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$1;->this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 53
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 64
    :goto_0
    return-void

    .line 55
    :pswitch_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$1;->this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    # invokes: Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->runCallbacksAndCleanup()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->access$000(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)V

    goto :goto_0

    .line 58
    :pswitch_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$1;->this$0:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->showUpgradingDialog()V

    goto :goto_0

    .line 53
    :pswitch_data_0
    .packed-switch 0x37
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
