.class public Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;
.super Ljava/lang/Object;
.source "SwipeDismissTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;
    }
.end annotation


# instance fields
.field private mAnimationTime:J

.field private mCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;

.field private mDownX:F

.field private mMaxFlingVelocity:I

.field private mMinFlingVelocity:I

.field private mSlop:I

.field private mSwiping:Z

.field private mToken:Ljava/lang/Object;

.field private mTranslationX:F

.field private mUndoView:Landroid/view/View;

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mView:Landroid/view/View;

.field private mViewWidth:I


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/Object;Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "token"    # Ljava/lang/Object;
    .param p3, "callback"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const/4 v1, 0x1

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mViewWidth:I

    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 102
    .local v0, "vc":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mSlop:I

    .line 103
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    mul-int/lit8 v1, v1, 0xa

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mMinFlingVelocity:I

    .line 104
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mMaxFlingVelocity:I

    .line 105
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e0000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    iput-wide v2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mAnimationTime:J

    .line 107
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    .line 108
    iput-object p2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mToken:Ljava/lang/Object;

    .line 109
    iput-object p3, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;

    .line 110
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->performDismiss()V

    return-void
.end method

.method private performDismiss()V
    .locals 3

    .prologue
    .line 226
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mToken:Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;->onDismiss(Landroid/view/View;Ljava/lang/Object;)V

    .line 254
    return-void
.end method

.method private showUndoRow()V
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mUndoView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 219
    :cond_0
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 13
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v12, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v10, 0x0

    .line 115
    iget v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mTranslationX:F

    invoke-virtual {p2, v8, v10}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 117
    iget v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mViewWidth:I

    const/4 v9, 0x2

    if-ge v8, v9, :cond_0

    .line 118
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    iput v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mViewWidth:I

    .line 121
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v8

    packed-switch v8, :pswitch_data_0

    .line 207
    :cond_1
    :goto_0
    return v7

    .line 124
    :pswitch_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    iput v6, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mDownX:F

    .line 125
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v6

    iput-object v6, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 126
    iget-object v6, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 127
    invoke-virtual {p1, p2}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_0

    .line 132
    :pswitch_1
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v8, :cond_1

    .line 136
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget v9, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mDownX:F

    sub-float v1, v8, v9

    .line 137
    .local v1, "deltaX":F
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 138
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v9, 0x3e8

    invoke-virtual {v8, v9}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 139
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 140
    .local v4, "velocityX":F
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 141
    .local v5, "velocityY":F
    const/4 v2, 0x0

    .line 142
    .local v2, "dismiss":Z
    const/4 v3, 0x0

    .line 143
    .local v3, "dismissRight":Z
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v8

    iget v9, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mViewWidth:I

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_4

    .line 144
    const/4 v2, 0x1

    .line 145
    cmpl-float v8, v1, v10

    if-lez v8, :cond_3

    move v3, v6

    .line 151
    :cond_2
    :goto_1
    if-eqz v2, :cond_7

    .line 153
    iget-object v6, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-static {v6}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v8

    if-eqz v3, :cond_6

    iget v6, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mViewWidth:I

    int-to-float v6, v6

    :goto_2
    invoke-virtual {v8, v6}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v6

    iget-wide v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mAnimationTime:J

    invoke-virtual {v6, v8, v9}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v6

    new-instance v8, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$1;

    invoke-direct {v8, p0}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$1;-><init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;)V

    invoke-virtual {v6, v8}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    .line 171
    :goto_3
    iput-object v12, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 172
    iput v10, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mTranslationX:F

    .line 173
    iput v10, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mDownX:F

    .line 174
    iput-boolean v7, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mSwiping:Z

    goto/16 :goto_0

    :cond_3
    move v3, v7

    .line 145
    goto :goto_1

    .line 146
    :cond_4
    iget v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mMinFlingVelocity:I

    int-to-float v8, v8

    cmpg-float v8, v8, v4

    if-gtz v8, :cond_2

    iget v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mMaxFlingVelocity:I

    int-to-float v8, v8

    cmpg-float v8, v4, v8

    if-gtz v8, :cond_2

    cmpg-float v8, v5, v4

    if-gez v8, :cond_2

    .line 148
    const/4 v2, 0x1

    .line 149
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v8

    cmpl-float v8, v8, v10

    if-lez v8, :cond_5

    move v3, v6

    :goto_4
    goto :goto_1

    :cond_5
    move v3, v7

    goto :goto_4

    .line 153
    :cond_6
    iget v6, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mViewWidth:I

    neg-int v6, v6

    int-to-float v6, v6

    goto :goto_2

    .line 165
    :cond_7
    iget-object v6, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-static {v6}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v6

    invoke-virtual {v6, v11}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v6

    iget-wide v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mAnimationTime:J

    invoke-virtual {v6, v8, v9}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v6

    invoke-virtual {v6, v12}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    goto :goto_3

    .line 179
    .end local v1    # "deltaX":F
    .end local v2    # "dismiss":Z
    .end local v3    # "dismissRight":Z
    .end local v4    # "velocityX":F
    .end local v5    # "velocityY":F
    :pswitch_2
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v8, :cond_1

    .line 183
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 184
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget v9, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mDownX:F

    sub-float v1, v8, v9

    .line 185
    .restart local v1    # "deltaX":F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v8

    iget v9, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mSlop:I

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_8

    .line 186
    iput-boolean v6, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mSwiping:Z

    .line 187
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    invoke-interface {v8, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 190
    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    .line 191
    .local v0, "cancelEvent":Landroid/view/MotionEvent;
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v8

    shl-int/lit8 v8, v8, 0x8

    or-int/lit8 v8, v8, 0x3

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->setAction(I)V

    .line 193
    iget-object v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v8, v0}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 196
    .end local v0    # "cancelEvent":Landroid/view/MotionEvent;
    :cond_8
    iget-boolean v8, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v8, :cond_1

    .line 197
    iput v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mTranslationX:F

    .line 198
    iget-object v7, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-static {v7, v1}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    .line 200
    iget-object v7, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mView:Landroid/view/View;

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v9

    mul-float/2addr v8, v9

    iget v9, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mViewWidth:I

    int-to-float v9, v9

    div-float/2addr v8, v9

    sub-float v8, v11, v8

    invoke-static {v11, v8}, Ljava/lang/Math;->min(FF)F

    move-result v8

    invoke-static {v10, v8}, Ljava/lang/Math;->max(FF)F

    move-result v8

    invoke-static {v7, v8}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    move v7, v6

    .line 202
    goto/16 :goto_0

    .line 121
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setUndoResId(ILandroid/view/ViewGroup;)V
    .locals 1
    .param p1, "resId"    # I
    .param p2, "container"    # Landroid/view/ViewGroup;

    .prologue
    .line 211
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;->mUndoView:Landroid/view/View;

    .line 212
    return-void
.end method
