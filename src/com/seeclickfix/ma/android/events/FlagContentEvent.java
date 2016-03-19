package com.seeclickfix.ma.android.events;

import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.api.SCFService.APIv2;
import java.util.HashMap;
import retrofit.Callback;

public class FlagContentEvent
{
  public String message;
  public int resourceId;
  public String resourceType;
  
  public FlagContentEvent(String paramString1, int paramInt, String paramString2)
  {
    resourceType = paramString1;
    resourceId = paramInt;
    message = paramString2;
  }
  
  public void flagContent(Callback<HashMap<String, String>> paramCallback)
  {
    if (getResourceType() == "comment") {
      MyApplication.scfV2.flagComment(String.valueOf(resourceId), message, paramCallback);
    }
    while (getResourceType() != "issue") {
      return;
    }
    MyApplication.scfV2.flagIssue(String.valueOf(resourceId), message, paramCallback);
  }
  
  public String getMessage()
  {
    return message;
  }
  
  public int getResourceId()
  {
    return resourceId;
  }
  
  public String getResourceType()
  {
    return resourceType;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.FlagContentEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */