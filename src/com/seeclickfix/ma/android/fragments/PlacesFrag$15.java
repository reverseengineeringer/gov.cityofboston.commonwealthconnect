package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import com.seeclickfix.ma.android.objects.loc.Place;

class PlacesFrag$15
  implements View.OnClickListener
{
  PlacesFrag$15(PlacesFrag paramPlacesFrag) {}
  
  public void onClick(View paramView)
  {
    CheckBox localCheckBox = (CheckBox)paramView.findViewById(2131362154);
    paramView = (Place)paramView.getTag();
    if (!paramView.isSelected()) {}
    for (boolean bool = true;; bool = false)
    {
      paramView.setSelected(bool);
      localCheckBox.toggle();
      if (!paramView.isSelected()) {
        break;
      }
      this$0.addPlace(paramView);
      return;
    }
    this$0.removePlace(paramView);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.15
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */