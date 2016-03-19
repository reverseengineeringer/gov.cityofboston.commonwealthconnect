.class public Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;
.super Ljava/lang/Object;
.source "SwipeDismissListViewTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;,
        Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$OnDismissCallback;
    }
.end annotation


# instance fields
.field private mAnimationTime:J

.field private mCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$OnDismissCallback;

.field private mDismissAnimationRefCount:I

.field private mDownPosition:I

.field private mDownView:Landroid/view/View;

.field private mDownX:F

.field private mListView:Landroid/widget/ListView;

.field private mMaxFlingVelocity:I

.field private mMinFlingVelocity:I

.field private mPaused:Z

.field private mPendingDismisses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;",
            ">;"
        }
    .end annotation
.end field

.field private mSlop:I

.field private mSwiping:Z

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mViewWidth:I


# direct methods
.method public constructor <init>(Landroid/widget/ListView;Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$OnDismissCallback;)V
    .locals 4
    .param p1, "listView"    # Landroid/widget/ListView;
    .param p2, "callback"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$OnDismissCallback;

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    const/4 v1, 0x1

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mViewWidth:I

    .line 94
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mPendingDismisses:Ljava/util/List;

    .line 95
    const/4 v1, 0x0

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    .line 127
    invoke-virtual {p1}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 128
    .local v0, "vc":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mSlop:I

    .line 129
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mMinFlingVelocity:I

    .line 130
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mMaxFlingVelocity:I

    .line 131
    invoke-virtual {p1}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e0000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    iput-wide v2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mAnimationTime:J

    .line 133
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    .line 134
    iput-object p2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$OnDismissCallback;

    .line 135
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;Landroid/view/View;I)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # I

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->performDismiss(Landroid/view/View;I)V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;)I
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    .prologue
    .line 81
    iget v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    return v0
.end method

.method static synthetic access$106(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;)I
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    .prologue
    .line 81
    iget v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    return v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mPendingDismisses:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;)Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$OnDismissCallback;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$OnDismissCallback;

    return-object v0
.end method

.method private performDismiss(Landroid/view/View;I)V
    .locals 6
    .param p1, "dismissView"    # Landroid/view/View;
    .param p2, "dismissPosition"    # I

    .prologue
    const/4 v5, 0x1

    .line 314
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 315
    .local v1, "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 317
    .local v2, "originalHeight":I
    const/4 v3, 0x2

    new-array v3, v3, [I

    const/4 v4, 0x0

    aput v2, v3, v4

    aput v5, v3, v5

    invoke-static {v3}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v3

    iget-wide v4, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mAnimationTime:J

    invoke-virtual {v3, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 319
    .local v0, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    new-instance v3, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$3;

    invoke-direct {v3, p0, v2}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$3;-><init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;I)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 349
    new-instance v3, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;

    invoke-direct {v3, p0, v1, p1}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$4;-><init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;Landroid/view/ViewGroup$LayoutParams;Landroid/view/View;)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 357
    iget-object v3, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mPendingDismisses:Ljava/util/List;

    new-instance v4, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;

    invoke-direct {v4, p0, p2, p1}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;-><init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;ILandroid/view/View;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 359
    return-void
.end method


# virtual methods
.method public makeScrollListener()Landroid/widget/AbsListView$OnScrollListener;
    .locals 1

    .prologue
    .line 157
    new-instance v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$1;-><init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;)V

    return-object v0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 23
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 171
    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mViewWidth:I

    move/from16 v17, v0

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_0

    .line 172
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/ListView;->getWidth()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mViewWidth:I

    .line 175
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v17

    packed-switch v17, :pswitch_data_0

    .line 290
    :cond_1
    :goto_0
    const/16 v17, 0x0

    :goto_1
    return v17

    .line 177
    :pswitch_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mPaused:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 178
    const/16 v17, 0x0

    goto :goto_1

    .line 184
    :cond_2
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 185
    .local v12, "rect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/ListView;->getChildCount()I

    move-result v4

    .line 186
    .local v4, "childCount":I
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v11, v0, [I

    .line 187
    .local v11, "listViewCoords":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Landroid/widget/ListView;->getLocationOnScreen([I)V

    .line 188
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v17

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    const/16 v18, 0x0

    aget v18, v11, v18

    sub-int v15, v17, v18

    .line 189
    .local v15, "x":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v17

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    const/16 v18, 0x1

    aget v18, v11, v18

    sub-int v16, v17, v18

    .line 191
    .local v16, "y":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_2
    if-ge v10, v4, :cond_3

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 193
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3, v12}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 194
    move/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Landroid/graphics/Rect;->contains(II)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 195
    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    .line 200
    .end local v3    # "child":Landroid/view/View;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    move-object/from16 v17, v0

    if-eqz v17, :cond_4

    .line 201
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownX:F

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/widget/ListView;->getPositionForView(Landroid/view/View;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownPosition:I

    .line 204
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 207
    :cond_4
    invoke-virtual/range {p1 .. p2}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 208
    const/16 v17, 0x1

    goto/16 :goto_1

    .line 191
    .restart local v3    # "child":Landroid/view/View;
    :cond_5
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 212
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "childCount":I
    .end local v10    # "i":I
    .end local v11    # "listViewCoords":[I
    .end local v12    # "rect":Landroid/graphics/Rect;
    .end local v15    # "x":I
    .end local v16    # "y":I
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    if-eqz v17, :cond_1

    .line 216
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownX:F

    move/from16 v18, v0

    sub-float v5, v17, v18

    .line 217
    .local v5, "deltaX":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    const/16 v18, 0x3e8

    invoke-virtual/range {v17 .. v18}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->abs(F)F

    move-result v13

    .line 220
    .local v13, "velocityX":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->abs(F)F

    move-result v14

    .line 221
    .local v14, "velocityY":F
    const/4 v6, 0x0

    .line 222
    .local v6, "dismiss":Z
    const/4 v7, 0x0

    .line 223
    .local v7, "dismissRight":Z
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mViewWidth:I

    move/from16 v18, v0

    div-int/lit8 v18, v18, 0x2

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    cmpl-float v17, v17, v18

    if-lez v17, :cond_8

    .line 224
    const/4 v6, 0x1

    .line 225
    const/16 v17, 0x0

    cmpl-float v17, v5, v17

    if-lez v17, :cond_7

    const/4 v7, 0x1

    .line 231
    :cond_6
    :goto_3
    if-eqz v6, :cond_b

    .line 233
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    .line 234
    .local v9, "downView":Landroid/view/View;
    move-object/from16 v0, p0

    iget v8, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownPosition:I

    .line 235
    .local v8, "downPosition":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v18

    if-eqz v7, :cond_a

    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mViewWidth:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    :goto_4
    move-object/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v17

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v17

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mAnimationTime:J

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v17

    new-instance v18, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v9, v8}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$2;-><init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;Landroid/view/View;I)V

    invoke-virtual/range {v17 .. v18}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    .line 254
    .end local v8    # "downPosition":I
    .end local v9    # "downView":Landroid/view/View;
    :goto_5
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 255
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownX:F

    .line 256
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    .line 257
    const/16 v17, -0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownPosition:I

    .line 258
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mSwiping:Z

    goto/16 :goto_0

    .line 225
    :cond_7
    const/4 v7, 0x0

    goto :goto_3

    .line 226
    :cond_8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mMinFlingVelocity:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    cmpg-float v17, v17, v13

    if-gtz v17, :cond_6

    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mMaxFlingVelocity:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    cmpg-float v17, v13, v17

    if-gtz v17, :cond_6

    cmpg-float v17, v14, v13

    if-gez v17, :cond_6

    .line 228
    const/4 v6, 0x1

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v17

    const/16 v18, 0x0

    cmpl-float v17, v17, v18

    if-lez v17, :cond_9

    const/4 v7, 0x1

    :goto_6
    goto/16 :goto_3

    :cond_9
    const/4 v7, 0x0

    goto :goto_6

    .line 236
    .restart local v8    # "downPosition":I
    .restart local v9    # "downView":Landroid/view/View;
    :cond_a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mViewWidth:I

    move/from16 v17, v0

    move/from16 v0, v17

    neg-int v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    goto/16 :goto_4

    .line 248
    .end local v8    # "downPosition":I
    .end local v9    # "downView":Landroid/view/View;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v17

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v17

    const/high16 v18, 0x3f800000    # 1.0f

    invoke-virtual/range {v17 .. v18}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v17

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mAnimationTime:J

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v17

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    goto/16 :goto_5

    .line 263
    .end local v5    # "deltaX":F
    .end local v6    # "dismiss":Z
    .end local v7    # "dismissRight":Z
    .end local v13    # "velocityX":F
    .end local v14    # "velocityY":F
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    if-eqz v17, :cond_1

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mPaused:Z

    move/from16 v17, v0

    if-nez v17, :cond_1

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 268
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownX:F

    move/from16 v18, v0

    sub-float v5, v17, v18

    .line 269
    .restart local v5    # "deltaX":F
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mSlop:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    cmpl-float v17, v17, v18

    if-lez v17, :cond_c

    .line 270
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mSwiping:Z

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Landroid/widget/ListView;->requestDisallowInterceptTouchEvent(Z)V

    .line 274
    invoke-static/range {p2 .. p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v2

    .line 275
    .local v2, "cancelEvent":Landroid/view/MotionEvent;
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v17

    shl-int/lit8 v17, v17, 0x8

    or-int/lit8 v17, v17, 0x3

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 278
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 281
    .end local v2    # "cancelEvent":Landroid/view/MotionEvent;
    :cond_c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mSwiping:Z

    move/from16 v17, v0

    if-eqz v17, :cond_1

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v5}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const/high16 v19, 0x3f800000    # 1.0f

    const/high16 v20, 0x3f800000    # 1.0f

    const/high16 v21, 0x40000000    # 2.0f

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v22

    mul-float v21, v21, v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mViewWidth:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    div-float v21, v21, v22

    sub-float v20, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->min(FF)F

    move-result v19

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(FF)F

    move-result v18

    invoke-static/range {v17 .. v18}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 285
    const/16 v17, 0x1

    goto/16 :goto_1

    .line 175
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 143
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;->mPaused:Z

    .line 144
    return-void

    .line 143
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
