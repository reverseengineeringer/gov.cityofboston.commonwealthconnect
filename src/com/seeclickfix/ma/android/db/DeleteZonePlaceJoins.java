package com.seeclickfix.ma.android.db;

import android.content.Context;
import android.database.SQLException;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas;
import com.seeclickfix.ma.android.objects.zone.MobileButtonsWithDefaults;
import com.seeclickfix.ma.android.objects.zone.ZonePlaceJoin;
import com.seeclickfix.ma.android.objects.zone.ZoneWrapper;
import java.util.List;
import java.util.concurrent.Callable;

public class DeleteZonePlaceJoins
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DeleteZonePlaceJoins";
  
  private Callable<Integer> getDeleteCallable(final Dao<ZonePlaceJoin, Integer> paramDao, Dao<ZoneWrapper, Integer> paramDao1, Dao<EnhancedWatchAreas, Integer> paramDao2, Dao<MobileButtonsWithDefaults, Integer> paramDao3, final Place paramPlace)
  {
    new Callable()
    {
      public Integer call()
        throws Exception
      {
        List localList = paramDao.queryForEq("place_id", Integer.valueOf(paramPlace.getId()));
        return Integer.valueOf(paramDao.delete(localList));
      }
    };
  }
  
  public int deletePlaceJoins(Place paramPlace, Context paramContext)
  {
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    paramContext.getWritableDatabase();
    try
    {
      Dao localDao = paramContext.getZonePlaceJoinDao();
      int i = ((Integer)localDao.callBatchTasks(getDeleteCallable(localDao, paramContext.getZoneDao(), paramContext.getEnhancedWatchAreaDao(), paramContext.getMobileButtonsDao(), paramPlace))).intValue();
      return i;
    }
    catch (Exception paramPlace)
    {
      return -1;
    }
    catch (SQLException paramPlace) {}
    return -1;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DeleteZonePlaceJoins
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */