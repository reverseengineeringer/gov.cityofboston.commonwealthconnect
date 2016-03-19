package com.seeclickfix.ma.android.objects.zone;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.objects.loc.Place;

@DatabaseTable(tableName="zone_place_join")
public class ZonePlaceJoin
{
  @DatabaseField
  private long dateJoinCreated;
  @DatabaseField(generatedId=true)
  public int id;
  @DatabaseField(foreign=true, foreignAutoCreate=true, foreignAutoRefresh=true)
  public Place place;
  @DatabaseField(foreign=true, foreignAutoCreate=true, foreignAutoRefresh=true)
  public ZoneWrapper zoneWrapper;
  
  public long getDateJoinCreated()
  {
    return dateJoinCreated;
  }
  
  public void setDateJoinCreated(long paramLong)
  {
    dateJoinCreated = paramLong;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.zone.ZonePlaceJoin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */