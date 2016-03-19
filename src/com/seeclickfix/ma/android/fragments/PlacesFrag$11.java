package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.ViewGroup;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.views.swipe.SwipeDismissTouchListener.OnDismissCallback;

class PlacesFrag$11
  implements SwipeDismissTouchListener.OnDismissCallback
{
  PlacesFrag$11(PlacesFrag paramPlacesFrag) {}
  
  public void onDismiss(View paramView, Object paramObject)
  {
    ViewGroup localViewGroup = (ViewGroup)paramView.getParent();
    paramObject = (Place)paramObject;
    localViewGroup.removeView(paramView);
    this$0.ignorePlace((Place)paramObject);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.11
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */