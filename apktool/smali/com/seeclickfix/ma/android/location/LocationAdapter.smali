.class public Lcom/seeclickfix/ma/android/location/LocationAdapter;
.super Ljava/lang/Object;
.source "LocationAdapter.java"

# interfaces
.implements Lcom/google/android/gms/maps/LocationSource;
.implements Lcom/google/android/gms/location/LocationListener;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation runtime Ljavax/inject/Singleton;
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "LocationAdapter"

.field static handler:Landroid/os/Handler;

.field private static pendingIntent:Landroid/app/PendingIntent;


# instance fields
.field context:Landroid/content/Context;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private locSourceListener:Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;

.field locationEnabledHelper:Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

.field private mCurrentLocation:Landroid/location/Location;

.field private mForceFakeLocation:Z

.field timeOutRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 68
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mForceFakeLocation:Z

    .line 256
    new-instance v0, Lcom/seeclickfix/ma/android/location/LocationAdapter$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter$1;-><init>(Lcom/seeclickfix/ma/android/location/LocationAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->timeOutRunnable:Ljava/lang/Runnable;

    .line 65
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->subscribeToBus()V

    .line 66
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/location/LocationAdapter;)Landroid/location/Location;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/location/LocationAdapter;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    return-object v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/location/LocationAdapter;Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/location/LocationAdapter;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->postEvent(Ljava/lang/Object;)V

    return-void
.end method

.method private getLocationReqHighAcc()Lcom/google/android/gms/location/LocationRequest;
    .locals 4

    .prologue
    .line 207
    new-instance v0, Lcom/google/android/gms/location/LocationRequest;

    invoke-direct {v0}, Lcom/google/android/gms/location/LocationRequest;-><init>()V

    .line 210
    .local v0, "req":Lcom/google/android/gms/location/LocationRequest;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/location/LocationRequest;->setFastestInterval(J)Lcom/google/android/gms/location/LocationRequest;

    .line 213
    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/location/LocationRequest;->setInterval(J)Lcom/google/android/gms/location/LocationRequest;

    .line 215
    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/google/android/gms/location/LocationRequest;->setPriority(I)Lcom/google/android/gms/location/LocationRequest;

    .line 217
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/location/LocationRequest;->setSmallestDisplacement(F)Lcom/google/android/gms/location/LocationRequest;

    .line 219
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/google/android/gms/location/LocationRequest;->setNumUpdates(I)Lcom/google/android/gms/location/LocationRequest;

    .line 221
    return-object v0
.end method

.method private isLocationEnabled()Z
    .locals 1

    .prologue
    .line 291
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->locationEnabledHelper:Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationEnabledHelper;->isLocationEnabled()Z

    move-result v0

    return v0
.end method

.method private isNewerCloserMoreAccurateOrSame(Landroid/location/Location;)Z
    .locals 4
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    .line 196
    sget-object v2, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->CLOSER_MORE_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-static {v2, v3, p1}, Lcom/seeclickfix/ma/android/location/LocationValidator;->compare(Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;Landroid/location/Location;Landroid/location/Location;)Z

    move-result v0

    .line 200
    .local v0, "isCloserAndNewer":Z
    sget-object v2, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->CLOSE:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    invoke-static {v2, p1}, Lcom/seeclickfix/ma/android/location/LocationValidator;->isPrecise(Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;Landroid/location/Location;)Z

    move-result v1

    .line 202
    .local v1, "isPrecise":Z
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private isServiceAvailable()Z
    .locals 2

    .prologue
    .line 95
    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    .line 97
    .local v0, "resultCode":I
    if-nez v0, :cond_0

    .line 101
    const/4 v1, 0x1

    .line 106
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private postEvent(Ljava/lang/Object;)V
    .locals 1
    .param p1, "event"    # Ljava/lang/Object;

    .prologue
    .line 287
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 288
    return-void
.end method

.method private startTimeoutClock()V
    .locals 4

    .prologue
    .line 247
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopTimeoutClock()V

    .line 248
    sget-object v0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->timeOutRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 249
    return-void
.end method

.method private stopTimeoutClock()V
    .locals 2

    .prologue
    .line 253
    sget-object v0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->timeOutRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 254
    return-void
.end method

.method private subscribeToBus()V
    .locals 1

    .prologue
    .line 72
    :try_start_0
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/squareup/otto/Bus;->register(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public activate(Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;)V
    .locals 3
    .param p1, "locSourceListener"    # Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;

    .prologue
    .line 319
    iput-object p1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->locSourceListener:Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;

    .line 321
    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 322
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLocationReqHighAcc()Lcom/google/android/gms/location/LocationRequest;

    move-result-object v0

    .line 324
    .local v0, "req":Lcom/google/android/gms/location/LocationRequest;
    sget-object v1, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v1, v2, v0, p0}, Lcom/google/android/gms/location/FusedLocationProviderApi;->requestLocationUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationListener;)Lcom/google/android/gms/common/api/PendingResult;

    .line 329
    .end local v0    # "req":Lcom/google/android/gms/location/LocationRequest;
    :cond_0
    return-void
.end method

.method public deactivate()V
    .locals 1

    .prologue
    .line 337
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->locSourceListener:Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;

    .line 338
    return-void
.end method

.method public forceMockLocation(Lcom/seeclickfix/ma/android/location/PresetLocation;)V
    .locals 4
    .param p1, "presetLocation"    # Lcom/seeclickfix/ma/android/location/PresetLocation;

    .prologue
    .line 341
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mForceFakeLocation:Z

    .line 342
    new-instance v0, Landroid/location/Location;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/location/PresetLocation;->provider()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    .line 343
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/location/PresetLocation;->time()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Landroid/location/Location;->setTime(J)V

    .line 344
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/location/PresetLocation;->lat()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Landroid/location/Location;->setLatitude(D)V

    .line 345
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/location/PresetLocation;->lng()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Landroid/location/Location;->setLongitude(D)V

    .line 346
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/location/PresetLocation;->accuracy()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/location/Location;->setAccuracy(F)V

    .line 348
    return-void
.end method

.method public getLastLocationEvent()Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;
    .locals 5
    .annotation runtime Lcom/squareup/otto/Produce;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 172
    iget-boolean v3, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mForceFakeLocation:Z

    if-eqz v3, :cond_1

    .line 174
    new-instance v2, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-direct {v2, v3}, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;-><init>(Landroid/location/Location;)V

    .line 192
    :cond_0
    :goto_0
    return-object v2

    .line 177
    :cond_1
    iget-object v3, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v3}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 179
    sget-object v3, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v3, v4}, Lcom/google/android/gms/location/FusedLocationProviderApi;->getLastLocation(Lcom/google/android/gms/common/api/GoogleApiClient;)Landroid/location/Location;

    move-result-object v1

    .line 181
    .local v1, "loc":Landroid/location/Location;
    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->isNewerCloserMoreAccurateOrSame(Landroid/location/Location;)Z

    move-result v0

    .line 183
    .local v0, "isGood":Z
    if-eqz v0, :cond_0

    .line 184
    iput-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    .line 186
    new-instance v2, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-direct {v2, v3}, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;-><init>(Landroid/location/Location;)V

    goto :goto_0
.end method

.method public getLastLocationIfAvailable()Landroid/location/Location;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    return-object v0
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mForceFakeLocation:Z

    if-nez v0, :cond_0

    .line 148
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, v1}, Lcom/google/android/gms/location/FusedLocationProviderApi;->getLastLocation(Lcom/google/android/gms/common/api/GoogleApiClient;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    .line 154
    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;-><init>(Landroid/location/Location;)V

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->postEvent(Ljava/lang/Object;)V

    .line 155
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startHighAccuracyLocationUpdates()V

    .line 157
    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 1
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 280
    new-instance v0, Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;

    invoke-direct {v0, p1}, Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;-><init>(Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->postEvent(Ljava/lang/Object;)V

    .line 281
    return-void
.end method

.method public onConnectionSuspended(I)V
    .locals 0
    .param p1, "i"    # I

    .prologue
    .line 161
    return-void
.end method

.method public onDisconnected()V
    .locals 0

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopActiveLocationUpdates()V

    .line 166
    return-void
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 2
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    .line 299
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mForceFakeLocation:Z

    if-eqz v0, :cond_1

    .line 301
    new-instance v0, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;-><init>(Landroid/location/Location;)V

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->postEvent(Ljava/lang/Object;)V

    .line 315
    :cond_0
    :goto_0
    return-void

    .line 305
    :cond_1
    iput-object p1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    .line 307
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startTimeoutClock()V

    .line 309
    new-instance v0, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;-><init>(Landroid/location/Location;)V

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->postEvent(Ljava/lang/Object;)V

    .line 311
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->locSourceListener:Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;

    if-eqz v0, :cond_0

    .line 312
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->locSourceListener:Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    invoke-interface {v0, v1}, Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;->onLocationChanged(Landroid/location/Location;)V

    goto :goto_0
.end method

.method public releaseLocationFaking()V
    .locals 1

    .prologue
    .line 352
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mForceFakeLocation:Z

    .line 353
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;

    .line 354
    return-void
.end method

.method public startHighAccuracyLocationUpdates()V
    .locals 3

    .prologue
    .line 226
    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    .line 240
    :cond_0
    :goto_0
    return-void

    .line 229
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopActiveLocationUpdates()V

    .line 231
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLocationReqHighAcc()Lcom/google/android/gms/location/LocationRequest;

    move-result-object v0

    .line 233
    .local v0, "req":Lcom/google/android/gms/location/LocationRequest;
    sget-object v1, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v1, v2, v0, p0}, Lcom/google/android/gms/location/FusedLocationProviderApi;->requestLocationUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationListener;)Lcom/google/android/gms/common/api/PendingResult;

    .line 236
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startTimeoutClock()V

    goto :goto_0
.end method

.method public startUpdates()V
    .locals 2

    .prologue
    .line 112
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->isLocationEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 114
    new-instance v0, Lcom/seeclickfix/ma/android/events/LocationNotEnabledEvent;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/events/LocationNotEnabledEvent;-><init>()V

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->postEvent(Ljava/lang/Object;)V

    .line 134
    :cond_0
    :goto_0
    return-void

    .line 118
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->isServiceAvailable()Z

    move-result v0

    if-nez v0, :cond_2

    .line 121
    new-instance v0, Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;-><init>(Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->postEvent(Ljava/lang/Object;)V

    goto :goto_0

    .line 125
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-nez v0, :cond_0

    .line 126
    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    sget-object v1, Lcom/google/android/gms/location/LocationServices;->API:Lcom/google/android/gms/common/api/Api;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addOnConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 132
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    goto :goto_0
.end method

.method public stopActiveLocationUpdates()V
    .locals 2

    .prologue
    .line 267
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopTimeoutClock()V

    .line 269
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 270
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, v1, p0}, Lcom/google/android/gms/location/FusedLocationProviderApi;->removeLocationUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationListener;)Lcom/google/android/gms/common/api/PendingResult;

    .line 276
    :cond_0
    return-void
.end method

.method public stopUpdates()V
    .locals 1

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopActiveLocationUpdates()V

    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter;->mClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 142
    :cond_0
    return-void
.end method
