package com.seeclickfix.ma.android.fragments;

import android.view.KeyEvent;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;

class PlacesFrag$5
  implements TextView.OnEditorActionListener
{
  PlacesFrag$5(PlacesFrag paramPlacesFrag) {}
  
  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 6)
    {
      this$0.doSearch();
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */