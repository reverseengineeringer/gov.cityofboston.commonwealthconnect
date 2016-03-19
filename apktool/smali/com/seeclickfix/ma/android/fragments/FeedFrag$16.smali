.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setupListeners()V
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
    .line 878
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIssueStarClick(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 3
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 882
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1202(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 883
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setScrollData()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1300(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    .line 884
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16$1;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;)V

    new-instance v2, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16$2;

    invoke-direct {v2, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16$2;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;)V

    invoke-static {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->followWarning(Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z

    .line 898
    return-void
.end method
