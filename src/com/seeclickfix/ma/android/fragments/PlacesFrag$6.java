package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnFocusChangeListener;
import android.widget.AutoCompleteTextView;
import android.widget.ScrollView;

class PlacesFrag$6
  implements View.OnFocusChangeListener
{
  PlacesFrag$6(PlacesFrag paramPlacesFrag) {}
  
  public void onFocusChange(View paramView, boolean paramBoolean)
  {
    if ((paramView.getId() == 2131362003) && (paramBoolean)) {
      ((ScrollView)PlacesFrag.access$200(this$0)).smoothScrollTo(0, ((View)PlacesFrag.access$100(this$0).getParent()).getTop());
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */