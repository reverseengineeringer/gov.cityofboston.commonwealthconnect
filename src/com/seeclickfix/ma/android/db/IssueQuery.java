package com.seeclickfix.ma.android.db;

import android.content.Context;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.PreparedQuery;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.loc.Place;
import java.sql.SQLException;

public class IssueQuery
  implements DbQuery<Issue>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "IssueQuery";
  private Place place;
  private PreparedQuery<Issue> preparedQuery;
  
  public IssueQuery(Place paramPlace)
  {
    place = paramPlace;
  }
  
  public PreparedQuery<Issue> getPreparedQuery(Context paramContext)
  {
    if (preparedQuery != null) {
      return preparedQuery;
    }
    Object localObject = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    ((OrmDbHelper)localObject).getWritableDatabase();
    preparedQuery = null;
    try
    {
      paramContext = ((OrmDbHelper)localObject).getIssueDao().queryBuilder();
      localObject = ((OrmDbHelper)localObject).getIssuePlaceJoinDao().queryBuilder();
      ((QueryBuilder)localObject).where().eq("place_id", Integer.valueOf(place.getId()));
      ((QueryBuilder)localObject).limit(Long.valueOf(25L));
      preparedQuery = paramContext.join((QueryBuilder)localObject).prepare();
      preparedQuery.getStatement();
      return preparedQuery;
    }
    catch (SQLException paramContext)
    {
      for (;;) {}
    }
  }
  
  public String getRawQuery(Context paramContext)
  {
    String str = "SELECT * FROM issues_by_place WHERE place_id =" + place.getId();
    try
    {
      paramContext = getPreparedQuery(paramContext).getStatement();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return str;
  }
  
  public void setPreparedQuery(PreparedQuery<Issue> paramPreparedQuery)
  {
    preparedQuery = paramPreparedQuery;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.IssueQuery
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */