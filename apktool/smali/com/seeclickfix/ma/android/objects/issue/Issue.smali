.class public Lcom/seeclickfix/ma/android/objects/issue/Issue;
.super Ljava/lang/Object;
.source "Issue.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "issues"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;"
        }
    .end annotation
.end field

.field private static final D:Z = false

.field private static final TAG:Ljava/lang/String; = "Issue"


# instance fields
.field private address:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "address"
    .end annotation
.end field

.field private anonymize_reporter:Z
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "anonymize_reporter"
    .end annotation
.end field

.field private bitly:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "bitly"
    .end annotation
.end field

.field private categoryIcon:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "category_icon"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "category_icon"
    .end annotation
.end field

.field private commentCountExcludingActivity:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comment_count_excluding_activity"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "comment_count_excluding_activity"
    .end annotation
.end field

.field private createdAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "created_at"
    .end annotation
.end field

.field private createdAtEpoch:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at_epoch"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "created_at_epoch"
    .end annotation
.end field

.field private description:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "description"
    .end annotation
.end field

.field private following:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "following"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "following"
    .end annotation
.end field

.field private iconSquare:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "square_image"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "icon_square"
    .end annotation
.end field

.field private id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        allowGeneratedIdInsert = true
        generatedId = true
    .end annotation
.end field

.field private integrationIssues:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "integration_issues"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private lat:D
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "lat"
    .end annotation
.end field

.field private lng:D
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "lng"
    .end annotation
.end field

.field private localImagePath:Ljava/lang/String;

.field private minutesSinceCreated:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "minutes_since_created"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "minutes_since_created"
    .end annotation
.end field

.field private numComments:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "num_comments"
    .end annotation
.end field

.field private photoLargeUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "public_filename"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "photo_large_url"
    .end annotation
.end field

.field private photoSmallUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "small_public_filename"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "photo_small_url"
    .end annotation
.end field

.field private photoSquareUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "square_public_filename"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "photo_square_url"
    .end annotation
.end field

.field private rating:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "rating"
    .end annotation
.end field

.field private reporterDisplay:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "reporter_display"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "reporter_display"
    .end annotation
.end field

.field private transient scrollPosition:I

.field private slug:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "slug"
    .end annotation
.end field

.field private status:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "status"
    .end annotation
.end field

.field private summary:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "summary"
    .end annotation
.end field

.field private type:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "type"
    .end annotation
.end field

.field private updatedAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "updated_at"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "updated_at"
    .end annotation
.end field

.field private updatedAtRaw:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "updated_at_raw"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "updated_at_raw"
    .end annotation
.end field

.field private userId:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "user_id"
    .end annotation
.end field

.field private votedBefore:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "voted_before"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "voted_before"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 406
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Issue$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->rating:I

    .line 195
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 458
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->rating:I

    .line 459
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    .line 460
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->scrollPosition:I

    .line 461
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->userId:I

    .line 462
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->summary:Ljava/lang/String;

    .line 463
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->type:Ljava/lang/String;

    .line 464
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->description:Ljava/lang/String;

    .line 465
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAt:Ljava/lang/String;

    .line 466
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAtRaw:Ljava/lang/String;

    .line 467
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAt:Ljava/lang/String;

    .line 468
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v4

    iput-wide v4, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lat:D

    .line 469
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v4

    iput-wide v4, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lng:D

    .line 470
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->anonymize_reporter:Z

    .line 471
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->rating:I

    .line 472
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->bitly:Ljava/lang/String;

    .line 473
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->slug:Ljava/lang/String;

    .line 474
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->minutesSinceCreated:I

    .line 475
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->address:Ljava/lang/String;

    .line 476
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->status:Ljava/lang/String;

    .line 477
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->numComments:I

    .line 478
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->reporterDisplay:Ljava/lang/String;

    .line 479
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->commentCountExcludingActivity:I

    .line 480
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->votedBefore:Z

    .line 481
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    :goto_2
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->following:Z

    .line 482
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->iconSquare:Ljava/lang/String;

    .line 483
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoLargeUrl:Ljava/lang/String;

    .line 484
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->localImagePath:Ljava/lang/String;

    .line 485
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSmallUrl:Ljava/lang/String;

    .line 486
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSquareUrl:Ljava/lang/String;

    .line 487
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->categoryIcon:Ljava/lang/String;

    .line 488
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAtEpoch:J

    .line 489
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->integrationIssues:Ljava/util/List;

    const-class v1, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 492
    return-void

    :cond_0
    move v0, v2

    .line 470
    goto :goto_0

    :cond_1
    move v0, v2

    .line 480
    goto :goto_1

    :cond_2
    move v1, v2

    .line 481
    goto :goto_2
.end method

.method public static fromIssue2(Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;)Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .locals 11
    .param p0, "source"    # Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;

    .prologue
    const/4 v10, 0x0

    .line 581
    new-instance v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;-><init>()V

    .line 583
    .local v2, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getId()I

    move-result v6

    iput v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    .line 584
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getReporter()Lcom/seeclickfix/ma/android/objects/apiv2/User;

    move-result-object v6

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/apiv2/User;->getId()I

    move-result v6

    iput v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->userId:I

    .line 585
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getSummary()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->summary:Ljava/lang/String;

    .line 586
    const-string/jumbo v6, ""

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->type:Ljava/lang/String;

    .line 587
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getDescription()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->description:Ljava/lang/String;

    .line 588
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getUpdatedAt()Ljava/util/Date;

    move-result-object v6

    invoke-static {v6}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->toISO8601(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAtRaw:Ljava/lang/String;

    .line 589
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getUpdatedAtLocal()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAt:Ljava/lang/String;

    .line 590
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getCreatedAt()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    iput-wide v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAtEpoch:J

    .line 591
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    iget-wide v8, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAtEpoch:J

    sub-long/2addr v6, v8

    long-to-int v6, v6

    div-int/lit16 v6, v6, 0x3e8

    div-int/lit8 v6, v6, 0x3c

    iput v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->minutesSinceCreated:I

    .line 592
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getCreatedAtLocal()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAt:Ljava/lang/String;

    .line 593
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getLat()D

    move-result-wide v6

    iput-wide v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lat:D

    .line 594
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getLng()D

    move-result-wide v6

    iput-wide v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lng:D

    .line 595
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getAnonymizeReporter()Z

    move-result v6

    iput-boolean v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->anonymize_reporter:Z

    .line 596
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getRating()I

    move-result v6

    iput v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->rating:I

    .line 597
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getShortenedUrl()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->bitly:Ljava/lang/String;

    .line 598
    const-string/jumbo v6, ""

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->slug:Ljava/lang/String;

    .line 599
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getAddress()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->address:Ljava/lang/String;

    .line 600
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getStatus()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->status:Ljava/lang/String;

    .line 601
    const/4 v6, 0x0

    iput v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->numComments:I

    .line 602
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getReporter()Lcom/seeclickfix/ma/android/objects/apiv2/User;

    move-result-object v6

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/apiv2/User;->getName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->reporterDisplay:Ljava/lang/String;

    .line 603
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getCommentsCount()I

    move-result v6

    iput v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->commentCountExcludingActivity:I

    .line 605
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getUserRelationships()Ljava/util/Map;

    move-result-object v3

    .line 606
    .local v3, "relationships":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Boolean;>;"
    if-eqz v3, :cond_0

    .line 607
    const-string/jumbo v6, "voted"

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-static {v6}, Lorg/apache/commons/lang3/BooleanUtils;->isFalse(Ljava/lang/Boolean;)Z

    move-result v6

    iput-boolean v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->votedBefore:Z

    .line 608
    const-string/jumbo v6, "following"

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-static {v6}, Lorg/apache/commons/lang3/BooleanUtils;->isFalse(Ljava/lang/Boolean;)Z

    move-result v6

    iput-boolean v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->following:Z

    .line 611
    :cond_0
    iput-object v10, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->iconSquare:Ljava/lang/String;

    .line 612
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getMedia()Ljava/util/Map;

    move-result-object v6

    const-string/jumbo v7, "image_small"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSmallUrl:Ljava/lang/String;

    .line 613
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getMedia()Ljava/util/Map;

    move-result-object v6

    const-string/jumbo v7, "image_full"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoLargeUrl:Ljava/lang/String;

    .line 614
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getMedia()Ljava/util/Map;

    move-result-object v6

    const-string/jumbo v7, "image_square_100x100"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSquareUrl:Ljava/lang/String;

    .line 615
    iput-object v10, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->categoryIcon:Ljava/lang/String;

    .line 617
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getRemoteIntegrations()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 619
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 620
    .local v1, "ii":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getRemoteIntegrations()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;

    .line 621
    .local v5, "ri2":Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 622
    .local v4, "ri":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;->getRemoteId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 623
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 625
    .end local v4    # "ri":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "ri2":Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;
    :cond_1
    iput-object v1, v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;->integrationIssues:Ljava/util/List;

    .line 628
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "ii":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_2
    return-object v2
.end method


# virtual methods
.method public create(Landroid/content/Context;)Z
    .locals 3
    .param p1, "appContext"    # Landroid/content/Context;

    .prologue
    .line 565
    const/4 v1, 0x0

    .line 566
    .local v1, "result":Z
    invoke-static {p1}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getIssueDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 569
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/Integer;>;"
    :try_start_0
    invoke-interface {v0, p0}, Lcom/j256/ormlite/dao/Dao;->create(Ljava/lang/Object;)I

    .line 570
    invoke-interface {v0, p0}, Lcom/j256/ormlite/dao/Dao;->refresh(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 571
    const/4 v1, 0x1

    .line 577
    :goto_0
    return v1

    .line 572
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 420
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 523
    if-ne p0, p1, :cond_1

    .line 528
    :cond_0
    :goto_0
    return v1

    .line 524
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    goto :goto_0

    .line 525
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

    .line 526
    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 527
    .local v0, "other":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget v3, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    iget v4, v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 306
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getAnonymizeReporter()Z
    .locals 1

    .prologue
    .line 277
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->anonymize_reporter:Z

    return v0
.end method

.method public getBitly()Ljava/lang/String;
    .locals 1

    .prologue
    .line 290
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->bitly:Ljava/lang/String;

    return-object v0
.end method

.method public getCategoryIcon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 540
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->categoryIcon:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentCountExcludingActivity()I
    .locals 1

    .prologue
    .line 342
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->commentCountExcludingActivity:I

    return v0
.end method

.method public getCreatedAt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAt:Ljava/lang/String;

    return-object v0
.end method

.method public getCreatedAtEpoch()J
    .locals 2

    .prologue
    .line 398
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAtEpoch:J

    return-wide v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getIconSquare()Ljava/lang/String;
    .locals 1

    .prologue
    .line 366
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->iconSquare:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 198
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    return v0
.end method

.method public getIntegrationIssues()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 557
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->integrationIssues:Ljava/util/List;

    return-object v0
.end method

.method public getLat()D
    .locals 2

    .prologue
    .line 262
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lat:D

    return-wide v0
.end method

.method public getLng()D
    .locals 2

    .prologue
    .line 270
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lng:D

    return-wide v0
.end method

.method public getLocalImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 548
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->localImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getMinutesSinceCreated()I
    .locals 1

    .prologue
    .line 298
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->minutesSinceCreated:I

    return v0
.end method

.method public getNumComments()I
    .locals 1

    .prologue
    .line 326
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->numComments:I

    return v0
.end method

.method public getPhotoLargeUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 374
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoLargeUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getPhotoSmallUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 382
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSmallUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getPhotoSquareUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 390
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSquareUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getRating()I
    .locals 1

    .prologue
    .line 282
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->rating:I

    return v0
.end method

.method public getReporterDisplay()Ljava/lang/String;
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->reporterDisplay:Ljava/lang/String;

    return-object v0
.end method

.method public getScrollPosition()I
    .locals 1

    .prologue
    .line 532
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->scrollPosition:I

    return v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->status:Ljava/lang/String;

    return-object v0
.end method

.method public getSummary()Ljava/lang/String;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->summary:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdatedAt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAt:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdatedAtRaw()Ljava/lang/String;
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAtRaw:Ljava/lang/String;

    return-object v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 206
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->userId:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 510
    const/16 v0, 0x1f

    .line 511
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 512
    .local v1, "result":I
    iget v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    add-int/lit8 v1, v2, 0x1f

    .line 513
    return v1
.end method

.method public isClosedOrArchived()Z
    .locals 2

    .prologue
    .line 318
    const-string/jumbo v0, "Closed"

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->status:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Archived"

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->status:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFollowing()Z
    .locals 1

    .prologue
    .line 358
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->following:Z

    return v0
.end method

.method public isVotedBefore()Z
    .locals 1

    .prologue
    .line 350
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->votedBefore:Z

    return v0
.end method

.method public setAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->address:Ljava/lang/String;

    .line 311
    return-void
.end method

.method public setAnonymizeReporter(Z)V
    .locals 0
    .param p1, "anonymize_reporter"    # Z

    .prologue
    .line 279
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->anonymize_reporter:Z

    return-void
.end method

.method public setBitly(Ljava/lang/String;)V
    .locals 0
    .param p1, "bitly"    # Ljava/lang/String;

    .prologue
    .line 294
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->bitly:Ljava/lang/String;

    .line 295
    return-void
.end method

.method public setCategoryIcon(Ljava/lang/String;)V
    .locals 0
    .param p1, "categoryIcon"    # Ljava/lang/String;

    .prologue
    .line 544
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->categoryIcon:Ljava/lang/String;

    .line 545
    return-void
.end method

.method public setCommentCountExcludingActivity(I)V
    .locals 0
    .param p1, "commentCountExcludingActivity"    # I

    .prologue
    .line 346
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->commentCountExcludingActivity:I

    .line 347
    return-void
.end method

.method public setCreatedAt(Ljava/lang/String;)V
    .locals 0
    .param p1, "createdAt"    # Ljava/lang/String;

    .prologue
    .line 258
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAt:Ljava/lang/String;

    .line 259
    return-void
.end method

.method public setCreatedAtEpoch(J)V
    .locals 1
    .param p1, "createdAtEpoch"    # J

    .prologue
    .line 402
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAtEpoch:J

    .line 403
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->description:Ljava/lang/String;

    .line 235
    return-void
.end method

.method public setFollowing(Z)V
    .locals 0
    .param p1, "following"    # Z

    .prologue
    .line 362
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->following:Z

    .line 363
    return-void
.end method

.method public setIconSquare(Ljava/lang/String;)V
    .locals 0
    .param p1, "iconSquare"    # Ljava/lang/String;

    .prologue
    .line 370
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->iconSquare:Ljava/lang/String;

    .line 371
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 202
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    .line 203
    return-void
.end method

.method public setIntegrationIssues(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 561
    .local p1, "integrationIssues":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->integrationIssues:Ljava/util/List;

    .line 562
    return-void
.end method

.method public setLat(D)V
    .locals 1
    .param p1, "lat"    # D

    .prologue
    .line 266
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lat:D

    .line 267
    return-void
.end method

.method public setLng(D)V
    .locals 1
    .param p1, "lng"    # D

    .prologue
    .line 274
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lng:D

    .line 275
    return-void
.end method

.method public setLocalImagePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "localImagePath"    # Ljava/lang/String;

    .prologue
    .line 552
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->localImagePath:Ljava/lang/String;

    .line 553
    return-void
.end method

.method public setMinutesSinceCreated(I)V
    .locals 0
    .param p1, "minutesSinceCreated"    # I

    .prologue
    .line 302
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->minutesSinceCreated:I

    .line 303
    return-void
.end method

.method public setNumComments(I)V
    .locals 0
    .param p1, "numComments"    # I

    .prologue
    .line 330
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->numComments:I

    .line 331
    return-void
.end method

.method public setPhotoLargeUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "photoLargeUrl"    # Ljava/lang/String;

    .prologue
    .line 378
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoLargeUrl:Ljava/lang/String;

    .line 379
    return-void
.end method

.method public setPhotoSmallUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "photoSmallUrl"    # Ljava/lang/String;

    .prologue
    .line 386
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSmallUrl:Ljava/lang/String;

    .line 387
    return-void
.end method

.method public setPhotoSquareUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "photoSquareUrl"    # Ljava/lang/String;

    .prologue
    .line 394
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSquareUrl:Ljava/lang/String;

    .line 395
    return-void
.end method

.method public setRating(I)V
    .locals 0
    .param p1, "rating"    # I

    .prologue
    .line 286
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->rating:I

    .line 287
    return-void
.end method

.method public setReporterDisplay(Ljava/lang/String;)V
    .locals 0
    .param p1, "reporterDisplay"    # Ljava/lang/String;

    .prologue
    .line 338
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->reporterDisplay:Ljava/lang/String;

    .line 339
    return-void
.end method

.method public setScrollPosition(I)V
    .locals 0
    .param p1, "scrollPosition"    # I

    .prologue
    .line 536
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->scrollPosition:I

    .line 537
    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 322
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->status:Ljava/lang/String;

    .line 323
    return-void
.end method

.method public setSummary(Ljava/lang/String;)V
    .locals 0
    .param p1, "summary"    # Ljava/lang/String;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->summary:Ljava/lang/String;

    .line 219
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 226
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->type:Ljava/lang/String;

    .line 227
    return-void
.end method

.method public setUpdatedAt(Ljava/lang/String;)V
    .locals 0
    .param p1, "updatedAt"    # Ljava/lang/String;

    .prologue
    .line 242
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAt:Ljava/lang/String;

    .line 243
    return-void
.end method

.method public setUpdatedAtRaw(Ljava/lang/String;)V
    .locals 0
    .param p1, "updatedAtRaw"    # Ljava/lang/String;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAtRaw:Ljava/lang/String;

    .line 251
    return-void
.end method

.method public setUserId(I)V
    .locals 0
    .param p1, "userId"    # I

    .prologue
    .line 210
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->userId:I

    .line 211
    return-void
.end method

.method public setVotedBefore(Z)V
    .locals 0
    .param p1, "votedBefore"    # Z

    .prologue
    .line 354
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->votedBefore:Z

    .line 355
    return-void
.end method

.method public suitableVoteAction()Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .locals 1

    .prologue
    .line 653
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->isVotedBefore()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Vote;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/objects/issue/Vote;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 496
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Issue [id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", userId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->userId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", summary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->summary:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", description="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", updatedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", updatedAtRaw="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAtRaw:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", createdAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lat:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lng:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", anonymize_reporter="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->anonymize_reporter:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", rating="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->rating:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", bitly="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->bitly:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", minutesSinceCreated="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->minutesSinceCreated:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", address="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->address:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->status:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", numComments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->numComments:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", reporterDisplay="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->reporterDisplay:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", commentCountExcludingActivity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->commentCountExcludingActivity:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", votedBefore="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->votedBefore:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", following="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->following:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", iconSquare="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->iconSquare:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", photoLargeUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoLargeUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", photoSmallUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSmallUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", photoSquareUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSquareUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", localImagePath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->localImagePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", createdAtEpoch="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAtEpoch:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toggleFollowing()V
    .locals 1

    .prologue
    .line 649
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->isFollowing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setFollowing(Z)V

    .line 650
    return-void

    .line 649
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public updateComment(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 2
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 632
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getComment()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang3/StringUtils;->isNotBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 633
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCommentCountExcludingActivity()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setCommentCountExcludingActivity(I)V

    .line 634
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setCreatedAtMillis(J)V

    .line 636
    :cond_0
    return-void
.end method

.method public updateVote()V
    .locals 1

    .prologue
    .line 640
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->votedBefore:Z

    if-nez v0, :cond_0

    .line 641
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getRating()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setRating(I)V

    .line 645
    :goto_0
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->votedBefore:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setVotedBefore(Z)V

    .line 646
    return-void

    .line 643
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getRating()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setRating(I)V

    goto :goto_0

    .line 645
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 6
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 425
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 426
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->scrollPosition:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 427
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->userId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 428
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->summary:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 429
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 430
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 431
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAt:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 432
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->updatedAtRaw:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 433
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAt:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 434
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lat:D

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeDouble(D)V

    .line 435
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->lng:D

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeDouble(D)V

    .line 436
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->anonymize_reporter:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 437
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->rating:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 438
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->bitly:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 439
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->slug:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 440
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->minutesSinceCreated:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 441
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->address:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 442
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->status:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 443
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->numComments:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 444
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->reporterDisplay:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 445
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->commentCountExcludingActivity:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 446
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->votedBefore:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 447
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->following:Z

    if-eqz v0, :cond_2

    :goto_2
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 448
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->iconSquare:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 449
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoLargeUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 450
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->localImagePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 451
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSmallUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 452
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->photoSquareUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 453
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->categoryIcon:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 454
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->createdAtEpoch:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 455
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/Issue;->integrationIssues:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 456
    return-void

    :cond_0
    move v0, v2

    .line 436
    goto :goto_0

    :cond_1
    move v0, v2

    .line 446
    goto :goto_1

    :cond_2
    move v1, v2

    .line 447
    goto :goto_2
.end method
