.class Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$2;
.super Ljava/lang/Object;
.source "IssueDetailsFrag.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V
    .locals 0

    .prologue
    .line 482
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 3
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 488
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 490
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/view/ViewGroup;

    move-result-object v1

    const v2, 0x7f0a007f

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 491
    .local v0, "loadingView":Landroid/view/View;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 492
    return-void
.end method
