package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.util.Map;
import org.json.JSONObject;

public class GetZonesTask
  extends ZoneTaskAbstract
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GetZonesTask";
  
  public GetZonesTask(Context paramContext, Place paramPlace, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramContext, paramPlace, paramListener, paramErrorListener);
  }
  
  public void execute()
  {
    Map localMap = buildParams();
    DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(c);
    if ((place.isMyLocation()) && (localDedicatedApp.getIsDedicatedApp())) {
      localMap.put("enhanced_watch_area_ids", localDedicatedApp.getAllowedIdsString());
    }
    performRequest(RequestFactory.constructUrl(UrlConfig.getZonesNearbyWithPlaceUrl(c), localMap), RequestFactory.getStandardHeaders(c));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetZonesTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */