.class final Lcom/seeclickfix/ma/android/fragments/SplashFrag$2;
.super Ljava/lang/Object;
.source "SplashFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/SplashFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 54
    new-instance v0, Lcom/seeclickfix/ma/android/events/SplashContinueEvent;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/events/SplashContinueEvent;-><init>()V

    # invokes: Lcom/seeclickfix/ma/android/fragments/SplashFrag;->postEvent(Ljava/lang/Object;)V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->access$100(Ljava/lang/Object;)V

    .line 55
    return-void
.end method
