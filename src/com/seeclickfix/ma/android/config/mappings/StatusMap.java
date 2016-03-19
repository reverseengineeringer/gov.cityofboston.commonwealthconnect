package com.seeclickfix.ma.android.config.mappings;

import android.content.res.Resources;
import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class StatusMap
{
  public static final String ACKNOWLEDGED = "Acknowledged";
  public static final String ACTION_ACKNOWLEDGE = "Issue Acknowledged";
  public static final String ACTION_CLOSE = "Issue Closed";
  private static final Map<String, String> ACTION_MAP;
  public static final String ACTION_REOPEN = "Issue Reopened";
  public static final String ARCHIVED = "Archived";
  public static final String CLOSED = "Closed";
  public static final String OPEN = "Open";
  private static LinkedHashMap<String, String> STATUS_MAP;
  private static LinkedHashMap<String, String> stateMap;
  
  static
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    localLinkedHashMap.put("Open", "Issue Reopened");
    localLinkedHashMap.put("Closed", "Issue Closed");
    localLinkedHashMap.put("Acknowledged", "Issue Acknowledged");
    ACTION_MAP = localLinkedHashMap;
    localLinkedHashMap = new LinkedHashMap();
    localLinkedHashMap.put("Issue Reopened", "Open");
    localLinkedHashMap.put("Issue Closed", "Closed");
    localLinkedHashMap.put("Issue Acknowledged", "Acknowledged");
    STATUS_MAP = localLinkedHashMap;
  }
  
  public static String getActionString(String paramString)
  {
    return (String)ACTION_MAP.get(paramString);
  }
  
  public static List<String> getDisplayForList(List<String> paramList)
  {
    Lists.transform(paramList, new Function()
    {
      public String apply(String paramAnonymousString)
      {
        return StatusMap.getStateDisplayString(paramAnonymousString);
      }
    });
  }
  
  public static String getStateDisplayString(String paramString)
  {
    return (String)getStateMap().get(paramString);
  }
  
  public static List<String> getStateDisplayStrings()
  {
    return new ArrayList(getStateMap().values());
  }
  
  public static LinkedHashMap<String, String> getStateMap()
  {
    if (stateMap == null)
    {
      Object localObject = MyApplication.instance;
      localObject = MyApplication.res;
      stateMap = new LinkedHashMap();
      localObject = ((Resources)localObject).getStringArray(2131099653);
      stateMap.put("Open", localObject[0]);
      stateMap.put("Closed", localObject[1]);
      stateMap.put("Acknowledged", localObject[2]);
      stateMap.put("Archived", localObject[3]);
    }
    return stateMap;
  }
  
  public static List<String> getStatusStateKeys()
  {
    return new ArrayList(getStateMap().keySet());
  }
  
  public static String getStatusString(String paramString)
  {
    return (String)STATUS_MAP.get(paramString);
  }
  
  public static List<String> statusListForIssue(Issue paramIssue, AuthUser paramAuthUser, boolean paramBoolean)
  {
    int j = 0;
    HashSet localHashSet = new HashSet();
    localHashSet.add(paramIssue.getStatus());
    String str = paramIssue.getStatus();
    int i;
    switch (str.hashCode())
    {
    default: 
      i = -1;
      switch (i)
      {
      default: 
        label62:
        label84:
        if ((paramAuthUser != null) && (paramAuthUser.getCanAcknowledge()))
        {
          paramIssue = paramIssue.getStatus();
          switch (paramIssue.hashCode())
          {
          default: 
            label132:
            i = -1;
            label134:
            switch (i)
            {
            }
            break;
          }
        }
        break;
      }
      break;
    }
    for (;;)
    {
      return new ArrayList(localHashSet);
      if (!str.equals("Open")) {
        break;
      }
      i = 0;
      break label62;
      if (!str.equals("Closed")) {
        break;
      }
      i = 1;
      break label62;
      localHashSet.add("Closed");
      break label84;
      localHashSet.add("Open");
      break label84;
      if (!paramIssue.equals("Open")) {
        break label132;
      }
      i = j;
      break label134;
      if (!paramIssue.equals("Acknowledged")) {
        break label132;
      }
      i = 1;
      break label134;
      localHashSet.add("Acknowledged");
      continue;
      localHashSet.add("Closed");
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.config.mappings.StatusMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */