.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$4;
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
    .line 1105
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$4;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1108
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .line 1110
    .local v0, "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$4;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCardClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$400(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1111
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$4;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCardClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$400(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;->onCommentCardClick(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    .line 1113
    :cond_0
    return-void
.end method
