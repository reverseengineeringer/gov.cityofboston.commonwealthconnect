.class public Lcom/seeclickfix/ma/android/constants/LocationConstants;
.super Ljava/lang/Object;
.source "LocationConstants.java"


# static fields
.field public static ACTIVE_LOCATION_UPDATE_PROVIDER_DISABLED:Ljava/lang/String; = null

.field public static ARGUMENTS_KEY_ID:Ljava/lang/String; = null

.field public static ARGUMENTS_KEY_REFERENCE:Ljava/lang/String; = null

.field public static CHECKIN_NOTIFICATION:I = 0x0

.field public static CHECKIN_RETRY_INTERVAL:J = 0x0L

.field public static final CLOSE_RADIUS:F = 75.0f

.field public static CONSTRUCTED_LOCATION_PROVIDER:Ljava/lang/String; = null

.field public static DEFAULT_RADIUS:I = 0x0

.field public static DISABLE_PASSIVE_LOCATION_WHEN_USER_EXIT:Z = false

.field public static DISABLE_PREFETCH_ON_LOW_BATTERY:Z = false

.field public static MAX_DETAILS_UPDATE_LATENCY:J = 0x0L

.field public static MAX_DISTANCE:I = 0x0

.field public static MAX_TIME:J = 0x0L

.field public static final MIN_ACCURACY_DELTA:F = 10.0f

.field public static final MIN_DISTANCE_METERS:J = 0x14L

.field public static final MIN_TIME_TO_REFRESH:J = 0x1f4L

.field public static PASSIVE_MAX_DISTANCE:I = 0x0

.field public static PASSIVE_MAX_TIME:J = 0x0L

.field public static final PLACE_REFRESH_RADIUS:F = 200.0f

.field public static PREFETCH_LIMIT:I = 0x0

.field public static PREFETCH_ON_WIFI_ONLY:Z = false

.field public static USE_GPS_WHEN_ACTIVITY_VISIBLE:Z = false

.field public static final US_CENTER_LATLNG:Lcom/google/android/gms/maps/model/LatLng;

.field public static final ZOOM_CLOSE:F = 13.0f

.field public static final ZOOM_MEDIUM:F = 10.0f

.field public static final ZOOM_NEARBY_DEFAULT:F = 12.0f

.field public static final ZOOM_OVERVIEW:F = 4.0f

.field public static final ZOOM_OVERVIEW_MINI:F = 2.0f

.field public static final ZOOM_VERY_CLOSE:F = 17.0f


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const-wide/32 v8, 0xdbba0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 36
    new-instance v0, Lcom/google/android/gms/maps/model/LatLng;

    const-wide v2, 0x4043da851a869403L    # 39.707187

    const-wide v4, -0x3fa6e2a00192a737L    # -100.458984

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    sput-object v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->US_CENTER_LATLNG:Lcom/google/android/gms/maps/model/LatLng;

    .line 64
    const/16 v0, 0x96

    sput v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->DEFAULT_RADIUS:I

    .line 66
    sget v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->DEFAULT_RADIUS:I

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->MAX_DISTANCE:I

    .line 68
    sput-wide v8, Lcom/seeclickfix/ma/android/constants/LocationConstants;->MAX_TIME:J

    .line 73
    sget v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->MAX_DISTANCE:I

    sput v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->PASSIVE_MAX_DISTANCE:I

    .line 75
    sget-wide v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->MAX_TIME:J

    sput-wide v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->PASSIVE_MAX_TIME:J

    .line 77
    sput-boolean v7, Lcom/seeclickfix/ma/android/constants/LocationConstants;->USE_GPS_WHEN_ACTIVITY_VISIBLE:Z

    .line 80
    sput-boolean v6, Lcom/seeclickfix/ma/android/constants/LocationConstants;->DISABLE_PASSIVE_LOCATION_WHEN_USER_EXIT:Z

    .line 83
    const-wide/32 v0, 0x5265c00

    sput-wide v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->MAX_DETAILS_UPDATE_LATENCY:J

    .line 88
    sput-boolean v6, Lcom/seeclickfix/ma/android/constants/LocationConstants;->PREFETCH_ON_WIFI_ONLY:Z

    .line 90
    sput-boolean v7, Lcom/seeclickfix/ma/android/constants/LocationConstants;->DISABLE_PREFETCH_ON_LOW_BATTERY:Z

    .line 93
    sput-wide v8, Lcom/seeclickfix/ma/android/constants/LocationConstants;->CHECKIN_RETRY_INTERVAL:J

    .line 96
    const/4 v0, 0x5

    sput v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->PREFETCH_LIMIT:I

    .line 99
    const-string/jumbo v0, "reference"

    sput-object v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->ARGUMENTS_KEY_REFERENCE:Ljava/lang/String;

    .line 100
    const-string/jumbo v0, "id"

    sput-object v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->ARGUMENTS_KEY_ID:Ljava/lang/String;

    .line 104
    const-string/jumbo v0, "com.radioactiveyak.places.active_location_update_provider_disabled"

    sput-object v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->ACTIVE_LOCATION_UPDATE_PROVIDER_DISABLED:Ljava/lang/String;

    .line 107
    const-string/jumbo v0, "CONSTRUCTED_LOCATION_PROVIDER"

    sput-object v0, Lcom/seeclickfix/ma/android/constants/LocationConstants;->CONSTRUCTED_LOCATION_PROVIDER:Ljava/lang/String;

    .line 109
    sput v6, Lcom/seeclickfix/ma/android/constants/LocationConstants;->CHECKIN_NOTIFICATION:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
