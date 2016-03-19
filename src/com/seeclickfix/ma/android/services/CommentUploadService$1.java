package com.seeclickfix.ma.android.services;

import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.objects.issue.Transition;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

class CommentUploadService$1
  implements Callback<SCFService.IssueActionReceipt>
{
  CommentUploadService$1(CommentUploadService paramCommentUploadService, Transition paramTransition) {}
  
  public void failure(RetrofitError paramRetrofitError)
  {
    paramRetrofitError = new SCFService.RetrofitResult(paramRetrofitError);
    val$transition.synch(paramRetrofitError);
    this$0.postEvent(val$transition.toEvent(paramRetrofitError));
  }
  
  public void success(SCFService.IssueActionReceipt paramIssueActionReceipt, Response paramResponse)
  {
    paramIssueActionReceipt = new SCFService.RetrofitResult(paramIssueActionReceipt, paramResponse);
    val$transition.synch(paramIssueActionReceipt);
    this$0.postEvent(val$transition.toEvent(paramIssueActionReceipt));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.CommentUploadService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */