package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.objects.loc.Place;

class PlacesFrag$9
  implements View.OnClickListener
{
  PlacesFrag$9(PlacesFrag paramPlacesFrag) {}
  
  public void onClick(View paramView)
  {
    paramView = (Place)paramView.getTag();
    this$0.undo(paramView);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */