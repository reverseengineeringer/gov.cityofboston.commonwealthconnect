package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import android.location.Location;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.db.InsertSinglePlace;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.net.PlaceRequest;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class GetPlacesTask
  implements CancellableTask<List<Place>>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GetPlacesTask";
  private Context c;
  private Location location;
  private PlaceRequest req;
  private ShouldRun shouldRun;
  
  public GetPlacesTask(Context paramContext, ShouldRun paramShouldRun, Location paramLocation)
  {
    c = paramContext;
    shouldRun = paramShouldRun;
    location = paramLocation;
  }
  
  private List<Place> callNetRequest()
  {
    new ArrayList();
    ArrayList localArrayList = new ArrayList();
    Dao localDao;
    long l;
    Object localObject2;
    try
    {
      req = new PlaceRequest();
      Object localObject1 = req.getPlaceListByLocation(location, c);
      localDao = DaoUtil.getPlaceDao(c);
      l = System.currentTimeMillis();
      Iterator localIterator = ((List)localObject1).iterator();
      while (localIterator.hasNext())
      {
        localObject1 = (Place)localIterator.next();
        ((Place)localObject1).setLastPlaceUpdateFromApi(l);
        Place localPlace = (Place)localDao.queryForFirst(localDao.queryBuilder().where().eq("api_id", Integer.valueOf(((Place)localObject1).getApiId())).prepare());
        if (localPlace != null)
        {
          localObject1 = localPlace;
          ((Place)localObject1).setLastPlaceUpdateFromApi(l);
        }
        InsertSinglePlace.creatOrUpdate(c, (Place)localObject1);
        continue;
        Collections.sort((List)localObject2);
      }
    }
    catch (Exception localException)
    {
      localObject2 = localArrayList;
    }
    for (;;)
    {
      return (List<Place>)localObject2;
      localObject2 = localDao.query(localDao.queryBuilder().limit(Long.valueOf(30L)).where().eq("selected", Boolean.valueOf(true)).or().gt("last_api_update", Long.valueOf(l - 900000L)).prepare());
    }
  }
  
  public List<Place> call()
  {
    new ArrayList();
    return callNetRequest();
  }
  
  public void cancel()
  {
    req.cancel();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetPlacesTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */