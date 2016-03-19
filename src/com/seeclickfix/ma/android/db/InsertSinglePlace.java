package com.seeclickfix.ma.android.db;

import android.content.Context;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.sql.SQLException;

public class InsertSinglePlace
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "InsertSinglePlace";
  
  public static void creatOrUpdate(Context paramContext, Place paramPlace)
    throws SQLException
  {
    paramContext = DaoUtil.getPlaceDao(paramContext);
    if ((Place)paramContext.queryForFirst(paramContext.queryBuilder().where().eq("api_id", Integer.valueOf(paramPlace.getApiId())).prepare()) != null)
    {
      paramContext.update(paramPlace);
      return;
    }
    paramContext.create(paramPlace);
  }
  
  public static void update(Context paramContext, Place paramPlace)
    throws SQLException
  {
    DaoUtil.getPlaceDao(paramContext).update(paramPlace);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.InsertSinglePlace
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */