package net.simonvt.calendarview;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.View.MeasureSpec;
import android.widget.ListView;
import java.util.Calendar;
import java.util.Locale;

class CalendarView$WeekView
  extends View
{
  private String[] mDayNumbers;
  private final Paint mDrawPaint = new Paint();
  private Calendar mFirstDay;
  private boolean[] mFocusDay;
  private boolean mHasFocusedDay;
  private boolean mHasSelectedDay = false;
  private boolean mHasUnfocusedDay;
  private int mHeight;
  private int mLastWeekDayMonth = -1;
  private final Paint mMonthNumDrawPaint = new Paint();
  private int mMonthOfFirstWeekDay = -1;
  private int mNumCells;
  private int mSelectedDay = -1;
  private int mSelectedLeft = -1;
  private int mSelectedRight = -1;
  private final Rect mTempRect = new Rect();
  private int mWeek = -1;
  private int mWidth;
  
  public CalendarView$WeekView(CalendarView paramCalendarView, Context paramContext)
  {
    super(paramContext);
    initilaizePaints();
  }
  
  private void drawBackground(Canvas paramCanvas)
  {
    int i = 0;
    if (!mHasSelectedDay) {
      return;
    }
    mDrawPaint.setColor(CalendarView.access$2500(this$0));
    mTempRect.top = CalendarView.access$2600(this$0);
    mTempRect.bottom = mHeight;
    boolean bool = CalendarView.access$2400(this$0);
    Rect localRect;
    if (bool)
    {
      mTempRect.left = 0;
      mTempRect.right = (mSelectedLeft - 2);
      paramCanvas.drawRect(mTempRect, mDrawPaint);
      if (!bool) {
        break label217;
      }
      mTempRect.left = (mSelectedRight + 3);
      localRect = mTempRect;
      if (!CalendarView.access$2100(this$0)) {
        break label209;
      }
      i = mWidth - mWidth / mNumCells;
    }
    label142:
    for (right = i;; mTempRect.right = mWidth)
    {
      paramCanvas.drawRect(mTempRect, mDrawPaint);
      return;
      localRect = mTempRect;
      if (CalendarView.access$2100(this$0)) {
        i = mWidth / mNumCells;
      }
      left = i;
      mTempRect.right = (mSelectedLeft - 2);
      break;
      label209:
      i = mWidth;
      break label142;
      label217:
      mTempRect.left = (mSelectedRight + 3);
    }
  }
  
  private void drawSelectedDateVerticalBars(Canvas paramCanvas)
  {
    if (!mHasSelectedDay) {
      return;
    }
    CalendarView.access$3200(this$0).setBounds(mSelectedLeft - CalendarView.access$3100(this$0) / 2, CalendarView.access$2600(this$0), mSelectedLeft + CalendarView.access$3100(this$0) / 2, mHeight);
    CalendarView.access$3200(this$0).draw(paramCanvas);
    CalendarView.access$3200(this$0).setBounds(mSelectedRight - CalendarView.access$3100(this$0) / 2, CalendarView.access$2600(this$0), mSelectedRight + CalendarView.access$3100(this$0) / 2, mHeight);
    CalendarView.access$3200(this$0).draw(paramCanvas);
  }
  
  private void drawWeekNumbersAndDates(Canvas paramCanvas)
  {
    float f = mDrawPaint.getTextSize();
    int k = (int)((mHeight + f) / 2.0F) - CalendarView.access$2600(this$0);
    int n = mNumCells;
    int m = n * 2;
    mDrawPaint.setTextAlign(Paint.Align.CENTER);
    mDrawPaint.setTextSize(CalendarView.access$2300(this$0));
    int j = 0;
    int i = 0;
    Paint localPaint;
    if (CalendarView.access$2400(this$0))
    {
      if (i < n - 1)
      {
        localPaint = mMonthNumDrawPaint;
        if (mFocusDay[i] != 0) {}
        for (j = CalendarView.access$2700(this$0);; j = CalendarView.access$2800(this$0))
        {
          localPaint.setColor(j);
          j = (i * 2 + 1) * mWidth / m;
          paramCanvas.drawText(mDayNumbers[(n - 1 - i)], j, k, mMonthNumDrawPaint);
          i += 1;
          break;
        }
      }
      if (CalendarView.access$2100(this$0))
      {
        mDrawPaint.setColor(CalendarView.access$2900(this$0));
        i = mWidth;
        j = mWidth / m;
        paramCanvas.drawText(mDayNumbers[0], i - j, k, mDrawPaint);
      }
      return;
    }
    i = j;
    if (CalendarView.access$2100(this$0))
    {
      mDrawPaint.setColor(CalendarView.access$2900(this$0));
      i = mWidth / m;
      paramCanvas.drawText(mDayNumbers[0], i, k, mDrawPaint);
      i = 0 + 1;
    }
    label297:
    if (i < n)
    {
      localPaint = mMonthNumDrawPaint;
      if (mFocusDay[i] == 0) {
        break label376;
      }
    }
    label376:
    for (j = CalendarView.access$2700(this$0);; j = CalendarView.access$2800(this$0))
    {
      localPaint.setColor(j);
      j = (i * 2 + 1) * mWidth / m;
      paramCanvas.drawText(mDayNumbers[i], j, k, mMonthNumDrawPaint);
      i += 1;
      break label297;
      break;
    }
  }
  
  private void drawWeekSeparators(Canvas paramCanvas)
  {
    int j = CalendarView.access$1800(this$0).getFirstVisiblePosition();
    int i = j;
    if (CalendarView.access$1800(this$0).getChildAt(0).getTop() < 0) {
      i = j + 1;
    }
    if (i == mWeek) {
      return;
    }
    mDrawPaint.setColor(CalendarView.access$3000(this$0));
    mDrawPaint.setStrokeWidth(CalendarView.access$2600(this$0));
    float f2;
    if (CalendarView.access$2400(this$0))
    {
      f2 = 0.0F;
      if (CalendarView.access$2100(this$0)) {}
      for (f1 = mWidth - mWidth / mNumCells;; f1 = mWidth)
      {
        paramCanvas.drawLine(f2, 0.0F, f1, 0.0F, mDrawPaint);
        return;
      }
    }
    if (CalendarView.access$2100(this$0)) {}
    for (float f1 = mWidth / mNumCells;; f1 = 0.0F)
    {
      float f3 = mWidth;
      f2 = f1;
      f1 = f3;
      break;
    }
  }
  
  private void initilaizePaints()
  {
    mDrawPaint.setFakeBoldText(false);
    mDrawPaint.setAntiAlias(true);
    mDrawPaint.setStyle(Paint.Style.FILL);
    mMonthNumDrawPaint.setFakeBoldText(true);
    mMonthNumDrawPaint.setAntiAlias(true);
    mMonthNumDrawPaint.setStyle(Paint.Style.FILL);
    mMonthNumDrawPaint.setTextAlign(Paint.Align.CENTER);
    mMonthNumDrawPaint.setTextSize(CalendarView.access$2300(this$0));
  }
  
  private void updateSelectionPositions()
  {
    int j;
    if (mHasSelectedDay)
    {
      boolean bool = CalendarView.access$2400(this$0);
      j = mSelectedDay - CalendarView.access$1700(this$0);
      int i = j;
      if (j < 0) {
        i = j + 7;
      }
      j = i;
      if (CalendarView.access$2100(this$0))
      {
        j = i;
        if (!bool) {
          j = i + 1;
        }
      }
      if (!bool) {
        break label109;
      }
    }
    label109:
    for (mSelectedLeft = ((CalendarView.access$2200(this$0) - 1 - j) * mWidth / mNumCells);; mSelectedLeft = (mWidth * j / mNumCells))
    {
      mSelectedRight = (mSelectedLeft + mWidth / mNumCells);
      return;
    }
  }
  
  public boolean getDayFromLocation(float paramFloat, Calendar paramCalendar)
  {
    boolean bool = CalendarView.access$2400(this$0);
    if (bool)
    {
      j = 0;
      if (CalendarView.access$2100(this$0)) {}
      for (i = mWidth - mWidth / mNumCells; (paramFloat < j) || (paramFloat > i); i = mWidth)
      {
        paramCalendar.clear();
        return false;
      }
    }
    if (CalendarView.access$2100(this$0)) {}
    for (int j = mWidth / mNumCells;; j = 0)
    {
      i = mWidth;
      break;
    }
    j = (int)((paramFloat - j) * CalendarView.access$2200(this$0) / (i - j));
    int i = j;
    if (bool) {
      i = CalendarView.access$2200(this$0) - 1 - j;
    }
    paramCalendar.setTimeInMillis(mFirstDay.getTimeInMillis());
    paramCalendar.add(5, i);
    return true;
  }
  
  public Calendar getFirstDay()
  {
    return mFirstDay;
  }
  
  public int getMonthOfFirstWeekDay()
  {
    return mMonthOfFirstWeekDay;
  }
  
  public int getMonthOfLastWeekDay()
  {
    return mLastWeekDayMonth;
  }
  
  public void init(int paramInt1, int paramInt2, int paramInt3)
  {
    mSelectedDay = paramInt2;
    boolean bool;
    if (mSelectedDay != -1)
    {
      bool = true;
      mHasSelectedDay = bool;
      if (!CalendarView.access$2100(this$0)) {
        break label391;
      }
      paramInt2 = CalendarView.access$2200(this$0) + 1;
      label42:
      mNumCells = paramInt2;
      mWeek = paramInt1;
      CalendarView.access$1900(this$0).setTimeInMillis(CalendarView.access$1600(this$0).getTimeInMillis());
      CalendarView.access$1900(this$0).add(3, mWeek);
      CalendarView.access$1900(this$0).setFirstDayOfWeek(CalendarView.access$1700(this$0));
      mDayNumbers = new String[mNumCells];
      mFocusDay = new boolean[mNumCells];
      paramInt1 = 0;
      if (CalendarView.access$2100(this$0))
      {
        mDayNumbers[0] = String.format(Locale.getDefault(), "%d", new Object[] { Integer.valueOf(CalendarView.access$1900(this$0).get(3)) });
        paramInt1 = 0 + 1;
      }
      paramInt2 = CalendarView.access$1700(this$0);
      int i = CalendarView.access$1900(this$0).get(7);
      CalendarView.access$1900(this$0).add(5, paramInt2 - i);
      mFirstDay = ((Calendar)CalendarView.access$1900(this$0).clone());
      mMonthOfFirstWeekDay = CalendarView.access$1900(this$0).get(2);
      mHasUnfocusedDay = true;
      label251:
      if (paramInt1 >= mNumCells) {
        break label452;
      }
      if (CalendarView.access$1900(this$0).get(2) != paramInt3) {
        break label402;
      }
      bool = true;
      label277:
      mFocusDay[paramInt1] = bool;
      mHasFocusedDay |= bool;
      int j = mHasUnfocusedDay;
      if (bool) {
        break label408;
      }
      paramInt2 = 1;
      label309:
      mHasUnfocusedDay = (paramInt2 & j);
      if ((!CalendarView.access$1900(this$0).before(CalendarView.access$1600(this$0))) && (!CalendarView.access$1900(this$0).after(CalendarView.access$1500(this$0)))) {
        break label413;
      }
      mDayNumbers[paramInt1] = "";
    }
    for (;;)
    {
      CalendarView.access$1900(this$0).add(5, 1);
      paramInt1 += 1;
      break label251;
      bool = false;
      break;
      label391:
      paramInt2 = CalendarView.access$2200(this$0);
      break label42;
      label402:
      bool = false;
      break label277;
      label408:
      paramInt2 = 0;
      break label309;
      label413:
      mDayNumbers[paramInt1] = String.format(Locale.getDefault(), "%d", new Object[] { Integer.valueOf(CalendarView.access$1900(this$0).get(5)) });
    }
    label452:
    if (CalendarView.access$1900(this$0).get(5) == 1) {
      CalendarView.access$1900(this$0).add(5, -1);
    }
    mLastWeekDayMonth = CalendarView.access$1900(this$0).get(2);
    updateSelectionPositions();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    drawBackground(paramCanvas);
    drawWeekNumbersAndDates(paramCanvas);
    drawWeekSeparators(paramCanvas);
    drawSelectedDateVerticalBars(paramCanvas);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    mHeight = ((CalendarView.access$1800(this$0).getHeight() - CalendarView.access$1800(this$0).getPaddingTop() - CalendarView.access$1800(this$0).getPaddingBottom()) / CalendarView.access$3300(this$0));
    setMeasuredDimension(View.MeasureSpec.getSize(paramInt1), mHeight);
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mWidth = paramInt1;
    updateSelectionPositions();
  }
}

/* Location:
 * Qualified Name:     net.simonvt.calendarview.CalendarView.WeekView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */