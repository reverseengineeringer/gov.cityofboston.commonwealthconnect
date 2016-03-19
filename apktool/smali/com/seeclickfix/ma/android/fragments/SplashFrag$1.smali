.class Lcom/seeclickfix/ma/android/fragments/SplashFrag$1;
.super Ljava/lang/Object;
.source "SplashFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/SplashFrag;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/SplashFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/SplashFrag;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/SplashFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/SplashFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 44
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 45
    new-instance v0, Lcom/seeclickfix/ma/android/events/SplashContinueEvent;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/events/SplashContinueEvent;-><init>()V

    # invokes: Lcom/seeclickfix/ma/android/fragments/SplashFrag;->postEvent(Ljava/lang/Object;)V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->access$000(Ljava/lang/Object;)V

    .line 46
    return-void
.end method
