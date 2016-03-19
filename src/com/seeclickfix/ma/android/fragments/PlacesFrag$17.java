package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.db.InsertSinglePlace;
import com.seeclickfix.ma.android.fragments.interfaces.OnPlaceAddedListener;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.sql.SQLException;

class PlacesFrag$17
  implements Runnable
{
  PlacesFrag$17(PlacesFrag paramPlacesFrag, Place paramPlace) {}
  
  public void run()
  {
    try
    {
      InsertSinglePlace.creatOrUpdate(PlacesFrag.access$300(this$0), val$place);
      ((OnPlaceAddedListener)this$0.getActivity()).onPlaceAdded(val$place);
      return;
    }
    catch (SQLException localSQLException) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.17
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */