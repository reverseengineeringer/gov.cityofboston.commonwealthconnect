package com.seeclickfix.ma.android.services;

import android.app.IntentService;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.support.v4.app.NotificationCompat.BigTextStyle;
import android.support.v4.app.NotificationCompat.Builder;
import android.support.v4.app.TaskStackBuilder;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.api.SCFService.APIv2;
import com.seeclickfix.ma.android.api.SCFService.IssueCreatedEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueFailureEvent;
import com.seeclickfix.ma.android.db.ReportSaveCommand;
import com.seeclickfix.ma.android.media.ImageResizer;
import com.seeclickfix.ma.android.objects.apiv2.IssueV2;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.report.Report;
import com.squareup.otto.Bus;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class ReportUploadService
  extends IntentService
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ReportUploadService";
  private Bus bus;
  
  public ReportUploadService()
  {
    super("reportUpload");
  }
  
  private void saveReport(Report paramReport)
  {
    new ReportSaveCommand(paramReport, getApplicationContext()).execute();
  }
  
  protected void onHandleIntent(final Intent paramIntent)
  {
    MyApplication localMyApplication = (MyApplication)getApplicationContext();
    setBus(MyApplication.getEventBus());
    if (paramIntent.getAction().equals("com.seeclickfix.actions.UPLOAD_REPORT"))
    {
      paramIntent = (Report)paramIntent.getParcelableExtra("report_bundle");
      MyApplication.scfV2.createIssue(paramIntent.typedImageFile(), paramIntent.toAPIv2Map(), new Callback()
      {
        public void failure(RetrofitError paramAnonymousRetrofitError)
        {
          paramIntent.setState("ReportState:DRAFT");
          ReportUploadService.this.saveReport(paramIntent);
          postEvent(new SCFService.IssueFailureEvent(paramAnonymousRetrofitError));
        }
        
        public void success(IssueV2 paramAnonymousIssueV2, Response paramAnonymousResponse)
        {
          paramIntent.setState("ReportState:SENT");
          ReportUploadService.this.saveReport(paramIntent);
          paramAnonymousIssueV2 = new SCFService.IssueCreatedEvent(paramAnonymousIssueV2, paramAnonymousResponse);
          if (paramAnonymousIssueV2.isCreated())
          {
            paramAnonymousResponse = paramAnonymousIssueV2.getIssue();
            paramAnonymousResponse.create(getApplicationContext());
            showSuccessNotification(paramAnonymousResponse, paramIntent);
          }
          postEvent(paramAnonymousIssueV2);
        }
      });
    }
  }
  
  public void postEvent(Object paramObject)
  {
    bus.post(paramObject);
  }
  
  public void setBus(Bus paramBus)
  {
    bus = paramBus;
  }
  
  protected void showSuccessNotification(Issue paramIssue, Report paramReport)
  {
    Resources localResources = getResources();
    NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(getApplicationContext());
    localBuilder.setAutoCancel(true);
    localBuilder.setContentTitle(localResources.getString(2131493069, new Object[] { paramIssue.getSummary() }));
    localBuilder.setContentText(getString(2131492884));
    localBuilder.setSmallIcon(2130837809);
    localBuilder.setTicker(localResources.getString(2131493069, new Object[] { paramIssue.getSummary() }));
    String str = paramReport.getLocalImagePath();
    int i = localResources.getDimensionPixelSize(2131296287);
    int j = localResources.getDimensionPixelSize(2131296286);
    paramIssue.setFollowing(true);
    if (str != null)
    {
      paramIssue.setLocalImagePath(str);
      localBuilder.setLargeIcon(ImageResizer.decodeSampledBitmapFromFile(paramReport.getLocalImagePath(), i, j, null));
      localBuilder.setStyle(new NotificationCompat.BigTextStyle().bigText(paramIssue.getDescription()).setBigContentTitle(localResources.getString(2131493069, new Object[] { paramIssue.getSummary() })).setSummaryText(getString(2131492884)));
    }
    for (;;)
    {
      paramReport = getApplicationContext().getPackageName();
      paramReport = getApplicationContext().getPackageManager().getLaunchIntentForPackage(paramReport);
      paramReport.setAction("com.seeclickfix.actions.ISSUE_DETAIL_NOTIF");
      paramReport.putExtra("issue_bundle", paramIssue);
      paramIssue = TaskStackBuilder.create(this);
      paramIssue.addParentStack(paramReport.getComponent());
      paramIssue.addNextIntent(paramReport);
      localBuilder.setContentIntent(paramIssue.getPendingIntent(0, 134217728));
      paramIssue = localBuilder.build();
      ((NotificationManager)getSystemService("notification")).notify(-1381111555, paramIssue);
      return;
      localBuilder.setLargeIcon(ImageResizer.decodeSampledBitmapFromResource(localResources, 2130837808, i, j, null));
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.ReportUploadService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */