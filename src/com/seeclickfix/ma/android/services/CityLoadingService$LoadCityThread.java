package com.seeclickfix.ma.android.services;

import android.content.Context;

class CityLoadingService$LoadCityThread
  extends Thread
{
  private Context ctx;
  
  public CityLoadingService$LoadCityThread(CityLoadingService paramCityLoadingService, Context paramContext)
  {
    ctx = paramContext;
  }
  
  public void run()
  {
    CityLoadingService.access$000(this$0, ctx);
    CityLoadingService.access$100(this$0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.CityLoadingService.LoadCityThread
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */