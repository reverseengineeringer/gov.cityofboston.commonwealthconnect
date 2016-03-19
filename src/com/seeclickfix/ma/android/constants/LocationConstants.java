package com.seeclickfix.ma.android.constants;

import com.google.android.gms.maps.model.LatLng;

public class LocationConstants
{
  public static String ACTIVE_LOCATION_UPDATE_PROVIDER_DISABLED;
  public static String ARGUMENTS_KEY_ID;
  public static String ARGUMENTS_KEY_REFERENCE;
  public static int CHECKIN_NOTIFICATION = 0;
  public static long CHECKIN_RETRY_INTERVAL = 0L;
  public static final float CLOSE_RADIUS = 75.0F;
  public static String CONSTRUCTED_LOCATION_PROVIDER;
  public static int DEFAULT_RADIUS = 0;
  public static boolean DISABLE_PASSIVE_LOCATION_WHEN_USER_EXIT = false;
  public static boolean DISABLE_PREFETCH_ON_LOW_BATTERY = false;
  public static long MAX_DETAILS_UPDATE_LATENCY = 0L;
  public static int MAX_DISTANCE = 0;
  public static long MAX_TIME = 0L;
  public static final float MIN_ACCURACY_DELTA = 10.0F;
  public static final long MIN_DISTANCE_METERS = 20L;
  public static final long MIN_TIME_TO_REFRESH = 500L;
  public static int PASSIVE_MAX_DISTANCE = 0;
  public static long PASSIVE_MAX_TIME = 0L;
  public static final float PLACE_REFRESH_RADIUS = 200.0F;
  public static int PREFETCH_LIMIT = 0;
  public static boolean PREFETCH_ON_WIFI_ONLY = false;
  public static boolean USE_GPS_WHEN_ACTIVITY_VISIBLE = false;
  public static final LatLng US_CENTER_LATLNG = new LatLng(39.707187D, -100.458984D);
  public static final float ZOOM_CLOSE = 13.0F;
  public static final float ZOOM_MEDIUM = 10.0F;
  public static final float ZOOM_NEARBY_DEFAULT = 12.0F;
  public static final float ZOOM_OVERVIEW = 4.0F;
  public static final float ZOOM_OVERVIEW_MINI = 2.0F;
  public static final float ZOOM_VERY_CLOSE = 17.0F;
  
  static
  {
    DEFAULT_RADIUS = 150;
    MAX_DISTANCE = DEFAULT_RADIUS / 2;
    MAX_TIME = 900000L;
    PASSIVE_MAX_DISTANCE = MAX_DISTANCE;
    PASSIVE_MAX_TIME = MAX_TIME;
    USE_GPS_WHEN_ACTIVITY_VISIBLE = true;
    DISABLE_PASSIVE_LOCATION_WHEN_USER_EXIT = false;
    MAX_DETAILS_UPDATE_LATENCY = 86400000L;
    PREFETCH_ON_WIFI_ONLY = false;
    DISABLE_PREFETCH_ON_LOW_BATTERY = true;
    CHECKIN_RETRY_INTERVAL = 900000L;
    PREFETCH_LIMIT = 5;
    ARGUMENTS_KEY_REFERENCE = "reference";
    ARGUMENTS_KEY_ID = "id";
    ACTIVE_LOCATION_UPDATE_PROVIDER_DISABLED = "com.radioactiveyak.places.active_location_update_provider_disabled";
    CONSTRUCTED_LOCATION_PROVIDER = "CONSTRUCTED_LOCATION_PROVIDER";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.constants.LocationConstants
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */