package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class Vote$1
  implements Parcelable.Creator<Vote>
{
  public Vote createFromParcel(Parcel paramParcel)
  {
    return new Vote(paramParcel, null);
  }
  
  public Vote[] newArray(int paramInt)
  {
    return new Vote[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Vote.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */