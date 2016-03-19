package gov.cityofboston.commonwealthconnect;

import com.seeclickfix.ma.android.SeeclickfixActivity;
import com.seeclickfix.ma.android.api.SCFService.IssueCreatedEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueFailureEvent;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;
import com.seeclickfix.ma.android.events.FlagContentEvent;
import com.seeclickfix.ma.android.events.GooglePlayErrorEvent;
import com.seeclickfix.ma.android.events.LocationNotEnabledEvent;
import com.seeclickfix.ma.android.events.LoginEvent;
import com.seeclickfix.ma.android.events.LoginSkipEvent;
import com.seeclickfix.ma.android.events.LogoutEvent;
import com.seeclickfix.ma.android.events.ShowReportEvent;
import com.seeclickfix.ma.android.events.SplashContinueEvent;
import com.seeclickfix.ma.android.events.UnboxingContinueEvent;
import com.seeclickfix.ma.android.events.UserProfileLoadedEvent;
import com.seeclickfix.ma.android.objects.modules.MainActivityModule;
import com.squareup.otto.Subscribe;
import dagger.Module;
import java.util.List;

public class DedicatedActivity
  extends SeeclickfixActivity
{
  public List<Object> getActivityModules()
  {
    List localList = super.getActivityModules();
    localList.add(new DedicatedActivityModule());
    return localList;
  }
  
  @Subscribe
  public void onAuthRequiredEvent(AuthRequiredEvent paramAuthRequiredEvent)
  {
    super.onAuthRequiredEvent(paramAuthRequiredEvent);
  }
  
  @Subscribe
  public void onFlagContentEvent(FlagContentEvent paramFlagContentEvent)
  {
    super.onFlagContentEvent(paramFlagContentEvent);
  }
  
  @Subscribe
  public void onGooglePlayErrorEvent(GooglePlayErrorEvent paramGooglePlayErrorEvent)
  {
    super.onGooglePlayErrorEvent(paramGooglePlayErrorEvent);
  }
  
  @Subscribe
  public void onIssueCreatedEvent(SCFService.IssueCreatedEvent paramIssueCreatedEvent)
  {
    super.onIssueCreatedEvent(paramIssueCreatedEvent);
  }
  
  @Subscribe
  public void onIssueFailureEvent(SCFService.IssueFailureEvent paramIssueFailureEvent)
  {
    super.onIssueFailureEvent(paramIssueFailureEvent);
  }
  
  @Subscribe
  public void onLocationNotEnabledEvent(LocationNotEnabledEvent paramLocationNotEnabledEvent)
  {
    super.onLocationNotEnabledEvent(paramLocationNotEnabledEvent);
  }
  
  @Subscribe
  public void onLoginEvent(LoginEvent paramLoginEvent)
  {
    super.onLoginEvent(paramLoginEvent);
  }
  
  @Subscribe
  public void onLoginSkipEvent(LoginSkipEvent paramLoginSkipEvent)
  {
    super.onLoginSkipEvent(paramLoginSkipEvent);
  }
  
  @Subscribe
  public void onLogoutEvent(LogoutEvent paramLogoutEvent)
  {
    super.onLogoutEvent(paramLogoutEvent);
  }
  
  @Subscribe
  public void onShowReportEvent(ShowReportEvent paramShowReportEvent)
  {
    super.onShowReportEvent(paramShowReportEvent);
  }
  
  @Subscribe
  public void onSplashContinueEvent(SplashContinueEvent paramSplashContinueEvent)
  {
    super.onSplashContinueEvent(paramSplashContinueEvent);
  }
  
  @Subscribe
  public void onUnboxingContinueEvent(UnboxingContinueEvent paramUnboxingContinueEvent)
  {
    super.onUnboxingContinueEvent(paramUnboxingContinueEvent);
  }
  
  @Subscribe
  public void onUserProfileEvent(UserProfileLoadedEvent paramUserProfileLoadedEvent)
  {
    super.onUserProfileEvent(paramUserProfileLoadedEvent);
  }
  
  @Module(includes={MainActivityModule.class}, injects={DedicatedActivity.class}, library=true)
  public static class DedicatedActivityModule {}
}

/* Location:
 * Qualified Name:     gov.cityofboston.commonwealthconnect.DedicatedActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */