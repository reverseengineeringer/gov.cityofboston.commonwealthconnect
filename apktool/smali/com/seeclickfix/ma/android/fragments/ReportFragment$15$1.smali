.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$15$1;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;)V
    .locals 0

    .prologue
    .line 989
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 992
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;->val$runner:Ljava/lang/Runnable;

    # invokes: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getRequestTypes(Ljava/lang/Runnable;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$700(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V

    .line 993
    return-void
.end method
