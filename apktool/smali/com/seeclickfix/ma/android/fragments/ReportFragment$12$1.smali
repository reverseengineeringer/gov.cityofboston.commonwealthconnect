.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$12$1;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;->onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;)V
    .locals 0

    .prologue
    .line 882
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 885
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12$1;->this$1:Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;->val$callback:Ljava/lang/Runnable;

    # invokes: Lcom/seeclickfix/ma/android/fragments/ReportFragment;->reverseGeocode(Ljava/lang/Runnable;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->access$800(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V

    .line 886
    return-void
.end method
