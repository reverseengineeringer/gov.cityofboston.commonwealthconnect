.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$3;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


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
    .line 530
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 534
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->onScrollListener:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setOnScrollListener(Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;)V

    .line 535
    return-void
.end method
