.class Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$7;
.super Ljava/lang/Object;
.source "IssueDetailsFrag.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->scrollToBottom()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

.field final synthetic val$svChild:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Landroid/view/ViewGroup;)V
    .locals 0

    .prologue
    .line 1052
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$7;->val$svChild:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .prologue
    .line 1058
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$7;->val$svChild:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1059
    .local v0, "obs":Landroid/view/ViewTreeObserver;
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1060
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->doScrollToBottom()V

    .line 1061
    return-void
.end method
