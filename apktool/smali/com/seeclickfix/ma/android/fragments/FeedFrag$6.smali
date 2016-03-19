.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0

    .prologue
    .line 593
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 7
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    const/4 v6, 0x0

    .line 599
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z
    invoke-static {v0, v6}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$102(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Z)Z

    .line 601
    const-string/jumbo v0, "NOT_LOGGED_IN_MY_REPORTS"

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 602
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showMustLogInForMyReports()V

    .line 615
    :goto_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 616
    return-void

    .line 603
    :cond_0
    const-string/jumbo v0, "NOT_LOGGED_IN_MY_COMMENTS"

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 604
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showMustLogInForMyComment()V

    goto :goto_0

    .line 606
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 607
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$600(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    move-result-object v0

    const v1, 0x7f0c0074

    const v2, 0x7f0c0067

    const v3, 0x7f020112

    const v4, 0x7f0c0072

    new-instance v5, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6$1;

    invoke-direct {v5, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6$1;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;)V

    invoke-virtual/range {v0 .. v5}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->showErrorPanel(IIIILjava/lang/Runnable;)V

    goto :goto_0
.end method
