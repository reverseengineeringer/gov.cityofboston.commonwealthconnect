package com.seeclickfix.ma.android.objects.report;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.List;

public class RequestWatchAreaWrapper
  implements Parcelable
{
  public static final Parcelable.Creator<RequestWatchAreaWrapper> CREATOR = new Parcelable.Creator()
  {
    public RequestWatchAreaWrapper createFromParcel(Parcel paramAnonymousParcel)
    {
      return new RequestWatchAreaWrapper(paramAnonymousParcel, null);
    }
    
    public RequestWatchAreaWrapper[] newArray(int paramAnonymousInt)
    {
      return new RequestWatchAreaWrapper[paramAnonymousInt];
    }
  };
  @SerializedName("enhanced_watch_areas")
  private List<RequestWatchArea> requestWatchAreas = new ArrayList();
  
  private RequestWatchAreaWrapper(Parcel paramParcel)
  {
    paramParcel.readTypedList(requestWatchAreas, RequestWatchArea.CREATOR);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public List<RequestWatchArea> getRequestWatchAreas()
  {
    return requestWatchAreas;
  }
  
  public void setRequestWatchAreas(List<RequestWatchArea> paramList)
  {
    requestWatchAreas = paramList;
  }
  
  public String toString()
  {
    return "RequestWatchAreaWrapper [requestWatchAreas=" + requestWatchAreas + "]\n";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeTypedList(requestWatchAreas);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.RequestWatchAreaWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */