.class public Lcom/seeclickfix/ma/android/objects/loc/Place;
.super Ljava/lang/Object;
.source "Place.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "places"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/seeclickfix/ma/android/objects/loc/Place;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation
.end field

.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "Place"


# instance fields
.field private apiId:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "api_id"
    .end annotation
.end field

.field private cacheKey:Ljava/lang/String;

.field private transient id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "id"
        generatedId = true
    .end annotation
.end field

.field private ignored:Z
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "ignored"
    .end annotation
.end field

.field private isCustom:Z
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "custom"
    .end annotation
.end field

.field private isMyComments:Z

.field private isMyLocation:Z
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "my_location"
    .end annotation
.end field

.field private isMyReports:Z

.field private isSelected:Z
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "selected"
    .end annotation
.end field

.field private lastPlaceUpdateFromApi:J
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "last_api_update"
    .end annotation
.end field

.field private lastSuccessfullListQuery:J
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "last_issue_query"
    .end annotation
.end field

.field private listPosition:I

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "name"
    .end annotation
.end field

.field private origLat:D

.field private origLng:D

.field private pageNumber:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "page_number"
    .end annotation
.end field

.field private placeLat:D
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "lat"
    .end annotation
.end field

.field private placeLng:D
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "lng"
    .end annotation
.end field

.field private shouldReload:Z

.field private simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "simplified_center"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
        foreignAutoCreate = true
        foreignAutoRefresh = true
    .end annotation
.end field

.field private state:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "state"
    .end annotation
.end field

.field private urlName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "url_name"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "slug"
    .end annotation
.end field

.field private zoneCacheKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 235
    new-instance v0, Lcom/seeclickfix/ma/android/objects/loc/Place$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v0, 0x0

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    .line 57
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments:Z

    .line 58
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->listPosition:I

    .line 80
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    .line 83
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    .line 86
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    .line 89
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->ignored:Z

    .line 92
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->shouldReload:Z

    .line 93
    const-string/jumbo v0, "CacheKeyNotSet"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->cacheKey:Ljava/lang/String;

    .line 94
    const-string/jumbo v0, "ZoneCacheKeyNotSet"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->zoneCacheKey:Ljava/lang/String;

    .line 98
    iput-wide v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    .line 104
    iput-wide v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    .line 199
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    .line 57
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments:Z

    .line 58
    iput v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->listPosition:I

    .line 80
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    .line 83
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    .line 86
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    .line 89
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->ignored:Z

    .line 92
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->shouldReload:Z

    .line 93
    const-string/jumbo v0, "CacheKeyNotSet"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->cacheKey:Ljava/lang/String;

    .line 94
    const-string/jumbo v0, "ZoneCacheKeyNotSet"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->zoneCacheKey:Ljava/lang/String;

    .line 98
    iput-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    .line 104
    iput-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    .line 209
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->id:I

    .line 210
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    .line 211
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    .line 212
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    .line 213
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->cacheKey:Ljava/lang/String;

    .line 214
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->zoneCacheKey:Ljava/lang/String;

    .line 215
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->pageNumber:I

    .line 216
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    .line 217
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    .line 218
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    .line 219
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    .line 220
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_4

    :goto_4
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->shouldReload:Z

    .line 221
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    .line 222
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    .line 223
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    .line 224
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    .line 225
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    .line 226
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    .line 227
    sget-object v0, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    .line 228
    return-void

    :cond_0
    move v0, v2

    .line 216
    goto :goto_0

    :cond_1
    move v0, v2

    .line 217
    goto :goto_1

    :cond_2
    move v0, v2

    .line 218
    goto :goto_2

    :cond_3
    move v0, v2

    .line 219
    goto :goto_3

    :cond_4
    move v1, v2

    .line 220
    goto :goto_4
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/loc/Place$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/loc/Place$1;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/seeclickfix/ma/android/objects/loc/Place;)I
    .locals 21
    .param p1, "another"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 150
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    if-eqz v2, :cond_0

    .line 152
    const/4 v2, -0x1

    .line 188
    :goto_0
    return v2

    .line 153
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 154
    const/4 v2, 0x1

    goto :goto_0

    .line 158
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected()Z

    move-result v2

    if-nez v2, :cond_2

    .line 160
    const/4 v2, -0x1

    goto :goto_0

    .line 161
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 162
    const/4 v2, 0x1

    goto :goto_0

    .line 167
    :cond_3
    const/4 v2, 0x3

    new-array v10, v2, [F

    .line 168
    .local v10, "distance":[F
    const/4 v2, 0x3

    new-array v0, v2, [F

    move-object/from16 v20, v0

    .line 170
    .local v20, "distanceOther":[F
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v6

    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v8

    invoke-static/range {v2 .. v10}, Landroid/location/Location;->distanceBetween(DDDD[F)V

    .line 176
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getOrigLat()D

    move-result-wide v12

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getOrigLng()D

    move-result-wide v14

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v16

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v18

    invoke-static/range {v12 .. v20}, Landroid/location/Location;->distanceBetween(DDDD[F)V

    .line 183
    const/4 v2, 0x0

    aget v2, v10, v2

    const/4 v3, 0x0

    aget v3, v20, v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_4

    .line 184
    const/4 v2, -0x1

    goto :goto_0

    .line 185
    :cond_4
    const/4 v2, 0x0

    aget v2, v10, v2

    const/4 v3, 0x0

    aget v3, v20, v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5

    .line 186
    const/4 v2, 0x1

    goto :goto_0

    .line 188
    :cond_5
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p1, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->compareTo(Lcom/seeclickfix/ma/android/objects/loc/Place;)I

    move-result v0

    return v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 231
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 520
    if-ne p0, p1, :cond_1

    .line 549
    :cond_0
    :goto_0
    return v1

    .line 521
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    goto :goto_0

    .line 522
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 523
    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 524
    .local v0, "other":Lcom/seeclickfix/ma/android/objects/loc/Place;
    iget v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->apiId:I

    iget v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->apiId:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 525
    :cond_4
    iget-boolean v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    iget-boolean v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 526
    :cond_5
    iget-boolean v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments:Z

    iget-boolean v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    goto :goto_0

    .line 527
    :cond_6
    iget-boolean v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    iget-boolean v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    if-eq v3, v4, :cond_7

    move v1, v2

    goto :goto_0

    .line 528
    :cond_7
    iget-boolean v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    iget-boolean v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    if-eq v3, v4, :cond_8

    move v1, v2

    goto :goto_0

    .line 529
    :cond_8
    iget-boolean v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    iget-boolean v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    if-eq v3, v4, :cond_9

    move v1, v2

    goto :goto_0

    .line 530
    :cond_9
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    iget-wide v6, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_a

    move v1, v2

    goto :goto_0

    .line 531
    :cond_a
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    iget-wide v6, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_b

    move v1, v2

    goto :goto_0

    .line 532
    :cond_b
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    if-nez v3, :cond_c

    .line 533
    iget-object v3, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    if-eqz v3, :cond_d

    move v1, v2

    goto :goto_0

    .line 534
    :cond_c
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    iget-object v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    move v1, v2

    goto :goto_0

    .line 535
    :cond_d
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    iget-wide v6, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_e

    move v1, v2

    .line 536
    goto :goto_0

    .line 537
    :cond_e
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    iget-wide v6, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_f

    move v1, v2

    .line 538
    goto/16 :goto_0

    .line 539
    :cond_f
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    iget-wide v6, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_10

    move v1, v2

    .line 540
    goto/16 :goto_0

    .line 541
    :cond_10
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    iget-wide v6, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_11

    move v1, v2

    .line 542
    goto/16 :goto_0

    .line 543
    :cond_11
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    if-nez v3, :cond_12

    .line 544
    iget-object v3, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    if-eqz v3, :cond_13

    move v1, v2

    goto/16 :goto_0

    .line 545
    :cond_12
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    iget-object v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    move v1, v2

    goto/16 :goto_0

    .line 546
    :cond_13
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    if-nez v3, :cond_14

    .line 547
    iget-object v3, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    if-eqz v3, :cond_0

    move v1, v2

    goto/16 :goto_0

    .line 548
    :cond_14
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    iget-object v4, v0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto/16 :goto_0
.end method

.method public getApiId()I
    .locals 1

    .prologue
    .line 442
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->apiId:I

    return v0
.end method

.method public getCacheKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 564
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->cacheKey:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 271
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->id:I

    return v0
.end method

.method public getIgnored()Z
    .locals 1

    .prologue
    .line 432
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->ignored:Z

    return v0
.end method

.method public getLastPlaceUpdateFromApi()J
    .locals 2

    .prologue
    .line 400
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    return-wide v0
.end method

.method public getLastSuccessfulListQuery()J
    .locals 2

    .prologue
    .line 376
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    return-wide v0
.end method

.method public getListPosition()I
    .locals 1

    .prologue
    .line 481
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->listPosition:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOrigLat()D
    .locals 2

    .prologue
    .line 301
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    return-wide v0
.end method

.method public getOrigLng()D
    .locals 2

    .prologue
    .line 311
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    return-wide v0
.end method

.method public getPageNumber()I
    .locals 1

    .prologue
    .line 412
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->pageNumber:I

    return v0
.end method

.method public getPlaceLat()D
    .locals 4

    .prologue
    .line 321
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;->lat:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;->lat:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    .line 325
    :cond_0
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    return-wide v0
.end method

.method public getPlaceLng()D
    .locals 4

    .prologue
    .line 340
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;->lng:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;->lng:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    .line 344
    :cond_0
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    return-wide v0
.end method

.method public getShouldReload()Z
    .locals 1

    .prologue
    .line 554
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->shouldReload:Z

    return v0
.end method

.method public getSimplifiedCenter()Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    return-object v0
.end method

.method public getState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 388
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    return-object v0
.end method

.method public getUrlName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 291
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    return-object v0
.end method

.method public getZoneCacheKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 574
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->zoneCacheKey:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 13

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x4d5

    const/16 v5, 0x4cf

    const/16 v12, 0x20

    .line 492
    const/16 v0, 0x1f

    .line 493
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 494
    .local v1, "result":I
    iget v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->apiId:I

    add-int/lit8 v1, v4, 0x1f

    .line 495
    mul-int/lit8 v8, v1, 0x1f

    iget-boolean v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    if-eqz v4, :cond_0

    move v4, v5

    :goto_0
    add-int v1, v8, v4

    .line 496
    mul-int/lit8 v8, v1, 0x1f

    iget-boolean v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments:Z

    if-eqz v4, :cond_1

    move v4, v5

    :goto_1
    add-int v1, v8, v4

    .line 497
    mul-int/lit8 v8, v1, 0x1f

    iget-boolean v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    if-eqz v4, :cond_2

    move v4, v5

    :goto_2
    add-int v1, v8, v4

    .line 498
    mul-int/lit8 v8, v1, 0x1f

    iget-boolean v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    if-eqz v4, :cond_3

    move v4, v5

    :goto_3
    add-int v1, v8, v4

    .line 499
    mul-int/lit8 v4, v1, 0x1f

    iget-boolean v8, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    if-eqz v8, :cond_4

    :goto_4
    add-int v1, v4, v5

    .line 500
    mul-int/lit8 v4, v1, 0x1f

    iget-wide v8, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    iget-wide v10, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    ushr-long/2addr v10, v12

    xor-long/2addr v8, v10

    long-to-int v5, v8

    add-int v1, v4, v5

    .line 501
    mul-int/lit8 v4, v1, 0x1f

    iget-wide v8, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    iget-wide v10, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    ushr-long/2addr v10, v12

    xor-long/2addr v8, v10

    long-to-int v5, v8

    add-int v1, v4, v5

    .line 502
    mul-int/lit8 v5, v1, 0x1f

    iget-object v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    if-nez v4, :cond_5

    move v4, v7

    :goto_5
    add-int v1, v5, v4

    .line 504
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 505
    .local v2, "temp":J
    mul-int/lit8 v4, v1, 0x1f

    ushr-long v8, v2, v12

    xor-long/2addr v8, v2

    long-to-int v5, v8

    add-int v1, v4, v5

    .line 506
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 507
    mul-int/lit8 v4, v1, 0x1f

    ushr-long v8, v2, v12

    xor-long/2addr v8, v2

    long-to-int v5, v8

    add-int v1, v4, v5

    .line 508
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 509
    mul-int/lit8 v4, v1, 0x1f

    ushr-long v8, v2, v12

    xor-long/2addr v8, v2

    long-to-int v5, v8

    add-int v1, v4, v5

    .line 510
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 511
    mul-int/lit8 v4, v1, 0x1f

    ushr-long v8, v2, v12

    xor-long/2addr v8, v2

    long-to-int v5, v8

    add-int v1, v4, v5

    .line 512
    mul-int/lit8 v5, v1, 0x1f

    iget-object v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    if-nez v4, :cond_6

    move v4, v7

    :goto_6
    add-int v1, v5, v4

    .line 513
    mul-int/lit8 v4, v1, 0x1f

    iget-object v5, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    if-nez v5, :cond_7

    :goto_7
    add-int v1, v4, v7

    .line 514
    return v1

    .end local v2    # "temp":J
    :cond_0
    move v4, v6

    .line 495
    goto/16 :goto_0

    :cond_1
    move v4, v6

    .line 496
    goto/16 :goto_1

    :cond_2
    move v4, v6

    .line 497
    goto/16 :goto_2

    :cond_3
    move v4, v6

    .line 498
    goto :goto_3

    :cond_4
    move v5, v6

    .line 499
    goto :goto_4

    .line 502
    :cond_5
    iget-object v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    goto :goto_5

    .line 512
    .restart local v2    # "temp":J
    :cond_6
    iget-object v4, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    goto :goto_6

    .line 513
    :cond_7
    iget-object v5, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v7

    goto :goto_7
.end method

.method public isCustom()Z
    .locals 1

    .prologue
    .line 422
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    return v0
.end method

.method public isMyComments()Z
    .locals 1

    .prologue
    .line 471
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments:Z

    return v0
.end method

.method public isMyLocation()Z
    .locals 1

    .prologue
    .line 356
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    return v0
.end method

.method public isMyReports()Z
    .locals 1

    .prologue
    .line 452
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    return v0
.end method

.method public isSelected()Z
    .locals 1

    .prologue
    .line 366
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    return v0
.end method

.method public setApiId(I)V
    .locals 0
    .param p1, "apiId"    # I

    .prologue
    .line 447
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->apiId:I

    .line 448
    return-void
.end method

.method public setCacheKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "cacheKey"    # Ljava/lang/String;

    .prologue
    .line 569
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->cacheKey:Ljava/lang/String;

    .line 570
    return-void
.end method

.method public setCustom(Z)V
    .locals 0
    .param p1, "isCustom"    # Z

    .prologue
    .line 427
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    .line 428
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 276
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->id:I

    .line 277
    return-void
.end method

.method public setIgnored(Z)V
    .locals 0
    .param p1, "ignored"    # Z

    .prologue
    .line 437
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->ignored:Z

    .line 438
    return-void
.end method

.method public setLastPlaceUpdateFromApi(J)V
    .locals 1
    .param p1, "lastPlaceUpdateFromApi"    # J

    .prologue
    .line 407
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    .line 408
    return-void
.end method

.method public setLastSuccessfulListQuery(J)V
    .locals 1
    .param p1, "lastSuccessfulNetQuery"    # J

    .prologue
    .line 383
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    .line 384
    return-void
.end method

.method public setListPosition(I)V
    .locals 0
    .param p1, "listPosition"    # I

    .prologue
    .line 486
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->listPosition:I

    .line 487
    return-void
.end method

.method public setMyComments(Z)V
    .locals 0
    .param p1, "isMyComments"    # Z

    .prologue
    .line 476
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments:Z

    .line 477
    return-void
.end method

.method public setMyLocation(Z)V
    .locals 0
    .param p1, "isMyLocation"    # Z

    .prologue
    .line 361
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    .line 362
    return-void
.end method

.method public setMyReports(Z)V
    .locals 0
    .param p1, "isMyReports"    # Z

    .prologue
    .line 457
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    .line 458
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 286
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    .line 287
    return-void
.end method

.method public setOrigLat(D)V
    .locals 1
    .param p1, "origLat"    # D

    .prologue
    .line 306
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    .line 307
    return-void
.end method

.method public setOrigLng(D)V
    .locals 1
    .param p1, "origLng"    # D

    .prologue
    .line 316
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    .line 317
    return-void
.end method

.method public setPageNumber(I)V
    .locals 0
    .param p1, "pageNumber"    # I

    .prologue
    .line 417
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->pageNumber:I

    .line 418
    return-void
.end method

.method public setPlaceLat(D)V
    .locals 1
    .param p1, "placeLat"    # D

    .prologue
    .line 332
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    .line 333
    return-void
.end method

.method public setPlaceLng(D)V
    .locals 1
    .param p1, "placeLng"    # D

    .prologue
    .line 351
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    .line 352
    return-void
.end method

.method public setSelected(Z)V
    .locals 0
    .param p1, "isSelected"    # Z

    .prologue
    .line 371
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    .line 372
    return-void
.end method

.method public setShouldReload(Z)V
    .locals 0
    .param p1, "shouldReload"    # Z

    .prologue
    .line 559
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->shouldReload:Z

    .line 560
    return-void
.end method

.method public setSimplifiedCenter(Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;)V
    .locals 2
    .param p1, "simplifiedCenter"    # Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    .prologue
    .line 129
    if-eqz p1, :cond_0

    .line 130
    iget-object v0, p1, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;->lat:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLat:D

    .line 131
    iget-object v0, p1, Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;->lng:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->placeLng:D

    .line 133
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    .line 136
    :cond_0
    return-void
.end method

.method public setState(Ljava/lang/String;)V
    .locals 0
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 393
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    .line 394
    return-void
.end method

.method public setUrlName(Ljava/lang/String;)V
    .locals 0
    .param p1, "urlName"    # Ljava/lang/String;

    .prologue
    .line 296
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    .line 297
    return-void
.end method

.method public setZoneCacheKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "zoneCacheKey"    # Ljava/lang/String;

    .prologue
    .line 579
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->zoneCacheKey:Ljava/lang/String;

    .line 580
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 463
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Place [isMyReports="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", apiId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->apiId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", urlName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", pageNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->pageNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isSelected="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isMyLocation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isCustom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", ignored="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->ignored:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lastSuccessfullListQuery="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lastPlaceUpdateFromApi="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", origLat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", origLng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", placeLat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", placeLng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", simplifiedCenter="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 248
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 249
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 250
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->state:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 251
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->urlName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 252
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->cacheKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 253
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->zoneCacheKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 254
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->pageNumber:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 255
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 256
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 257
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isCustom:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 258
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 259
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->shouldReload:Z

    if-eqz v0, :cond_4

    :goto_4
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 260
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastSuccessfullListQuery:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 261
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->lastPlaceUpdateFromApi:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 262
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLat:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 263
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->origLng:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 264
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 265
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 266
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Place;->simplifiedCenter:Lcom/seeclickfix/ma/android/objects/loc/SimplifiedCenter;

    invoke-virtual {p1, v0, v2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 267
    return-void

    :cond_0
    move v0, v2

    .line 255
    goto :goto_0

    :cond_1
    move v0, v2

    .line 256
    goto :goto_1

    :cond_2
    move v0, v2

    .line 257
    goto :goto_2

    :cond_3
    move v0, v2

    .line 258
    goto :goto_3

    :cond_4
    move v1, v2

    .line 259
    goto :goto_4
.end method
