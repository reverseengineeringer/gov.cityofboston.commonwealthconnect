package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class Transition$1
  implements Parcelable.Creator<Transition>
{
  public Transition createFromParcel(Parcel paramParcel)
  {
    return new Transition(paramParcel, null);
  }
  
  public Transition[] newArray(int paramInt)
  {
    return new Transition[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Transition.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */