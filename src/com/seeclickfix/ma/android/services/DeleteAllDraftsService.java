package com.seeclickfix.ma.android.services;

import android.app.IntentService;
import android.content.Intent;
import com.seeclickfix.ma.android.db.DeleteReportHelper;
import java.sql.SQLException;

public class DeleteAllDraftsService
  extends IntentService
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DeleteAllDraftsService";
  
  public DeleteAllDraftsService()
  {
    super("DeleteAllDraftsService");
  }
  
  public DeleteAllDraftsService(String paramString)
  {
    super(paramString);
  }
  
  protected void onHandleIntent(Intent paramIntent)
  {
    paramIntent = new DeleteReportHelper(getApplicationContext());
    try
    {
      paramIntent.deleteAllDrafts();
      return;
    }
    catch (SQLException paramIntent) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.DeleteAllDraftsService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */