package com.seeclickfix.ma.android.api;

import java.util.Date;

public class SCFService$IssueActionReceipt
{
  public Date createdAt;
  public int follow;
  public SCFService.IssueStub issue;
  public SCFService.Metadata metadata;
  public boolean moderated;
  public int vote;
  
  public String getStatus()
  {
    return issue.status;
  }
  
  public Boolean isModerated()
  {
    if ((moderated) || ((metadata != null) && (metadata.isModerated()))) {}
    for (boolean bool = true;; bool = false) {
      return Boolean.valueOf(bool);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */