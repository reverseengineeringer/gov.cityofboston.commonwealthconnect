.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$8;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showMustLogInForMyReports()V
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
    .line 662
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 666
    new-instance v0, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$700(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;-><init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->postEvent(Ljava/lang/Object;)V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$800(Ljava/lang/Object;)V

    .line 667
    return-void
.end method
