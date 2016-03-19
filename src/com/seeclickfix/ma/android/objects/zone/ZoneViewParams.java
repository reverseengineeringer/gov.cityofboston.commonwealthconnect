package com.seeclickfix.ma.android.objects.zone;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ZoneViewParams
  implements Parcelable
{
  public static final Parcelable.Creator<ZoneViewParams> CREATOR = new Parcelable.Creator()
  {
    public ZoneViewParams createFromParcel(Parcel paramAnonymousParcel)
    {
      return new ZoneViewParams(paramAnonymousParcel, null);
    }
    
    public ZoneViewParams[] newArray(int paramAnonymousInt)
    {
      return new ZoneViewParams[paramAnonymousInt];
    }
  };
  private String action;
  private String icon;
  private String label;
  private String uri;
  
  private ZoneViewParams(Parcel paramParcel)
  {
    action = paramParcel.readString();
    uri = paramParcel.readString();
    icon = paramParcel.readString();
    label = paramParcel.readString();
  }
  
  public static Parcelable.Creator<ZoneViewParams> getCreator()
  {
    return CREATOR;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAction()
  {
    return action;
  }
  
  public String getIcon()
  {
    return icon;
  }
  
  public String getLabel()
  {
    return label;
  }
  
  public String getUri()
  {
    return uri;
  }
  
  public void setAction(String paramString)
  {
    action = paramString;
  }
  
  public void setIcon(String paramString)
  {
    icon = paramString;
  }
  
  public void setLabel(String paramString)
  {
    label = paramString;
  }
  
  public void setUri(String paramString)
  {
    uri = paramString;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(action);
    paramParcel.writeString(uri);
    paramParcel.writeString(icon);
    paramParcel.writeString(label);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.zone.ZoneViewParams
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */