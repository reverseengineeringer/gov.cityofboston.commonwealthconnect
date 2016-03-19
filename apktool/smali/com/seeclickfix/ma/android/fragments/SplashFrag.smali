.class public Lcom/seeclickfix/ma/android/fragments/SplashFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "SplashFrag.java"


# static fields
.field static handler:Landroid/os/Handler;

.field private static runnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->handler:Landroid/os/Handler;

    .line 51
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/SplashFrag$2;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/SplashFrag$2;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->runnable:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/Object;

    .prologue
    .line 17
    invoke-static {p0}, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->postEvent(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$100(Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/Object;

    .prologue
    .line 17
    invoke-static {p0}, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->postEvent(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x0

    return-object v0
.end method

.method public getShouldShowActionBar()Z
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    if-nez p2, :cond_0

    .line 25
    const/4 v0, 0x0

    .line 29
    :goto_0
    return-object v0

    .line 27
    :cond_0
    const v0, 0x7f030039

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 29
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 60
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onPause()V

    .line 61
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->handler:Landroid/os/Handler;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 62
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 40
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 41
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->rootFrag:Landroid/view/ViewGroup;

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/SplashFrag$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/SplashFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/SplashFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->handler:Landroid/os/Handler;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/SplashFrag;->runnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x9c4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 49
    return-void
.end method
