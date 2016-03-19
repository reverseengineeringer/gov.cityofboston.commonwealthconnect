package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class Issue$1
  implements Parcelable.Creator<Issue>
{
  public Issue createFromParcel(Parcel paramParcel)
  {
    return new Issue(paramParcel);
  }
  
  public Issue[] newArray(int paramInt)
  {
    return new Issue[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Issue.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */