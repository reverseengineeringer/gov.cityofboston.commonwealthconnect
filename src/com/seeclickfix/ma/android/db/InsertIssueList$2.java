package com.seeclickfix.ma.android.db;

import android.location.Location;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.issue.IssuePlaceJoin;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;

class InsertIssueList$2
  implements Callable<Void>
{
  InsertIssueList$2(InsertIssueList paramInsertIssueList, Place paramPlace, List paramList, Dao paramDao) {}
  
  public Void call()
    throws Exception
  {
    Location localLocation = new Location("");
    localLocation.setLatitude(val$place.getPlaceLat());
    localLocation.setLongitude(val$place.getPlaceLng());
    Iterator localIterator = val$list.iterator();
    while (localIterator.hasNext())
    {
      Issue localIssue = (Issue)localIterator.next();
      Object localObject = new Location("");
      ((Location)localObject).setLatitude(localIssue.getLat());
      ((Location)localObject).setLongitude(localIssue.getLng());
      double d = localLocation.distanceTo((Location)localObject);
      localObject = new IssuePlaceJoin();
      ((IssuePlaceJoin)localObject).setPlace(val$place);
      ((IssuePlaceJoin)localObject).setIssue(localIssue);
      ((IssuePlaceJoin)localObject).setDistance(d);
      ((IssuePlaceJoin)localObject).setDateJoinCreated(System.currentTimeMillis());
      val$dao.createOrUpdate(localObject);
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.InsertIssueList.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */