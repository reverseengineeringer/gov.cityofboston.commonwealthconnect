package com.seeclickfix.ma.android.util;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;

public class FormUtil
{
  private static View.OnTouchListener getListener()
  {
    new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        FormUtil.hideKeyboard(paramAnonymousView);
        return false;
      }
    };
  }
  
  public static void hideKeyboard(View paramView)
  {
    ((InputMethodManager)paramView.getContext().getSystemService("input_method")).hideSoftInputFromWindow(paramView.getWindowToken(), 0);
  }
  
  public static void setupUI(View paramView, View.OnTouchListener paramOnTouchListener)
  {
    View.OnTouchListener localOnTouchListener = paramOnTouchListener;
    if (paramOnTouchListener == null) {
      localOnTouchListener = getListener();
    }
    if (!(paramView instanceof EditText)) {
      paramView.setOnTouchListener(localOnTouchListener);
    }
    if ((paramView instanceof ViewGroup))
    {
      int i = 0;
      while (i < ((ViewGroup)paramView).getChildCount())
      {
        setupUI(((ViewGroup)paramView).getChildAt(i), localOnTouchListener);
        i += 1;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.util.FormUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */