package com.seeclickfix.ma.android.objects.loc;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import java.io.Serializable;

@DatabaseTable(tableName="simplified_center")
public class SimplifiedCenter
  implements Serializable, Parcelable
{
  public static final Parcelable.Creator<SimplifiedCenter> CREATOR = new Parcelable.Creator()
  {
    public SimplifiedCenter createFromParcel(Parcel paramAnonymousParcel)
    {
      return new SimplifiedCenter(paramAnonymousParcel, null);
    }
    
    public SimplifiedCenter[] newArray(int paramAnonymousInt)
    {
      return new SimplifiedCenter[paramAnonymousInt];
    }
  };
  private static final long serialVersionUID = -4531843873995399463L;
  @DatabaseField(generatedId=true)
  public int id;
  @DatabaseField(columnName="lat")
  public String lat;
  @DatabaseField(columnName="lng")
  public String lng;
  
  public SimplifiedCenter() {}
  
  private SimplifiedCenter(Parcel paramParcel)
  {
    id = paramParcel.readInt();
    lat = paramParcel.readString();
    lng = paramParcel.readString();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String toString()
  {
    return "SimplifiedCenter [id=" + id + ", lat=" + lat + ", lng=" + lng + "]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(id);
    paramParcel.writeString(lat);
    paramParcel.writeString(lng);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.loc.SimplifiedCenter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */