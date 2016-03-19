package com.seeclickfix.ma.android.adapters;

import android.content.Context;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.objects.zone.MobileButtonsWithDefaults;
import java.util.ArrayList;
import java.util.List;

public class ZoneBtnListFilter
{
  public static List<MobileButtonsWithDefaults> convert(List<MobileButtonsWithDefaults> paramList, Context paramContext)
  {
    ArrayList localArrayList = new ArrayList();
    int j = paramList.size();
    int i = 0;
    if (i < j)
    {
      MobileButtonsWithDefaults localMobileButtonsWithDefaults = (MobileButtonsWithDefaults)paramList.get(i);
      if ((i < 6) && (isNeededBtn(localMobileButtonsWithDefaults, paramContext))) {
        localArrayList.add(localMobileButtonsWithDefaults);
      }
      for (;;)
      {
        i += 1;
        break;
        if (i >= 6) {
          localArrayList.add(localMobileButtonsWithDefaults);
        }
      }
    }
    return localArrayList;
  }
  
  private static boolean isNeededBtn(MobileButtonsWithDefaults paramMobileButtonsWithDefaults, Context paramContext)
  {
    boolean bool1 = DedicatedAppManager.isDedicatedApp(paramContext);
    boolean bool2 = "scf://report".equalsIgnoreCase(paramMobileButtonsWithDefaults.getUri());
    return (bool1) && (bool2);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.ZoneBtnListFilter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */