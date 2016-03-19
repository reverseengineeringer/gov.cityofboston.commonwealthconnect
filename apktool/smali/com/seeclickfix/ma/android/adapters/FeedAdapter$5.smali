.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$5;
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
    .line 1115
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$5;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1118
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .local v1, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    move-object v0, p1

    .line 1120
    check-cast v0, Landroid/widget/CheckBox;

    .line 1124
    .local v0, "cb":Landroid/widget/CheckBox;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$5;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueStarListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$500(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1125
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$5;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueStarListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$500(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;->onIssueStarClick(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 1127
    :cond_0
    return-void
.end method
