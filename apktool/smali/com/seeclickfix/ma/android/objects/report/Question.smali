.class public Lcom/seeclickfix/ma/android/objects/report/Question;
.super Ljava/lang/Object;
.source "Question.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "questions"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;"
        }
    .end annotation
.end field

.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "Question"


# instance fields
.field private api_id:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "api_id"
    .end annotation
.end field

.field private createdAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "date_created"
    .end annotation
.end field

.field private transient db_id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "id"
        generatedId = true
    .end annotation
.end field

.field private displayAnswer:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "display_answer"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "displayed_answer"
    .end annotation
.end field

.field private position:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "position"
    .end annotation
.end field

.field private primaryKey:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "primary_key"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "primary_api_key"
    .end annotation
.end field

.field private questionText:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "question"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "question_text"
    .end annotation
.end field

.field private questionType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "question_type"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "type"
    .end annotation
.end field

.field private transient report:Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
    .end annotation
.end field

.field private required:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "required_response"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "required"
    .end annotation
.end field

.field private selectValues:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "select_values"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "selectable_values"
    .end annotation
.end field

.field private transient selectedAnswer:Lcom/seeclickfix/ma/android/objects/report/Answer;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
    .end annotation
.end field

.field private selectedValues:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "selected_values"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "default_vaules"
    .end annotation
.end field

.field private updatedAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "updated_at"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "date_updated"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 348
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Question$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/Question$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/report/Question;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->db_id:I

    .line 329
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->api_id:I

    .line 330
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->position:I

    .line 331
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionText:Ljava/lang/String;

    .line 332
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionType:Ljava/lang/String;

    .line 333
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->displayAnswer:Z

    .line 334
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->required:Z

    .line 335
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectValues:Ljava/lang/String;

    .line 336
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedValues:Ljava/lang/String;

    .line 337
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->updatedAt:Ljava/lang/String;

    .line 338
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->createdAt:Ljava/lang/String;

    .line 339
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->primaryKey:Ljava/lang/String;

    .line 340
    const-class v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedAnswer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 341
    return-void

    :cond_0
    move v0, v2

    .line 333
    goto :goto_0

    :cond_1
    move v1, v2

    .line 334
    goto :goto_1
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/report/Question$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/report/Question$1;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/Question;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 344
    const/4 v0, 0x0

    return v0
.end method

.method public getAnswerAsString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 300
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v0

    .line 302
    .local v0, "answer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    if-nez v0, :cond_0

    const-string/jumbo v1, ""

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getAnswer()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getAnswerList()Ljava/util/List;
    .locals 8
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
    .line 117
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Question;->getValPairArray()[Ljava/lang/String;

    move-result-object v6

    .line 118
    .local v6, "valPairArray":[Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .local v1, "answersArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Answer;>;"
    move-object v2, v6

    .local v2, "arr$":[Ljava/lang/String;
    array-length v4, v2

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v2, v3

    .line 123
    .local v5, "valPair":Ljava/lang/String;
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;-><init>()V

    .line 125
    .local v0, "answer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    invoke-virtual {v0, v5}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setNameValueString(Ljava/lang/String;)V

    .line 126
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Question;->getPrimaryKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setPrimaryKey(Ljava/lang/String;)V

    .line 127
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 130
    .end local v0    # "answer":Lcom/seeclickfix/ma/android/objects/report/Answer;
    .end local v5    # "valPair":Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public getApiId()I
    .locals 1

    .prologue
    .line 169
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->api_id:I

    return v0
.end method

.method public getCreatedAt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->createdAt:Ljava/lang/String;

    return-object v0
.end method

.method public getDbId()I
    .locals 1

    .prologue
    .line 151
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->db_id:I

    return v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 181
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->position:I

    return v0
.end method

.method public getPrimaryKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 288
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->primaryKey:Ljava/lang/String;

    return-object v0
.end method

.method public getQuestionText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionText:Ljava/lang/String;

    return-object v0
.end method

.method public getQuestionType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionType:Ljava/lang/String;

    return-object v0
.end method

.method public getReport()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 1

    .prologue
    .line 386
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-object v0
.end method

.method public getSelectValues()Ljava/lang/String;
    .locals 1

    .prologue
    .line 261
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectValues:Ljava/lang/String;

    return-object v0
.end method

.method public getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;
    .locals 1

    .prologue
    .line 296
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedAnswer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    return-object v0
.end method

.method public getSelectedValues()Ljava/lang/String;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedValues:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdatedAt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->updatedAt:Ljava/lang/String;

    return-object v0
.end method

.method public getValPairArray()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 143
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectValues()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "\\|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isMultiValue()Z
    .locals 2

    .prologue
    .line 231
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionType()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "multivaluelist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isReportable()Z
    .locals 2

    .prologue
    .line 227
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionType()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "note"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRequired()Z
    .locals 1

    .prologue
    .line 219
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->required:Z

    return v0
.end method

.method public setApiId(I)V
    .locals 0
    .param p1, "apiId"    # I

    .prologue
    .line 177
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->api_id:I

    .line 178
    return-void
.end method

.method public setCreatedAt(Ljava/lang/String;)V
    .locals 0
    .param p1, "createdAt"    # Ljava/lang/String;

    .prologue
    .line 284
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->createdAt:Ljava/lang/String;

    .line 285
    return-void
.end method

.method public setDbId(I)V
    .locals 0
    .param p1, "dbid"    # I

    .prologue
    .line 161
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->db_id:I

    .line 162
    return-void
.end method

.method public setDisplayAnswer(Z)V
    .locals 0
    .param p1, "displayAnswer"    # Z

    .prologue
    .line 215
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->displayAnswer:Z

    .line 216
    return-void
.end method

.method public setPosition(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 185
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->position:I

    .line 186
    return-void
.end method

.method public setPrimaryKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "primaryKey"    # Ljava/lang/String;

    .prologue
    .line 292
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->primaryKey:Ljava/lang/String;

    .line 293
    return-void
.end method

.method public setQuestionText(Ljava/lang/String;)V
    .locals 0
    .param p1, "question"    # Ljava/lang/String;

    .prologue
    .line 199
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionText:Ljava/lang/String;

    .line 200
    return-void
.end method

.method public setQuestionType(Ljava/lang/String;)V
    .locals 0
    .param p1, "questionType"    # Ljava/lang/String;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionType:Ljava/lang/String;

    .line 208
    return-void
.end method

.method public setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 390
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 391
    return-void
.end method

.method public setRequired(Z)V
    .locals 0
    .param p1, "required"    # Z

    .prologue
    .line 223
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->required:Z

    .line 224
    return-void
.end method

.method public setSelectValues(Ljava/lang/String;)V
    .locals 0
    .param p1, "selectValues"    # Ljava/lang/String;

    .prologue
    .line 268
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectValues:Ljava/lang/String;

    .line 269
    return-void
.end method

.method public setSelectedAnswer(Lcom/seeclickfix/ma/android/objects/report/Answer;)V
    .locals 0
    .param p1, "selectedAnswer"    # Lcom/seeclickfix/ma/android/objects/report/Answer;

    .prologue
    .line 306
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedAnswer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    .line 307
    return-void
.end method

.method public setSelectedValues(Ljava/lang/String;)V
    .locals 0
    .param p1, "selectedValues"    # Ljava/lang/String;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedValues:Ljava/lang/String;

    .line 253
    return-void
.end method

.method public setUpdatedAt(Ljava/lang/String;)V
    .locals 0
    .param p1, "updatedAt"    # Ljava/lang/String;

    .prologue
    .line 276
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->updatedAt:Ljava/lang/String;

    .line 277
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 380
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Question [db_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->db_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", api_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->api_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", position="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->position:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", questionText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", questionType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", displayAnswer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->displayAnswer:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", required="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->required:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", selectValues="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectValues:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", selectedValues="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedValues:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", updatedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->updatedAt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", createdAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->createdAt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", primaryKey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->primaryKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", selectedAnswer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedAnswer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public willDisplayAnswer()Z
    .locals 1

    .prologue
    .line 211
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->displayAnswer:Z

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 362
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->db_id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 363
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->api_id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 364
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->position:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 365
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 366
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->questionType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 367
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->displayAnswer:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 368
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->required:Z

    if-eqz v0, :cond_1

    :goto_1
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 369
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectValues:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 370
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedValues:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 371
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->updatedAt:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 372
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->createdAt:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 373
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->primaryKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 374
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/Question;->selectedAnswer:Lcom/seeclickfix/ma/android/objects/report/Answer;

    invoke-virtual {p1, v0, v2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 376
    return-void

    :cond_0
    move v0, v2

    .line 367
    goto :goto_0

    :cond_1
    move v1, v2

    .line 368
    goto :goto_1
.end method
