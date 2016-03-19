package com.seeclickfix.ma.android.services;

import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.objects.issue.Comment;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

class CommentUploadService$2
  implements Callback<SCFService.IssueActionReceipt>
{
  CommentUploadService$2(CommentUploadService paramCommentUploadService, Comment paramComment) {}
  
  public void failure(RetrofitError paramRetrofitError)
  {
    paramRetrofitError = new SCFService.RetrofitResult(paramRetrofitError);
    val$comment.synch(paramRetrofitError);
    this$0.postEvent(val$comment.toEvent(paramRetrofitError));
  }
  
  public void success(SCFService.IssueActionReceipt paramIssueActionReceipt, Response paramResponse)
  {
    paramIssueActionReceipt = new SCFService.RetrofitResult(paramIssueActionReceipt, paramResponse);
    val$comment.synch(paramIssueActionReceipt);
    this$0.postEvent(val$comment.toEvent(paramIssueActionReceipt));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.CommentUploadService.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */