.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$8;
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
    .line 1156
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$8;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1159
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 1160
    .local v0, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$8;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->activity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$200(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    const-string/jumbo v2, "issue"

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFlagDialog(Ljava/lang/String;I)V

    .line 1161
    return-void
.end method
