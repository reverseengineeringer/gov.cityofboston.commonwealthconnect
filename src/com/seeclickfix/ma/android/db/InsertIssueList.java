package com.seeclickfix.ma.android.db;

import android.content.Context;
import android.database.SQLException;
import android.location.Location;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.issue.IssuePlaceJoin;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;

public class InsertIssueList
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "InsertIssueList";
  
  private Callable<Void> getCallable(final Dao<Issue, Integer> paramDao, final List<Issue> paramList)
  {
    new Callable()
    {
      public Void call()
        throws Exception
      {
        Iterator localIterator = paramList.iterator();
        while (localIterator.hasNext())
        {
          Issue localIssue = (Issue)localIterator.next();
          paramDao.createOrUpdate(localIssue);
        }
        return null;
      }
    };
  }
  
  private Callable<Void> getJoinsCallable(final Dao<IssuePlaceJoin, Integer> paramDao, final List<Issue> paramList, final Place paramPlace)
  {
    new Callable()
    {
      public Void call()
        throws Exception
      {
        Location localLocation = new Location("");
        localLocation.setLatitude(paramPlace.getPlaceLat());
        localLocation.setLongitude(paramPlace.getPlaceLng());
        Iterator localIterator = paramList.iterator();
        while (localIterator.hasNext())
        {
          Issue localIssue = (Issue)localIterator.next();
          Object localObject = new Location("");
          ((Location)localObject).setLatitude(localIssue.getLat());
          ((Location)localObject).setLongitude(localIssue.getLng());
          double d = localLocation.distanceTo((Location)localObject);
          localObject = new IssuePlaceJoin();
          ((IssuePlaceJoin)localObject).setPlace(paramPlace);
          ((IssuePlaceJoin)localObject).setIssue(localIssue);
          ((IssuePlaceJoin)localObject).setDistance(d);
          ((IssuePlaceJoin)localObject).setDateJoinCreated(System.currentTimeMillis());
          paramDao.createOrUpdate(localObject);
        }
        return null;
      }
    };
  }
  
  public void insert(List<Issue> paramList, Place paramPlace, Context paramContext)
  {
    Object localObject = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    ((OrmDbHelper)localObject).getWritableDatabase();
    try
    {
      Dao localDao1 = ((OrmDbHelper)localObject).getIssueDao();
      Dao localDao2 = ((OrmDbHelper)localObject).getIssuePlaceJoinDao();
      ((OrmDbHelper)localObject).getPlaceDao();
      localObject = getCallable(localDao1, paramList);
      paramList = getJoinsCallable(localDao2, paramList, paramPlace);
      InsertSinglePlace.creatOrUpdate(paramContext, paramPlace);
      localDao1.callBatchTasks((Callable)localObject);
      localDao2.callBatchTasks(paramList);
      return;
    }
    catch (Exception paramList) {}catch (SQLException paramList) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.InsertIssueList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */