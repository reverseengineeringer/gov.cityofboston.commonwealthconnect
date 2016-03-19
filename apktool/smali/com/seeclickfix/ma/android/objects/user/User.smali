.class public Lcom/seeclickfix/ma/android/objects/user/User;
.super Ljava/lang/Object;
.source "User.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/user/User;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected avatarLargeUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "public_filename"
    .end annotation
.end field

.field protected avatarSquareImage:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "square_image"
    .end annotation
.end field

.field protected civicPoints:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "civic_points"
    .end annotation
.end field

.field protected closedIssueCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "closed_issue_count"
    .end annotation
.end field

.field protected commentCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comments_count"
    .end annotation
.end field

.field private followedIssueCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "following_issue_count"
    .end annotation
.end field

.field protected id:I

.field protected name:Ljava/lang/String;

.field protected placeId:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "place_id"
    .end annotation
.end field

.field private reportedIssueCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "reported_issue_count"
    .end annotation
.end field

.field protected votedIssueCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "voted_issue_count"
    .end annotation
.end field

.field protected wittyTitle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "witty_title"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 194
    new-instance v0, Lcom/seeclickfix/ma/android/objects/user/User$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/user/User$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/user/User;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->name:Ljava/lang/String;

    .line 160
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->id:I

    .line 161
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->placeId:I

    .line 162
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->civicPoints:I

    .line 163
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->wittyTitle:Ljava/lang/String;

    .line 164
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->votedIssueCount:I

    .line 165
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->followedIssueCount:I

    .line 166
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->reportedIssueCount:I

    .line 167
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->commentCount:I

    .line 168
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->closedIssueCount:I

    .line 169
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarLargeUrl:Ljava/lang/String;

    .line 170
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarSquareImage:Ljava/lang/String;

    .line 171
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 175
    const/4 v0, 0x0

    return v0
.end method

.method public getAvatarLargeUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarLargeUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getAvatarSquareImage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarSquareImage:Ljava/lang/String;

    return-object v0
.end method

.method public getCivicPoints()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->civicPoints:I

    return v0
.end method

.method public getClosedIssueCount()I
    .locals 1

    .prologue
    .line 126
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->closedIssueCount:I

    return v0
.end method

.method public getCommentCount()I
    .locals 1

    .prologue
    .line 118
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->commentCount:I

    return v0
.end method

.method public getFollowedIssueCount()I
    .locals 1

    .prologue
    .line 134
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->followedIssueCount:I

    return v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->id:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPlaceId()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->placeId:I

    return v0
.end method

.method public getReportedIssueCount()I
    .locals 1

    .prologue
    .line 110
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->reportedIssueCount:I

    return v0
.end method

.method public getVotedIssueCount()I
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->votedIssueCount:I

    return v0
.end method

.method public getWittyTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->wittyTitle:Ljava/lang/String;

    return-object v0
.end method

.method public setAvatarLargeUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "avatarLargeUrl"    # Ljava/lang/String;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarLargeUrl:Ljava/lang/String;

    .line 147
    return-void
.end method

.method public setAvatarSquareImage(Ljava/lang/String;)V
    .locals 0
    .param p1, "avatarSquareImage"    # Ljava/lang/String;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarSquareImage:Ljava/lang/String;

    .line 155
    return-void
.end method

.method public setCivicPoints(I)V
    .locals 0
    .param p1, "civicPoints"    # I

    .prologue
    .line 90
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->civicPoints:I

    .line 91
    return-void
.end method

.method public setClosedIssueCount(I)V
    .locals 0
    .param p1, "closedIssueCount"    # I

    .prologue
    .line 130
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->closedIssueCount:I

    .line 131
    return-void
.end method

.method public setCommentCount(I)V
    .locals 0
    .param p1, "commentCount"    # I

    .prologue
    .line 122
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->commentCount:I

    .line 123
    return-void
.end method

.method public setFollowedIssueCount(I)V
    .locals 0
    .param p1, "followedIssueCount"    # I

    .prologue
    .line 138
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->followedIssueCount:I

    .line 139
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 74
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->id:I

    .line 75
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->name:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setPlaceId(I)V
    .locals 0
    .param p1, "placeId"    # I

    .prologue
    .line 82
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->placeId:I

    .line 83
    return-void
.end method

.method public setReportedIssueCount(I)V
    .locals 0
    .param p1, "reportedIssueCount"    # I

    .prologue
    .line 114
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->reportedIssueCount:I

    .line 115
    return-void
.end method

.method public setVotedIssueCount(I)V
    .locals 0
    .param p1, "votedIssueCount"    # I

    .prologue
    .line 106
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->votedIssueCount:I

    .line 107
    return-void
.end method

.method public setWittyTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "wittyTitle"    # Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->wittyTitle:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "User [name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", placeId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->placeId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", civicPoints="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->civicPoints:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", wittyTitle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->wittyTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", votedIssueCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->votedIssueCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", reportedIssueCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->reportedIssueCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", commentCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->commentCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", closedIssueCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->closedIssueCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", avatarLargeUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarLargeUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", avatarSquareImage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarSquareImage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
    .line 180
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 181
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 182
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->placeId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 183
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->civicPoints:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 184
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->wittyTitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 185
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->votedIssueCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 186
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->followedIssueCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 187
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->reportedIssueCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 188
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->commentCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 189
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->closedIssueCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 190
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarLargeUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/User;->avatarSquareImage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 192
    return-void
.end method
