.class public Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "UnboxingPagerFrag.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$MyGestureDetector;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final SWIPE_MAX_OFF_PATH:I = 0xfa

.field private static final SWIPE_MIN_DISTANCE:I = 0x78

.field private static final SWIPE_THRESHOLD_VELOCITY:I = 0xc8

.field private static final TAG:Ljava/lang/String; = "PagerFrag"


# instance fields
.field private final MAX_PAGES:I

.field private c:Landroid/content/Context;

.field private circlePageIndicator:Lcom/viewpagerindicator/CirclePageIndicator;

.field private continueBtn:Landroid/widget/ImageButton;

.field private currentPage:I

.field private gestureDetector:Landroid/view/GestureDetector;

.field gestureListener:Landroid/view/View$OnTouchListener;

.field mAdapter:Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;

.field mPager:Landroid/support/v4/view/ViewPager;

.field private pageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private skipBtn:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I

    .line 42
    const/4 v0, 0x3

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->MAX_PAGES:I

    .line 183
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->skipBtn:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->advanceToHome()V

    return-void
.end method

.method static synthetic access$202(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;I)I
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I

    return p1
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)Landroid/view/GestureDetector;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->gestureDetector:Landroid/view/GestureDetector;

    return-object v0
.end method

.method private advanceToHome()V
    .locals 1

    .prologue
    .line 234
    new-instance v0, Lcom/seeclickfix/ma/android/events/UnboxingContinueEvent;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/events/UnboxingContinueEvent;-><init>()V

    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->postEvent(Ljava/lang/Object;)V

    .line 235
    return-void
.end method

.method private setCurrentPage(I)V
    .locals 2
    .param p1, "pageToSet"    # I

    .prologue
    .line 209
    if-gtz p1, :cond_0

    .line 210
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I

    .line 212
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->mPager:Landroid/support/v4/view/ViewPager;

    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 224
    :goto_0
    return-void

    .line 213
    :cond_0
    const/4 v0, 0x3

    if-lt p1, v0, :cond_1

    .line 214
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->advanceToHome()V

    goto :goto_0

    .line 219
    :cond_1
    iput p1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I

    .line 221
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->mPager:Landroid/support/v4/view/ViewPager;

    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_0
.end method

.method private setSwipeListener()V
    .locals 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->rootFrag:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOverScrollMode(I)V

    .line 172
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$MyGestureDetector;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$MyGestureDetector;-><init>(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V

    invoke-direct {v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->gestureDetector:Landroid/view/GestureDetector;

    .line 173
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->gestureListener:Landroid/view/View$OnTouchListener;

    .line 179
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->gestureListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 180
    return-void
.end method

.method private setupListeners()V
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a0121

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->skipBtn:Landroid/widget/TextView;

    .line 122
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->skipBtn:Landroid/widget/TextView;

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->pageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 165
    return-void
.end method


# virtual methods
.method public checkForFinishSwipe()V
    .locals 2

    .prologue
    .line 227
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->currentPage:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 228
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->advanceToHome()V

    .line 231
    :cond_0
    return-void
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    return-object v0
.end method

.method public getShouldShowActionBar()Z
    .locals 1

    .prologue
    .line 239
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 70
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->c:Landroid/content/Context;

    .line 71
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;-><init>(Landroid/support/v4/app/Fragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->mAdapter:Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;

    .line 72
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a011e

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->mPager:Landroid/support/v4/view/ViewPager;

    .line 73
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a0120

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/viewpagerindicator/CirclePageIndicator;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->circlePageIndicator:Lcom/viewpagerindicator/CirclePageIndicator;

    .line 75
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->setupListeners()V

    .line 77
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->mAdapter:Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 78
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->circlePageIndicator:Lcom/viewpagerindicator/CirclePageIndicator;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->mPager:Landroid/support/v4/view/ViewPager;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/viewpagerindicator/CirclePageIndicator;->setViewPager(Landroid/support/v4/view/ViewPager;I)V

    .line 79
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->circlePageIndicator:Lcom/viewpagerindicator/CirclePageIndicator;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->pageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-virtual {v0, v1}, Lcom/viewpagerindicator/CirclePageIndicator;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 81
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->setSwipeListener()V

    .line 84
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 57
    if-nez p2, :cond_0

    .line 58
    const/4 v0, 0x0

    .line 62
    :goto_0
    return-object v0

    .line 60
    :cond_0
    const v0, 0x7f03003e

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 62
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 93
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 94
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/actionbarsherlock/app/ActionBar;->hide()V

    .line 95
    return-void
.end method
