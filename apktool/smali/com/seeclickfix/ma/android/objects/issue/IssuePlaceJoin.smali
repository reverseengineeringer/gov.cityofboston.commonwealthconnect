.class public Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;
.super Ljava/lang/Object;
.source "IssuePlaceJoin.java"


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "issue_place_join"
.end annotation


# instance fields
.field private dateJoinCreated:J
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private distance:D
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        generatedId = true
    .end annotation
.end field

.field private issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "issue_id"
        foreign = true
    .end annotation
.end field

.field private place:Lcom/seeclickfix/ma/android/objects/loc/Place;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "place_id"
        foreign = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDateJoinCreated()J
    .locals 2

    .prologue
    .line 73
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->dateJoinCreated:J

    return-wide v0
.end method

.method public getDistance()D
    .locals 2

    .prologue
    .line 65
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->distance:D

    return-wide v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 41
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->id:I

    return v0
.end method

.method public getIssue()Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    return-object v0
.end method

.method public getPlace()Lcom/seeclickfix/ma/android/objects/loc/Place;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    return-object v0
.end method

.method public setDateJoinCreated(J)V
    .locals 1
    .param p1, "dateJoinCreated"    # J

    .prologue
    .line 77
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->dateJoinCreated:J

    .line 78
    return-void
.end method

.method public setDistance(D)V
    .locals 1
    .param p1, "distance"    # D

    .prologue
    .line 69
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->distance:D

    .line 70
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 45
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->id:I

    .line 46
    return-void
.end method

.method public setIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 0
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 54
    return-void
.end method

.method public setPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 62
    return-void
.end method
