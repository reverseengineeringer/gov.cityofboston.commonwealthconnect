.class Lcom/seeclickfix/ma/android/SeeclickfixActivity$2;
.super Ljava/lang/Object;
.source "SeeclickfixActivity.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/SeeclickfixActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 0

    .prologue
    .line 408
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$2;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDbReady()V
    .locals 2

    .prologue
    .line 411
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$2;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    const/4 v1, 0x0

    # setter for: Lcom/seeclickfix/ma/android/SeeclickfixActivity;->upgradeHelper:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->access$402(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    .line 412
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$2;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    # invokes: Lcom/seeclickfix/ma/android/SeeclickfixActivity;->start()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->access$500(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    .line 413
    return-void
.end method
