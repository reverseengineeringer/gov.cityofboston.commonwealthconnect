package com.seeclickfix.ma.android.objects.report;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;

public class ReportWrapper
  implements Parcelable
{
  public static final Parcelable.Creator<ReportWrapper> CREATOR = new Parcelable.Creator()
  {
    public ReportWrapper createFromParcel(Parcel paramAnonymousParcel)
    {
      return new ReportWrapper(paramAnonymousParcel, null);
    }
    
    public ReportWrapper[] newArray(int paramAnonymousInt)
    {
      return new ReportWrapper[paramAnonymousInt];
    }
  };
  @SerializedName("api_key")
  private String apiKey = "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249";
  @SerializedName("authenticity_token")
  private String authToken;
  @SerializedName("issue")
  private Report report;
  
  public ReportWrapper() {}
  
  private ReportWrapper(Parcel paramParcel)
  {
    report = ((Report)paramParcel.readParcelable(Report.class.getClassLoader()));
    authToken = paramParcel.readString();
    apiKey = paramParcel.readString();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getApiKey()
  {
    return apiKey;
  }
  
  public Report getReport()
  {
    return report;
  }
  
  public void setApiKey(String paramString)
  {
    apiKey = paramString;
  }
  
  public void setReport(Report paramReport)
  {
    report = paramReport;
  }
  
  public String toString()
  {
    return "ReportWrapper [report=" + report + ", authToken=" + authToken + "]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeValue(report);
    paramParcel.writeString(authToken);
    paramParcel.writeString(apiKey);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.ReportWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */