.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$2;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->dispatchReportUriEvent(Ljava/lang/String;Landroid/view/View;)V
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
    .line 1086
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$2;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1089
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    new-instance v1, Lcom/seeclickfix/ma/android/events/ShowReportEvent;

    const-string/jumbo v2, "zone-card"

    invoke-direct {v1, v2}, Lcom/seeclickfix/ma/android/events/ShowReportEvent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 1090
    return-void
.end method
