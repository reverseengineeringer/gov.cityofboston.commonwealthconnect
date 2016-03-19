package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.location.PresetLocation;
import com.seeclickfix.ma.android.location.TestLocationList;
import com.seeclickfix.ma.android.views.ToastFactory;
import java.util.List;

class AboutFrag$6
  implements AdapterView.OnItemSelectedListener
{
  AboutFrag$6(AboutFrag paramAboutFrag) {}
  
  public void onItemSelected(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = (PresetLocation)TestLocationList.getPresetLocations(AboutFrag.access$100(this$0)).get(paramInt);
    if (!paramAdapterView.name().equals("(No location selected)"))
    {
      this$0.mLocationAdapter.forceMockLocation(paramAdapterView);
      AboutFrag.access$200(this$0);
      ToastFactory.showCenteredShortToast(AboutFrag.access$100(this$0), "Location set to: " + paramAdapterView.name() + "\n" + "Volley cache cleared.");
    }
  }
  
  public void onNothingSelected(AdapterView<?> paramAdapterView) {}
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.AboutFrag.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */