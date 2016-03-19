.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$10;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;


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
    .line 713
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollToPosition(II)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "total"    # I

    .prologue
    .line 718
    if-gez p1, :cond_1

    .line 730
    :cond_0
    :goto_0
    return-void

    .line 720
    :cond_1
    if-lez p2, :cond_0

    .line 724
    add-int/lit8 v0, p2, -0x7

    if-le p1, v0, :cond_0

    .line 725
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 726
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadMore()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1000(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    goto :goto_0
.end method
