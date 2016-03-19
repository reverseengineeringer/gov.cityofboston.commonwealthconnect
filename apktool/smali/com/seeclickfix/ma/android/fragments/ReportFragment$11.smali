.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$11;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->perhapsShowDraftIndicator()V
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
    .line 727
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$11;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 730
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$11;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    const v1, 0x7f0c00f4

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->notifyUser(I)V

    .line 731
    return-void
.end method
