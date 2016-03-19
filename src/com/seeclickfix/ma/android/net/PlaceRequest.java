package com.seeclickfix.ma.android.net;

import android.content.Context;
import android.location.Location;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.location.MyPlaceFactory;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.zone.ZoneWrapper;
import com.seeclickfix.ma.android.tasks.CancellableTask;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class PlaceRequest
  implements CancellableTask<Place>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "PlaceRequest";
  private NetRequest req;
  
  public Place call()
    throws Exception
  {
    return null;
  }
  
  public void cancel()
  {
    if (req != null) {
      req.abort();
    }
  }
  
  public List<Place> getPlaceListByLocation(Location paramLocation, Context paramContext)
  {
    Object localObject = new NetRequest.Builder(paramContext);
    ((NetRequest.Builder)localObject).url(UrlConfig.getPlacesNearbyUrl(paramContext));
    ((NetRequest.Builder)localObject).method("GET");
    ((NetRequest.Builder)localObject).lat(paramLocation.getLatitude());
    ((NetRequest.Builder)localObject).lng(paramLocation.getLongitude());
    ((NetRequest.Builder)localObject).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    ((NetRequest.Builder)localObject).numResults(5);
    req = ((NetRequest.Builder)localObject).create();
    System.currentTimeMillis();
    localObject = req.executeRequest(null);
    System.currentTimeMillis();
    localObject = new DeserializeResponse().getJavaObject((String)localObject, Place.class);
    ((ArrayList)localObject).add(0, MyPlaceFactory.create(paramLocation, paramContext));
    paramContext = ((ArrayList)localObject).iterator();
    while (paramContext.hasNext())
    {
      Place localPlace = (Place)paramContext.next();
      localPlace.setOrigLat(paramLocation.getLatitude());
      localPlace.setOrigLat(paramLocation.getLongitude());
    }
    return (List<Place>)localObject;
  }
  
  public List<Place> getPlacebyName(String paramString, Location paramLocation, Context paramContext)
  {
    Object localObject = new NetRequest.Builder(paramContext);
    ((NetRequest.Builder)localObject).url(UrlConfig.getZonesNearbyWithPlaceUrl(paramContext));
    ((NetRequest.Builder)localObject).method("GET");
    ((NetRequest.Builder)localObject).at(paramString);
    ((NetRequest.Builder)localObject).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    ((NetRequest.Builder)localObject).numResults(1);
    req = ((NetRequest.Builder)localObject).create();
    System.currentTimeMillis();
    paramString = req.executeRequest(null);
    System.currentTimeMillis();
    paramContext = ((ZoneWrapper)new DeserializeResponse().getJavaObject(paramString, ZoneWrapper.class).get(0)).getApiPlace();
    paramString = new ArrayList();
    paramString.add(paramContext);
    if (paramLocation != null)
    {
      paramContext = paramString.iterator();
      while (paramContext.hasNext())
      {
        localObject = (Place)paramContext.next();
        ((Place)localObject).setOrigLat(paramLocation.getLatitude());
        ((Place)localObject).setOrigLat(paramLocation.getLongitude());
      }
    }
    return paramString;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.PlaceRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */