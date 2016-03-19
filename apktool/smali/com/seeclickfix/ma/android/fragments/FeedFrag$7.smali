.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$7;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getNoIssueNoticeItem()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
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
    .line 645
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 648
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onClickButton(ILjava/lang/Object;)V

    .line 649
    return-void
.end method
