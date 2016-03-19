package com.seeclickfix.ma.android.fragments.reporting;

import com.seeclickfix.ma.android.cache.GlobalReportCache;
import com.seeclickfix.ma.android.objects.report.Report;
import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class ReportProvider
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_ReportProvider";
  @Inject
  ReportDbLoader mReportDbLoader;
  
  private Report loadFromCache()
  {
    Report localReport = GlobalReportCache.getReport();
    String str;
    int i;
    if (localReport != null)
    {
      str = localReport.getState();
      i = -1;
      switch (str.hashCode())
      {
      }
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        return null;
        if (str.equals("ReportState:DRAFT"))
        {
          i = 0;
          continue;
          if (str.equals("ReportState:NONE")) {
            i = 1;
          }
        }
        break;
      }
    }
    return localReport;
  }
  
  public Report load()
  {
    Object localObject2 = loadFromCache();
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = mReportDbLoader.load((Report)localObject2);
    }
    localObject2 = localObject1;
    if (localObject1 == null) {
      localObject2 = new Report();
    }
    return (Report)localObject2;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.ReportProvider
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */