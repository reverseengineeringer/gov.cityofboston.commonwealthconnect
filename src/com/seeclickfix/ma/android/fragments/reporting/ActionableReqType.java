package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.report.RequestType;
import java.util.Iterator;
import java.util.List;

public class ActionableReqType
{
  public static final String API_311_REQUEST_FAKE_ID = "-311";
  
  private boolean contains(List<RequestType> paramList, String paramString)
  {
    if (paramList == null) {}
    do
    {
      while (!paramList.hasNext())
      {
        return false;
        paramList = paramList.iterator();
      }
    } while (!((RequestType)paramList.next()).getApiId().equals(paramString));
    return true;
  }
  
  public void add311IfNeeded(List<RequestType> paramList, int paramInt, Context paramContext)
  {
    if (contains(paramList, "-311")) {}
    do
    {
      return;
      paramContext = DedicatedAppManager.getDedicatedApp(paramContext);
    } while (!FeatureFlagHelper.isZoneEnabled(paramContext.getCall311Number(), paramInt, paramContext));
    RequestType localRequestType = new RequestType();
    localRequestType.setViewType("req_type_button_view");
    localRequestType.setApiId("-311");
    localRequestType.setAction("android.intent.action.DIAL");
    localRequestType.setActionData(paramContext.getCall311Number());
    localRequestType.setHeaderTitle(paramContext.getCall311HeaderTitle());
    localRequestType.setTitle(paramContext.getCall311Message());
    paramList.add(localRequestType);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.ActionableReqType
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */