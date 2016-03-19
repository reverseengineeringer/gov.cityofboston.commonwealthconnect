package com.seeclickfix.ma.android.fragments.reporting;

import com.seeclickfix.ma.android.objects.report.RequestType;
import java.util.Iterator;
import java.util.List;

public class BlankReqType
{
  public static final String API_BLANK_REQUEST_FAKE_ID = "-1";
  
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
  
  public void addIfNeeded(List<RequestType> paramList)
  {
    if (contains(paramList, "-1")) {
      return;
    }
    RequestType localRequestType = new RequestType();
    localRequestType.setViewType("req_type_blank_view");
    localRequestType.setApiId("-1");
    paramList.add(0, localRequestType);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.BlankReqType
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */