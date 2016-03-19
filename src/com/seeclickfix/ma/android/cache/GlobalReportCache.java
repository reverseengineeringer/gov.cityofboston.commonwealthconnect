package com.seeclickfix.ma.android.cache;

import com.seeclickfix.ma.android.objects.report.Report;

public class GlobalReportCache
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GlobalObjectCache";
  private static Report currentReport = null;
  
  public static void clearReport()
  {
    currentReport = null;
  }
  
  public static Report getReport()
  {
    return currentReport;
  }
  
  public static void markReportForDelete()
  {
    if (currentReport != null) {
      currentReport.setState("ReportState:MARKED_FOR_DELETE");
    }
  }
  
  public static void putReport(Report paramReport)
  {
    currentReport = paramReport;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.cache.GlobalReportCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */