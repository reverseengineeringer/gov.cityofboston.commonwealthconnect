package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class Nop$1
  implements Parcelable.Creator<Nop>
{
  public Nop createFromParcel(Parcel paramParcel)
  {
    return new Nop(paramParcel, null);
  }
  
  public Nop[] newArray(int paramInt)
  {
    return new Nop[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Nop.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */