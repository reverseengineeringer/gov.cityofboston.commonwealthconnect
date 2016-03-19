package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.view.KeyEvent;
import android.view.inputmethod.InputMethodManager;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;

class IssueDetailsFrag$4
  implements TextView.OnEditorActionListener
{
  IssueDetailsFrag$4(IssueDetailsFrag paramIssueDetailsFrag) {}
  
  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool = false;
    if (paramInt == 6)
    {
      ((InputMethodManager)paramTextView.getContext().getSystemService("input_method")).hideSoftInputFromWindow(paramTextView.getWindowToken(), 0);
      bool = true;
    }
    return bool;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */