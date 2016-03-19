package com.seeclickfix.ma.android.objects;

import android.content.Context;
import android.content.res.Resources;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestType;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import java.util.ArrayList;
import java.util.List;

public class OtherWatchAreaFactory
{
  public static RequestWatchArea getOtherArea(Context paramContext, Report paramReport)
  {
    RequestWatchArea localRequestWatchArea = new RequestWatchArea();
    localRequestWatchArea.setTitle(paramContext.getResources().getString(2131493152));
    localRequestWatchArea.setId(-1);
    RequestType localRequestType = new RequestType();
    localRequestType.setApiId("other");
    localRequestType.setTitle(paramContext.getResources().getString(2131493153));
    localRequestType.setWatchArea(localRequestWatchArea);
    localRequestType.setNumQuestions(0);
    paramContext = new ArrayList();
    paramContext.add(localRequestType);
    localRequestWatchArea.setRequestTypes(paramContext);
    localRequestWatchArea.setReport(paramReport);
    localRequestWatchArea.setDefault(true);
    return localRequestWatchArea;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.OtherWatchAreaFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */