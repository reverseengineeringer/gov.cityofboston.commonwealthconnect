package com.seeclickfix.ma.android.util;

import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;

final class FormUtil$1
  implements View.OnTouchListener
{
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    FormUtil.hideKeyboard(paramView);
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.util.FormUtil.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */