package com.seeclickfix.ma.android.db.util;

import android.content.Context;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.db.OrmDbHelper;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestType;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas;
import com.seeclickfix.ma.android.objects.zone.ZonePlaceJoin;
import com.seeclickfix.ma.android.objects.zone.ZoneWrapper;
import java.sql.SQLException;

public class DaoUtil
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DaoUtil";
  
  public static Dao<Answer, Integer> getAnswerDao(Context paramContext)
  {
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    try
    {
      paramContext = paramContext.getAnswerDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<EnhancedWatchAreas, Integer> getEnhancedWatchAreaDao(Context paramContext)
  {
    try
    {
      paramContext = ((OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class)).getEnhancedWatchAreaDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<Issue, Integer> getIssueDao(Context paramContext)
  {
    try
    {
      paramContext = ((OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class)).getIssueDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<Place, Integer> getPlaceDao(Context paramContext)
  {
    try
    {
      paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
      paramContext.getWritableDatabase();
      paramContext = paramContext.getPlaceDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<Question, Integer> getQuestionDao(Context paramContext)
  {
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    try
    {
      paramContext = paramContext.getQuestionDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<Report, Integer> getReportDao(Context paramContext)
  {
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    try
    {
      paramContext = paramContext.getReportDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<RequestType, Integer> getRequestTypeDao(Context paramContext)
  {
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    try
    {
      paramContext = paramContext.getRequestTypeDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<RequestWatchArea, Integer> getWatchAreaDao(Context paramContext)
  {
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    try
    {
      paramContext = paramContext.getWatchAreaDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<ZonePlaceJoin, Integer> getZonePlaceJoinDao(Context paramContext)
  {
    try
    {
      paramContext = ((OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class)).getZonePlaceJoinDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
  
  public static Dao<ZoneWrapper, Integer> getZonesDao(Context paramContext)
  {
    try
    {
      paramContext = ((OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class)).getZoneDao();
      return paramContext;
    }
    catch (SQLException paramContext) {}
    return null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.util.DaoUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */