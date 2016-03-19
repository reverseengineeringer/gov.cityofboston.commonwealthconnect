package com.seeclickfix.ma.android.fragments;

import android.view.KeyEvent;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.seeclickfix.ma.android.util.FormUtil;

class RegisterFrag$3
  implements TextView.OnEditorActionListener
{
  RegisterFrag$3(RegisterFrag paramRegisterFrag) {}
  
  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 6) || (paramInt == 5))
    {
      FormUtil.hideKeyboard(paramTextView);
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.RegisterFrag.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */