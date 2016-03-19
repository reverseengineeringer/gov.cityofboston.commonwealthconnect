package com.seeclickfix.ma.android;

import android.view.View;
import android.view.inputmethod.InputMethodManager;

class SeeclickfixActivity$1
  implements Runnable
{
  SeeclickfixActivity$1(SeeclickfixActivity paramSeeclickfixActivity, View paramView) {}
  
  public void run()
  {
    ((InputMethodManager)this$0.getSystemService("input_method")).showSoftInput(val$focusedChild, 1);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.SeeclickfixActivity.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */