package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AutoCompleteTextView;
import com.seeclickfix.ma.android.objects.loc.City;
import com.seeclickfix.ma.android.util.FormUtil;

class PlacesFrag$3
  implements AdapterView.OnItemClickListener
{
  PlacesFrag$3(PlacesFrag paramPlacesFrag) {}
  
  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = (City)paramView.getTag();
    FormUtil.hideKeyboard(PlacesFrag.access$100(this$0));
    this$0.search(name + "+" + state);
    PlacesFrag.access$100(this$0).setText(name + ", " + state);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */