package com.seeclickfix.ma.android.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.j256.ormlite.android.apptools.OrmLiteSqliteOpenHelper;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.DaoManager;
import com.j256.ormlite.support.ConnectionSource;
import com.j256.ormlite.table.TableUtils;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.issue.IssuePlaceJoin;
import com.seeclickfix.ma.android.objects.loc.City;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.loc.SimplifiedCenter;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestType;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas;
import com.seeclickfix.ma.android.objects.zone.MobileButtonsWithDefaults;
import com.seeclickfix.ma.android.objects.zone.ZonePlaceJoin;
import com.seeclickfix.ma.android.objects.zone.ZoneWrapper;
import java.sql.SQLException;

public class OrmDbHelper
  extends OrmLiteSqliteOpenHelper
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "OrmDbHelper";
  private Dao<Answer, Integer> answerDao;
  private Context c;
  private Dao<City, Integer> cityDao;
  private Dao<EnhancedWatchAreas, Integer> enahancedWatchAreaDao;
  private boolean isUpgrading = false;
  private Dao<Issue, Integer> issueDao;
  private Dao<IssuePlaceJoin, Integer> issuePlaceJoinDao;
  private Dao<MobileButtonsWithDefaults, Integer> mobileButtonsDao;
  private Dao<Place, Integer> placeDao;
  private Dao<Question, Integer> questionDao;
  private Dao<Report, Integer> reportDao;
  private Dao<RequestType, Integer> requestTypeDao;
  private Dao<RequestWatchArea, Integer> watchAreaDao;
  private Dao<ZoneWrapper, Integer> zoneDao;
  private Dao<ZonePlaceJoin, Integer> zonePlaceJoinDao;
  
  public OrmDbHelper(Context paramContext)
  {
    super(paramContext, "scfcache.db", null, DatabaseConfig.DB_VERSION);
    c = paramContext;
    if (PrefsUtil.getInt("Pref:DB_VERSION", 0, paramContext) < DatabaseConfig.DB_VERSION)
    {
      isUpgrading = true;
      return;
    }
    isUpgrading = false;
  }
  
  public Dao<Answer, Integer> getAnswerDao()
    throws SQLException
  {
    answerDao = DaoManager.createDao(connectionSource, Answer.class);
    return answerDao;
  }
  
  public Dao<City, Integer> getCityDao()
    throws SQLException
  {
    cityDao = DaoManager.createDao(connectionSource, City.class);
    return cityDao;
  }
  
  public Dao<EnhancedWatchAreas, Integer> getEnhancedWatchAreaDao()
    throws SQLException
  {
    enahancedWatchAreaDao = DaoManager.createDao(connectionSource, EnhancedWatchAreas.class);
    return enahancedWatchAreaDao;
  }
  
  public Dao<Issue, Integer> getIssueDao()
    throws SQLException
  {
    issueDao = DaoManager.createDao(connectionSource, Issue.class);
    return issueDao;
  }
  
  public Dao<IssuePlaceJoin, Integer> getIssuePlaceJoinDao()
    throws SQLException
  {
    issuePlaceJoinDao = DaoManager.createDao(connectionSource, IssuePlaceJoin.class);
    return issuePlaceJoinDao;
  }
  
  public Dao<MobileButtonsWithDefaults, Integer> getMobileButtonsDao()
    throws SQLException
  {
    mobileButtonsDao = DaoManager.createDao(connectionSource, MobileButtonsWithDefaults.class);
    return mobileButtonsDao;
  }
  
  public Dao<Place, Integer> getPlaceDao()
    throws SQLException
  {
    placeDao = DaoManager.createDao(connectionSource, Place.class);
    return placeDao;
  }
  
  public Dao<Question, Integer> getQuestionDao()
    throws SQLException
  {
    questionDao = DaoManager.createDao(connectionSource, Question.class);
    return questionDao;
  }
  
  public Dao<Report, Integer> getReportDao()
    throws SQLException
  {
    reportDao = DaoManager.createDao(connectionSource, Report.class);
    return reportDao;
  }
  
  public Dao<RequestType, Integer> getRequestTypeDao()
    throws SQLException
  {
    requestTypeDao = DaoManager.createDao(connectionSource, RequestType.class);
    return requestTypeDao;
  }
  
  public Dao<RequestWatchArea, Integer> getWatchAreaDao()
    throws SQLException
  {
    watchAreaDao = DaoManager.createDao(connectionSource, RequestWatchArea.class);
    return watchAreaDao;
  }
  
  public Dao<ZoneWrapper, Integer> getZoneDao()
    throws SQLException
  {
    zoneDao = DaoManager.createDao(connectionSource, ZoneWrapper.class);
    return zoneDao;
  }
  
  public Dao<ZonePlaceJoin, Integer> getZonePlaceJoinDao()
    throws SQLException
  {
    zonePlaceJoinDao = DaoManager.createDao(connectionSource, ZonePlaceJoin.class);
    return zonePlaceJoinDao;
  }
  
  public boolean isUpgrading()
  {
    return isUpgrading;
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase, ConnectionSource paramConnectionSource)
  {
    try
    {
      TableUtils.createTable(paramConnectionSource, Issue.class);
      TableUtils.createTable(paramConnectionSource, Place.class);
      TableUtils.createTable(paramConnectionSource, IssuePlaceJoin.class);
      TableUtils.createTable(paramConnectionSource, Report.class);
      TableUtils.createTable(paramConnectionSource, SimplifiedCenter.class);
      TableUtils.createTable(paramConnectionSource, Question.class);
      TableUtils.createTable(paramConnectionSource, Answer.class);
      TableUtils.createTable(paramConnectionSource, City.class);
      TableUtils.createTable(paramConnectionSource, RequestWatchArea.class);
      TableUtils.createTable(paramConnectionSource, RequestType.class);
      TableUtils.createTable(paramConnectionSource, ZoneWrapper.class);
      TableUtils.createTable(paramConnectionSource, ZonePlaceJoin.class);
      TableUtils.createTable(paramConnectionSource, MobileButtonsWithDefaults.class);
      TableUtils.createTable(paramConnectionSource, EnhancedWatchAreas.class);
      paramSQLiteDatabase.execSQL("CREATE VIEW IF NOT EXISTS issues_by_place AS SELECT DISTINCT i.id as id,i.user_id as user_id,i.address as address,i.description as description,i.lat as lat,i.lng as lng,i.anonymize_reporter as anonymize_reporter,i.summary as summary,i.num_comments as num_comments,i.bitly as bitly,i.slug as slug,i.rating as rating,i.status as status,i.type as type,i.updated_at as updated_at,i.updated_at_raw as updated_at_raw,i.comment_count_excluding_activity as comment_count_excluding_activity,i.following as following,i.icon_square as icon_square,i.photo_large_url as photo_large_url,i.photo_small_url as photo_small_url,i.photo_square_url as photo_square_url,i.minutes_since_created as minutes_since_created,i.voted_before as voted_before,i.created_at_epoch as created_at_epoch,i.created_at as created_at,i.reporter_display as reporter_display,p.id as place_id FROM issues i, places p, issue_place_join j WHERE j.place_id = p.id AND j.issue_id = i.id");
      PrefsUtil.putInt("Pref:DB_VERSION", DatabaseConfig.DB_VERSION, c);
      isUpgrading = false;
      return;
    }
    catch (SQLException paramSQLiteDatabase)
    {
      for (;;) {}
    }
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, ConnectionSource paramConnectionSource, int paramInt1, int paramInt2)
  {
    isUpgrading = true;
    try
    {
      TableUtils.dropTable(paramConnectionSource, Issue.class, true);
      TableUtils.dropTable(paramConnectionSource, Place.class, true);
      TableUtils.dropTable(paramConnectionSource, IssuePlaceJoin.class, true);
      TableUtils.dropTable(paramConnectionSource, Report.class, true);
      TableUtils.dropTable(paramConnectionSource, SimplifiedCenter.class, true);
      TableUtils.dropTable(paramConnectionSource, Question.class, true);
      TableUtils.dropTable(paramConnectionSource, Answer.class, true);
      TableUtils.dropTable(paramConnectionSource, City.class, true);
      TableUtils.dropTable(paramConnectionSource, RequestWatchArea.class, true);
      TableUtils.dropTable(paramConnectionSource, RequestType.class, true);
      TableUtils.dropTable(paramConnectionSource, ZoneWrapper.class, true);
      TableUtils.dropTable(paramConnectionSource, ZonePlaceJoin.class, true);
      TableUtils.dropTable(paramConnectionSource, MobileButtonsWithDefaults.class, true);
      TableUtils.dropTable(paramConnectionSource, EnhancedWatchAreas.class, true);
      onCreate(paramSQLiteDatabase, paramConnectionSource);
      return;
    }
    catch (SQLException paramSQLiteDatabase)
    {
      isUpgrading = false;
    }
  }
  
  public void setUpgrading(boolean paramBoolean)
  {
    isUpgrading = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.OrmDbHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */