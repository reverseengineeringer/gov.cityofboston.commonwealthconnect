package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.graphics.drawable.shapes.Shape;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.ViewDebug.ExportedProperty;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.Transformation;
import android.widget.RemoteViews.RemoteView;

@RemoteViews.RemoteView
public class IcsProgressBar
  extends View
{
  private static final int ANIMATION_RESOLUTION = 200;
  private static final boolean IS_HONEYCOMB;
  private static final int MAX_LEVEL = 10000;
  private static final int[] ProgressBar;
  private static final int ProgressBar_animationResolution = 14;
  private static final int ProgressBar_indeterminate = 5;
  private static final int ProgressBar_indeterminateBehavior = 10;
  private static final int ProgressBar_indeterminateDrawable = 7;
  private static final int ProgressBar_indeterminateDuration = 9;
  private static final int ProgressBar_indeterminateOnly = 6;
  private static final int ProgressBar_interpolator = 13;
  private static final int ProgressBar_max = 2;
  private static final int ProgressBar_maxHeight = 1;
  private static final int ProgressBar_maxWidth = 0;
  private static final int ProgressBar_minHeight = 12;
  private static final int ProgressBar_minWidth = 11;
  private static final int ProgressBar_progress = 3;
  private static final int ProgressBar_progressDrawable = 8;
  private static final int ProgressBar_secondaryProgress = 4;
  private static final int TIMEOUT_SEND_ACCESSIBILITY_EVENT = 200;
  private AccessibilityEventSender mAccessibilityEventSender;
  private AccessibilityManager mAccessibilityManager;
  private AlphaAnimation mAnimation;
  private int mAnimationResolution;
  private int mBehavior;
  private Drawable mCurrentDrawable;
  private int mDuration;
  private boolean mInDrawing;
  private boolean mIndeterminate;
  private Drawable mIndeterminateDrawable;
  private int mIndeterminateRealLeft;
  private int mIndeterminateRealTop;
  private Interpolator mInterpolator;
  private long mLastDrawTime;
  private int mMax;
  int mMaxHeight;
  int mMaxWidth;
  int mMinHeight;
  int mMinWidth;
  private boolean mNoInvalidate;
  private boolean mOnlyIndeterminate;
  private int mProgress;
  private Drawable mProgressDrawable;
  private RefreshProgressRunnable mRefreshProgressRunnable;
  Bitmap mSampleTile;
  private int mSecondaryProgress;
  private boolean mShouldStartAnimationDrawable;
  private Transformation mTransformation;
  private long mUiThreadId = Thread.currentThread().getId();
  
  static
  {
    if (Build.VERSION.SDK_INT >= 11) {}
    for (boolean bool = true;; bool = false)
    {
      IS_HONEYCOMB = bool;
      ProgressBar = new int[] { 16843039, 16843040, 16843062, 16843063, 16843064, 16843065, 16843066, 16843067, 16843068, 16843069, 16843070, 16843071, 16843072, 16843073, 16843546 };
      return;
    }
  }
  
  public IcsProgressBar(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public IcsProgressBar(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842871);
  }
  
  public IcsProgressBar(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, 0);
  }
  
  public IcsProgressBar(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    super(paramContext, paramAttributeSet, paramInt1);
    initProgressBar();
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, ProgressBar, paramInt1, paramInt2);
    mNoInvalidate = true;
    Drawable localDrawable = paramAttributeSet.getDrawable(8);
    if (localDrawable != null) {
      setProgressDrawable(tileify(localDrawable, false));
    }
    mDuration = paramAttributeSet.getInt(9, mDuration);
    mMinWidth = paramAttributeSet.getDimensionPixelSize(11, mMinWidth);
    mMaxWidth = paramAttributeSet.getDimensionPixelSize(0, mMaxWidth);
    mMinHeight = paramAttributeSet.getDimensionPixelSize(12, mMinHeight);
    mMaxHeight = paramAttributeSet.getDimensionPixelSize(1, mMaxHeight);
    mBehavior = paramAttributeSet.getInt(10, mBehavior);
    paramInt1 = paramAttributeSet.getResourceId(13, 17432587);
    if (paramInt1 > 0) {
      setInterpolator(paramContext, paramInt1);
    }
    setMax(paramAttributeSet.getInt(2, mMax));
    setProgress(paramAttributeSet.getInt(3, mProgress));
    setSecondaryProgress(paramAttributeSet.getInt(4, mSecondaryProgress));
    localDrawable = paramAttributeSet.getDrawable(7);
    if (localDrawable != null) {
      setIndeterminateDrawable(tileifyIndeterminate(localDrawable));
    }
    mOnlyIndeterminate = paramAttributeSet.getBoolean(6, mOnlyIndeterminate);
    mNoInvalidate = false;
    if ((mOnlyIndeterminate) || (paramAttributeSet.getBoolean(5, mIndeterminate))) {
      bool = true;
    }
    setIndeterminate(bool);
    mAnimationResolution = paramAttributeSet.getInteger(14, 200);
    paramAttributeSet.recycle();
    mAccessibilityManager = ((AccessibilityManager)paramContext.getSystemService("accessibility"));
  }
  
  private void doRefreshProgress(int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
  {
    for (;;)
    {
      try
      {
        float f;
        Drawable localDrawable2;
        Drawable localDrawable1;
        if (mMax > 0)
        {
          f = paramInt2 / mMax;
          localDrawable2 = mCurrentDrawable;
          if (localDrawable2 != null)
          {
            localDrawable1 = null;
            if (!(localDrawable2 instanceof LayerDrawable)) {
              break label111;
            }
            localDrawable1 = ((LayerDrawable)localDrawable2).findDrawableByLayerId(paramInt1);
            break label111;
            localDrawable1.setLevel(paramInt2);
            if ((paramBoolean2) && (paramInt1 == 16908301)) {
              onProgressRefresh(f, paramBoolean1);
            }
          }
        }
        else
        {
          f = 0.0F;
          continue;
          localDrawable1 = localDrawable2;
          continue;
        }
        invalidate();
        continue;
        paramInt2 = (int)(10000.0F * f);
      }
      finally {}
      label111:
      if (localObject == null) {}
    }
  }
  
  private void initProgressBar()
  {
    mMax = 100;
    mProgress = 0;
    mSecondaryProgress = 0;
    mIndeterminate = false;
    mOnlyIndeterminate = false;
    mDuration = 4000;
    mBehavior = 1;
    mMinWidth = 24;
    mMaxWidth = 48;
    mMinHeight = 24;
    mMaxHeight = 48;
  }
  
  private void refreshProgress(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    for (;;)
    {
      try
      {
        if (mUiThreadId == Thread.currentThread().getId())
        {
          doRefreshProgress(paramInt1, paramInt2, paramBoolean, true);
          return;
        }
        if (mRefreshProgressRunnable != null)
        {
          RefreshProgressRunnable localRefreshProgressRunnable1 = mRefreshProgressRunnable;
          mRefreshProgressRunnable = null;
          localRefreshProgressRunnable1.setup(paramInt1, paramInt2, paramBoolean);
          post(localRefreshProgressRunnable1);
        }
        else
        {
          RefreshProgressRunnable localRefreshProgressRunnable2 = new RefreshProgressRunnable(paramInt1, paramInt2, paramBoolean);
        }
      }
      finally {}
    }
  }
  
  private void scheduleAccessibilityEventSender()
  {
    if (mAccessibilityEventSender == null) {
      mAccessibilityEventSender = new AccessibilityEventSender(null);
    }
    for (;;)
    {
      postDelayed(mAccessibilityEventSender, 200L);
      return;
      removeCallbacks(mAccessibilityEventSender);
    }
  }
  
  private Drawable tileify(Drawable paramDrawable, boolean paramBoolean)
  {
    Object localObject;
    if ((paramDrawable instanceof LayerDrawable))
    {
      LayerDrawable localLayerDrawable = (LayerDrawable)paramDrawable;
      int j = localLayerDrawable.getNumberOfLayers();
      paramDrawable = new Drawable[j];
      int i = 0;
      if (i < j)
      {
        int k = localLayerDrawable.getId(i);
        localObject = localLayerDrawable.getDrawable(i);
        if ((k == 16908301) || (k == 16908303)) {}
        for (paramBoolean = true;; paramBoolean = false)
        {
          paramDrawable[i] = tileify((Drawable)localObject, paramBoolean);
          i += 1;
          break;
        }
      }
      localObject = new LayerDrawable(paramDrawable);
      i = 0;
      for (;;)
      {
        paramDrawable = (Drawable)localObject;
        if (i >= j) {
          break;
        }
        ((LayerDrawable)localObject).setId(i, localLayerDrawable.getId(i));
        i += 1;
      }
    }
    if ((paramDrawable instanceof BitmapDrawable))
    {
      paramDrawable = ((BitmapDrawable)paramDrawable).getBitmap();
      if (mSampleTile == null) {
        mSampleTile = paramDrawable;
      }
      localObject = new ShapeDrawable(getDrawableShape());
      paramDrawable = new BitmapShader(paramDrawable, Shader.TileMode.REPEAT, Shader.TileMode.CLAMP);
      ((ShapeDrawable)localObject).getPaint().setShader(paramDrawable);
      paramDrawable = (Drawable)localObject;
      if (paramBoolean) {
        paramDrawable = new ClipDrawable((Drawable)localObject, 3, 1);
      }
      return paramDrawable;
    }
    return paramDrawable;
  }
  
  private Drawable tileifyIndeterminate(Drawable paramDrawable)
  {
    Object localObject = paramDrawable;
    if ((paramDrawable instanceof AnimationDrawable))
    {
      paramDrawable = (AnimationDrawable)paramDrawable;
      int j = paramDrawable.getNumberOfFrames();
      localObject = new AnimationDrawable();
      ((AnimationDrawable)localObject).setOneShot(paramDrawable.isOneShot());
      int i = 0;
      while (i < j)
      {
        Drawable localDrawable = tileify(paramDrawable.getFrame(i), true);
        localDrawable.setLevel(10000);
        ((AnimationDrawable)localObject).addFrame(localDrawable, paramDrawable.getDuration(i));
        i += 1;
      }
      ((AnimationDrawable)localObject).setLevel(10000);
    }
    return (Drawable)localObject;
  }
  
  private void updateDrawableBounds(int paramInt1, int paramInt2)
  {
    int k = paramInt1 - getPaddingRight() - getPaddingLeft();
    int m = paramInt2 - getPaddingBottom() - getPaddingTop();
    int i2 = 0;
    int i3 = 0;
    int i = m;
    int j = k;
    int i1;
    int n;
    float f1;
    if (mIndeterminateDrawable != null)
    {
      i = m;
      i1 = i3;
      j = k;
      n = i2;
      if (mOnlyIndeterminate)
      {
        i = m;
        i1 = i3;
        j = k;
        n = i2;
        if (!(mIndeterminateDrawable instanceof AnimationDrawable))
        {
          i = mIndeterminateDrawable.getIntrinsicWidth();
          j = mIndeterminateDrawable.getIntrinsicHeight();
          f1 = i / j;
          float f2 = paramInt1 / paramInt2;
          i = m;
          i1 = i3;
          j = k;
          n = i2;
          if (f1 != f2)
          {
            if (f2 <= f1) {
              break label238;
            }
            paramInt2 = (int)(paramInt2 * f1);
            i1 = (paramInt1 - paramInt2) / 2;
            j = i1 + paramInt2;
            n = i2;
            i = m;
          }
        }
      }
    }
    for (;;)
    {
      mIndeterminateDrawable.setBounds(0, 0, j - i1, i - n);
      mIndeterminateRealLeft = i1;
      mIndeterminateRealTop = n;
      if (mProgressDrawable != null) {
        mProgressDrawable.setBounds(0, 0, j, i);
      }
      return;
      label238:
      paramInt1 = (int)(paramInt1 * (1.0F / f1));
      n = (paramInt2 - paramInt1) / 2;
      i = n + paramInt1;
      i1 = i3;
      j = k;
    }
  }
  
  private void updateDrawableState()
  {
    int[] arrayOfInt = getDrawableState();
    if ((mProgressDrawable != null) && (mProgressDrawable.isStateful())) {
      mProgressDrawable.setState(arrayOfInt);
    }
    if ((mIndeterminateDrawable != null) && (mIndeterminateDrawable.isStateful())) {
      mIndeterminateDrawable.setState(arrayOfInt);
    }
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    updateDrawableState();
  }
  
  Drawable getCurrentDrawable()
  {
    return mCurrentDrawable;
  }
  
  Shape getDrawableShape()
  {
    return new RoundRectShape(new float[] { 5.0F, 5.0F, 5.0F, 5.0F, 5.0F, 5.0F, 5.0F, 5.0F }, null, null);
  }
  
  public Drawable getIndeterminateDrawable()
  {
    return mIndeterminateDrawable;
  }
  
  public Interpolator getInterpolator()
  {
    return mInterpolator;
  }
  
  @ViewDebug.ExportedProperty(category="progress")
  public int getMax()
  {
    try
    {
      int i = mMax;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  @ViewDebug.ExportedProperty(category="progress")
  public int getProgress()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 231	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminate	Z
    //   6: istore_2
    //   7: iload_2
    //   8: ifeq +9 -> 17
    //   11: iconst_0
    //   12: istore_1
    //   13: aload_0
    //   14: monitorexit
    //   15: iload_1
    //   16: ireturn
    //   17: aload_0
    //   18: getfield 208	com/actionbarsherlock/internal/widget/IcsProgressBar:mProgress	I
    //   21: istore_1
    //   22: goto -9 -> 13
    //   25: astore_3
    //   26: aload_0
    //   27: monitorexit
    //   28: aload_3
    //   29: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	30	0	this	IcsProgressBar
    //   12	10	1	i	int
    //   6	2	2	bool	boolean
    //   25	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	25	finally
    //   17	22	25	finally
  }
  
  public Drawable getProgressDrawable()
  {
    return mProgressDrawable;
  }
  
  /* Error */
  @ViewDebug.ExportedProperty(category="progress")
  public int getSecondaryProgress()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 231	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminate	Z
    //   6: istore_2
    //   7: iload_2
    //   8: ifeq +9 -> 17
    //   11: iconst_0
    //   12: istore_1
    //   13: aload_0
    //   14: monitorexit
    //   15: iload_1
    //   16: ireturn
    //   17: aload_0
    //   18: getfield 213	com/actionbarsherlock/internal/widget/IcsProgressBar:mSecondaryProgress	I
    //   21: istore_1
    //   22: goto -9 -> 13
    //   25: astore_3
    //   26: aload_0
    //   27: monitorexit
    //   28: aload_3
    //   29: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	30	0	this	IcsProgressBar
    //   12	10	1	i	int
    //   6	2	2	bool	boolean
    //   25	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	25	finally
    //   17	22	25	finally
  }
  
  public final void incrementProgressBy(int paramInt)
  {
    try
    {
      setProgress(mProgress + paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public final void incrementSecondaryProgressBy(int paramInt)
  {
    try
    {
      setSecondaryProgress(mSecondaryProgress + paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void invalidateDrawable(Drawable paramDrawable)
  {
    if (!mInDrawing)
    {
      if (verifyDrawable(paramDrawable))
      {
        paramDrawable = paramDrawable.getBounds();
        int i = getScrollX() + getPaddingLeft();
        int j = getScrollY() + getPaddingTop();
        invalidate(left + i, top + j, right + i, bottom + j);
      }
    }
    else {
      return;
    }
    super.invalidateDrawable(paramDrawable);
  }
  
  @ViewDebug.ExportedProperty(category="progress")
  public boolean isIndeterminate()
  {
    try
    {
      boolean bool = mIndeterminate;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void jumpDrawablesToCurrentState()
  {
    super.jumpDrawablesToCurrentState();
    if (mProgressDrawable != null) {
      mProgressDrawable.jumpToCurrentState();
    }
    if (mIndeterminateDrawable != null) {
      mIndeterminateDrawable.jumpToCurrentState();
    }
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    if (mIndeterminate) {
      startAnimation();
    }
  }
  
  protected void onDetachedFromWindow()
  {
    if (mIndeterminate) {
      stopAnimation();
    }
    if (mRefreshProgressRunnable != null) {
      removeCallbacks(mRefreshProgressRunnable);
    }
    if (mAccessibilityEventSender != null) {
      removeCallbacks(mAccessibilityEventSender);
    }
    super.onDetachedFromWindow();
  }
  
  /* Error */
  protected void onDraw(android.graphics.Canvas paramCanvas)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: invokespecial 528	android/view/View:onDraw	(Landroid/graphics/Canvas;)V
    //   7: aload_0
    //   8: getfield 265	com/actionbarsherlock/internal/widget/IcsProgressBar:mCurrentDrawable	Landroid/graphics/drawable/Drawable;
    //   11: astore 5
    //   13: aload 5
    //   15: ifnull +160 -> 175
    //   18: aload_1
    //   19: invokevirtual 533	android/graphics/Canvas:save	()I
    //   22: pop
    //   23: aload_1
    //   24: aload_0
    //   25: invokevirtual 406	com/actionbarsherlock/internal/widget/IcsProgressBar:getPaddingLeft	()I
    //   28: aload_0
    //   29: getfield 426	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminateRealLeft	I
    //   32: iadd
    //   33: i2f
    //   34: aload_0
    //   35: invokevirtual 412	com/actionbarsherlock/internal/widget/IcsProgressBar:getPaddingTop	()I
    //   38: aload_0
    //   39: getfield 428	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminateRealTop	I
    //   42: iadd
    //   43: i2f
    //   44: invokevirtual 537	android/graphics/Canvas:translate	(FF)V
    //   47: aload_0
    //   48: invokevirtual 540	com/actionbarsherlock/internal/widget/IcsProgressBar:getDrawingTime	()J
    //   51: lstore_3
    //   52: aload_0
    //   53: getfield 542	com/actionbarsherlock/internal/widget/IcsProgressBar:mAnimation	Landroid/view/animation/AlphaAnimation;
    //   56: ifnull +79 -> 135
    //   59: aload_0
    //   60: getfield 542	com/actionbarsherlock/internal/widget/IcsProgressBar:mAnimation	Landroid/view/animation/AlphaAnimation;
    //   63: lload_3
    //   64: aload_0
    //   65: getfield 544	com/actionbarsherlock/internal/widget/IcsProgressBar:mTransformation	Landroid/view/animation/Transformation;
    //   68: invokevirtual 550	android/view/animation/AlphaAnimation:getTransformation	(JLandroid/view/animation/Transformation;)Z
    //   71: pop
    //   72: aload_0
    //   73: getfield 544	com/actionbarsherlock/internal/widget/IcsProgressBar:mTransformation	Landroid/view/animation/Transformation;
    //   76: invokevirtual 556	android/view/animation/Transformation:getAlpha	()F
    //   79: fstore_2
    //   80: aload_0
    //   81: iconst_1
    //   82: putfield 473	com/actionbarsherlock/internal/widget/IcsProgressBar:mInDrawing	Z
    //   85: aload 5
    //   87: ldc_w 285
    //   90: fload_2
    //   91: fmul
    //   92: f2i
    //   93: invokevirtual 276	android/graphics/drawable/Drawable:setLevel	(I)Z
    //   96: pop
    //   97: aload_0
    //   98: iconst_0
    //   99: putfield 473	com/actionbarsherlock/internal/widget/IcsProgressBar:mInDrawing	Z
    //   102: invokestatic 561	android/os/SystemClock:uptimeMillis	()J
    //   105: aload_0
    //   106: getfield 563	com/actionbarsherlock/internal/widget/IcsProgressBar:mLastDrawTime	J
    //   109: lsub
    //   110: aload_0
    //   111: getfield 240	com/actionbarsherlock/internal/widget/IcsProgressBar:mAnimationResolution	I
    //   114: i2l
    //   115: lcmp
    //   116: iflt +19 -> 135
    //   119: aload_0
    //   120: invokestatic 561	android/os/SystemClock:uptimeMillis	()J
    //   123: putfield 563	com/actionbarsherlock/internal/widget/IcsProgressBar:mLastDrawTime	J
    //   126: aload_0
    //   127: aload_0
    //   128: getfield 240	com/actionbarsherlock/internal/widget/IcsProgressBar:mAnimationResolution	I
    //   131: i2l
    //   132: invokevirtual 567	com/actionbarsherlock/internal/widget/IcsProgressBar:postInvalidateDelayed	(J)V
    //   135: aload 5
    //   137: aload_1
    //   138: invokevirtual 570	android/graphics/drawable/Drawable:draw	(Landroid/graphics/Canvas;)V
    //   141: aload_1
    //   142: invokevirtual 573	android/graphics/Canvas:restore	()V
    //   145: aload_0
    //   146: getfield 575	com/actionbarsherlock/internal/widget/IcsProgressBar:mShouldStartAnimationDrawable	Z
    //   149: ifeq +26 -> 175
    //   152: aload 5
    //   154: instanceof 577
    //   157: ifeq +18 -> 175
    //   160: aload 5
    //   162: checkcast 577	android/graphics/drawable/Animatable
    //   165: invokeinterface 580 1 0
    //   170: aload_0
    //   171: iconst_0
    //   172: putfield 575	com/actionbarsherlock/internal/widget/IcsProgressBar:mShouldStartAnimationDrawable	Z
    //   175: aload_0
    //   176: monitorexit
    //   177: return
    //   178: astore_1
    //   179: aload_0
    //   180: iconst_0
    //   181: putfield 473	com/actionbarsherlock/internal/widget/IcsProgressBar:mInDrawing	Z
    //   184: aload_1
    //   185: athrow
    //   186: astore_1
    //   187: aload_0
    //   188: monitorexit
    //   189: aload_1
    //   190: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	191	0	this	IcsProgressBar
    //   0	191	1	paramCanvas	android.graphics.Canvas
    //   79	12	2	f	float
    //   51	13	3	l	long
    //   11	150	5	localDrawable	Drawable
    // Exception table:
    //   from	to	target	type
    //   80	97	178	finally
    //   2	13	186	finally
    //   18	80	186	finally
    //   97	135	186	finally
    //   135	175	186	finally
    //   179	186	186	finally
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setItemCount(mMax);
    paramAccessibilityEvent.setCurrentItemIndex(mProgress);
  }
  
  /* Error */
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 265	com/actionbarsherlock/internal/widget/IcsProgressBar:mCurrentDrawable	Landroid/graphics/drawable/Drawable;
    //   6: astore 5
    //   8: iconst_0
    //   9: istore 4
    //   11: iconst_0
    //   12: istore_3
    //   13: aload 5
    //   15: ifnull +44 -> 59
    //   18: aload_0
    //   19: getfield 181	com/actionbarsherlock/internal/widget/IcsProgressBar:mMinWidth	I
    //   22: aload_0
    //   23: getfield 186	com/actionbarsherlock/internal/widget/IcsProgressBar:mMaxWidth	I
    //   26: aload 5
    //   28: invokevirtual 417	android/graphics/drawable/Drawable:getIntrinsicWidth	()I
    //   31: invokestatic 598	java/lang/Math:min	(II)I
    //   34: invokestatic 601	java/lang/Math:max	(II)I
    //   37: istore 4
    //   39: aload_0
    //   40: getfield 188	com/actionbarsherlock/internal/widget/IcsProgressBar:mMinHeight	I
    //   43: aload_0
    //   44: getfield 190	com/actionbarsherlock/internal/widget/IcsProgressBar:mMaxHeight	I
    //   47: aload 5
    //   49: invokevirtual 420	android/graphics/drawable/Drawable:getIntrinsicHeight	()I
    //   52: invokestatic 598	java/lang/Math:min	(II)I
    //   55: invokestatic 601	java/lang/Math:max	(II)I
    //   58: istore_3
    //   59: aload_0
    //   60: invokespecial 447	com/actionbarsherlock/internal/widget/IcsProgressBar:updateDrawableState	()V
    //   63: iload 4
    //   65: aload_0
    //   66: invokevirtual 406	com/actionbarsherlock/internal/widget/IcsProgressBar:getPaddingLeft	()I
    //   69: aload_0
    //   70: invokevirtual 403	com/actionbarsherlock/internal/widget/IcsProgressBar:getPaddingRight	()I
    //   73: iadd
    //   74: iadd
    //   75: istore 4
    //   77: iload_3
    //   78: aload_0
    //   79: invokevirtual 412	com/actionbarsherlock/internal/widget/IcsProgressBar:getPaddingTop	()I
    //   82: aload_0
    //   83: invokevirtual 409	com/actionbarsherlock/internal/widget/IcsProgressBar:getPaddingBottom	()I
    //   86: iadd
    //   87: iadd
    //   88: istore_3
    //   89: getstatic 105	com/actionbarsherlock/internal/widget/IcsProgressBar:IS_HONEYCOMB	Z
    //   92: ifeq +23 -> 115
    //   95: aload_0
    //   96: iload 4
    //   98: iload_1
    //   99: iconst_0
    //   100: invokestatic 605	android/view/View:resolveSizeAndState	(III)I
    //   103: iload_3
    //   104: iload_2
    //   105: iconst_0
    //   106: invokestatic 605	android/view/View:resolveSizeAndState	(III)I
    //   109: invokevirtual 608	com/actionbarsherlock/internal/widget/IcsProgressBar:setMeasuredDimension	(II)V
    //   112: aload_0
    //   113: monitorexit
    //   114: return
    //   115: aload_0
    //   116: iload 4
    //   118: iload_1
    //   119: invokestatic 611	android/view/View:resolveSize	(II)I
    //   122: iload_3
    //   123: iload_2
    //   124: invokestatic 611	android/view/View:resolveSize	(II)I
    //   127: invokevirtual 608	com/actionbarsherlock/internal/widget/IcsProgressBar:setMeasuredDimension	(II)V
    //   130: goto -18 -> 112
    //   133: astore 5
    //   135: aload_0
    //   136: monitorexit
    //   137: aload 5
    //   139: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	140	0	this	IcsProgressBar
    //   0	140	1	paramInt1	int
    //   0	140	2	paramInt2	int
    //   12	111	3	i	int
    //   9	108	4	j	int
    //   6	42	5	localDrawable	Drawable
    //   133	5	5	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	8	133	finally
    //   18	59	133	finally
    //   59	112	133	finally
    //   115	130	133	finally
  }
  
  void onProgressRefresh(float paramFloat, boolean paramBoolean)
  {
    if (mAccessibilityManager.isEnabled()) {
      scheduleAccessibilityEventSender();
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    setProgress(progress);
    setSecondaryProgress(secondaryProgress);
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    progress = mProgress;
    secondaryProgress = mSecondaryProgress;
    return localSavedState;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    updateDrawableBounds(paramInt1, paramInt2);
  }
  
  protected void onVisibilityChanged(View paramView, int paramInt)
  {
    super.onVisibilityChanged(paramView, paramInt);
    if (mIndeterminate)
    {
      if ((paramInt == 8) || (paramInt == 4)) {
        stopAnimation();
      }
    }
    else {
      return;
    }
    startAnimation();
  }
  
  public void postInvalidate()
  {
    if (!mNoInvalidate) {
      super.postInvalidate();
    }
  }
  
  /* Error */
  public void setIndeterminate(boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 225	com/actionbarsherlock/internal/widget/IcsProgressBar:mOnlyIndeterminate	Z
    //   6: ifeq +10 -> 16
    //   9: aload_0
    //   10: getfield 231	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminate	Z
    //   13: ifne +32 -> 45
    //   16: iload_1
    //   17: aload_0
    //   18: getfield 231	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminate	Z
    //   21: if_icmpeq +24 -> 45
    //   24: aload_0
    //   25: iload_1
    //   26: putfield 231	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminate	Z
    //   29: iload_1
    //   30: ifeq +18 -> 48
    //   33: aload_0
    //   34: aload_0
    //   35: getfield 414	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminateDrawable	Landroid/graphics/drawable/Drawable;
    //   38: putfield 265	com/actionbarsherlock/internal/widget/IcsProgressBar:mCurrentDrawable	Landroid/graphics/drawable/Drawable;
    //   41: aload_0
    //   42: invokevirtual 518	com/actionbarsherlock/internal/widget/IcsProgressBar:startAnimation	()V
    //   45: aload_0
    //   46: monitorexit
    //   47: return
    //   48: aload_0
    //   49: aload_0
    //   50: getfield 430	com/actionbarsherlock/internal/widget/IcsProgressBar:mProgressDrawable	Landroid/graphics/drawable/Drawable;
    //   53: putfield 265	com/actionbarsherlock/internal/widget/IcsProgressBar:mCurrentDrawable	Landroid/graphics/drawable/Drawable;
    //   56: aload_0
    //   57: invokevirtual 522	com/actionbarsherlock/internal/widget/IcsProgressBar:stopAnimation	()V
    //   60: goto -15 -> 45
    //   63: astore_2
    //   64: aload_0
    //   65: monitorexit
    //   66: aload_2
    //   67: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	68	0	this	IcsProgressBar
    //   0	68	1	paramBoolean	boolean
    //   63	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	16	63	finally
    //   16	29	63	finally
    //   33	45	63	finally
    //   48	60	63	finally
  }
  
  public void setIndeterminateDrawable(Drawable paramDrawable)
  {
    if (paramDrawable != null) {
      paramDrawable.setCallback(this);
    }
    mIndeterminateDrawable = paramDrawable;
    if (mIndeterminate)
    {
      mCurrentDrawable = paramDrawable;
      postInvalidate();
    }
  }
  
  public void setInterpolator(Context paramContext, int paramInt)
  {
    setInterpolator(AnimationUtils.loadInterpolator(paramContext, paramInt));
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    mInterpolator = paramInterpolator;
  }
  
  public void setMax(int paramInt)
  {
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    try
    {
      if (i != mMax)
      {
        mMax = i;
        postInvalidate();
        if (mProgress > i) {
          mProgress = i;
        }
        refreshProgress(16908301, mProgress, false);
      }
      return;
    }
    finally {}
  }
  
  public void setProgress(int paramInt)
  {
    try
    {
      setProgress(paramInt, false);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  void setProgress(int paramInt, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 231	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminate	Z
    //   6: istore 4
    //   8: iload 4
    //   10: ifeq +6 -> 16
    //   13: aload_0
    //   14: monitorexit
    //   15: return
    //   16: iload_1
    //   17: istore_3
    //   18: iload_1
    //   19: ifge +5 -> 24
    //   22: iconst_0
    //   23: istore_3
    //   24: iload_3
    //   25: istore_1
    //   26: iload_3
    //   27: aload_0
    //   28: getfield 202	com/actionbarsherlock/internal/widget/IcsProgressBar:mMax	I
    //   31: if_icmple +8 -> 39
    //   34: aload_0
    //   35: getfield 202	com/actionbarsherlock/internal/widget/IcsProgressBar:mMax	I
    //   38: istore_1
    //   39: iload_1
    //   40: aload_0
    //   41: getfield 208	com/actionbarsherlock/internal/widget/IcsProgressBar:mProgress	I
    //   44: if_icmpeq -31 -> 13
    //   47: aload_0
    //   48: iload_1
    //   49: putfield 208	com/actionbarsherlock/internal/widget/IcsProgressBar:mProgress	I
    //   52: aload_0
    //   53: ldc_w 277
    //   56: aload_0
    //   57: getfield 208	com/actionbarsherlock/internal/widget/IcsProgressBar:mProgress	I
    //   60: iload_2
    //   61: invokespecial 660	com/actionbarsherlock/internal/widget/IcsProgressBar:refreshProgress	(IIZ)V
    //   64: goto -51 -> 13
    //   67: astore 5
    //   69: aload_0
    //   70: monitorexit
    //   71: aload 5
    //   73: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	74	0	this	IcsProgressBar
    //   0	74	1	paramInt	int
    //   0	74	2	paramBoolean	boolean
    //   17	15	3	i	int
    //   6	3	4	bool	boolean
    //   67	5	5	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	8	67	finally
    //   26	39	67	finally
    //   39	64	67	finally
  }
  
  public void setProgressDrawable(Drawable paramDrawable)
  {
    if ((mProgressDrawable != null) && (paramDrawable != mProgressDrawable)) {
      mProgressDrawable.setCallback(null);
    }
    for (int i = 1;; i = 0)
    {
      if (paramDrawable != null)
      {
        paramDrawable.setCallback(this);
        int j = paramDrawable.getMinimumHeight();
        if (mMaxHeight < j)
        {
          mMaxHeight = j;
          requestLayout();
        }
      }
      mProgressDrawable = paramDrawable;
      if (!mIndeterminate)
      {
        mCurrentDrawable = paramDrawable;
        postInvalidate();
      }
      if (i != 0)
      {
        updateDrawableBounds(getWidth(), getHeight());
        updateDrawableState();
        doRefreshProgress(16908301, mProgress, false, false);
        doRefreshProgress(16908303, mSecondaryProgress, false, false);
      }
      return;
    }
  }
  
  /* Error */
  public void setSecondaryProgress(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 231	com/actionbarsherlock/internal/widget/IcsProgressBar:mIndeterminate	Z
    //   6: istore_3
    //   7: iload_3
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: iload_1
    //   15: istore_2
    //   16: iload_1
    //   17: ifge +5 -> 22
    //   20: iconst_0
    //   21: istore_2
    //   22: iload_2
    //   23: istore_1
    //   24: iload_2
    //   25: aload_0
    //   26: getfield 202	com/actionbarsherlock/internal/widget/IcsProgressBar:mMax	I
    //   29: if_icmple +8 -> 37
    //   32: aload_0
    //   33: getfield 202	com/actionbarsherlock/internal/widget/IcsProgressBar:mMax	I
    //   36: istore_1
    //   37: iload_1
    //   38: aload_0
    //   39: getfield 213	com/actionbarsherlock/internal/widget/IcsProgressBar:mSecondaryProgress	I
    //   42: if_icmpeq -31 -> 11
    //   45: aload_0
    //   46: iload_1
    //   47: putfield 213	com/actionbarsherlock/internal/widget/IcsProgressBar:mSecondaryProgress	I
    //   50: aload_0
    //   51: ldc_w 321
    //   54: aload_0
    //   55: getfield 213	com/actionbarsherlock/internal/widget/IcsProgressBar:mSecondaryProgress	I
    //   58: iconst_0
    //   59: invokespecial 660	com/actionbarsherlock/internal/widget/IcsProgressBar:refreshProgress	(IIZ)V
    //   62: goto -51 -> 11
    //   65: astore 4
    //   67: aload_0
    //   68: monitorexit
    //   69: aload 4
    //   71: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	72	0	this	IcsProgressBar
    //   0	72	1	paramInt	int
    //   15	15	2	i	int
    //   6	2	3	bool	boolean
    //   65	5	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	65	finally
    //   24	37	65	finally
    //   37	62	65	finally
  }
  
  public void setVisibility(int paramInt)
  {
    if (getVisibility() != paramInt)
    {
      super.setVisibility(paramInt);
      if (mIndeterminate)
      {
        if ((paramInt != 8) && (paramInt != 4)) {
          break label36;
        }
        stopAnimation();
      }
    }
    return;
    label36:
    startAnimation();
  }
  
  void startAnimation()
  {
    if (getVisibility() != 0) {
      return;
    }
    if ((mIndeterminateDrawable instanceof Animatable))
    {
      mShouldStartAnimationDrawable = true;
      mAnimation = null;
    }
    for (;;)
    {
      postInvalidate();
      return;
      if (mInterpolator == null) {
        mInterpolator = new LinearInterpolator();
      }
      mTransformation = new Transformation();
      mAnimation = new AlphaAnimation(0.0F, 1.0F);
      mAnimation.setRepeatMode(mBehavior);
      mAnimation.setRepeatCount(-1);
      mAnimation.setDuration(mDuration);
      mAnimation.setInterpolator(mInterpolator);
      mAnimation.setStartTime(-1L);
    }
  }
  
  void stopAnimation()
  {
    mAnimation = null;
    mTransformation = null;
    if ((mIndeterminateDrawable instanceof Animatable))
    {
      ((Animatable)mIndeterminateDrawable).stop();
      mShouldStartAnimationDrawable = false;
    }
    postInvalidate();
  }
  
  protected boolean verifyDrawable(Drawable paramDrawable)
  {
    return (paramDrawable == mProgressDrawable) || (paramDrawable == mIndeterminateDrawable) || (super.verifyDrawable(paramDrawable));
  }
  
  private class AccessibilityEventSender
    implements Runnable
  {
    private AccessibilityEventSender() {}
    
    public void run()
    {
      sendAccessibilityEvent(4);
    }
  }
  
  private class RefreshProgressRunnable
    implements Runnable
  {
    private boolean mFromUser;
    private int mId;
    private int mProgress;
    
    RefreshProgressRunnable(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      mId = paramInt1;
      mProgress = paramInt2;
      mFromUser = paramBoolean;
    }
    
    public void run()
    {
      IcsProgressBar.this.doRefreshProgress(mId, mProgress, mFromUser, true);
      IcsProgressBar.access$102(IcsProgressBar.this, this);
    }
    
    public void setup(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      mId = paramInt1;
      mProgress = paramInt2;
      mFromUser = paramBoolean;
    }
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public IcsProgressBar.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new IcsProgressBar.SavedState(paramAnonymousParcel, null);
      }
      
      public IcsProgressBar.SavedState[] newArray(int paramAnonymousInt)
      {
        return new IcsProgressBar.SavedState[paramAnonymousInt];
      }
    };
    int progress;
    int secondaryProgress;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      progress = paramParcel.readInt();
      secondaryProgress = paramParcel.readInt();
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(progress);
      paramParcel.writeInt(secondaryProgress);
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.widget.IcsProgressBar
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */