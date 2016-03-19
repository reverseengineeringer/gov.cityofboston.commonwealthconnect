package com.seeclickfix.ma.android.db;

import android.content.Context;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.seeclickfix.ma.android.cache.IssuesPlaceCache;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

public class InsertPlaces
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "InsertPlaces";
  
  private void clearOldJoins(Place paramPlace, Context paramContext)
  {
    IssuesPlaceCache.invalidatePlaceCache(paramContext, paramPlace);
    new DeleteJoins().deletePlaceJoins(paramPlace, paramContext);
    new DeleteZonePlaceJoins().deletePlaceJoins(paramPlace, paramContext);
  }
  
  public void setPlaces(List<Place> paramList, Context paramContext)
  {
    if ((paramList == null) || (paramContext == null)) {}
    for (;;)
    {
      return;
      try
      {
        ((OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class)).getPlaceDao();
        if (paramList.size() <= 0) {
          continue;
        }
        paramList = paramList.iterator();
        while (paramList.hasNext())
        {
          Place localPlace = (Place)paramList.next();
          clearOldJoins(localPlace, paramContext);
          InsertSinglePlace.creatOrUpdate(paramContext, localPlace);
        }
        return;
      }
      catch (SQLException paramList) {}
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.InsertPlaces
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */