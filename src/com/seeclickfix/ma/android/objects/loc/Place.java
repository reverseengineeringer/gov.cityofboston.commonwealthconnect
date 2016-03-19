package com.seeclickfix.ma.android.objects.loc;

import android.location.Location;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName="places")
public class Place
  implements Comparable<Place>, Parcelable
{
  public static final Parcelable.Creator<Place> CREATOR = new Parcelable.Creator()
  {
    public Place createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Place(paramAnonymousParcel, null);
    }
    
    public Place[] newArray(int paramAnonymousInt)
    {
      return new Place[paramAnonymousInt];
    }
  };
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "Place";
  @SerializedName("id")
  @DatabaseField(columnName="api_id")
  private int apiId;
  private String cacheKey = "CacheKeyNotSet";
  @DatabaseField(columnName="id", generatedId=true)
  private transient int id;
  @DatabaseField(columnName="ignored")
  private boolean ignored = false;
  @DatabaseField(columnName="custom")
  private boolean isCustom = false;
  private boolean isMyComments = false;
  @DatabaseField(columnName="my_location")
  private boolean isMyLocation = false;
  private boolean isMyReports = false;
  @DatabaseField(columnName="selected")
  private boolean isSelected = false;
  @DatabaseField(columnName="last_api_update")
  private long lastPlaceUpdateFromApi = 0L;
  @DatabaseField(columnName="last_issue_query")
  private long lastSuccessfullListQuery = 0L;
  private int listPosition = 0;
  @DatabaseField(columnName="name")
  private String name;
  private double origLat;
  private double origLng;
  @DatabaseField(columnName="page_number")
  private int pageNumber;
  @DatabaseField(columnName="lat")
  private double placeLat;
  @DatabaseField(columnName="lng")
  private double placeLng;
  private boolean shouldReload = false;
  @SerializedName("simplified_center")
  @DatabaseField(foreign=true, foreignAutoCreate=true, foreignAutoRefresh=true)
  private SimplifiedCenter simplifiedCenter;
  @DatabaseField(columnName="state")
  private String state;
  @SerializedName("url_name")
  @DatabaseField(columnName="slug")
  private String urlName;
  private String zoneCacheKey = "ZoneCacheKeyNotSet";
  
  public Place() {}
  
  private Place(Parcel paramParcel)
  {
    id = paramParcel.readInt();
    name = paramParcel.readString();
    state = paramParcel.readString();
    urlName = paramParcel.readString();
    cacheKey = paramParcel.readString();
    zoneCacheKey = paramParcel.readString();
    pageNumber = paramParcel.readInt();
    if (paramParcel.readByte() != 0)
    {
      bool1 = true;
      isSelected = bool1;
      if (paramParcel.readByte() == 0) {
        break label268;
      }
      bool1 = true;
      label147:
      isMyLocation = bool1;
      if (paramParcel.readByte() == 0) {
        break label273;
      }
      bool1 = true;
      label161:
      isCustom = bool1;
      if (paramParcel.readByte() == 0) {
        break label278;
      }
      bool1 = true;
      label175:
      isMyReports = bool1;
      if (paramParcel.readByte() == 0) {
        break label283;
      }
    }
    label268:
    label273:
    label278:
    label283:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      shouldReload = bool1;
      lastSuccessfullListQuery = paramParcel.readLong();
      lastPlaceUpdateFromApi = paramParcel.readLong();
      origLat = paramParcel.readDouble();
      origLng = paramParcel.readDouble();
      placeLat = paramParcel.readDouble();
      placeLng = paramParcel.readDouble();
      simplifiedCenter = ((SimplifiedCenter)paramParcel.readParcelable(SimplifiedCenter.CREATOR.getClass().getClassLoader()));
      return;
      bool1 = false;
      break;
      bool1 = false;
      break label147;
      bool1 = false;
      break label161;
      bool1 = false;
      break label175;
    }
  }
  
  public int compareTo(Place paramPlace)
  {
    if (isMyLocation) {
      return -1;
    }
    if (paramPlace.isMyLocation()) {
      return 1;
    }
    if ((isSelected()) && (!paramPlace.isSelected())) {
      return -1;
    }
    if ((!isSelected()) && (paramPlace.isSelected())) {
      return 1;
    }
    float[] arrayOfFloat1 = new float[3];
    float[] arrayOfFloat2 = new float[3];
    Location.distanceBetween(origLat, origLng, getPlaceLat(), getPlaceLng(), arrayOfFloat1);
    Location.distanceBetween(paramPlace.getOrigLat(), paramPlace.getOrigLng(), paramPlace.getPlaceLat(), paramPlace.getPlaceLng(), arrayOfFloat2);
    if (arrayOfFloat1[0] < arrayOfFloat2[0]) {
      return -1;
    }
    if (arrayOfFloat1[0] > arrayOfFloat2[0]) {
      return 1;
    }
    return 0;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      do
      {
        return true;
        if (paramObject == null) {
          return false;
        }
        if (getClass() != paramObject.getClass()) {
          return false;
        }
        paramObject = (Place)paramObject;
        if (apiId != apiId) {
          return false;
        }
        if (isCustom != isCustom) {
          return false;
        }
        if (isMyComments != isMyComments) {
          return false;
        }
        if (isMyLocation != isMyLocation) {
          return false;
        }
        if (isMyReports != isMyReports) {
          return false;
        }
        if (isSelected != isSelected) {
          return false;
        }
        if (lastPlaceUpdateFromApi != lastPlaceUpdateFromApi) {
          return false;
        }
        if (lastSuccessfullListQuery != lastSuccessfullListQuery) {
          return false;
        }
        if (name == null)
        {
          if (name != null) {
            return false;
          }
        }
        else if (!name.equals(name)) {
          return false;
        }
        if (Double.doubleToLongBits(origLat) != Double.doubleToLongBits(origLat)) {
          return false;
        }
        if (Double.doubleToLongBits(origLng) != Double.doubleToLongBits(origLng)) {
          return false;
        }
        if (Double.doubleToLongBits(placeLat) != Double.doubleToLongBits(placeLat)) {
          return false;
        }
        if (Double.doubleToLongBits(placeLng) != Double.doubleToLongBits(placeLng)) {
          return false;
        }
        if (state == null)
        {
          if (state != null) {
            return false;
          }
        }
        else if (!state.equals(state)) {
          return false;
        }
        if (urlName != null) {
          break;
        }
      } while (urlName == null);
      return false;
    } while (urlName.equals(urlName));
    return false;
  }
  
  public int getApiId()
  {
    return apiId;
  }
  
  public String getCacheKey()
  {
    return cacheKey;
  }
  
  public int getId()
  {
    return id;
  }
  
  public boolean getIgnored()
  {
    return ignored;
  }
  
  public long getLastPlaceUpdateFromApi()
  {
    return lastPlaceUpdateFromApi;
  }
  
  public long getLastSuccessfulListQuery()
  {
    return lastSuccessfullListQuery;
  }
  
  public int getListPosition()
  {
    return listPosition;
  }
  
  public String getName()
  {
    return name;
  }
  
  public double getOrigLat()
  {
    return origLat;
  }
  
  public double getOrigLng()
  {
    return origLng;
  }
  
  public int getPageNumber()
  {
    return pageNumber;
  }
  
  public double getPlaceLat()
  {
    if ((placeLat == 0.0D) && (simplifiedCenter != null) && (simplifiedCenter.lat != null)) {
      placeLat = Double.valueOf(simplifiedCenter.lat).doubleValue();
    }
    return placeLat;
  }
  
  public double getPlaceLng()
  {
    if ((placeLng == 0.0D) && (simplifiedCenter != null) && (simplifiedCenter.lng != null)) {
      placeLng = Double.valueOf(simplifiedCenter.lng).doubleValue();
    }
    return placeLng;
  }
  
  public boolean getShouldReload()
  {
    return shouldReload;
  }
  
  public SimplifiedCenter getSimplifiedCenter()
  {
    return simplifiedCenter;
  }
  
  public String getState()
  {
    return state;
  }
  
  public String getUrlName()
  {
    return urlName;
  }
  
  public String getZoneCacheKey()
  {
    return zoneCacheKey;
  }
  
  public int hashCode()
  {
    int i3 = 0;
    int n = 1231;
    int i4 = apiId;
    int i;
    int j;
    label36:
    int k;
    label47:
    int m;
    label59:
    label66:
    int i5;
    int i6;
    int i1;
    label106:
    int i7;
    int i8;
    int i9;
    int i10;
    int i2;
    if (isCustom)
    {
      i = 1231;
      if (!isMyComments) {
        break label297;
      }
      j = 1231;
      if (!isMyLocation) {
        break label304;
      }
      k = 1231;
      if (!isMyReports) {
        break label311;
      }
      m = 1231;
      if (!isSelected) {
        break label319;
      }
      i5 = (int)(lastPlaceUpdateFromApi ^ lastPlaceUpdateFromApi >>> 32);
      i6 = (int)(lastSuccessfullListQuery ^ lastSuccessfullListQuery >>> 32);
      if (name != null) {
        break label327;
      }
      i1 = 0;
      long l = Double.doubleToLongBits(origLat);
      i7 = (int)(l >>> 32 ^ l);
      l = Double.doubleToLongBits(origLng);
      i8 = (int)(l >>> 32 ^ l);
      l = Double.doubleToLongBits(placeLat);
      i9 = (int)(l >>> 32 ^ l);
      l = Double.doubleToLongBits(placeLng);
      i10 = (int)(l >>> 32 ^ l);
      if (state != null) {
        break label339;
      }
      i2 = 0;
      label196:
      if (urlName != null) {
        break label351;
      }
    }
    for (;;)
    {
      return ((((((((((((((i4 + 31) * 31 + i) * 31 + j) * 31 + k) * 31 + m) * 31 + n) * 31 + i5) * 31 + i6) * 31 + i1) * 31 + i7) * 31 + i8) * 31 + i9) * 31 + i10) * 31 + i2) * 31 + i3;
      i = 1237;
      break;
      label297:
      j = 1237;
      break label36;
      label304:
      k = 1237;
      break label47;
      label311:
      m = 1237;
      break label59;
      label319:
      n = 1237;
      break label66;
      label327:
      i1 = name.hashCode();
      break label106;
      label339:
      i2 = state.hashCode();
      break label196;
      label351:
      i3 = urlName.hashCode();
    }
  }
  
  public boolean isCustom()
  {
    return isCustom;
  }
  
  public boolean isMyComments()
  {
    return isMyComments;
  }
  
  public boolean isMyLocation()
  {
    return isMyLocation;
  }
  
  public boolean isMyReports()
  {
    return isMyReports;
  }
  
  public boolean isSelected()
  {
    return isSelected;
  }
  
  public void setApiId(int paramInt)
  {
    apiId = paramInt;
  }
  
  public void setCacheKey(String paramString)
  {
    cacheKey = paramString;
  }
  
  public void setCustom(boolean paramBoolean)
  {
    isCustom = paramBoolean;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setIgnored(boolean paramBoolean)
  {
    ignored = paramBoolean;
  }
  
  public void setLastPlaceUpdateFromApi(long paramLong)
  {
    lastPlaceUpdateFromApi = paramLong;
  }
  
  public void setLastSuccessfulListQuery(long paramLong)
  {
    lastSuccessfullListQuery = paramLong;
  }
  
  public void setListPosition(int paramInt)
  {
    listPosition = paramInt;
  }
  
  public void setMyComments(boolean paramBoolean)
  {
    isMyComments = paramBoolean;
  }
  
  public void setMyLocation(boolean paramBoolean)
  {
    isMyLocation = paramBoolean;
  }
  
  public void setMyReports(boolean paramBoolean)
  {
    isMyReports = paramBoolean;
  }
  
  public void setName(String paramString)
  {
    name = paramString;
  }
  
  public void setOrigLat(double paramDouble)
  {
    origLat = paramDouble;
  }
  
  public void setOrigLng(double paramDouble)
  {
    origLng = paramDouble;
  }
  
  public void setPageNumber(int paramInt)
  {
    pageNumber = paramInt;
  }
  
  public void setPlaceLat(double paramDouble)
  {
    placeLat = paramDouble;
  }
  
  public void setPlaceLng(double paramDouble)
  {
    placeLng = paramDouble;
  }
  
  public void setSelected(boolean paramBoolean)
  {
    isSelected = paramBoolean;
  }
  
  public void setShouldReload(boolean paramBoolean)
  {
    shouldReload = paramBoolean;
  }
  
  public void setSimplifiedCenter(SimplifiedCenter paramSimplifiedCenter)
  {
    if (paramSimplifiedCenter != null)
    {
      placeLat = Double.valueOf(lat).doubleValue();
      placeLng = Double.valueOf(lng).doubleValue();
      simplifiedCenter = paramSimplifiedCenter;
    }
  }
  
  public void setState(String paramString)
  {
    state = paramString;
  }
  
  public void setUrlName(String paramString)
  {
    urlName = paramString;
  }
  
  public void setZoneCacheKey(String paramString)
  {
    zoneCacheKey = paramString;
  }
  
  public String toString()
  {
    return "Place [isMyReports=" + isMyReports + ", apiId=" + apiId + ", name=" + name + ", state=" + state + ", urlName=" + urlName + ", pageNumber=" + pageNumber + ", isSelected=" + isSelected + ", isMyLocation=" + isMyLocation + ", isCustom=" + isCustom + ", ignored=" + ignored + ", lastSuccessfullListQuery=" + lastSuccessfullListQuery + ", lastPlaceUpdateFromApi=" + lastPlaceUpdateFromApi + ", origLat=" + origLat + ", origLng=" + origLng + ", placeLat=" + getPlaceLat() + ", placeLng=" + getPlaceLng() + ", simplifiedCenter=" + simplifiedCenter + "]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    paramParcel.writeInt(id);
    paramParcel.writeString(name);
    paramParcel.writeString(state);
    paramParcel.writeString(urlName);
    paramParcel.writeString(cacheKey);
    paramParcel.writeString(zoneCacheKey);
    paramParcel.writeInt(pageNumber);
    if (isSelected)
    {
      paramInt = 1;
      paramParcel.writeByte((byte)paramInt);
      if (!isMyLocation) {
        break label196;
      }
      paramInt = 1;
      label82:
      paramParcel.writeByte((byte)paramInt);
      if (!isCustom) {
        break label201;
      }
      paramInt = 1;
      label97:
      paramParcel.writeByte((byte)paramInt);
      if (!isMyReports) {
        break label206;
      }
      paramInt = 1;
      label112:
      paramParcel.writeByte((byte)paramInt);
      if (!shouldReload) {
        break label211;
      }
    }
    label196:
    label201:
    label206:
    label211:
    for (paramInt = i;; paramInt = 0)
    {
      paramParcel.writeByte((byte)paramInt);
      paramParcel.writeLong(lastSuccessfullListQuery);
      paramParcel.writeLong(lastPlaceUpdateFromApi);
      paramParcel.writeDouble(origLat);
      paramParcel.writeDouble(origLng);
      paramParcel.writeDouble(getPlaceLat());
      paramParcel.writeDouble(getPlaceLng());
      paramParcel.writeParcelable(simplifiedCenter, 0);
      return;
      paramInt = 0;
      break;
      paramInt = 0;
      break label82;
      paramInt = 0;
      break label97;
      paramInt = 0;
      break label112;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.loc.Place
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */