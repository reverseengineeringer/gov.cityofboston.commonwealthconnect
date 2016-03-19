package com.seeclickfix.ma.android.events;

import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.user.AuthUser;

public class LoginEvent
{
  private PageParams onAuthCompleteParams;
  private AuthUser user;
  
  public LoginEvent(AuthUser paramAuthUser, PageParams paramPageParams)
  {
    user = paramAuthUser;
    if (paramPageParams != null)
    {
      onAuthCompleteParams = paramPageParams;
      return;
    }
    onAuthCompleteParams = new PageParams();
  }
  
  public PageParams getOnAuthCompleteParams()
  {
    return onAuthCompleteParams;
  }
  
  public AuthUser getUser()
  {
    return user;
  }
  
  public void setUser(AuthUser paramAuthUser)
  {
    user = paramAuthUser;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.LoginEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */