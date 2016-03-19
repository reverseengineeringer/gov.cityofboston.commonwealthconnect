package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import android.content.res.Resources;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.OtherWatchAreaFactory;
import com.seeclickfix.ma.android.objects.app.AppOptions;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestType;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import java.util.Iterator;
import java.util.List;
import javax.inject.Inject;

public class DefaultOtherZone
{
  @Inject
  Context c;
  
  private boolean getIsOtherAdded(List<RequestWatchArea> paramList)
  {
    String str1 = c.getResources().getString(2131493153);
    String str2;
    do
    {
      do
      {
        paramList = paramList.iterator();
        Iterator localIterator;
        while (!localIterator.hasNext())
        {
          if (!paramList.hasNext()) {
            break;
          }
          localIterator = ((RequestWatchArea)paramList.next()).getRequestTypes().iterator();
        }
        str2 = ((RequestType)localIterator.next()).getTitle();
      } while (str2 == null);
      if (str2.equalsIgnoreCase("Other")) {
        return true;
      }
    } while (!str2.equalsIgnoreCase(str1));
    return true;
    return false;
  }
  
  private boolean getShouldBlockOther(List<RequestWatchArea> paramList)
  {
    DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(c);
    return FeatureFlagHelper.hasEnabledZone(getOptionsblockOtherCategory, paramList, localDedicatedApp);
  }
  
  public void addOtherIfNeeded(List<RequestWatchArea> paramList, Report paramReport)
  {
    boolean bool1 = getIsOtherAdded(paramList);
    boolean bool2 = getShouldBlockOther(paramList);
    if ((!bool1) && (!bool2)) {
      paramList.add(OtherWatchAreaFactory.getOtherArea(c, paramReport));
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZone
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */