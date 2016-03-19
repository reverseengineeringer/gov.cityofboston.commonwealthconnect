package com.seeclickfix.ma.android.fragments;

import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;

class IssueDetailsFrag$7
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  IssueDetailsFrag$7(IssueDetailsFrag paramIssueDetailsFrag, ViewGroup paramViewGroup) {}
  
  public void onGlobalLayout()
  {
    val$svChild.getViewTreeObserver().removeGlobalOnLayoutListener(this);
    this$0.doScrollToBottom();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */