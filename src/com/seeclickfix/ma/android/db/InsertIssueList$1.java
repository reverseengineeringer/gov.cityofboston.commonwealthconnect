package com.seeclickfix.ma.android.db;

import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.objects.issue.Issue;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;

class InsertIssueList$1
  implements Callable<Void>
{
  InsertIssueList$1(InsertIssueList paramInsertIssueList, List paramList, Dao paramDao) {}
  
  public Void call()
    throws Exception
  {
    Iterator localIterator = val$list.iterator();
    while (localIterator.hasNext())
    {
      Issue localIssue = (Issue)localIterator.next();
      val$dao.createOrUpdate(localIssue);
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.InsertIssueList.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */