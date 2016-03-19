package com.seeclickfix.ma.android.dialogs;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class DialogOptions$1
  implements Parcelable.Creator<DialogOptions>
{
  public DialogOptions createFromParcel(Parcel paramParcel)
  {
    return new DialogOptions(paramParcel, null);
  }
  
  public DialogOptions[] newArray(int paramInt)
  {
    return new DialogOptions[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.DialogOptions.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */