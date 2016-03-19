package com.seeclickfix.ma.android.events;

import com.seeclickfix.ma.android.objects.PageParams;

public class LoginSkipEvent
{
  private PageParams onAuthCompleteParams;
  
  public LoginSkipEvent(PageParams paramPageParams)
  {
    onAuthCompleteParams = paramPageParams;
  }
  
  public PageParams getOnAuthCompleteParams()
  {
    return onAuthCompleteParams;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.LoginSkipEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */