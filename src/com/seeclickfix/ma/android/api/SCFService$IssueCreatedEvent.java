package com.seeclickfix.ma.android.api;

import com.seeclickfix.ma.android.fragments.NoticeItem;
import com.seeclickfix.ma.android.objects.apiv2.IssueV2;
import com.seeclickfix.ma.android.objects.issue.Issue;
import retrofit.client.Response;

public class SCFService$IssueCreatedEvent
{
  private Issue issue;
  private Response response;
  
  public SCFService$IssueCreatedEvent(IssueV2 paramIssueV2, Response paramResponse)
  {
    response = paramResponse;
    if (isCreated())
    {
      issue = Issue.fromIssue2(paramIssueV2);
      return;
    }
    issue = null;
  }
  
  public Issue getIssue()
  {
    return issue;
  }
  
  public NoticeItem getNoticeItem()
  {
    if (isAccepted()) {
      return NoticeItem.ACCEPTED();
    }
    return NoticeItem.CREATED();
  }
  
  public Response getResponse()
  {
    return response;
  }
  
  public boolean isAccepted()
  {
    return getResponse().getStatus() == 202;
  }
  
  public boolean isCreated()
  {
    return getResponse().getStatus() == 201;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.IssueCreatedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */