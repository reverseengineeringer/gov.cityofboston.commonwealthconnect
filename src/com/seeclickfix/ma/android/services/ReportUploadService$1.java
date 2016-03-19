package com.seeclickfix.ma.android.services;

import com.seeclickfix.ma.android.api.SCFService.IssueCreatedEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueFailureEvent;
import com.seeclickfix.ma.android.objects.apiv2.IssueV2;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.report.Report;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

class ReportUploadService$1
  implements Callback<IssueV2>
{
  ReportUploadService$1(ReportUploadService paramReportUploadService, Report paramReport) {}
  
  public void failure(RetrofitError paramRetrofitError)
  {
    val$report.setState("ReportState:DRAFT");
    ReportUploadService.access$000(this$0, val$report);
    this$0.postEvent(new SCFService.IssueFailureEvent(paramRetrofitError));
  }
  
  public void success(IssueV2 paramIssueV2, Response paramResponse)
  {
    val$report.setState("ReportState:SENT");
    ReportUploadService.access$000(this$0, val$report);
    paramIssueV2 = new SCFService.IssueCreatedEvent(paramIssueV2, paramResponse);
    if (paramIssueV2.isCreated())
    {
      paramResponse = paramIssueV2.getIssue();
      paramResponse.create(this$0.getApplicationContext());
      this$0.showSuccessNotification(paramResponse, val$report);
    }
    this$0.postEvent(paramIssueV2);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.ReportUploadService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */