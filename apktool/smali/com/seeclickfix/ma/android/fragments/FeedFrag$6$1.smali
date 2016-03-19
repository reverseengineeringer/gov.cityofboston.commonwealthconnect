.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$6$1;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->onErrorResponse(Lcom/android/volley/VolleyError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;)V
    .locals 0

    .prologue
    .line 607
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 610
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 611
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->startLoading()V

    .line 612
    return-void
.end method
