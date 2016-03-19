package com.seeclickfix.ma.android.objects.zone;

import android.graphics.Color;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.ForeignCollection;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.field.ForeignCollectionField;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.objects.types.FeedItem;
import java.util.ArrayList;
import java.util.List;

@DatabaseTable(tableName="enhanced_watch_areas")
public class EnhancedWatchAreas
  implements FeedItem
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "EnhancedWatchAreas";
  @SerializedName("id")
  @DatabaseField(columnName="api_id")
  private int apiId;
  @SerializedName("h_background_color")
  @DatabaseField(columnName="background_color")
  private String backgroundColor;
  @SerializedName("h_button_color")
  @DatabaseField(columnName="button_color")
  private String buttonColor;
  @SerializedName("created_at")
  @DatabaseField(columnName="created_at")
  private String createdAt;
  private transient Dao<EnhancedWatchAreas, Integer> dao;
  @SerializedName("demo_code")
  @DatabaseField(columnName="demo_code")
  private String demoCode;
  @DatabaseField(columnName="description")
  private String description;
  @SerializedName("h_highlight_color")
  @DatabaseField(columnName="highlight_color")
  private String highlightColor;
  @DatabaseField(allowGeneratedIdInsert=true, columnName="id", generatedId=true)
  private transient int id;
  private transient int index;
  @SerializedName("header_path")
  @DatabaseField(columnName="logo_url")
  private String logoURL;
  @ForeignCollectionField(eager=true)
  private ForeignCollection<MobileButtonsWithDefaults> mobileButtonsDb;
  @SerializedName("mobile_buttons_with_defaults")
  private List<MobileButtonsWithDefaults> mobileButtonsWithDefaults = new ArrayList();
  @SerializedName("h_start_gradient_button_color")
  @DatabaseField(columnName="start_gradient_button_color")
  private String startGradientButtonColor;
  @SerializedName("h_text_color")
  @DatabaseField(columnName="text_color")
  private String textColor;
  @DatabaseField(columnName="title")
  private String title;
  @SerializedName("updated_at")
  @DatabaseField(columnName="updated_at")
  private String updatedAt;
  @DatabaseField(foreign=true, foreignAutoCreate=true, foreignAutoRefresh=true)
  private ZoneWrapper zoneWrapper;
  
  private ForeignCollection<MobileButtonsWithDefaults> getNewEmpty()
  {
    ForeignCollection localForeignCollection = null;
    Dao localDao = getDao();
    if (localDao != null) {}
    try
    {
      localForeignCollection = localDao.getEmptyForeignCollection("mobileButtonsDb");
      return localForeignCollection;
    }
    catch (Exception localException) {}
    return null;
  }
  
  public int color(String paramString1, String paramString2)
  {
    try
    {
      int i = Color.parseColor(paramString1);
      return i;
    }
    catch (IllegalArgumentException paramString1) {}
    return Color.parseColor(paramString2);
  }
  
  public int getApiId()
  {
    return apiId;
  }
  
  public int getBackgroundColor()
  {
    return color(backgroundColor, "#FFFFFF");
  }
  
  public int getButtonColor()
  {
    return color(buttonColor, "#f06d1e");
  }
  
  public String getCreatedAt()
  {
    return createdAt;
  }
  
  public Dao<EnhancedWatchAreas, Integer> getDao()
  {
    return dao;
  }
  
  public String getDemoCode()
  {
    return demoCode;
  }
  
  public String getDescription()
  {
    return description;
  }
  
  public int getId()
  {
    return id;
  }
  
  public String getLogoURL()
  {
    return logoURL;
  }
  
  public List<MobileButtonsWithDefaults> getMobileButtonsWithDefaults()
  {
    if (mobileButtonsDb == null) {}
    for (ForeignCollection localForeignCollection = getNewEmpty();; localForeignCollection = mobileButtonsDb)
    {
      mobileButtonsDb = localForeignCollection;
      if ((mobileButtonsWithDefaults.isEmpty()) && (!mobileButtonsDb.isEmpty())) {
        mobileButtonsWithDefaults.addAll(mobileButtonsDb);
      }
      return mobileButtonsWithDefaults;
    }
  }
  
  public int getStartGradientButtonColor()
  {
    return color(startGradientButtonColor, "#f06d1e");
  }
  
  public int getTextColor()
  {
    return color(textColor, "#000000");
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public String getUpdatedAt()
  {
    return updatedAt;
  }
  
  public int getZeroBasedIndex()
  {
    return index;
  }
  
  public ZoneWrapper getZoneWrapper()
  {
    return zoneWrapper;
  }
  
  public void setApiId(int paramInt)
  {
    apiId = paramInt;
  }
  
  public void setBackgroundColor(String paramString)
  {
    backgroundColor = paramString;
  }
  
  public void setButtonColor(String paramString)
  {
    buttonColor = paramString;
  }
  
  public void setCreatedAt(String paramString)
  {
    createdAt = paramString;
  }
  
  public void setDao(Dao<EnhancedWatchAreas, Integer> paramDao)
  {
    dao = paramDao;
  }
  
  public void setDemoCode(String paramString)
  {
    demoCode = paramString;
  }
  
  public void setDescription(String paramString)
  {
    description = paramString;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setLogoURL(String paramString)
  {
    logoURL = paramString;
  }
  
  public void setMobileButtonsWithDefaults(List<MobileButtonsWithDefaults> paramList)
  {
    mobileButtonsWithDefaults = paramList;
  }
  
  public void setStartGradientButtonColor(String paramString)
  {
    startGradientButtonColor = paramString;
  }
  
  public void setTextColor(String paramString)
  {
    textColor = paramString;
  }
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
  
  public void setUpdatedAt(String paramString)
  {
    updatedAt = paramString;
  }
  
  public void setZeroBasedIndex(int paramInt)
  {
    index = paramInt;
  }
  
  public void setZoneWrapper(ZoneWrapper paramZoneWrapper)
  {
    zoneWrapper = paramZoneWrapper;
  }
  
  public String toString()
  {
    return "EnhancedWatchAreas [id=" + id + ", title=" + title + ", description=" + description + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", backgroundColor=" + backgroundColor + ", textColor=" + textColor + ", highlightColor=" + highlightColor + ", startGradientButtonColor=" + startGradientButtonColor + ", buttonColor=" + buttonColor + ", logoURL=" + logoURL + ", demoCode=" + demoCode + ", mobileButtonsWithDefaults=\n" + mobileButtonsWithDefaults + "]\n";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */