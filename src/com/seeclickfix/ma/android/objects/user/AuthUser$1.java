package com.seeclickfix.ma.android.objects.user;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class AuthUser$1
  implements Parcelable.Creator<AuthUser>
{
  public AuthUser createFromParcel(Parcel paramParcel)
  {
    return new AuthUser(paramParcel, null);
  }
  
  public AuthUser[] newArray(int paramInt)
  {
    return new AuthUser[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.user.AuthUser.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */