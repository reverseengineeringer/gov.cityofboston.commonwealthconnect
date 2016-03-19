package com.seeclickfix.ma.android.objects.loc;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class Place$1
  implements Parcelable.Creator<Place>
{
  public Place createFromParcel(Parcel paramParcel)
  {
    return new Place(paramParcel, null);
  }
  
  public Place[] newArray(int paramInt)
  {
    return new Place[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.loc.Place.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */