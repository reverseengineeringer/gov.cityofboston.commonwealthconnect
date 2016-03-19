package com.seeclickfix.ma.android.services;

import android.util.Log;
import com.j256.ormlite.dao.Dao;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;

class CityLoadingService$1
  implements Callable<Void>
{
  CityLoadingService$1(CityLoadingService paramCityLoadingService, List paramList) {}
  
  public Void call()
    throws Exception
  {
    int i = 0;
    Iterator localIterator = val$chunkList.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      i += CityLoadingService.access$200(this$0).executeRaw(str, new String[0]);
    }
    Log.v("numInserted ", "" + i);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.CityLoadingService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */