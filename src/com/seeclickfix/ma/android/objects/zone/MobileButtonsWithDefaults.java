package com.seeclickfix.ma.android.objects.zone;

import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName="mobile_buttons")
public class MobileButtonsWithDefaults
{
  public static final String REPORT_URI = "scf://report";
  @DatabaseField
  private String action;
  @DatabaseField(foreign=true, foreignAutoCreate=true, foreignAutoRefresh=true)
  private EnhancedWatchAreas enhancedWatchArea;
  @SerializedName("icon_name")
  @DatabaseField
  private String icon;
  @DatabaseField(allowGeneratedIdInsert=true, generatedId=true)
  private transient int id;
  @DatabaseField
  private String label;
  @DatabaseField
  private String uri;
  
  public String getAction()
  {
    return action;
  }
  
  public EnhancedWatchAreas getEnhancedWatchArea()
  {
    return enhancedWatchArea;
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
  
  public void setEnhancedWatchArea(EnhancedWatchAreas paramEnhancedWatchAreas)
  {
    enhancedWatchArea = paramEnhancedWatchAreas;
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
  
  public String toString()
  {
    return "MobileButtonsWithDefaults [label=" + label + ", icon=" + icon + ", action=" + action + ", uri=" + uri + "]\n";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.zone.MobileButtonsWithDefaults
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */