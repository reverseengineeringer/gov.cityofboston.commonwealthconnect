package com.seeclickfix.ma.android.db;

import android.content.Context;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.DeleteBuilder;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.objects.report.Report;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

public class DeleteReportHelper
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DeleteReportHelper";
  private Context ctx;
  
  public DeleteReportHelper(Context paramContext)
  {
    ctx = paramContext;
  }
  
  public void deleteAllDrafts()
    throws SQLException
  {
    Object localObject = DaoUtil.getReportDao(ctx);
    QueryBuilder localQueryBuilder = ((Dao)localObject).queryBuilder();
    localQueryBuilder.where().eq("report_state", "ReportState:DRAFT");
    localObject = ((Dao)localObject).query(localQueryBuilder.prepare()).iterator();
    while (((Iterator)localObject).hasNext()) {
      deleteByReport((Report)((Iterator)localObject).next());
    }
  }
  
  public void deleteById(int paramInt)
  {
    Dao localDao = DaoUtil.getReportDao(ctx);
    if (paramInt >= 0) {}
    try
    {
      deleteReportChildren(paramInt);
      localDao.deleteById(Integer.valueOf(paramInt));
      return;
    }
    catch (SQLException localSQLException) {}
  }
  
  public void deleteByReport(Report paramReport)
  {
    deleteById(paramReport.getDbId());
  }
  
  public void deleteReportChildren(int paramInt)
    throws SQLException
  {
    Object localObject4 = DaoUtil.getWatchAreaDao(ctx);
    Object localObject2 = DaoUtil.getQuestionDao(ctx);
    Object localObject1 = DaoUtil.getAnswerDao(ctx);
    Object localObject3 = DaoUtil.getRequestTypeDao(ctx);
    localObject4 = ((Dao)localObject4).deleteBuilder();
    ((DeleteBuilder)localObject4).where().eq("report_id", Integer.valueOf(paramInt));
    ((DeleteBuilder)localObject4).delete();
    localObject3 = ((Dao)localObject3).deleteBuilder();
    ((DeleteBuilder)localObject3).where().eq("report_id", Integer.valueOf(paramInt));
    ((DeleteBuilder)localObject3).delete();
    localObject2 = ((Dao)localObject2).deleteBuilder();
    ((DeleteBuilder)localObject2).where().eq("report_id", Integer.valueOf(paramInt));
    ((DeleteBuilder)localObject2).delete();
    localObject1 = ((Dao)localObject1).deleteBuilder();
    ((DeleteBuilder)localObject1).where().eq("report_id", Integer.valueOf(paramInt));
    ((DeleteBuilder)localObject1).delete();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DeleteReportHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */