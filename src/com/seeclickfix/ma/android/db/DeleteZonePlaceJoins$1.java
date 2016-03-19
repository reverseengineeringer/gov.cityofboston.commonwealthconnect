package com.seeclickfix.ma.android.db;

import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.util.List;
import java.util.concurrent.Callable;

class DeleteZonePlaceJoins$1
  implements Callable<Integer>
{
  DeleteZonePlaceJoins$1(DeleteZonePlaceJoins paramDeleteZonePlaceJoins, Dao paramDao, Place paramPlace) {}
  
  public Integer call()
    throws Exception
  {
    List localList = val$dao.queryForEq("place_id", Integer.valueOf(val$place.getId()));
    return Integer.valueOf(val$dao.delete(localList));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DeleteZonePlaceJoins.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */