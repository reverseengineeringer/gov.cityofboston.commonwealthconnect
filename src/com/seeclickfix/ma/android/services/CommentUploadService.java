package com.seeclickfix.ma.android.services;

import android.app.IntentService;
import android.content.Intent;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.api.SCFService.APIv2;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.objects.issue.Comment;
import com.seeclickfix.ma.android.objects.issue.Transition;
import com.squareup.otto.Bus;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;
import retrofit.mime.TypedString;

public class CommentUploadService
  extends IntentService
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "CommentUploadService";
  private Bus bus;
  
  public CommentUploadService()
  {
    super("commentUpload");
  }
  
  Callback<SCFService.IssueActionReceipt> buildCommentCallback(final Comment paramComment)
  {
    new Callback()
    {
      public void failure(RetrofitError paramAnonymousRetrofitError)
      {
        paramAnonymousRetrofitError = new SCFService.RetrofitResult(paramAnonymousRetrofitError);
        paramComment.synch(paramAnonymousRetrofitError);
        postEvent(paramComment.toEvent(paramAnonymousRetrofitError));
      }
      
      public void success(SCFService.IssueActionReceipt paramAnonymousIssueActionReceipt, Response paramAnonymousResponse)
      {
        paramAnonymousIssueActionReceipt = new SCFService.RetrofitResult(paramAnonymousIssueActionReceipt, paramAnonymousResponse);
        paramComment.synch(paramAnonymousIssueActionReceipt);
        postEvent(paramComment.toEvent(paramAnonymousIssueActionReceipt));
      }
    };
  }
  
  Callback<SCFService.IssueActionReceipt> buildIssueCallback(final Comment paramComment)
  {
    new Callback()
    {
      public void failure(RetrofitError paramAnonymousRetrofitError)
      {
        paramAnonymousRetrofitError = new SCFService.RetrofitResult(paramAnonymousRetrofitError);
        postEvent(paramComment.toEvent(paramAnonymousRetrofitError));
      }
      
      public void success(SCFService.IssueActionReceipt paramAnonymousIssueActionReceipt, Response paramAnonymousResponse)
      {
        paramAnonymousIssueActionReceipt = new SCFService.RetrofitResult(paramAnonymousIssueActionReceipt, paramAnonymousResponse);
        postEvent(paramComment.toEvent(paramAnonymousIssueActionReceipt));
      }
    };
  }
  
  Callback<SCFService.IssueActionReceipt> buildStatusChangeCallback(final Transition paramTransition)
  {
    new Callback()
    {
      public void failure(RetrofitError paramAnonymousRetrofitError)
      {
        paramAnonymousRetrofitError = new SCFService.RetrofitResult(paramAnonymousRetrofitError);
        paramTransition.synch(paramAnonymousRetrofitError);
        postEvent(paramTransition.toEvent(paramAnonymousRetrofitError));
      }
      
      public void success(SCFService.IssueActionReceipt paramAnonymousIssueActionReceipt, Response paramAnonymousResponse)
      {
        paramAnonymousIssueActionReceipt = new SCFService.RetrofitResult(paramAnonymousIssueActionReceipt, paramAnonymousResponse);
        paramTransition.synch(paramAnonymousIssueActionReceipt);
        postEvent(paramTransition.toEvent(paramAnonymousIssueActionReceipt));
      }
    };
  }
  
  protected void onHandleIntent(Intent paramIntent)
  {
    if (paramIntent == null) {}
    do
    {
      return;
      localObject = (MyApplication)getApplicationContext();
      setBus(MyApplication.getEventBus());
    } while (!paramIntent.getAction().equals("com.seeclickfix.actions.UPLOAD_COMMENT"));
    paramIntent = (Comment)paramIntent.getParcelableExtra("comment_bundle");
    Object localObject = paramIntent.getCommentType();
    int i = -1;
    switch (((String)localObject).hashCode())
    {
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        return;
      case 0: 
        MyApplication.scfV2.openIssue(paramIntent.getIssueId(), paramIntent.partMap(), buildStatusChangeCallback((Transition)paramIntent));
        return;
        if (((String)localObject).equals("Issue Reopened"))
        {
          i = 0;
          continue;
          if (((String)localObject).equals("Issue Acknowledged"))
          {
            i = 1;
            continue;
            if (((String)localObject).equals("Issue Closed"))
            {
              i = 2;
              continue;
              if (((String)localObject).equals("Issue Voted For"))
              {
                i = 3;
                continue;
                if (((String)localObject).equals("Issue Revoked Vote For"))
                {
                  i = 4;
                  continue;
                  if (((String)localObject).equals("Watcher Added"))
                  {
                    i = 5;
                    continue;
                    if (((String)localObject).equals("Comment")) {
                      i = 6;
                    }
                  }
                }
              }
            }
          }
        }
        break;
      }
    }
    MyApplication.scfV2.acknowledgeIssue(paramIntent.getIssueId(), paramIntent.partMap(), buildStatusChangeCallback((Transition)paramIntent));
    return;
    MyApplication.scfV2.closeIssue(paramIntent.getIssueId(), paramIntent.partMap(), buildStatusChangeCallback((Transition)paramIntent));
    return;
    MyApplication.scfV2.voteForIssue(paramIntent.getIssueId(), buildIssueCallback(paramIntent));
    return;
    MyApplication.scfV2.revokeVoteForIssue(paramIntent.getIssueId(), buildIssueCallback(paramIntent));
    return;
    MyApplication.scfV2.followIssue(paramIntent.getIssueId(), buildIssueCallback(paramIntent));
    return;
    MyApplication.scfV2.commentOnIssue(paramIntent.getIssueId(), new TypedString(paramIntent.getComment()), paramIntent.typedImageFile(), paramIntent.typedVideoFile(), new TypedString(paramIntent.getYoutubeUrl()), buildCommentCallback(paramIntent));
  }
  
  public void postEvent(Object paramObject)
  {
    bus.post(paramObject);
  }
  
  public void setBus(Bus paramBus)
  {
    bus = paramBus;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.CommentUploadService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */