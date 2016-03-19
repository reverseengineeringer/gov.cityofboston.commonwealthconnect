.class Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;
.super Ljava/lang/Object;
.source "DeleteZonePlaceJoins.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;->getDeleteCallable(Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;
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
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;

.field final synthetic val$dao:Lcom/j256/ormlite/dao/Dao;

.field final synthetic val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;->this$0:Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;->val$dao:Lcom/j256/ormlite/dao/Dao;

    iput-object p3, p0, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Integer;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;->val$dao:Lcom/j256/ormlite/dao/Dao;

    const-string/jumbo v3, "place_id"

    iget-object v4, p0, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/j256/ormlite/dao/Dao;->queryForEq(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 83
    .local v1, "zoneJoins":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/ZonePlaceJoin;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;->val$dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v2, v1}, Lcom/j256/ormlite/dao/Dao;->delete(Ljava/util/Collection;)I

    move-result v0

    .line 91
    .local v0, "numDeleted":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    return-object v2
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/db/DeleteZonePlaceJoins$1;->call()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
