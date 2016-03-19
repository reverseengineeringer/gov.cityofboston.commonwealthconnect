package com.seeclickfix.ma.android.objects;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class ErrorResponse$1
  implements Parcelable.Creator<ErrorResponse>
{
  public ErrorResponse createFromParcel(Parcel paramParcel)
  {
    return new ErrorResponse(paramParcel);
  }
  
  public ErrorResponse[] newArray(int paramInt)
  {
    return new ErrorResponse[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.ErrorResponse.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */