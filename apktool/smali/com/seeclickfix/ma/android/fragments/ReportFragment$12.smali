.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->performLocationTasks(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

.field final synthetic val$hasCachedWatchAreas:Z


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Z)V
    .locals 0

    .prologue
    .line 880
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iput-boolean p2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;->val$hasCachedWatchAreas:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 883
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;->val$hasCachedWatchAreas:Z

    if-nez v0, :cond_0

    .line 884
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    const/4 v1, 0x0

    # invokes: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getRequestTypes(Ljava/lang/Runnable;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$700(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V

    .line 886
    :cond_0
    return-void
.end method
