package com.seeclickfix.ma.android.objects;

import com.google.gson.annotations.SerializedName;
import com.seeclickfix.ma.android.objects.app.AppOptions;
import com.seeclickfix.ma.android.objects.issue.IssueFilter;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;

public class DedicatedApp
{
  @SerializedName("accuracy_label_text")
  private String accuracyLabelText;
  @SerializedName("allowed_zone_ids")
  private List<Integer> allowedZoneIds;
  @SerializedName("app_id")
  private String appId;
  @SerializedName("call_311_header_title")
  private String call311HeaderTitle;
  @SerializedName("call_311_message")
  private String call311Message;
  @SerializedName("call_311_number")
  private String call311Number;
  @SerializedName("default_geo_config_url")
  private String defaultGeoConfigUrl;
  @SerializedName("default_zone_id")
  private int defaultZoneId = -1;
  @SerializedName("disclaimer_text")
  private String disclaimerText;
  @SerializedName("geo_aware_branding")
  private boolean geoAwareBranding = true;
  @SerializedName("is_dedicated_app")
  private boolean isDedicatedApp = false;
  @SerializedName("options")
  private AppOptions options = new AppOptions();
  @SerializedName("report_alert_body_text")
  private String reportAlertBodyText;
  @SerializedName("report_alert_button_text")
  private String reportAlertButtonText;
  @SerializedName("report_alert_button_uri")
  private String reportAlertButtonUri;
  @SerializedName("report_alert_message")
  private String reportAlertMessage;
  @SerializedName("title")
  private String title;
  
  public String getAccuracyLabelText()
  {
    return accuracyLabelText;
  }
  
  public String getAllowedIdsString()
  {
    return StringUtils.join(allowedZoneIds, ",");
  }
  
  public List<Integer> getAllowedZoneIds()
  {
    return allowedZoneIds;
  }
  
  public String getAppId()
  {
    return appId;
  }
  
  public String getCall311HeaderTitle()
  {
    return call311HeaderTitle;
  }
  
  public String getCall311Message()
  {
    return call311Message;
  }
  
  public String getCall311Number()
  {
    return call311Number;
  }
  
  public String getDefaultGeoConfigUrl()
  {
    return defaultGeoConfigUrl;
  }
  
  public int getDefaultZoneId()
  {
    return defaultZoneId;
  }
  
  public String getDisclaimerText()
  {
    return disclaimerText;
  }
  
  public boolean getIsDedicatedApp()
  {
    return isDedicatedApp;
  }
  
  public Map<String, String> getIssueFilter()
  {
    return new IssueFilter(this).get();
  }
  
  public int getNumZones()
  {
    if (allowedZoneIds == null) {
      return 0;
    }
    return allowedZoneIds.size();
  }
  
  public AppOptions getOptions()
  {
    return options;
  }
  
  public String getReportAlertBodyText()
  {
    return reportAlertBodyText;
  }
  
  public String getReportAlertButtonText()
  {
    return reportAlertButtonText;
  }
  
  public String getReportAlertButtonUri()
  {
    return reportAlertButtonUri;
  }
  
  public String getReportAlertMessage()
  {
    return reportAlertMessage;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public void setAllowedZoneIds(List<Integer> paramList)
  {
    allowedZoneIds = paramList;
  }
  
  public void setAppId(String paramString)
  {
    appId = paramString;
  }
  
  public void setDefaultGeoConfigUrl(String paramString)
  {
    defaultGeoConfigUrl = paramString;
  }
  
  public void setDefaultZoneId(int paramInt)
  {
    defaultZoneId = paramInt;
  }
  
  public void setGeoAwareBranding(boolean paramBoolean)
  {
    geoAwareBranding = paramBoolean;
  }
  
  public void setIsDedicatedApp(boolean paramBoolean)
  {
    isDedicatedApp = paramBoolean;
  }
  
  public void setOptions(AppOptions paramAppOptions)
  {
    options = paramAppOptions;
  }
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.DedicatedApp
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */