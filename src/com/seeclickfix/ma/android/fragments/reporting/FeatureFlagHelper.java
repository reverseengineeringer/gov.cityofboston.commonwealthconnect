package com.seeclickfix.ma.android.fragments.reporting;

import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.lang3.StringUtils;

public class FeatureFlagHelper
{
  public static boolean hasEnabledZone(boolean paramBoolean, List<RequestWatchArea> paramList, DedicatedApp paramDedicatedApp)
  {
    int j = 0;
    paramList = paramList.iterator();
    do
    {
      i = j;
      if (!paramList.hasNext()) {
        break;
      }
    } while (!hasZone(((RequestWatchArea)paramList.next()).getId(), paramDedicatedApp));
    int i = 1;
    return (i != 0) && (paramBoolean);
  }
  
  public static boolean hasZone(int paramInt, DedicatedApp paramDedicatedApp)
  {
    boolean bool2 = false;
    paramDedicatedApp = paramDedicatedApp.getAllowedZoneIds();
    if (paramDedicatedApp == null) {
      return false;
    }
    paramDedicatedApp = paramDedicatedApp.iterator();
    do
    {
      bool1 = bool2;
      if (!paramDedicatedApp.hasNext()) {
        break;
      }
    } while (((Integer)paramDedicatedApp.next()).intValue() != paramInt);
    boolean bool1 = true;
    return bool1;
  }
  
  public static boolean isZoneEnabled(String paramString, int paramInt, DedicatedApp paramDedicatedApp)
  {
    boolean bool1 = hasZone(paramInt, paramDedicatedApp);
    boolean bool2 = StringUtils.isNotEmpty(paramString);
    return (bool1) && (bool2);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.FeatureFlagHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */