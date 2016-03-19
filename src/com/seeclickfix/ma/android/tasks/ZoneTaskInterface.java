package com.seeclickfix.ma.android.tasks;

import java.util.Map;

public abstract interface ZoneTaskInterface
{
  public abstract Map<String, String> buildParams();
  
  public abstract void cancel();
  
  public abstract void execute();
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.ZoneTaskInterface
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */