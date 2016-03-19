package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.ForeignCollection;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.db.WatchAreaHelper;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.objects.report.Question;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class ReportDbLoader
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_ReportDbLoader";
  @Inject
  Context c;
  
  private Report loadQuestions(Report paramReport)
  {
    Iterator localIterator;
    ArrayList localArrayList;
    Dao localDao;
    if (paramReport.getQuestionsDb() != null)
    {
      localIterator = paramReport.getQuestionsDb().iterator();
      localArrayList = new ArrayList();
      localDao = DaoUtil.getAnswerDao(c);
    }
    for (;;)
    {
      Question localQuestion;
      if (localIterator.hasNext()) {
        localQuestion = (Question)localIterator.next();
      }
      try
      {
        localDao.refresh(localQuestion.getSelectedAnswer());
        localArrayList.add(localQuestion);
        continue;
        paramReport.setQuestions(localArrayList);
        return paramReport;
      }
      catch (SQLException localSQLException)
      {
        for (;;) {}
      }
    }
  }
  
  private Report loadZones(Report paramReport)
  {
    Object localObject = WatchAreaHelper.getLocalWatchAreas(paramReport);
    if (!((List)localObject).isEmpty()) {}
    for (int i = 1; i != 0; i = 0)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        RequestWatchArea localRequestWatchArea = (RequestWatchArea)((Iterator)localObject).next();
        if (localRequestWatchArea.getId() == paramReport.getSelectedWatchAreaApiId())
        {
          localRequestWatchArea.setIsFromDraft(true);
          loadQuestions(paramReport);
        }
      }
    }
    return paramReport;
  }
  
  public Report load(Report paramReport)
  {
    Object localObject1 = DaoUtil.getReportDao(c);
    if (paramReport != null) {
      paramReport.setDao((Dao)localObject1);
    }
    Object localObject2 = ((Dao)localObject1).queryBuilder();
    try
    {
      localObject2 = (Report)((Dao)localObject1).queryForFirst(((QueryBuilder)localObject2).orderBy("id", false).where().eq("report_state", "ReportState:DRAFT").prepare());
      localObject1 = paramReport;
      if (localObject2 != null) {
        localObject1 = loadZones((Report)localObject2);
      }
      return (Report)localObject1;
    }
    catch (SQLException localSQLException) {}
    return paramReport;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.ReportDbLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */