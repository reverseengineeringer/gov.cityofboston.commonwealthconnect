package com.seeclickfix.ma.android.objects.media;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class ImageParcel$1
  implements Parcelable.Creator<ImageParcel>
{
  public ImageParcel createFromParcel(Parcel paramParcel)
  {
    return new ImageParcel(paramParcel, null);
  }
  
  public ImageParcel[] newArray(int paramInt)
  {
    return new ImageParcel[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.media.ImageParcel.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */