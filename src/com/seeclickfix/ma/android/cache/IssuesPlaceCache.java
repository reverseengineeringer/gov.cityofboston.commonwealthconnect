package com.seeclickfix.ma.android.cache;

import android.content.Context;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.objects.loc.Place;

public class IssuesPlaceCache
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "IssuesPlaceCache";
  
  public static void invalidatePlaceCache(Context paramContext, Place paramPlace)
  {
    paramContext = DaoUtil.getPlaceDao(paramContext);
    paramPlace.setLastSuccessfulListQuery(0L);
    try
    {
      paramContext.update(paramPlace);
      return;
    }
    catch (Exception paramContext) {}
  }
  
  public static boolean isCacheStale(Context paramContext, Place paramPlace)
  {
    long l = paramPlace.getLastSuccessfulListQuery();
    if ((System.currentTimeMillis() - l <= 1800000L) && (l == 0L)) {}
    return true;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.cache.IssuesPlaceCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */