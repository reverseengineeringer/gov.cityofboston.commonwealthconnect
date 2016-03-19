package com.seeclickfix.ma.android.objects.issue;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.objects.loc.Place;

@DatabaseTable(tableName="issue_place_join")
public class IssuePlaceJoin
{
  @DatabaseField
  private long dateJoinCreated;
  @DatabaseField
  private double distance;
  @DatabaseField(generatedId=true)
  private int id;
  @DatabaseField(columnName="issue_id", foreign=true)
  private Issue issue;
  @DatabaseField(columnName="place_id", foreign=true)
  private Place place;
  
  public long getDateJoinCreated()
  {
    return dateJoinCreated;
  }
  
  public double getDistance()
  {
    return distance;
  }
  
  public int getId()
  {
    return id;
  }
  
  public Issue getIssue()
  {
    return issue;
  }
  
  public Place getPlace()
  {
    return place;
  }
  
  public void setDateJoinCreated(long paramLong)
  {
    dateJoinCreated = paramLong;
  }
  
  public void setDistance(double paramDouble)
  {
    distance = paramDouble;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setIssue(Issue paramIssue)
  {
    issue = paramIssue;
  }
  
  public void setPlace(Place paramPlace)
  {
    place = paramPlace;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.IssuePlaceJoin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */