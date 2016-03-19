package com.seeclickfix.ma.android.api;

import com.seeclickfix.ma.android.objects.issue.Comment;

public class SCFService$IssueActionEvent
{
  protected final Comment comment;
  protected final SCFService.RetrofitResult<SCFService.IssueActionReceipt> issueActionResult;
  
  public SCFService$IssueActionEvent(Comment paramComment, SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    comment = paramComment;
    issueActionResult = paramRetrofitResult;
  }
  
  public Comment getComment()
  {
    return comment;
  }
  
  public SCFService.RetrofitResult<SCFService.IssueActionReceipt> getIssueActionResult()
  {
    return issueActionResult;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.IssueActionEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */