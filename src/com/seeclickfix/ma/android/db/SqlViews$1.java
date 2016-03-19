package com.seeclickfix.ma.android.db;

import com.j256.ormlite.dao.RawRowMapper;
import com.seeclickfix.ma.android.objects.issue.Issue;

class SqlViews$1
  implements RawRowMapper<Issue>
{
  SqlViews$1(SqlViews paramSqlViews) {}
  
  public Issue mapRow(String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    return new Issue();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.SqlViews.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */