.class public Lcom/seeclickfix/ma/android/objects/report/Answer;
.super Ljava/lang/Object;
.source "Answer.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "answers"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Answer;",
            ">;"
        }
    .end annotation
.end field

.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "Answer"


# instance fields
.field private answer:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient date:J
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient db_id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "id"
        generatedId = true
    .end annotation
.end field

.field private displayText:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private primaryKey:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "request_type_question_primary_key"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient report:Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
    .end annotation
.end field

.field private transient selectedPosition:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient time:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 129
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Answer$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/report/Answer;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->db_id:I

    .line 114
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->answer:Ljava/lang/String;

    .line 115
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->displayText:Ljava/lang/String;

    .line 116
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->primaryKey:Ljava/lang/String;

    .line 117
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->date:J

    .line 118
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->time:Ljava/lang/String;

    .line 119
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->selectedPosition:I

    .line 122
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/report/Answer$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/report/Answer$1;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/Answer;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    return v0
.end method

.method public getAnswer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->answer:Ljava/lang/String;

    return-object v0
.end method

.method public getDate()J
    .locals 2

    .prologue
    .line 213
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->date:J

    return-wide v0
.end method

.method public getDbId()I
    .locals 1

    .prologue
    .line 233
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->db_id:I

    return v0
.end method

.method public getDisplayText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->displayText:Ljava/lang/String;

    return-object v0
.end method

.method public getPrimaryKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->primaryKey:Ljava/lang/String;

    return-object v0
.end method

.method public getReport()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-object v0
.end method

.method public getSelectedPosition()I
    .locals 1

    .prologue
    .line 223
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->selectedPosition:I

    return v0
.end method

.method public getTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->time:Ljava/lang/String;

    return-object v0
.end method

.method public setAnswer(Ljava/lang/String;)V
    .locals 0
    .param p1, "answer"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->answer:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public setDate(J)V
    .locals 1
    .param p1, "date"    # J

    .prologue
    .line 218
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->date:J

    .line 219
    return-void
.end method

.method public setDbId(I)V
    .locals 0
    .param p1, "db_id"    # I

    .prologue
    .line 238
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->db_id:I

    .line 239
    return-void
.end method

.method public setDisplayText(Ljava/lang/String;)V
    .locals 0
    .param p1, "displayText"    # Ljava/lang/String;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->displayText:Ljava/lang/String;

    .line 160
    return-void
.end method

.method public setNameValueString(Ljava/lang/String;)V
    .locals 4
    .param p1, "valName"    # Ljava/lang/String;

    .prologue
    .line 168
    new-instance v0, Ljava/lang/String;

    const-string/jumbo v2, "="

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 169
    .local v0, "name":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "="

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 174
    .local v1, "val":Ljava/lang/String;
    iput-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->answer:Ljava/lang/String;

    .line 175
    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->displayText:Ljava/lang/String;

    .line 176
    return-void
.end method

.method public setPrimaryKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "primaryKey"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->primaryKey:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 248
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 249
    return-void
.end method

.method public setSelectedPosition(I)V
    .locals 0
    .param p1, "selectedPosition"    # I

    .prologue
    .line 228
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->selectedPosition:I

    .line 229
    return-void
.end method

.method public setTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->time:Ljava/lang/String;

    .line 209
    return-void
.end method

.method public toLogString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Answer [answer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->answer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", displayText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->displayText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", time="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->time:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", date="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->date:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", primaryKey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->primaryKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->displayText:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 141
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->db_id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 142
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->answer:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 143
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->displayText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 144
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->primaryKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 145
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->date:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 146
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->time:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 147
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Answer;->selectedPosition:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 150
    return-void
.end method
