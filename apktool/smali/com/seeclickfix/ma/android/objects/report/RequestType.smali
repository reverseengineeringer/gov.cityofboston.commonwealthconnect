.class public Lcom/seeclickfix/ma/android/objects/report/RequestType;
.super Ljava/lang/Object;
.source "RequestType.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "request_type"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/objects/report/RequestType$ViewTypes;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private transient action:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "action"
    .end annotation
.end field

.field private transient actionData:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "action_data"
    .end annotation
.end field

.field private apiId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "api_id"
    .end annotation
.end field

.field private transient headerTitle:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "header_title"
    .end annotation
.end field

.field private transient id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "id"
        generatedId = true
    .end annotation
.end field

.field private numQuestions:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "additional_questions_count"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "num_questions"
    .end annotation
.end field

.field private position:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "position"
    .end annotation
.end field

.field private transient report:Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
    .end annotation
.end field

.field private title:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "title"
    .end annotation
.end field

.field private transient viewType:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "view_type"
    .end annotation
.end field

.field private watchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 159
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/RequestType$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestType$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const-string/jumbo v0, "req_type_normal_view"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->viewType:Ljava/lang/String;

    .line 32
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const-string/jumbo v0, "req_type_normal_view"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->viewType:Ljava/lang/String;

    .line 189
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->id:I

    .line 190
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->apiId:Ljava/lang/String;

    .line 191
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->title:Ljava/lang/String;

    .line 192
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->action:Ljava/lang/String;

    .line 193
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->actionData:Ljava/lang/String;

    .line 194
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->headerTitle:Ljava/lang/String;

    .line 195
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->viewType:Ljava/lang/String;

    .line 196
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->position:I

    .line 197
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->numQuestions:I

    .line 199
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/report/RequestType$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/report/RequestType$1;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 171
    const/4 v0, 0x0

    return v0
.end method

.method public getAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->action:Ljava/lang/String;

    return-object v0
.end method

.method public getActionData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->actionData:Ljava/lang/String;

    return-object v0
.end method

.method public getApiId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->apiId:Ljava/lang/String;

    return-object v0
.end method

.method public getDbId()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->id:I

    return v0
.end method

.method public getHeaderTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->headerTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getNumQuestions()I
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->numQuestions:I

    return v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->position:I

    return v0
.end method

.method public getReport()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getViewType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->viewType:Ljava/lang/String;

    return-object v0
.end method

.method public getWatchArea()Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->watchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    return-object v0
.end method

.method public setAction(Ljava/lang/String;)V
    .locals 0
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->action:Ljava/lang/String;

    .line 149
    return-void
.end method

.method public setActionData(Ljava/lang/String;)V
    .locals 0
    .param p1, "actionData"    # Ljava/lang/String;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->actionData:Ljava/lang/String;

    .line 141
    return-void
.end method

.method public setApiId(Ljava/lang/String;)V
    .locals 0
    .param p1, "apiId"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->apiId:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public setDbId(I)V
    .locals 0
    .param p1, "dbId"    # I

    .prologue
    .line 75
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->id:I

    .line 76
    return-void
.end method

.method public setHeaderTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "headerTitle"    # Ljava/lang/String;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->headerTitle:Ljava/lang/String;

    .line 133
    return-void
.end method

.method public setNumQuestions(I)V
    .locals 0
    .param p1, "numQuestions"    # I

    .prologue
    .line 107
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->numQuestions:I

    .line 108
    return-void
.end method

.method public setPosition(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 99
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->position:I

    .line 100
    return-void
.end method

.method public setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 125
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->title:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setViewType(Ljava/lang/String;)V
    .locals 0
    .param p1, "viewType"    # Ljava/lang/String;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->viewType:Ljava/lang/String;

    .line 157
    return-void
.end method

.method public setWatchArea(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V
    .locals 0
    .param p1, "watchArea"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->watchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 116
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "RequestType{id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", apiId=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->apiId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", title=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", position="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->position:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", numQuestions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->numQuestions:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", headerTitle=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->headerTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", actionData=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->actionData:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", action=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->action:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", viewType=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->viewType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 176
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 177
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->apiId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 178
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 179
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->action:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 180
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->actionData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 181
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->headerTitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->viewType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 183
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->position:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 184
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestType;->numQuestions:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 186
    return-void
.end method
