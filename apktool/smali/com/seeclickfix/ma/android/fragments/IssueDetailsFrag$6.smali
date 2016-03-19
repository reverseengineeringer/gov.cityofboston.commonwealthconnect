.class Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$6;
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
    .line 901
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 907
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 908
    return-void
.end method
