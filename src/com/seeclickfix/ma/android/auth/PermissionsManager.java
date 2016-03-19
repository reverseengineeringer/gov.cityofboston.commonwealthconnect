package com.seeclickfix.ma.android.auth;

import android.content.Context;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.events.LoginEvent;
import com.seeclickfix.ma.android.events.LogoutEvent;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.app.AppOptions;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.squareup.otto.Subscribe;
import javax.inject.Inject;

public class PermissionsManager
{
  static DedicatedApp app;
  static AppOptions appOptions;
  static AuthUser authUser;
  static boolean isDedicated = false;
  @Inject
  Context mContext;
  
  @Inject
  public PermissionsManager()
  {
    app = DedicatedAppManager.getDedicatedApp(mContext);
    isDedicated = app.getIsDedicatedApp();
    appOptions = app.getOptions();
  }
  
  private boolean areActionsRestricted(Issue paramIssue)
  {
    return (!closedIsFinal()) || (!paramIssue.isClosedOrArchived());
  }
  
  public boolean closedIsFinal()
  {
    return (isDedicated) && (appOptionsblockActionOnClosedIssues);
  }
  
  public boolean isActionableIssue(String paramString, Issue paramIssue)
  {
    int i = -1;
    switch (paramString.hashCode())
    {
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        return true;
        if (paramString.equals("com.seeclickfix.actions.CHANGE_STATUS"))
        {
          i = 0;
          continue;
          if (paramString.equals("com.seeclickfix.actions.COMMENT"))
          {
            i = 1;
            continue;
            if (paramString.equals("com.seeclickfix.actions.VOTE")) {
              i = 2;
            }
          }
        }
        break;
      }
    }
    return areActionsRestricted(paramIssue);
  }
  
  @Subscribe
  public void onLoginEvent(LoginEvent paramLoginEvent)
  {
    authUser = paramLoginEvent.getUser();
  }
  
  @Subscribe
  public void onLogoutEvent(LogoutEvent paramLogoutEvent)
  {
    authUser = null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.PermissionsManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */