package com.seeclickfix.ma.android.events;

import com.seeclickfix.ma.android.objects.PageParams;

public class AuthRequiredEvent
{
  private PageParams params;
  
  public AuthRequiredEvent(PageParams paramPageParams)
  {
    params = paramPageParams;
  }
  
  public PageParams getParams()
  {
    return params;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.AuthRequiredEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */