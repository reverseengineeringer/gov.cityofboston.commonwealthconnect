package com.seeclickfix.ma.android.db;

import android.content.Context;
import android.util.Log;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestType;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import com.seeclickfix.ma.android.util.CollectionUtil;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class ReportSaveCommand
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ReportSaveCommand";
  private Context c;
  private Dao<Report, Integer> dao;
  private OrmDbHelper helper;
  private Report report;
  private Dao<RequestWatchArea, Integer> watchAreaDao;
  
  public ReportSaveCommand(Report paramReport, Context paramContext)
  {
    report = paramReport;
    c = paramContext;
  }
  
  private void createQuestionsAndAnswers()
    throws SQLException
  {
    Log.w("ReportSaveCommand", "createQuestionsAndAnswers()");
    Dao localDao1 = helper.getQuestionDao();
    Dao localDao2 = helper.getAnswerDao();
    Object localObject = report.getQuestions();
    if (CollectionUtil.isNotNullOrEmpty((Collection)localObject))
    {
      localObject = ((Collection)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        Question localQuestion = (Question)((Iterator)localObject).next();
        Answer localAnswer = localQuestion.getSelectedAnswer();
        localQuestion.setReport(report);
        if (localAnswer != null)
        {
          localAnswer.setReport(report);
          localDao2.createOrUpdate(localAnswer);
        }
        localDao1.createOrUpdate(localQuestion);
      }
    }
  }
  
  private void createRequestTypes(RequestWatchArea paramRequestWatchArea)
    throws SQLException
  {
    Dao localDao = helper.getRequestTypeDao();
    Object localObject = paramRequestWatchArea.getRequestTypes();
    if (CollectionUtil.isNotNullOrEmpty((Collection)localObject))
    {
      localObject = ((Collection)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        RequestType localRequestType = (RequestType)((Iterator)localObject).next();
        localRequestType.setWatchArea(paramRequestWatchArea);
        localRequestType.setReport(report);
        localDao.createOrUpdate(localRequestType);
      }
    }
  }
  
  private void createWatchAreas()
    throws SQLException
  {
    watchAreaDao = helper.getWatchAreaDao();
    Object localObject = report.getWatchAreas();
    if (CollectionUtil.isNotNullOrEmpty((Collection)localObject))
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        RequestWatchArea localRequestWatchArea = (RequestWatchArea)((Iterator)localObject).next();
        localRequestWatchArea.setReport(report);
        createRequestTypes(localRequestWatchArea);
        watchAreaDao.createOrUpdate(localRequestWatchArea);
      }
    }
  }
  
  public void execute()
  {
    helper = ((OrmDbHelper)OpenHelperManager.getHelper(c, OrmDbHelper.class));
    try
    {
      dao = helper.getReportDao();
      report.setDao(dao);
      new DeleteReportHelper(c).deleteAllDrafts();
      dao.createOrUpdate(report);
      createQuestionsAndAnswers();
      createWatchAreas();
      return;
    }
    catch (SQLException localSQLException) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.ReportSaveCommand
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */