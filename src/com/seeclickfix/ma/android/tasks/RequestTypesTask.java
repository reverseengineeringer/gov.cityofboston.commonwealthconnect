package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import com.google.android.gms.maps.model.LatLng;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.net.NetRequest;
import com.seeclickfix.ma.android.net.NetRequest.Builder;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import com.seeclickfix.ma.android.objects.report.RequestWatchAreaWrapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class RequestTypesTask
  extends SafeTask<LatLng, List<RequestWatchArea>>
{
  public RequestTypesTask(SafeListener<List<RequestWatchArea>> paramSafeListener)
  {
    super(paramSafeListener);
  }
  
  private List<RequestWatchArea> getByLatLng(LatLng paramLatLng, Context paramContext)
    throws IOException
  {
    NetRequest.Builder localBuilder = new NetRequest.Builder(paramContext);
    localBuilder.url(UrlConfig.getRequestTypesUrl(paramContext));
    localBuilder.method("GET");
    localBuilder.lat(latitude);
    localBuilder.lng(longitude);
    localBuilder.apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    paramLatLng = DedicatedAppManager.getDedicatedApp(paramContext);
    if (paramLatLng.getIsDedicatedApp()) {
      localBuilder.add("ids", paramLatLng.getAllowedIdsString());
    }
    paramLatLng = localBuilder.create().executeRequest();
    paramLatLng = new DeserializeResponse().getJavaObject(paramLatLng, RequestWatchAreaWrapper.class);
    if (paramLatLng.isEmpty()) {
      return new ArrayList();
    }
    return ((RequestWatchAreaWrapper)paramLatLng.get(0)).getRequestWatchAreas();
  }
  
  public static void launch(LatLng paramLatLng, SafeListener<List<RequestWatchArea>> paramSafeListener)
  {
    new RequestTypesTask(paramSafeListener).execute(new LatLng[] { paramLatLng });
  }
  
  public static void launch(String paramString, LatLng paramLatLng, SafeListener<List<RequestWatchArea>> paramSafeListener)
  {
    cancel(paramString);
    paramSafeListener = new RequestTypesTask(paramSafeListener);
    register(paramString, paramSafeListener);
    paramSafeListener.execute(new LatLng[] { paramLatLng });
  }
  
  protected List<RequestWatchArea> doInBackground(LatLng... paramVarArgs)
  {
    ArrayList localArrayList = new ArrayList();
    try
    {
      paramVarArgs = getByLatLng(paramVarArgs[0], getFragment().getAppContext());
      return paramVarArgs;
    }
    catch (IOException paramVarArgs)
    {
      setErrorCode(SimpleListener.Code.NETWORK_UNAVAILABLE);
    }
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.RequestTypesTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */