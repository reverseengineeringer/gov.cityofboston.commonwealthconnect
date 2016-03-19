.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$6;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V
    .locals 0

    .prologue
    .line 1131
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$6;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1136
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 1138
    .local v0, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$6;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$600(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1139
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$6;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$600(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;->onIssueClick(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 1141
    :cond_0
    return-void
.end method
