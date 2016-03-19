package com.seeclickfix.ma.android.fragments;

import android.view.KeyEvent;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.seeclickfix.ma.android.util.FormUtil;

class LoginFrag$6
  implements TextView.OnEditorActionListener
{
  LoginFrag$6(LoginFrag paramLoginFrag) {}
  
  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 6)
    {
      FormUtil.hideKeyboard(paramTextView);
      LoginFrag.access$000(this$0);
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.LoginFrag.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */