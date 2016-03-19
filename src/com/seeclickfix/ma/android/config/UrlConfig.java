package com.seeclickfix.ma.android.config;

import android.content.Context;

public class UrlConfig
{
  private static final String BASE = "/";
  public static final String CATEGORY_ICONS_128 = "http://cdn.seeclickfix.com/images/category_icons/128/";
  public static final String CATEGORY_ICONS_256 = "http://cdn.seeclickfix.com/images/category_icons/256/";
  public static final String CATEGORY_ICONS_28 = "http://cdn.seeclickfix.com/images/category_icons/28/";
  public static final String CATEGORY_ICONS_36 = "http://cdn.seeclickfix.com/images/category_icons/36/";
  public static final String CATEGORY_ICONS_48 = "http://cdn.seeclickfix.com/images/category_icons/48/";
  public static final String CATEGORY_ICONS_512 = "http://cdn.seeclickfix.com/images/category_icons/512/";
  public static final String CATEGORY_ICONS_96 = "http://cdn.seeclickfix.com/images/category_icons/96/";
  private static final String CATEGORY_ICONS_BASE = "http://cdn.seeclickfix.com/images/category_icons/";
  private static final String COMMENT = "/api/issues/%d/comments.json";
  private static final String COMMENTS_BY_USER_LIST = "/api/users/%d/comments.json";
  private static final String FOLLOW_UP_QUESTIONS = "/api/request_types/%s/request_type_questions.json";
  private static final String FORGOT_PASSWORD = "/api/forgot_password.json";
  private static final String GEOCODE = "/geocodings/latlng_to_address.json";
  public static final String HTTP = "http://";
  public static final String HTTPS = "https://";
  public static final String INT = "int.seeclickfix.com";
  private static final String ISSUE = "/api/issues/%d.json";
  private static final String ISSUES_BY_USER_LIST = "/api/users/%d/reported.json";
  private static final String ISSUE_LIST = "/api/issues.json";
  private static final String ISSUE_SHARE = "/issues/";
  private static final String LOGIN = "/api/session.json";
  private static final String PLACES = "/places/nearby.json";
  public static final String PREFIX = "http://";
  public static final String PRODUCTION = "seeclickfix.com";
  private static final String REGISTER = "/api/users.json";
  private static final String REPORT = "/issues.json";
  private static final String REQUEST_TYPES = "/api/enhanced_watch_areas/at.json";
  public static final String SECURE_PREFIX = "https://";
  public static final String TERMS_OF_USE = "http://seeclickfix.com/legal/terms-of-use";
  public static final String TEST = "test.seeclickfix.com";
  private static final String USER_PROFILE = "/api/users/%d.json";
  private static final String ZONES = "/api/enhanced_watch_areas/nearby_with_place.json";
  public static final String ZONE_ICONS_28 = "http://cdn.seeclickfix.com/images/custom_buttons/28/";
  public static final String ZONE_ICONS_36 = "http://cdn.seeclickfix.com/images/custom_buttons/36/";
  public static final String ZONE_ICONS_48 = "http://cdn.seeclickfix.com/images/custom_buttons/48/";
  public static final String ZONE_ICONS_72 = "http://cdn.seeclickfix.com/images/custom_buttons/72/";
  public static final String ZONE_ICONS_96 = "http://cdn.seeclickfix.com/images/custom_buttons/96/";
  private static final String ZONE_ICONS_BASE = "http://cdn.seeclickfix.com/images/custom_buttons/";
  private static final String ZONE_SINGLE = "/api/enhanced_watch_areas/%d/app_config.json";
  
  public static String getBaseUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/";
  }
  
  public static String getCommentsUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/issues/%d/comments.json";
  }
  
  public static String getCommentsbyUserUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/users/%d/comments.json";
  }
  
  public static String getEndpoint(Context paramContext)
  {
    return getPrefix(paramContext) + getServer(paramContext);
  }
  
  public static String getForgotPasswordUrl(Context paramContext)
  {
    return getPrefix(paramContext) + getServer(paramContext) + "/api/forgot_password.json";
  }
  
  public static String getGoogleGeocodeUrl()
  {
    return "https://maps.googleapis.com/maps/api/geocode/json";
  }
  
  public static String getIssueListUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/issues.json";
  }
  
  public static String getIssueShareUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/issues/";
  }
  
  public static String getIssuesbyUserUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/users/%d/reported.json";
  }
  
  public static String getLoginUrl(Context paramContext)
  {
    return getPrefix(paramContext) + getServer(paramContext) + "/api/session.json";
  }
  
  public static String getPlacesNearbyUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/places/nearby.json";
  }
  
  private static String getPrefix(Context paramContext)
  {
    if (!AppBuild.getEnvironment(paramContext).equals("ENVIRONMENT.CUSTOM")) {
      return "https://";
    }
    return "http://";
  }
  
  public static String getRegisterUrl(Context paramContext)
  {
    return getPrefix(paramContext) + getServer(paramContext) + "/api/users.json";
  }
  
  public static String getReportUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/issues.json";
  }
  
  public static String getRequestTypesUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/enhanced_watch_areas/at.json";
  }
  
  public static String getSecondaryQuestionUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/request_types/%s/request_type_questions.json";
  }
  
  private static String getServer(Context paramContext)
  {
    String str = AppBuild.getHostname(paramContext);
    paramContext = str;
    if (str.equals("ENVIRONMENT.PROD")) {
      paramContext = "seeclickfix.com";
    }
    if (str.equals("ENVIRONMENT.TEST")) {
      paramContext = "test.seeclickfix.com";
    }
    if (str.equals("ENVIRONMENT.INT")) {
      paramContext = "int.seeclickfix.com";
    }
    return paramContext;
  }
  
  public static String getSingleIssueUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/issues/%d.json";
  }
  
  public static String getUserProfileUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/users/%d.json";
  }
  
  public static String getZoneSingleUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/enhanced_watch_areas/%d/app_config.json";
  }
  
  public static String getZonesNearbyWithPlaceUrl(Context paramContext)
  {
    return "http://" + getServer(paramContext) + "/api/enhanced_watch_areas/nearby_with_place.json";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.config.UrlConfig
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */