.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$19$1;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;->onErrorResponse(Lcom/android/volley/VolleyError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;)V
    .locals 0

    .prologue
    .line 1070
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1073
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 1074
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19$1;->this$1:Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->runZoneRequest()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1600(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    .line 1075
    return-void
.end method
