package com.seeclickfix.ma.android.api;

import com.seeclickfix.ma.android.config.mappings.StatusMap;
import com.seeclickfix.ma.android.objects.issue.Transition;

public class SCFService$ChangeStatusEvent
  extends SCFService.IssueActionEvent
{
  private final String eventType;
  
  public SCFService$ChangeStatusEvent(Transition paramTransition, SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    super(paramTransition, paramRetrofitResult);
    eventType = paramTransition.getCommentType();
  }
  
  public String getEventType()
  {
    return eventType;
  }
  
  public String getStatus()
  {
    return StatusMap.getStatusString(getEventType());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.ChangeStatusEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */