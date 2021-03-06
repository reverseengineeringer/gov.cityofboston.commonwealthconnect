package com.google.android.gms.auth;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import java.util.ArrayList;

public class AccountChangeEventsResponseCreator
  implements Parcelable.Creator<AccountChangeEventsResponse>
{
  public static final int CONTENT_DESCRIPTION = 0;
  
  static void a(AccountChangeEventsResponse paramAccountChangeEventsResponse, Parcel paramParcel, int paramInt)
  {
    paramInt = b.H(paramParcel);
    b.c(paramParcel, 1, Ef);
    b.c(paramParcel, 2, mp, false);
    b.H(paramParcel, paramInt);
  }
  
  public AccountChangeEventsResponse createFromParcel(Parcel paramParcel)
  {
    int j = a.G(paramParcel);
    int i = 0;
    ArrayList localArrayList = null;
    while (paramParcel.dataPosition() < j)
    {
      int k = a.F(paramParcel);
      switch (a.aH(k))
      {
      default: 
        a.b(paramParcel, k);
        break;
      case 1: 
        i = a.g(paramParcel, k);
        break;
      case 2: 
        localArrayList = a.c(paramParcel, k, AccountChangeEvent.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new a.a("Overread allowed size end=" + j, paramParcel);
    }
    return new AccountChangeEventsResponse(i, localArrayList);
  }
  
  public AccountChangeEventsResponse[] newArray(int paramInt)
  {
    return new AccountChangeEventsResponse[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.auth.AccountChangeEventsResponseCreator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */