package com.seeclickfix.ma.android.objects.report;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class RequestType$1
  implements Parcelable.Creator<RequestType>
{
  public RequestType createFromParcel(Parcel paramParcel)
  {
    return new RequestType(paramParcel, null);
  }
  
  public RequestType[] newArray(int paramInt)
  {
    return new RequestType[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.RequestType.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */