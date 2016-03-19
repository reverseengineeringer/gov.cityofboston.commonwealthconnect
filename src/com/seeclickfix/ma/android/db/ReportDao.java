package com.seeclickfix.ma.android.db;

import com.j256.ormlite.dao.BaseDaoImpl;
import com.j256.ormlite.support.ConnectionSource;
import com.seeclickfix.ma.android.objects.report.Report;
import java.sql.SQLException;

public class ReportDao
  extends BaseDaoImpl<Report, Integer>
{
  protected ReportDao(ConnectionSource paramConnectionSource, Class<Report> paramClass)
    throws SQLException
  {
    super(paramConnectionSource, paramClass);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.ReportDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */