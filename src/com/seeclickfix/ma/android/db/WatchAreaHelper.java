package com.seeclickfix.ma.android.db;

import com.j256.ormlite.dao.ForeignCollection;
import com.seeclickfix.ma.android.cache.GlobalReportCache;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestType;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class WatchAreaHelper
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ReportLoadHelper";
  
  public static List<RequestWatchArea> getLocalWatchAreas(Report paramReport)
  {
    new ArrayList();
    if (GlobalReportCache.getReport() != null) {
      return paramReport.getWatchAreas();
    }
    return getWatchAreasFromDb(paramReport);
  }
  
  private static List<RequestWatchArea> getWatchAreasFromDb(Report paramReport)
  {
    ArrayList localArrayList1 = new ArrayList();
    paramReport = paramReport.getWatchAreasDb();
    if (paramReport != null)
    {
      paramReport = paramReport.iterator();
      while (paramReport.hasNext())
      {
        RequestWatchArea localRequestWatchArea = (RequestWatchArea)paramReport.next();
        ArrayList localArrayList2 = new ArrayList();
        Iterator localIterator = localRequestWatchArea.getRequestTypesDb().iterator();
        while (localIterator.hasNext()) {
          localArrayList2.add((RequestType)localIterator.next());
        }
        localRequestWatchArea.setRequestTypes(localArrayList2);
        localArrayList1.add(localRequestWatchArea);
      }
    }
    return localArrayList1;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.WatchAreaHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */