package com.seeclickfix.ma.android.services;

import android.app.IntentService;
import android.content.Intent;
import com.seeclickfix.ma.android.db.ReportSaveCommand;
import com.seeclickfix.ma.android.objects.report.Report;

public class DraftSaveService
  extends IntentService
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DraftSaveService";
  private Report report;
  
  public DraftSaveService()
  {
    super("DraftSaveService");
  }
  
  public DraftSaveService(String paramString)
  {
    super(paramString);
  }
  
  protected void onHandleIntent(Intent paramIntent)
  {
    report = ((Report)paramIntent.getParcelableExtra("report_bundle"));
    new ReportSaveCommand(report, getApplicationContext()).execute();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.DraftSaveService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */