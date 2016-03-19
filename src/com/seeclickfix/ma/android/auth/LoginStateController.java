package com.seeclickfix.ma.android.auth;

import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;
import com.seeclickfix.ma.android.events.LoginEvent;
import com.seeclickfix.ma.android.events.LoginSkipEvent;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.squareup.otto.Bus;
import com.squareup.otto.Produce;
import com.squareup.otto.Subscribe;

public class LoginStateController
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "LoginStateMachine";
  private static LoginStateController instance = null;
  private AuthUser mUser = null;
  private PageParams onAuthCompleteParams;
  
  public static LoginStateController getInstance()
  {
    if (instance == null) {
      instance = new LoginStateController();
    }
    return instance;
  }
  
  public void clearAuthCompleteParams()
  {
    onAuthCompleteParams = null;
  }
  
  public void dispatchLoginEvent(AuthUser paramAuthUser)
  {
    mUser = paramAuthUser;
    MyApplication.getEventBus().post(new LoginEvent(mUser, onAuthCompleteParams));
  }
  
  public void dispatchLoginSkipEvent()
  {
    MyApplication.getEventBus().post(new LoginSkipEvent(onAuthCompleteParams));
  }
  
  public PageParams getOnAuthCompleteParams()
  {
    return onAuthCompleteParams;
  }
  
  @Subscribe
  public void onAuthRequiredEvent(AuthRequiredEvent paramAuthRequiredEvent)
  {
    onAuthCompleteParams = paramAuthRequiredEvent.getParams();
  }
  
  @Produce
  public LoginEvent produceLoginState()
  {
    if (mUser == null) {
      return null;
    }
    return new LoginEvent(mUser, onAuthCompleteParams);
  }
  
  public void resetLoginState()
  {
    mUser = null;
    onAuthCompleteParams = null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.LoginStateController
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */