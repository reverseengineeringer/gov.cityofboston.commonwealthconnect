package com.seeclickfix.ma.android.objects.issue;

import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.app.AppOptions;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;

public class IssueFilter
{
  private DedicatedApp mDedicatedApp;
  private Map<String, String> mParams = new HashMap();
  private List<Integer> mZoneIds;
  
  public IssueFilter(DedicatedApp paramDedicatedApp)
  {
    mDedicatedApp = paramDedicatedApp;
    initAppFilters();
    addAnyRequestTags();
  }
  
  private void addAnyRequestTags()
  {
    if ((mZoneIds != null) && (!mZoneIds.isEmpty()))
    {
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = mZoneIds.iterator();
      while (localIterator.hasNext())
      {
        Integer localInteger = (Integer)localIterator.next();
        localArrayList.add("plus_watch_area_" + String.valueOf(localInteger));
      }
      mParams.put("request_tags", StringUtils.join(localArrayList, ","));
    }
  }
  
  private void initAppFilters()
  {
    if (mDedicatedApp.getOptions().showOnlyCustomerIssues) {
      mZoneIds = mDedicatedApp.getAllowedZoneIds();
    }
  }
  
  public Map<String, String> get()
  {
    return mParams;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.IssueFilter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */