package com.seeclickfix.ma.android.fragments.reporting;

import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.app.AppOptions;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class NonDedicatedReqTypes
{
  public List<RequestWatchArea> filterIfNeeded(List<RequestWatchArea> paramList, DedicatedApp paramDedicatedApp)
  {
    if (!getOptionshideNonDedicatedRequestTypes) {
      return paramList;
    }
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      RequestWatchArea localRequestWatchArea = (RequestWatchArea)paramList.next();
      if (FeatureFlagHelper.hasZone(localRequestWatchArea.getId(), paramDedicatedApp)) {
        localArrayList.add(localRequestWatchArea);
      }
    }
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.NonDedicatedReqTypes
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */