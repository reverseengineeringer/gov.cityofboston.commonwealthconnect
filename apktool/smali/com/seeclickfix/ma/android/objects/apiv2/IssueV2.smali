.class public Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;
.super Ljava/lang/Object;
.source "IssueV2.java"


# static fields
.field private static final D:Z = false

.field private static final TAG:Ljava/lang/String; = "Issue2"


# instance fields
.field private acknowledgedAt:Ljava/util/Date;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "acknowledged_at"
    .end annotation
.end field

.field private address:Ljava/lang/String;

.field private anonymize_reporter:Z

.field private assignee:Lcom/seeclickfix/ma/android/objects/apiv2/User;

.field private closedAt:Ljava/util/Date;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "closed_at"
    .end annotation
.end field

.field private commentUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comment_url"
    .end annotation
.end field

.field private comments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/Comment;",
            ">;"
        }
    .end annotation
.end field

.field private commentsCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comments_count"
    .end annotation
.end field

.field private createdAt:Ljava/util/Date;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at"
    .end annotation
.end field

.field private description:Ljava/lang/String;

.field private htmlUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "html_url"
    .end annotation
.end field

.field private id:I

.field private lat:D

.field private lng:D

.field private media:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private questions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/Question;",
            ">;"
        }
    .end annotation
.end field

.field private rating:I

.field private remoteIntegrations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;",
            ">;"
        }
    .end annotation
.end field

.field private reporter:Lcom/seeclickfix/ma/android/objects/apiv2/User;

.field private shortenedUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "shortened_url"
    .end annotation
.end field

.field private status:Ljava/lang/String;

.field private summary:Ljava/lang/String;

.field private updatedAt:Ljava/util/Date;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "updated_at"
    .end annotation
.end field

.field private url:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "url"
    .end annotation
.end field

.field private userRelationships:Ljava/util/Map;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "current_user_relationship"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private votes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/Vote;",
            ">;"
        }
    .end annotation
.end field

.field private votesCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "votes_count"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->rating:I

    return-void
.end method

.method public static getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    const-string/jumbo v0, "Issue2"

    return-object v0
.end method

.method public static isD()Z
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method public static toISO8601(Ljava/util/Date;)Ljava/lang/String;
    .locals 3
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 203
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 204
    .local v0, "iso8601Format":Ljava/text/DateFormat;
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getAcknowledgedAt()Ljava/util/Date;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->acknowledgedAt:Ljava/util/Date;

    return-object v0
.end method

.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getAnonymizeReporter()Z
    .locals 1

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->anonymize_reporter:Z

    return v0
.end method

.method public getAssignee()Lcom/seeclickfix/ma/android/objects/apiv2/User;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->assignee:Lcom/seeclickfix/ma/android/objects/apiv2/User;

    return-object v0
.end method

.method public getClosedAt()Ljava/util/Date;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->closedAt:Ljava/util/Date;

    return-object v0
.end method

.method public getCommentUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->commentUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getComments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/Comment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->comments:Ljava/util/List;

    return-object v0
.end method

.method public getCommentsCount()I
    .locals 1

    .prologue
    .line 183
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->commentsCount:I

    return v0
.end method

.method public getCreatedAt()Ljava/util/Date;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->createdAt:Ljava/util/Date;

    return-object v0
.end method

.method public getCreatedAtLocal()Ljava/lang/String;
    .locals 2

    .prologue
    .line 125
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v0

    .line 126
    .local v0, "formatter":Ljava/text/DateFormat;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getCreatedAt()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getHtmlUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->htmlUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->id:I

    return v0
.end method

.method public getLat()D
    .locals 2

    .prologue
    .line 106
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->lat:D

    return-wide v0
.end method

.method public getLng()D
    .locals 2

    .prologue
    .line 110
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->lng:D

    return-wide v0
.end method

.method public getMedia()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->media:Ljava/util/Map;

    return-object v0
.end method

.method public getQuestions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/Question;",
            ">;"
        }
    .end annotation

    .prologue
    .line 179
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->questions:Ljava/util/List;

    return-object v0
.end method

.method public getRating()I
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->rating:I

    return v0
.end method

.method public getRemoteIntegrations()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;",
            ">;"
        }
    .end annotation

    .prologue
    .line 171
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->remoteIntegrations:Ljava/util/List;

    return-object v0
.end method

.method public getReporter()Lcom/seeclickfix/ma/android/objects/apiv2/User;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->reporter:Lcom/seeclickfix/ma/android/objects/apiv2/User;

    return-object v0
.end method

.method public getShortenedUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->shortenedUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->status:Ljava/lang/String;

    return-object v0
.end method

.method public getSummary()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->summary:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdatedAt()Ljava/util/Date;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->updatedAt:Ljava/util/Date;

    return-object v0
.end method

.method public getUpdatedAtLocal()Ljava/lang/String;
    .locals 2

    .prologue
    .line 142
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v0

    .line 143
    .local v0, "formatter":Ljava/text/DateFormat;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->getUpdatedAt()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->url:Ljava/lang/String;

    return-object v0
.end method

.method public getUserRelationships()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->userRelationships:Ljava/util/Map;

    return-object v0
.end method

.method public getVotes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/Vote;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->votes:Ljava/util/List;

    return-object v0
.end method

.method public getVotesCount()I
    .locals 1

    .prologue
    .line 191
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;->votesCount:I

    return v0
.end method
