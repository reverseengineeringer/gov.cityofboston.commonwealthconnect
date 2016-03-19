package com.seeclickfix.ma.android.db;

import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.DeleteBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.util.concurrent.Callable;

class DeleteJoins$1
  implements Callable<Integer>
{
  DeleteJoins$1(DeleteJoins paramDeleteJoins, Dao paramDao, Place paramPlace) {}
  
  public Integer call()
    throws Exception
  {
    DeleteBuilder localDeleteBuilder = val$dao.deleteBuilder();
    localDeleteBuilder.where().eq("place_id", Integer.valueOf(val$place.getId()));
    return Integer.valueOf(val$dao.delete(localDeleteBuilder.prepare()));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DeleteJoins.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */