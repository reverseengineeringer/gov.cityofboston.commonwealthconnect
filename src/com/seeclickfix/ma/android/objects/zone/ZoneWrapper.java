package com.seeclickfix.ma.android.objects.zone;

import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.objects.loc.Geocode;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.types.FeedItem;
import java.util.ArrayList;
import java.util.List;

@DatabaseTable
public class ZoneWrapper
  implements FeedItem
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ZoneWrapper";
  @SerializedName("place")
  private Place apiPlace;
  @SerializedName("enhanced_watch_area_id")
  @DatabaseField
  private String enhanced_watch_area_id;
  private Geocode geocode;
  @DatabaseField(allowGeneratedIdInsert=true, generatedId=true)
  private transient int id;
  private transient int index;
  @SerializedName("enhanced_watch_areas")
  private List<EnhancedWatchAreas> watchAreas = new ArrayList();
  
  public Place getApiPlace()
  {
    return apiPlace;
  }
  
  public Geocode getGeocode()
  {
    return geocode;
  }
  
  public int getId()
  {
    return id;
  }
  
  public List<EnhancedWatchAreas> getWatchAreas()
  {
    return watchAreas;
  }
  
  public int getZeroBasedIndex()
  {
    return index;
  }
  
  public void setApiPlace(Place paramPlace)
  {
    apiPlace = paramPlace;
  }
  
  public void setGeocode(Geocode paramGeocode)
  {
    geocode = paramGeocode;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setWatchAreas(List<EnhancedWatchAreas> paramList)
  {
    watchAreas = paramList;
  }
  
  public void setZeroBasedIndex(int paramInt)
  {
    index = paramInt;
  }
  
  public String toString()
  {
    return "ZoneWrapper [watchAreas=" + watchAreas + ", enhanced_watch_area_id=" + enhanced_watch_area_id + ", apiPlace=" + apiPlace + ", geocode=" + geocode + "]";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.zone.ZoneWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */