package com.seeclickfix.ma.android.objects.apiv2;

import com.google.gson.annotations.SerializedName;

public class RemoteIntegration
{
  @SerializedName("remote_id")
  private String remoteId;
  private String status;
  private String title;
  
  public String getRemoteId()
  {
    return remoteId;
  }
  
  public String getStatus()
  {
    return status;
  }
  
  public String getTitle()
  {
    return title;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.apiv2.RemoteIntegration
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */