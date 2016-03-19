package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import android.location.Location;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.db.OrmDbHelper;
import com.seeclickfix.ma.android.net.PlaceRequest;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GetPlaceBySearchTask
  implements CancellableTask<List<Place>>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GetIssuesTask";
  private Context c;
  private Location location;
  private String name;
  private PlaceRequest req;
  private ShouldRun shouldRun;
  
  public GetPlaceBySearchTask(Context paramContext, ShouldRun paramShouldRun, Location paramLocation, String paramString)
  {
    c = paramContext;
    shouldRun = paramShouldRun;
    location = paramLocation;
    name = paramString;
  }
  
  private List<Place> callNetRequest()
  {
    Object localObject2 = new ArrayList();
    Object localObject1 = localObject2;
    try
    {
      req = new PlaceRequest();
      localObject1 = localObject2;
      localObject2 = req.getPlacebyName(name, location, c);
      localObject1 = localObject2;
      Dao localDao = ((OrmDbHelper)OpenHelperManager.getHelper(c, OrmDbHelper.class)).getPlaceDao();
      localObject1 = localObject2;
      Iterator localIterator = ((List)localObject2).iterator();
      Object localObject3;
      for (;;)
      {
        localObject1 = localObject2;
        localObject3 = localObject2;
        if (!localIterator.hasNext()) {
          break;
        }
        localObject1 = localObject2;
        localDao.createIfNotExists((Place)localIterator.next());
      }
      return (List<Place>)localObject3;
    }
    catch (Exception localException)
    {
      localObject3 = localObject1;
      c = null;
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
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetPlaceBySearchTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */