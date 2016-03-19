.class public Lcom/seeclickfix/ma/android/objects/apiv2/User;
.super Ljava/lang/Object;
.source "User.java"


# instance fields
.field private avatar:Ljava/util/Map;
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

.field private civicPoints:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "civic_points"
    .end annotation
.end field

.field private closedIssueCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "closed_issue_count"
    .end annotation
.end field

.field private commentsCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comments_count"
    .end annotation
.end field

.field private followingIssueCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "following_issue_count"
    .end annotation
.end field

.field private id:I

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private permissions:Ljava/util/Map;
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

.field private reportedIssueCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "reported_issue_count"
    .end annotation
.end field

.field private votedIssueCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "voted_issue_count"
    .end annotation
.end field

.field private wittyTitle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "witty_title"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAvatar()Ljava/util/Map;
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
    .line 78
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->avatar:Ljava/util/Map;

    return-object v0
.end method

.method public getCivicPoints()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->civicPoints:I

    return v0
.end method

.method public getClosedIssueCount()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->closedIssueCount:I

    return v0
.end method

.method public getCommentsCount()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->commentsCount:I

    return v0
.end method

.method public getFollowingIssueCount()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->followingIssueCount:I

    return v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->id:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissions()Ljava/util/Map;
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
    .line 74
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->permissions:Ljava/util/Map;

    return-object v0
.end method

.method public getReportedIssueCount()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->reportedIssueCount:I

    return v0
.end method

.method public getVotedIssueCount()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->votedIssueCount:I

    return v0
.end method

.method public getWittyTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/User;->wittyTitle:Ljava/lang/String;

    return-object v0
.end method
