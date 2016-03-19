.class Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$2;
.super Ljava/lang/Object;
.source "IssueDetailsFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;)V
    .locals 0

    .prologue
    .line 1095
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$2;->this$1:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1098
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8$2;->this$1:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->resetStatus()V

    .line 1099
    return-void
.end method
