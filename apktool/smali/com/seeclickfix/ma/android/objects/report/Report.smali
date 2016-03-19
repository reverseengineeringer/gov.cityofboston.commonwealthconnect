.class public Lcom/seeclickfix/ma/android/objects/report/Report;
.super Ljava/lang/Object;
.source "Report.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "reports"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            ">;"
        }
    .end annotation
.end field

.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "Reports"


# instance fields
.field private address:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private anonymize_reporter:Z
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private answers:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "request_type_answers_attributes"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Answer;",
            ">;"
        }
    .end annotation
.end field

.field private api_id:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation
.end field

.field private transient camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

.field private transient dao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private db_id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        allowGeneratedIdInsert = true
        columnName = "id"
        generatedId = true
    .end annotation
.end field

.field private description:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient empty:Z
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient isUsingCurrentLocation:Z
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "using_current_loc"
    .end annotation
.end field

.field private lastEdited:J
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private lat:D
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient latLng:Lcom/google/android/gms/maps/model/LatLng;

.field private transient latLngModified:Z

.field private lng:D
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private localImagePath:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient modified:Z

.field private transient questions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;"
        }
    .end annotation
.end field

.field private transient questionsDb:Lcom/j256/ormlite/dao/ForeignCollection;
    .annotation runtime Lcom/j256/ormlite/field/ForeignCollectionField;
        eager = false
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;"
        }
    .end annotation
.end field

.field private reporterDisplay:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "reporter_display"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private reporterEmail:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "reporter_email"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private reqTypeID:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "request_type_id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "req_type_id"
    .end annotation
.end field

.field private requestType:Lcom/seeclickfix/ma/android/objects/report/RequestType;

.field private transient selectedWatchAreaApiId:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private state:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "report_state"
    .end annotation
.end field

.field private summary:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private userID:I

.field private transient watchAreas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation
.end field

.field private transient watchAreasDb:Lcom/j256/ormlite/dao/ForeignCollection;
    .annotation runtime Lcom/j256/ormlite/field/ForeignCollectionField;
        eager = false
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation
.end field

.field private transient zoom:F
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 267
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Report$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/Report$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/report/Report;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    .line 120
    iput-wide v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    .line 123
    iput-wide v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    .line 146
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 149
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->modified:Z

    .line 151
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLngModified:Z

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    .line 167
    const-string/jumbo v0, "ReportState:NONE"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    .line 171
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->isUsingCurrentLocation:Z

    .line 183
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    .line 120
    iput-wide v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    .line 123
    iput-wide v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    .line 146
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 149
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->modified:Z

    .line 151
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLngModified:Z

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    .line 167
    const-string/jumbo v0, "ReportState:NONE"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    .line 171
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->isUsingCurrentLocation:Z

    .line 224
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->api_id:I

    .line 225
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->db_id:I

    .line 226
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setReqTypeID(Ljava/lang/String;)V

    .line 227
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->summary:Ljava/lang/String;

    .line 228
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->description:Ljava/lang/String;

    .line 229
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->localImagePath:Ljava/lang/String;

    .line 230
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v4

    iput-wide v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    .line 231
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v4

    iput-wide v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    .line 232
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->anonymize_reporter:Z

    .line 233
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->address:Ljava/lang/String;

    .line 234
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterDisplay:Ljava/lang/String;

    .line 235
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterEmail:Ljava/lang/String;

    .line 236
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->selectedWatchAreaApiId:I

    .line 237
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    .line 239
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    sget-object v3, Lcom/seeclickfix/ma/android/objects/report/Question;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v3}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 240
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    sget-object v3, Lcom/seeclickfix/ma/android/objects/report/Answer;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v3}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 241
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    sget-object v3, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v3}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 243
    const-class v0, Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/maps/model/CameraPosition;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 244
    const-class v0, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/maps/model/LatLng;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 246
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 247
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLngModified:Z

    .line 248
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_3

    :goto_3
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->isUsingCurrentLocation:Z

    .line 249
    return-void

    :cond_0
    move v0, v2

    .line 232
    goto :goto_0

    :cond_1
    move v0, v2

    .line 246
    goto :goto_1

    :cond_2
    move v0, v2

    .line 247
    goto :goto_2

    :cond_3
    move v1, v2

    .line 248
    goto :goto_3
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/report/Report$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/report/Report$1;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 5
    .param p1, "old"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    .line 120
    iput-wide v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    .line 123
    iput-wide v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    .line 146
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 149
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->modified:Z

    .line 151
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLngModified:Z

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    .line 167
    const-string/jumbo v0, "ReportState:NONE"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    .line 171
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->isUsingCurrentLocation:Z

    .line 190
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->address:Ljava/lang/String;

    .line 191
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAnswers()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    .line 192
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getApiID()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->api_id:I

    .line 193
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getCamPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 194
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->dao:Lcom/j256/ormlite/dao/Dao;

    .line 195
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getDbId()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->db_id:I

    .line 196
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getDescription()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->description:Ljava/lang/String;

    .line 197
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLat()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    .line 198
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 199
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLng()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    .line 200
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAnonymizeReporter()Z

    move-result v0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->anonymize_reporter:Z

    .line 201
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLocalImagePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->localImagePath:Ljava/lang/String;

    .line 202
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    .line 203
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestionsDb()Lcom/j256/ormlite/dao/ForeignCollection;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questionsDb:Lcom/j256/ormlite/dao/ForeignCollection;

    .line 204
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getReporterDisplay()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterDisplay:Ljava/lang/String;

    .line 205
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getReporterEmail()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterEmail:Ljava/lang/String;

    .line 206
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getRequestTypeId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setReqTypeID(Ljava/lang/String;)V

    .line 207
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSelectedWatchAreaApiId()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->selectedWatchAreaApiId:I

    .line 208
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getState()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    .line 209
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSummary()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->summary:Ljava/lang/String;

    .line 210
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getUserID()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->userID:I

    .line 211
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getWatchAreas()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setWatchAreas(Ljava/util/List;)V

    .line 212
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getZoom()F

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->zoom:F

    .line 213
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->isEmpty()Z

    move-result v0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 214
    return-void
.end method

.method private addAnswerToQuestion(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 4
    .param p1, "a"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 534
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 535
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 537
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 538
    .local v1, "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 539
    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/objects/report/Question;->setSelectedAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 544
    .end local v1    # "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    :cond_1
    return-void
.end method

.method private removeAnswerFromQuestion(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 4
    .param p1, "a"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 547
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 548
    .local v1, "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 549
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->setSelectedAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 554
    .end local v1    # "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    :cond_1
    return-void
.end method


# virtual methods
.method public addAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 5
    .param p1, "a"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 503
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 504
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 507
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 508
    const/4 v2, 0x0

    .line 510
    .local v2, "replacedAnswer":Z
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 511
    .local v0, "currentFA":Lcom/seeclickfix/ma/android/objects/report/Answer;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getPrimaryKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 512
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 513
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 515
    const/4 v2, 0x1

    .line 520
    .end local v0    # "currentFA":Lcom/seeclickfix/ma/android/objects/report/Answer;
    :cond_1
    if-nez v2, :cond_2

    .line 522
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 529
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "replacedAnswer":Z
    :cond_2
    :goto_0
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->addAnswerToQuestion(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 530
    return-void

    .line 526
    :cond_3
    iget-object v3, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public clearSecondaryData()V
    .locals 1

    .prologue
    .line 796
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setReqTypeID(Ljava/lang/String;)V

    .line 798
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    .line 799
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    .line 800
    return-void
.end method

.method public clearWatchAreaAndReqTypes()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 780
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->clearSecondaryData()V

    .line 782
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    .line 784
    iput-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questionsDb:Lcom/j256/ormlite/dao/ForeignCollection;

    .line 785
    iput-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreasDb:Lcom/j256/ormlite/dao/ForeignCollection;

    .line 787
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->selectedWatchAreaApiId:I

    .line 788
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 263
    const/4 v0, 0x0

    return v0
.end method

.method public encodeMultiValueAnswer(Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "answer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 841
    .local p1, "params":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v5, Lcom/google/gson/Gson;

    invoke-direct {v5}, Lcom/google/gson/Gson;-><init>()V

    const-class v6, [Ljava/lang/String;

    invoke-virtual {v5, p3, v6}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    invoke-static {v5}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->nullToEmpty([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 842
    .local v4, "values":[Ljava/lang/String;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 843
    .local v3, "value":Ljava/lang/String;
    const-string/jumbo v5, "%s[]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5, v3}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 842
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 845
    .end local v3    # "value":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public encodeQuestion(Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;Lcom/seeclickfix/ma/android/objects/report/Question;)V
    .locals 6
    .param p2, "question"    # Lcom/seeclickfix/ma/android/objects/report/Question;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ")V"
        }
    .end annotation

    .prologue
    .line 827
    .local p1, "result":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 828
    .local v2, "pKeyVal":Ljava/lang/String;
    const-string/jumbo v3, "answers[%s]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 830
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/report/Question;->getAnswerAsString()Ljava/lang/String;

    move-result-object v0

    .line 832
    .local v0, "answer":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/report/Question;->isMultiValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 833
    invoke-virtual {p0, p1, v1, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->encodeMultiValueAnswer(Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    :goto_0
    return-void

    .line 835
    :cond_0
    invoke-virtual {p1, v1, v0}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 488
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getAnonymizeReporter()Z
    .locals 1

    .prologue
    .line 327
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->anonymize_reporter:Z

    return v0
.end method

.method public getAnswers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Answer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 338
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    return-object v0
.end method

.method public getApiID()I
    .locals 1

    .prologue
    .line 668
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->api_id:I

    return v0
.end method

.method public getCamPosition()Lcom/google/android/gms/maps/model/CameraPosition;
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    return-object v0
.end method

.method public getDao()Lcom/j256/ormlite/dao/Dao;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 634
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->dao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getDbId()I
    .locals 1

    .prologue
    .line 663
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->db_id:I

    return v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 364
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getIsUsingCurrentLocation()Z
    .locals 1

    .prologue
    .line 763
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->isUsingCurrentLocation:Z

    return v0
.end method

.method public getLastEdited()J
    .locals 2

    .prologue
    .line 747
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lastEdited:J

    return-wide v0
.end method

.method public getLat()D
    .locals 2

    .prologue
    .line 394
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    return-wide v0
.end method

.method public getLatLng()Lcom/google/android/gms/maps/model/LatLng;
    .locals 6

    .prologue
    const-wide/16 v2, 0x0

    .line 427
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_0

    .line 428
    new-instance v0, Lcom/google/android/gms/maps/model/LatLng;

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 430
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    return-object v0
.end method

.method public getLatLngModified()Z
    .locals 1

    .prologue
    .line 755
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLngModified:Z

    return v0
.end method

.method public getLng()D
    .locals 2

    .prologue
    .line 453
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    return-wide v0
.end method

.method public getLocalImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 379
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->localImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getQuestions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;"
        }
    .end annotation

    .prologue
    .line 611
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    return-object v0
.end method

.method public getQuestionsDb()Lcom/j256/ormlite/dao/ForeignCollection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;"
        }
    .end annotation

    .prologue
    .line 688
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questionsDb:Lcom/j256/ormlite/dao/ForeignCollection;

    return-object v0
.end method

.method public getReportableQuestions()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;"
        }
    .end annotation

    .prologue
    .line 615
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 617
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 618
    .local v1, "question":Lcom/seeclickfix/ma/android/objects/report/Question;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Question;->isReportable()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 619
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 622
    .end local v1    # "question":Lcom/seeclickfix/ma/android/objects/report/Question;
    :cond_1
    return-object v2
.end method

.method public getReporterDisplay()Ljava/lang/String;
    .locals 1

    .prologue
    .line 476
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterDisplay:Ljava/lang/String;

    return-object v0
.end method

.method public getReporterEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 465
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterEmail:Ljava/lang/String;

    return-object v0
.end method

.method public getReqTypeID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 860
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reqTypeID:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestType()Lcom/seeclickfix/ma/android/objects/report/RequestType;
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->requestType:Lcom/seeclickfix/ma/android/objects/report/RequestType;

    return-object v0
.end method

.method public getRequestTypeId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 313
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getReqTypeID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSelectedWatchArea()Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .locals 5

    .prologue
    .line 593
    const/4 v2, 0x0

    .line 595
    .local v2, "returnArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    iget v3, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->selectedWatchAreaApiId:I

    if-gtz v3, :cond_0

    .line 596
    const/4 v3, 0x0

    .line 606
    :goto_0
    return-object v3

    .line 599
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getWatchAreas()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 600
    .local v0, "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v3

    iget v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->selectedWatchAreaApiId:I

    if-ne v3, v4, :cond_1

    .line 601
    move-object v2, v0

    .end local v0    # "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    :cond_2
    move-object v3, v2

    .line 606
    goto :goto_0
.end method

.method public getSelectedWatchAreaApiId()I
    .locals 1

    .prologue
    .line 731
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->selectedWatchAreaApiId:I

    return v0
.end method

.method public getState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 658
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    return-object v0
.end method

.method public getSummary()Ljava/lang/String;
    .locals 1

    .prologue
    .line 348
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->summary:Ljava/lang/String;

    return-object v0
.end method

.method public getUserID()I
    .locals 1

    .prologue
    .line 678
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->userID:I

    return v0
.end method

.method public getWatchAreas()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation

    .prologue
    .line 572
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    return-object v0
.end method

.method public getWatchAreasDb()Lcom/j256/ormlite/dao/ForeignCollection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation

    .prologue
    .line 723
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreasDb:Lcom/j256/ormlite/dao/ForeignCollection;

    return-object v0
.end method

.method public getZoom()F
    .locals 1

    .prologue
    .line 692
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->zoom:F

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 702
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    return v0
.end method

.method public isModified()Z
    .locals 1

    .prologue
    .line 706
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->modified:Z

    return v0
.end method

.method public removeAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 4
    .param p1, "a"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 559
    iget-object v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 560
    .local v0, "currentFA":Lcom/seeclickfix/ma/android/objects/report/Answer;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 562
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 563
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->removeAnswerFromQuestion(Lcom/seeclickfix/ma/android/objects/report/Answer;)V

    .line 568
    .end local v0    # "currentFA":Lcom/seeclickfix/ma/android/objects/report/Answer;
    :cond_1
    return-void
.end method

.method public setAddress(Ljava/lang/String;)V
    .locals 1
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 493
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->isUsingCurrentLocation:Z

    if-nez v0, :cond_0

    .line 494
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 495
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 497
    :cond_0
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->address:Ljava/lang/String;

    .line 498
    return-void
.end method

.method public setAnonymizeReporter(Z)V
    .locals 1
    .param p1, "anonymize_reporter"    # Z

    .prologue
    .line 331
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 332
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->anonymize_reporter:Z

    .line 334
    return-void
.end method

.method public setAnswers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Answer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 342
    .local p1, "answers":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 343
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    .line 344
    return-void
.end method

.method public setApiID(I)V
    .locals 1
    .param p1, "api_id"    # I

    .prologue
    .line 672
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 673
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 674
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->api_id:I

    .line 675
    return-void
.end method

.method public setCamPosition(Lcom/google/android/gms/maps/model/CameraPosition;)V
    .locals 1
    .param p1, "camPosition"    # Lcom/google/android/gms/maps/model/CameraPosition;

    .prologue
    .line 435
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 436
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 437
    iget v0, p1, Lcom/google/android/gms/maps/model/CameraPosition;->zoom:F

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->zoom:F

    .line 438
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 445
    :goto_0
    return-void

    .line 439
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public setDao(Lcom/j256/ormlite/dao/Dao;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 639
    .local p1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Report;Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->dao:Lcom/j256/ormlite/dao/Dao;

    .line 640
    return-void
.end method

.method public setDbId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 743
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->db_id:I

    .line 744
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 1
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 369
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 370
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 372
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 373
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->description:Ljava/lang/String;

    .line 375
    :cond_0
    return-void
.end method

.method public setEmpty(Z)V
    .locals 0
    .param p1, "empty"    # Z

    .prologue
    .line 739
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 740
    return-void
.end method

.method public setIsUsingCurrentLocation(Z)V
    .locals 1
    .param p1, "isUsingCurrentLocation"    # Z

    .prologue
    .line 767
    if-nez p1, :cond_0

    .line 768
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 770
    :cond_0
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->isUsingCurrentLocation:Z

    .line 771
    return-void
.end method

.method public setLastEdited(J)V
    .locals 1
    .param p1, "lastEdited"    # J

    .prologue
    .line 751
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lastEdited:J

    .line 752
    return-void
.end method

.method public setLat(D)V
    .locals 1
    .param p1, "lat"    # D

    .prologue
    .line 399
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 401
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 402
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    .line 403
    return-void
.end method

.method public setLatLng(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 2
    .param p1, "latLng"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 414
    if-nez p1, :cond_0

    .line 424
    :goto_0
    return-void

    .line 419
    :cond_0
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 420
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 421
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 422
    iget-wide v0, p1, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    .line 423
    iget-wide v0, p1, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    goto :goto_0
.end method

.method public setLatLngModified(Z)V
    .locals 0
    .param p1, "latLngModified"    # Z

    .prologue
    .line 759
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLngModified:Z

    .line 760
    return-void
.end method

.method public setLng(D)V
    .locals 1
    .param p1, "lng"    # D

    .prologue
    .line 458
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 459
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 460
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    .line 461
    return-void
.end method

.method public setLocalImagePath(Ljava/lang/String;)V
    .locals 1
    .param p1, "localImagePath"    # Ljava/lang/String;

    .prologue
    .line 385
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->localImagePath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->localImagePath:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 386
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 387
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 388
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->localImagePath:Ljava/lang/String;

    .line 390
    :cond_1
    return-void
.end method

.method public setModified(Z)V
    .locals 2
    .param p1, "modified"    # Z

    .prologue
    .line 712
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->modified:Z

    .line 714
    if-eqz p1, :cond_0

    .line 715
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lastEdited:J

    .line 720
    :goto_0
    return-void

    .line 717
    :cond_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lastEdited:J

    goto :goto_0
.end method

.method public setQuestions(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 627
    .local p1, "questions":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 628
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 629
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    .line 630
    return-void
.end method

.method public setReporterDisplay(Ljava/lang/String;)V
    .locals 0
    .param p1, "reporterDisplay"    # Ljava/lang/String;

    .prologue
    .line 483
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterDisplay:Ljava/lang/String;

    .line 484
    return-void
.end method

.method public setReporterEmail(Ljava/lang/String;)V
    .locals 0
    .param p1, "reporterEmail"    # Ljava/lang/String;

    .prologue
    .line 471
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterEmail:Ljava/lang/String;

    .line 472
    return-void
.end method

.method public setReqTypeID(Ljava/lang/String;)V
    .locals 0
    .param p1, "reqTypeID"    # Ljava/lang/String;

    .prologue
    .line 864
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reqTypeID:Ljava/lang/String;

    .line 865
    return-void
.end method

.method public setRequestType(Lcom/seeclickfix/ma/android/objects/report/RequestType;)V
    .locals 1
    .param p1, "requestType"    # Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .prologue
    .line 256
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->requestType:Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 257
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getApiId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setRequestTypeId(Ljava/lang/String;)V

    .line 258
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setSummary(Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method public setRequestTypeId(Ljava/lang/String;)V
    .locals 1
    .param p1, "requestTypeId"    # Ljava/lang/String;

    .prologue
    .line 318
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 319
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 321
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setReqTypeID(Ljava/lang/String;)V

    .line 324
    return-void
.end method

.method public setSelectedWatchAreaApiId(I)V
    .locals 0
    .param p1, "selectedWatchAreaApiId"    # I

    .prologue
    .line 735
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->selectedWatchAreaApiId:I

    .line 736
    return-void
.end method

.method public setState(Ljava/lang/String;)V
    .locals 0
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 654
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    .line 655
    return-void
.end method

.method public setSummary(Ljava/lang/String;)V
    .locals 2
    .param p1, "summary"    # Ljava/lang/String;

    .prologue
    .line 353
    if-nez p1, :cond_1

    const-string/jumbo v0, ""

    .line 355
    .local v0, "actual":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 356
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 359
    :cond_0
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->summary:Ljava/lang/String;

    .line 360
    return-void

    .end local v0    # "actual":Ljava/lang/String;
    :cond_1
    move-object v0, p1

    .line 353
    goto :goto_0
.end method

.method public setUserID(I)V
    .locals 1
    .param p1, "userID"    # I

    .prologue
    .line 682
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 683
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 684
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->userID:I

    .line 685
    return-void
.end method

.method public setUserInfo(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 1
    .param p1, "userResult"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    .line 868
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setReporterEmail(Ljava/lang/String;)V

    .line 869
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setReporterDisplay(Ljava/lang/String;)V

    .line 870
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getUserID()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setUserID(I)V

    .line 871
    return-void
.end method

.method public setWatchAreas(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 578
    .local p1, "watchAreas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    if-eqz p1, :cond_0

    .line 581
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 582
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    .line 588
    :goto_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 589
    return-void

    .line 585
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    goto :goto_0
.end method

.method public setWatchAreasDb(Lcom/j256/ormlite/dao/ForeignCollection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 727
    .local p1, "watchAreasDb":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreasDb:Lcom/j256/ormlite/dao/ForeignCollection;

    .line 728
    return-void
.end method

.method public setZoom(F)V
    .locals 1
    .param p1, "zoom"    # F

    .prologue
    .line 696
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    .line 697
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 698
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->zoom:F

    .line 699
    return-void
.end method

.method public toAPIv2Map()Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 804
    new-instance v3, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;

    invoke-direct {v3}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;-><init>()V

    .line 806
    .local v3, "result":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v4, "api_key"

    const-string/jumbo v5, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v3, v4, v5}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 807
    const-string/jumbo v4, "request_type_id"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getRequestTypeId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 808
    const-string/jumbo v4, "address"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 809
    const-string/jumbo v4, "lat"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLat()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 810
    const-string/jumbo v4, "lng"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLng()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 811
    const-string/jumbo v4, "anonymize_reporter"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAnonymizeReporter()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 812
    const-string/jumbo v4, "answers[summary]"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSummary()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 813
    const-string/jumbo v4, "answers[description]"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 815
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getDeviceParams()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->putAll(Ljava/util/Map;)V

    .line 817
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getReportableQuestions()Ljava/util/List;

    move-result-object v0

    .line 819
    .local v0, "filteredQuestions":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 820
    .local v2, "question":Lcom/seeclickfix/ma/android/objects/report/Question;
    invoke-virtual {p0, v3, v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->encodeQuestion(Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;Lcom/seeclickfix/ma/android/objects/report/Question;)V

    goto :goto_0

    .line 823
    .end local v2    # "question":Lcom/seeclickfix/ma/android/objects/report/Question;
    :cond_0
    return-object v3
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 645
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Reports [dbId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->db_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", apiId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->api_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", reqTypeID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getReqTypeID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", answers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", summary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->summary:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", description="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", localImagePath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->localImagePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", address="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->address:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", reporterDisplay="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterDisplay:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", reporterEmail="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterEmail:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", latLng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", camPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", anonymize_reporter="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->anonymize_reporter:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", questions=(removed)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", answers=(removed)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", watchAreas= (removed)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", hashCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public typedImageFile()Lretrofit/mime/TypedFile;
    .locals 4

    .prologue
    .line 848
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLocalImagePath()Ljava/lang/String;

    move-result-object v2

    .line 849
    .local v2, "imagePath":Ljava/lang/String;
    const/4 v0, 0x0

    .line 851
    .local v0, "image":Lretrofit/mime/TypedFile;
    if-eqz v2, :cond_0

    .line 852
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 853
    .local v1, "imageFile":Ljava/io/File;
    new-instance v0, Lretrofit/mime/TypedFile;

    .end local v0    # "image":Lretrofit/mime/TypedFile;
    new-instance v3, Lorg/apache/http/entity/mime/content/FileBody;

    invoke-direct {v3, v1}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;)V

    invoke-virtual {v3}, Lorg/apache/http/entity/mime/content/FileBody;->getMimeType()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3, v1}, Lretrofit/mime/TypedFile;-><init>(Ljava/lang/String;Ljava/io/File;)V

    .line 856
    .end local v1    # "imageFile":Ljava/io/File;
    .restart local v0    # "image":Lretrofit/mime/TypedFile;
    :cond_0
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 6
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 282
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->api_id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 283
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->db_id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 284
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getReqTypeID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 285
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->summary:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 286
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 287
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->localImagePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 288
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lat:D

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeDouble(D)V

    .line 289
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->lng:D

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeDouble(D)V

    .line 290
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->anonymize_reporter:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 291
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->address:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 292
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterDisplay:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 293
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->reporterEmail:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 294
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->selectedWatchAreaApiId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 295
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->state:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 297
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->questions:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 298
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->answers:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 299
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->watchAreas:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 301
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 302
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 304
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->empty:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 306
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->latLngModified:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 307
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Report;->isUsingCurrentLocation:Z

    if-eqz v0, :cond_3

    :goto_3
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 308
    return-void

    :cond_0
    move v0, v2

    .line 290
    goto :goto_0

    :cond_1
    move v0, v2

    .line 304
    goto :goto_1

    :cond_2
    move v0, v2

    .line 306
    goto :goto_2

    :cond_3
    move v1, v2

    .line 307
    goto :goto_3
.end method
