package com.seeclickfix.ma.android.events;

import android.content.Intent;

public class StartActivityEvent
{
  private Intent intent;
  
  public StartActivityEvent(Intent paramIntent)
  {
    intent = paramIntent;
  }
  
  public Intent getIntent()
  {
    return intent;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.StartActivityEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */