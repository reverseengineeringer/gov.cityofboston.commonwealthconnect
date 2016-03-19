.class public Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;
.super Ljava/lang/Object;
.source "ZonePlaceJoin.java"


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "zone_place_join"
.end annotation


# instance fields
.field private dateJoinCreated:J
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field public id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        generatedId = true
    .end annotation
.end field

.field public place:Lcom/seeclickfix/ma/android/objects/loc/Place;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
        foreignAutoCreate = true
        foreignAutoRefresh = true
    .end annotation
.end field

.field public zoneWrapper:Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
        foreignAutoCreate = true
        foreignAutoRefresh = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDateJoinCreated()J
    .locals 2

    .prologue
    .line 27
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;->dateJoinCreated:J

    return-wide v0
.end method

.method public setDateJoinCreated(J)V
    .locals 1
    .param p1, "dateJoinCreated"    # J

    .prologue
    .line 23
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;->dateJoinCreated:J

    .line 24
    return-void
.end method
