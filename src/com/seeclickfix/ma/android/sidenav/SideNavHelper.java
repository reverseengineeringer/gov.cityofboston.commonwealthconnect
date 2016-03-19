package com.seeclickfix.ma.android.sidenav;

import android.content.Context;
import android.widget.Button;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.app.AppOptions;

public class SideNavHelper
{
  private DedicatedApp mDedicatedApp;
  
  public SideNavHelper(Context paramContext, DedicatedApp paramDedicatedApp)
  {
    DedicatedApp localDedicatedApp = paramDedicatedApp;
    if (paramDedicatedApp == null) {
      localDedicatedApp = DedicatedAppManager.getDedicatedApp(paramContext);
    }
    mDedicatedApp = localDedicatedApp;
  }
  
  public static String getHelpUrl(Context paramContext)
  {
    return new SideNavHelper(paramContext, null).getHelpUrl();
  }
  
  public static void hideHelpButtonFromView(Context paramContext, Button paramButton)
  {
    new SideNavHelper(paramContext, null).hideHelpButtonFromView(paramButton);
  }
  
  public String getHelpUrl()
  {
    AppOptions localAppOptions = mDedicatedApp.getOptions();
    if ((mDedicatedApp.getIsDedicatedApp()) && (localAppOptions != null)) {
      return helpLink;
    }
    return null;
  }
  
  public void hideHelpButtonFromView(Button paramButton)
  {
    AppOptions localAppOptions = mDedicatedApp.getOptions();
    if ((mDedicatedApp.getIsDedicatedApp()) && (localAppOptions != null) && (helpLink == null)) {
      paramButton.setVisibility(8);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.sidenav.SideNavHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */