package com.seeclickfix.ma.android.tasks;

import android.location.Address;
import android.location.Geocoder;
import com.google.android.gms.maps.model.LatLng;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.util.CollectionUtil;
import java.io.IOException;
import java.util.List;

public class ReverseGeocodeTask
  extends SafeTask<LatLng, Address>
{
  private Geocoder geoCoder;
  
  public ReverseGeocodeTask(BaseFrag paramBaseFrag, SafeListener<Address> paramSafeListener)
  {
    super(paramSafeListener);
    geoCoder = new Geocoder(paramBaseFrag.getAppContext());
  }
  
  public static void launch(String paramString, LatLng paramLatLng, BaseFrag paramBaseFrag, SafeListener<Address> paramSafeListener)
  {
    cancel(paramString);
    paramBaseFrag = new ReverseGeocodeTask(paramBaseFrag, paramSafeListener);
    register(paramString, paramBaseFrag);
    paramBaseFrag.execute(new LatLng[] { paramLatLng });
  }
  
  protected Address doInBackground(LatLng... paramVarArgs)
  {
    Object localObject = null;
    paramVarArgs = paramVarArgs[0];
    try
    {
      paramVarArgs = geoCoder.getFromLocation(latitude, longitude, 1);
      if (CollectionUtil.isNullOrEmpty(paramVarArgs)) {
        return null;
      }
    }
    catch (IOException paramVarArgs)
    {
      for (;;)
      {
        setErrorCode(SimpleListener.Code.NETWORK_UNAVAILABLE);
        paramVarArgs = (LatLng[])localObject;
      }
    }
    return (Address)paramVarArgs.get(0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.ReverseGeocodeTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */