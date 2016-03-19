.class Lcom/seeclickfix/ma/android/db/InsertIssueList$2;
.super Ljava/lang/Object;
.source "InsertIssueList.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/db/InsertIssueList;->getJoinsCallable(Lcom/j256/ormlite/dao/Dao;Ljava/util/List;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/db/InsertIssueList;

.field final synthetic val$dao:Lcom/j256/ormlite/dao/Dao;

.field final synthetic val$list:Ljava/util/List;

.field final synthetic val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/db/InsertIssueList;Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/util/List;Lcom/j256/ormlite/dao/Dao;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->this$0:Lcom/seeclickfix/ma/android/db/InsertIssueList;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    iput-object p3, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->val$list:Ljava/util/List;

    iput-object p4, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->val$dao:Lcom/j256/ormlite/dao/Dao;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 74
    new-instance v6, Landroid/location/Location;

    const-string/jumbo v7, ""

    invoke-direct {v6, v7}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 75
    .local v6, "placeLoc":Landroid/location/Location;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Landroid/location/Location;->setLatitude(D)V

    .line 76
    iget-object v7, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Landroid/location/Location;->setLongitude(D)V

    .line 78
    iget-object v7, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->val$list:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 80
    .local v3, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    new-instance v4, Landroid/location/Location;

    const-string/jumbo v7, ""

    invoke-direct {v4, v7}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 81
    .local v4, "issueLoc":Landroid/location/Location;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLat()D

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Landroid/location/Location;->setLatitude(D)V

    .line 82
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLng()D

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Landroid/location/Location;->setLongitude(D)V

    .line 84
    invoke-virtual {v6, v4}, Landroid/location/Location;->distanceTo(Landroid/location/Location;)F

    move-result v7

    float-to-double v0, v7

    .line 86
    .local v0, "distance":D
    new-instance v5, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;

    invoke-direct {v5}, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;-><init>()V

    .line 87
    .local v5, "join":Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v5, v7}, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->setPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 88
    invoke-virtual {v5, v3}, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->setIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 89
    invoke-virtual {v5, v0, v1}, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->setDistance(D)V

    .line 90
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v5, v8, v9}, Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;->setDateJoinCreated(J)V

    .line 100
    iget-object v7, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$2;->val$dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v7, v5}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;

    goto :goto_0

    .line 103
    .end local v0    # "distance":D
    .end local v3    # "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .end local v4    # "issueLoc":Landroid/location/Location;
    .end local v5    # "join":Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;
    :cond_0
    const/4 v7, 0x0

    return-object v7
.end method
