package com.seeclickfix.ma.android.events;

import com.seeclickfix.ma.android.objects.user.User;

public class UserProfileLoadedEvent
{
  private User user;
  
  public UserProfileLoadedEvent(User paramUser)
  {
    user = paramUser;
  }
  
  public User getUser()
  {
    return user;
  }
  
  public String toString()
  {
    return "UserProfileLoadedEvent [user=" + user + "]";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.UserProfileLoadedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */