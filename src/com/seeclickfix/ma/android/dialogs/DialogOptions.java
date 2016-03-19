package com.seeclickfix.ma.android.dialogs;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class DialogOptions
  implements Parcelable
{
  public static Parcelable.Creator<DialogOptions> CREATOR = new Parcelable.Creator()
  {
    public DialogOptions createFromParcel(Parcel paramAnonymousParcel)
    {
      return new DialogOptions(paramAnonymousParcel, null);
    }
    
    public DialogOptions[] newArray(int paramAnonymousInt)
    {
      return new DialogOptions[paramAnonymousInt];
    }
  };
  public String fragmentTag;
  public int iconResId = 0;
  public int msgTextId = 0;
  public int negativeButtonTextId = 0;
  public int positiveButtonTextId = 0;
  public boolean retainInstance = false;
  public int titleTextId = 0;
  public String type;
  
  public DialogOptions() {}
  
  private DialogOptions(Parcel paramParcel)
  {
    titleTextId = paramParcel.readInt();
    msgTextId = paramParcel.readInt();
    positiveButtonTextId = paramParcel.readInt();
    negativeButtonTextId = paramParcel.readInt();
    fragmentTag = paramParcel.readString();
    type = paramParcel.readString();
    if (paramParcel.readByte() != 0) {
      bool = true;
    }
    retainInstance = bool;
    iconResId = paramParcel.readInt();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(titleTextId);
    paramParcel.writeInt(msgTextId);
    paramParcel.writeInt(positiveButtonTextId);
    paramParcel.writeInt(negativeButtonTextId);
    paramParcel.writeString(fragmentTag);
    paramParcel.writeString(type);
    if (retainInstance) {}
    for (byte b = 1;; b = 0)
    {
      paramParcel.writeByte(b);
      paramParcel.writeInt(iconResId);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.DialogOptions
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */