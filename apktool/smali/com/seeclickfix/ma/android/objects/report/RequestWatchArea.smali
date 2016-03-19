.class public Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
.super Ljava/lang/Object;
.source "RequestWatchArea.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "request_watch_areas"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation
.end field

.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "RequestWatchArea"


# instance fields
.field private id:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "id"
        id = true
    .end annotation
.end field

.field private includesPoint:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "includes_point"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "includes_point"
    .end annotation
.end field

.field private transient isDefault:Z

.field private transient isFromDraft:Z

.field private report:Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        canBeNull = true
        foreign = true
    .end annotation
.end field

.field private requestTypes:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "request_types"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;"
        }
    .end annotation
.end field

.field private requestTypesDB:Lcom/j256/ormlite/dao/ForeignCollection;
    .annotation runtime Lcom/j256/ormlite/field/ForeignCollectionField;
        columnName = "request_types_db"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;"
        }
    .end annotation
.end field

.field private transient selectedPosition:I

.field private title:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "title"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 117
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->includesPoint:Z

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypes:Ljava/util/List;

    .line 53
    iput v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->selectedPosition:I

    .line 55
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isFromDraft:Z

    .line 57
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isDefault:Z

    .line 61
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->includesPoint:Z

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypes:Ljava/util/List;

    .line 53
    iput v2, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->selectedPosition:I

    .line 55
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isFromDraft:Z

    .line 57
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isDefault:Z

    .line 142
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->id:I

    .line 144
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->title:Ljava/lang/String;

    .line 145
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setSelectedPosition(I)V

    .line 146
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->includesPoint:Z

    .line 147
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setIsFromDraft(Z)V

    .line 148
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypes:Ljava/util/List;

    sget-object v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 149
    return-void

    :cond_0
    move v0, v2

    .line 146
    goto :goto_0

    :cond_1
    move v1, v2

    .line 147
    goto :goto_1
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea$1;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 114
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 161
    if-ne p0, p1, :cond_1

    .line 166
    :cond_0
    :goto_0
    return v1

    .line 162
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    goto :goto_0

    .line 163
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

    .line 164
    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 165
    .local v0, "other":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    iget v3, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->id:I

    iget v4, v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->id:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->id:I

    return v0
.end method

.method public getIncludesPoint()Z
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->includesPoint:Z

    return v0
.end method

.method public getIsFromDraft()Z
    .locals 1

    .prologue
    .line 178
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isFromDraft:Z

    return v0
.end method

.method public getReport()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-object v0
.end method

.method public getRequestTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypes:Ljava/util/List;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypes:Ljava/util/List;

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypes:Ljava/util/List;

    return-object v0
.end method

.method public getRequestTypesDb()Lcom/j256/ormlite/dao/ForeignCollection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypesDB:Lcom/j256/ormlite/dao/ForeignCollection;

    return-object v0
.end method

.method public getSelectedPosition()I
    .locals 1

    .prologue
    .line 170
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->selectedPosition:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->title:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 153
    const/16 v0, 0x1f

    .line 154
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 155
    .local v1, "result":I
    iget v2, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->id:I

    add-int/lit8 v1, v2, 0x1f

    .line 156
    return v1
.end method

.method public isDefault()Z
    .locals 1

    .prologue
    .line 210
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isDefault:Z

    return v0
.end method

.method public setDefault(Z)V
    .locals 0
    .param p1, "isDefault"    # Z

    .prologue
    .line 215
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isDefault:Z

    .line 216
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 69
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->id:I

    .line 70
    return-void
.end method

.method public setIncludesPoint(Z)V
    .locals 0
    .param p1, "includesPoint"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->includesPoint:Z

    .line 93
    return-void
.end method

.method public setIsFromDraft(Z)V
    .locals 0
    .param p1, "isFromDraft"    # Z

    .prologue
    .line 182
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isFromDraft:Z

    .line 183
    return-void
.end method

.method public setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 192
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 193
    return-void
.end method

.method public setRequestTypes(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "requestType":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypes:Ljava/util/List;

    .line 109
    return-void
.end method

.method public setRequestTypesDB(Lcom/j256/ormlite/dao/ForeignCollection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 205
    .local p1, "requestTypesDB":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypesDB:Lcom/j256/ormlite/dao/ForeignCollection;

    .line 206
    return-void
.end method

.method public setSelectedPosition(I)V
    .locals 0
    .param p1, "selectedPosition"    # I

    .prologue
    .line 174
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->selectedPosition:I

    .line 175
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->title:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "RequestWatchArea [id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", title="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", includesPoint="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->includesPoint:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", requestTypesDB="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypesDB:Lcom/j256/ormlite/dao/ForeignCollection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", selectedPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->selectedPosition:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", queueSelection="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isFromDraft:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

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

    .line 131
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 133
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getSelectedPosition()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 135
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->includesPoint:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 136
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getIsFromDraft()Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 137
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->requestTypes:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 139
    return-void

    :cond_0
    move v0, v2

    .line 135
    goto :goto_0

    :cond_1
    move v1, v2

    .line 136
    goto :goto_1
.end method
