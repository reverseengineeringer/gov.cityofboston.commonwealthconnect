.class public Lcom/seeclickfix/ma/android/objects/issue/Comment;
.super Ljava/lang/Object;
.source "Comment.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "comments"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Comment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private apiID:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "api_id"
    .end annotation
.end field

.field protected comment:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "text"
    .end annotation
.end field

.field protected commentImagePath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comment_image_path"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "image_url"
    .end annotation
.end field

.field protected commentType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comment_type"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "type"
    .end annotation
.end field

.field protected createdAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "date_created"
    .end annotation
.end field

.field private transient dbID:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "id"
        generatedId = true
    .end annotation
.end field

.field protected email:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "email"
    .end annotation
.end field

.field protected issueId:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "issue_id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "issue_api_id"
    .end annotation
.end field

.field private moderated:Z

.field protected name:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "name"
    .end annotation
.end field

.field private notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

.field protected smallCommentImagePath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "small_comment_image_path"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "image_small_url"
    .end annotation
.end field

.field protected squareCommentImagePath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "square_comment_image_path"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "image_square_url"
    .end annotation
.end field

.field private subscribeEmailNotification:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "send_email"
    .end annotation
.end field

.field protected updatedAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "updated_at"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "date_updated"
    .end annotation
.end field

.field private user:Lcom/seeclickfix/ma/android/objects/user/User;

.field protected videoPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "video_path"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "video_path"
    .end annotation
.end field

.field protected youtubeUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "youtube_url"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "youtube_url"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 124
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Comment$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->subscribeEmailNotification:Z

    .line 119
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->moderated:Z

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 130
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->subscribeEmailNotification:Z

    .line 119
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->moderated:Z

    .line 120
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->apiID:I

    .line 134
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->dbID:I

    .line 135
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->name:Ljava/lang/String;

    .line 136
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->comment:Ljava/lang/String;

    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->email:Ljava/lang/String;

    .line 138
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentType:Ljava/lang/String;

    .line 139
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->createdAt:Ljava/lang/String;

    .line 140
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updatedAt:Ljava/lang/String;

    .line 141
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->issueId:I

    .line 142
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->youtubeUrl:Ljava/lang/String;

    .line 143
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentImagePath:Ljava/lang/String;

    .line 144
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->smallCommentImagePath:Ljava/lang/String;

    .line 145
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->squareCommentImagePath:Ljava/lang/String;

    .line 146
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->subscribeEmailNotification:Z

    .line 147
    return-void

    :cond_0
    move v0, v1

    .line 146
    goto :goto_0
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V
    .locals 1
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "comment"    # Ljava/lang/String;

    .prologue
    .line 159
    const-string/jumbo v0, "Comment"

    invoke-direct {p0, v0, p1, p2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V
    .locals 1
    .param p1, "commentType"    # Ljava/lang/String;
    .param p2, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p3, "comment"    # Ljava/lang/String;

    .prologue
    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->subscribeEmailNotification:Z

    .line 119
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->moderated:Z

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 151
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setCommentType(Ljava/lang/String;)V

    .line 152
    if-eqz p2, :cond_0

    .line 153
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setIssueId(I)V

    .line 155
    :cond_0
    invoke-virtual {p0, p3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setComment(Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method public static commentTypeTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 377
    const-string/jumbo v0, "Comment"

    return-object v0
.end method

.method public static paramsToComment(Lcom/seeclickfix/ma/android/objects/PageParams;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .locals 3
    .param p0, "params"    # Lcom/seeclickfix/ma/android/objects/PageParams;
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 164
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.seeclickfix.actions.NOP"

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    move v0, v1

    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 172
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Nop;

    invoke-direct {v0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Nop;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    :goto_1
    return-object v0

    .line 164
    :sswitch_0
    const-string/jumbo v2, "com.seeclickfix.actions.VOTE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "com.seeclickfix.actions.ADD_WATCHER"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v2, "com.seeclickfix.actions.CHANGE_STATUS"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    .line 166
    :pswitch_0
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Vote;

    invoke-direct {v0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Vote;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    goto :goto_1

    .line 168
    :pswitch_1
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Follow;

    invoke-direct {v0, p1}, Lcom/seeclickfix/ma/android/objects/issue/Follow;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    goto :goto_1

    .line 170
    :pswitch_2
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Transition;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/PageParams;->getTransition()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/seeclickfix/ma/android/objects/issue/Transition;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    goto :goto_1

    .line 164
    :sswitch_data_0
    .sparse-switch
        -0x528f5c0e -> :sswitch_1
        -0x3cd6b2aa -> :sswitch_0
        -0x2ad3558b -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public attachUser(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 1
    .param p1, "user"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    .line 367
    if-eqz p1, :cond_0

    .line 368
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setEmail(Ljava/lang/String;)V

    .line 369
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setName(Ljava/lang/String;)V

    .line 374
    :goto_0
    return-void

    .line 371
    :cond_0
    const-string/jumbo v0, ""

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setEmail(Ljava/lang/String;)V

    .line 372
    const-string/jumbo v0, ""

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setName(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public commentActionTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 381
    const-string/jumbo v0, "com.seeclickfix.actions.COMMENT"

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 338
    const/4 v0, 0x0

    return v0
.end method

.method public executeAction()V
    .locals 3

    .prologue
    .line 432
    sget-object v2, Lcom/seeclickfix/ma/android/MyApplication;->instance:Lcom/seeclickfix/ma/android/MyApplication;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 434
    .local v0, "appContext":Landroid/content/Context;
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->attachUser(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    .line 436
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.seeclickfix.actions.UPLOAD_COMMENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 437
    .local v1, "i":Landroid/content/Intent;
    const-class v2, Lcom/seeclickfix/ma/android/services/CommentUploadService;

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 438
    const-string/jumbo v2, "comment_bundle"

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 439
    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 440
    return-void
.end method

.method public getApiID()I
    .locals 1

    .prologue
    .line 187
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->apiID:I

    return v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->comment:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCommentImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 282
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentType:Ljava/lang/String;

    return-object v0
.end method

.method public getCreatedAt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->createdAt:Ljava/lang/String;

    return-object v0
.end method

.method public getCreatedAtShort()Ljava/lang/String;
    .locals 2

    .prologue
    .line 234
    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->createdAt:Ljava/lang/String;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/date/DateUtil;->formatDateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "shortDate":Ljava/lang/String;
    return-object v0
.end method

.method public getDbID()I
    .locals 1

    .prologue
    .line 177
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->dbID:I

    return v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getIssueDetailsParams(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 416
    new-instance v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 417
    .local v0, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentActionTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 418
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDataParcel(Landroid/os/Parcelable;)V

    .line 420
    return-object v0
.end method

.method public getIssueId()I
    .locals 1

    .prologue
    .line 257
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->issueId:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 457
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    return-object v0
.end method

.method public getSmallCommentImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->smallCommentImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getSquareCommentImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 302
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->squareCommentImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getTypedFile(Ljava/lang/String;)Lretrofit/mime/TypedFile;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 397
    const/4 v1, 0x0

    .line 399
    .local v1, "typedFile":Lretrofit/mime/TypedFile;
    if-eqz p1, :cond_0

    .line 400
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 401
    .local v0, "file":Ljava/io/File;
    new-instance v1, Lretrofit/mime/TypedFile;

    .end local v1    # "typedFile":Lretrofit/mime/TypedFile;
    new-instance v2, Lorg/apache/http/entity/mime/content/FileBody;

    invoke-direct {v2, v0}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Lorg/apache/http/entity/mime/content/FileBody;->getMimeType()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lretrofit/mime/TypedFile;-><init>(Ljava/lang/String;Ljava/io/File;)V

    .line 404
    .end local v0    # "file":Ljava/io/File;
    .restart local v1    # "typedFile":Lretrofit/mime/TypedFile;
    :cond_0
    return-object v1
.end method

.method public getUpdatedAt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updatedAt:Ljava/lang/String;

    return-object v0
.end method

.method public getUser()Lcom/seeclickfix/ma/android/objects/user/User;
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    return-object v0
.end method

.method public getVideoPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->videoPath:Ljava/lang/String;

    return-object v0
.end method

.method public getYoutubeUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->youtubeUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAssociatedWith(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 424
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->issueId:I

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->comment:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isModerated()Z
    .locals 1

    .prologue
    .line 443
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->moderated:Z

    return v0
.end method

.method public isSubscribeEmailNotification()Z
    .locals 1

    .prologue
    .line 319
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->subscribeEmailNotification:Z

    return v0
.end method

.method public partMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lretrofit/mime/TypedOutput;",
            ">;"
        }
    .end annotation

    .prologue
    .line 265
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 266
    .local v0, "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lretrofit/mime/TypedOutput;>;"
    const-string/jumbo v1, "image"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->typedImageFile()Lretrofit/mime/TypedFile;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    const-string/jumbo v1, "video"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->typedVideoFile()Lretrofit/mime/TypedFile;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    const-string/jumbo v1, "youtube_url"

    new-instance v2, Lretrofit/mime/TypedString;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getYoutubeUrl()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lretrofit/mime/TypedString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    const-string/jumbo v1, "comment"

    new-instance v2, Lretrofit/mime/TypedString;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getComment()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lretrofit/mime/TypedString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    return-object v0
.end method

.method public setApiID(I)V
    .locals 0
    .param p1, "apiID"    # I

    .prologue
    .line 192
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->apiID:I

    .line 193
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->comment:Ljava/lang/String;

    .line 210
    return-void
.end method

.method public setCommentImagePath(Ljava/lang/String;)V
    .locals 1
    .param p1, "commentImagePath"    # Ljava/lang/String;

    .prologue
    .line 286
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentImagePath:Ljava/lang/String;

    .line 288
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getComment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 289
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setComment(Ljava/lang/String;)V

    .line 291
    :cond_0
    return-void
.end method

.method public setCommentType(Ljava/lang/String;)V
    .locals 0
    .param p1, "commentType"    # Ljava/lang/String;

    .prologue
    .line 226
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentType:Ljava/lang/String;

    .line 227
    return-void
.end method

.method public setCreatedAt(Ljava/lang/String;)V
    .locals 0
    .param p1, "createdAt"    # Ljava/lang/String;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->createdAt:Ljava/lang/String;

    .line 246
    return-void
.end method

.method public setCreatedAtMillis(J)V
    .locals 3
    .param p1, "milliseconds"    # J

    .prologue
    .line 240
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/date/DateUtil;->formatMilliDateToISO(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "isoFormatted":Ljava/lang/String;
    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->createdAt:Ljava/lang/String;

    .line 242
    return-void
.end method

.method public setDbID(I)V
    .locals 0
    .param p1, "dbID"    # I

    .prologue
    .line 182
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->dbID:I

    .line 183
    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 0
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->email:Ljava/lang/String;

    .line 219
    return-void
.end method

.method public setIssueId(I)V
    .locals 0
    .param p1, "issueId"    # I

    .prologue
    .line 261
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->issueId:I

    .line 262
    return-void
.end method

.method public setModerated(Z)V
    .locals 0
    .param p1, "moderated"    # Z

    .prologue
    .line 447
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->moderated:Z

    .line 448
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 201
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->name:Ljava/lang/String;

    .line 202
    return-void
.end method

.method public setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V
    .locals 0
    .param p1, "notice"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .prologue
    .line 461
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 462
    return-void
.end method

.method public setSmallCommentImagePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "smallCommentImagePath"    # Ljava/lang/String;

    .prologue
    .line 298
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->smallCommentImagePath:Ljava/lang/String;

    .line 299
    return-void
.end method

.method public setSquareCommentImagePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "squareCommentImagePath"    # Ljava/lang/String;

    .prologue
    .line 306
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->squareCommentImagePath:Ljava/lang/String;

    .line 307
    return-void
.end method

.method public setSubscribeEmailNotification(Z)V
    .locals 0
    .param p1, "subscribeEmailNotification"    # Z

    .prologue
    .line 324
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->subscribeEmailNotification:Z

    .line 325
    return-void
.end method

.method public setUpdatedAt(Ljava/lang/String;)V
    .locals 0
    .param p1, "updatedAt"    # Ljava/lang/String;

    .prologue
    .line 253
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updatedAt:Ljava/lang/String;

    .line 254
    return-void
.end method

.method public setUser(Lcom/seeclickfix/ma/android/objects/user/User;)V
    .locals 0
    .param p1, "user"    # Lcom/seeclickfix/ma/android/objects/user/User;

    .prologue
    .line 333
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    .line 334
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "videoPath"    # Ljava/lang/String;

    .prologue
    .line 314
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->videoPath:Ljava/lang/String;

    .line 315
    return-void
.end method

.method public setYoutubeUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "youtubeUrl"    # Ljava/lang/String;

    .prologue
    .line 278
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->youtubeUrl:Ljava/lang/String;

    .line 279
    return-void
.end method

.method public synch(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 465
    .local p1, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 466
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getReceipt()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateFrom(Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 468
    :cond_0
    return-void
.end method

.method public toEvent(Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;"
        }
    .end annotation

    .prologue
    .line 408
    .local p1, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Comment;Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 361
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Comment [dbID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->dbID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", apiID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->apiID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", issueId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->issueId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", comment="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->comment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", email="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->email:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", commentType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", createdAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->createdAt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", updatedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updatedAt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", youtubeUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->youtubeUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", commentImagePath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentImagePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", smallCommentImagePath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->smallCommentImagePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", squareCommentImagePath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->squareCommentImagePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", videoPath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->videoPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", subscribeEmailNotification="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->subscribeEmailNotification:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", user="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public typedImageFile()Lretrofit/mime/TypedFile;
    .locals 1

    .prologue
    .line 389
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCommentImagePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getTypedFile(Ljava/lang/String;)Lretrofit/mime/TypedFile;

    move-result-object v0

    return-object v0
.end method

.method public typedVideoFile()Lretrofit/mime/TypedFile;
    .locals 1

    .prologue
    .line 393
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getVideoPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getTypedFile(Ljava/lang/String;)Lretrofit/mime/TypedFile;

    move-result-object v0

    return-object v0
.end method

.method public updateCard(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "card"    # Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 412
    invoke-interface {p1, p0, p2}, Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;->updateComment(Lcom/seeclickfix/ma/android/objects/issue/Comment;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 413
    return-void
.end method

.method public updateFrom(Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 1
    .param p1, "issueActionReceipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 451
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;->isModerated()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 452
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setModerated(Z)V

    .line 454
    :cond_0
    return-void
.end method

.method public updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 385
    invoke-virtual {p1, p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updateComment(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    .line 386
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 343
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->apiID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 344
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->dbID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 345
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 346
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->comment:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 347
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->email:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 348
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 349
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->createdAt:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 350
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updatedAt:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 351
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->issueId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 352
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->youtubeUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 353
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->commentImagePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 354
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->smallCommentImagePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 355
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->squareCommentImagePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 356
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Comment;->subscribeEmailNotification:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 357
    return-void

    .line 356
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
