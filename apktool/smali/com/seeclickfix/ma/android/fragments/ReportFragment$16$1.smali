.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$16$1;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->failure(Lretrofit/RetrofitError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;)V
    .locals 0

    .prologue
    .line 1020
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1023
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$watchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$reqId:Ljava/lang/String;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;

    iget-object v3, v3, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;->val$runner:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v2, v3}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getFollowupQuestions(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 1024
    return-void
.end method
