package com.seeclickfix.ma.android.objects.user;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class User$1
  implements Parcelable.Creator<User>
{
  public User createFromParcel(Parcel paramParcel)
  {
    return new User(paramParcel);
  }
  
  public User[] newArray(int paramInt)
  {
    return new User[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.user.User.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */