package com.seeclickfix.ma.android.db;

import android.content.Context;
import android.database.SQLException;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.DeleteBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.objects.issue.IssuePlaceJoin;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.util.concurrent.Callable;

public class DeleteJoins
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DeleteJoins";
  
  private Callable<Integer> getDeleteCallable(final Dao<IssuePlaceJoin, Integer> paramDao, final Place paramPlace)
  {
    new Callable()
    {
      public Integer call()
        throws Exception
      {
        DeleteBuilder localDeleteBuilder = paramDao.deleteBuilder();
        localDeleteBuilder.where().eq("place_id", Integer.valueOf(paramPlace.getId()));
        return Integer.valueOf(paramDao.delete(localDeleteBuilder.prepare()));
      }
    };
  }
  
  public int deletePlaceJoins(Place paramPlace, Context paramContext)
  {
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    paramContext.getWritableDatabase();
    try
    {
      paramContext = paramContext.getIssuePlaceJoinDao();
      int i = ((Integer)paramContext.callBatchTasks(getDeleteCallable(paramContext, paramPlace))).intValue();
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
 * Qualified Name:     com.seeclickfix.ma.android.db.DeleteJoins
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */