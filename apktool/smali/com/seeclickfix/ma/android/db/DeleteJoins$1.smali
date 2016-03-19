.class Lcom/seeclickfix/ma/android/db/DeleteJoins$1;
.super Ljava/lang/Object;
.source "DeleteJoins.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/db/DeleteJoins;->getDeleteCallable(Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)Ljava/util/concurrent/Callable;
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
.field final synthetic this$0:Lcom/seeclickfix/ma/android/db/DeleteJoins;

.field final synthetic val$dao:Lcom/j256/ormlite/dao/Dao;

.field final synthetic val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/db/DeleteJoins;Lcom/j256/ormlite/dao/Dao;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0

    .prologue
    .line 44
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;->this$0:Lcom/seeclickfix/ma/android/db/DeleteJoins;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;->val$dao:Lcom/j256/ormlite/dao/Dao;

    iput-object p3, p0, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

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
    .line 48
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;->val$dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v2}, Lcom/j256/ormlite/dao/Dao;->deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;

    move-result-object v0

    .line 50
    .local v0, "deleteBuilder":Lcom/j256/ormlite/stmt/DeleteBuilder;, "Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/seeclickfix/ma/android/objects/issue/IssuePlaceJoin;Ljava/lang/Integer;>;"
    invoke-virtual {v0}, Lcom/j256/ormlite/stmt/DeleteBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v2

    const-string/jumbo v3, "place_id"

    iget-object v4, p0, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;->val$place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 52
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;->val$dao:Lcom/j256/ormlite/dao/Dao;

    invoke-virtual {v0}, Lcom/j256/ormlite/stmt/DeleteBuilder;->prepare()Lcom/j256/ormlite/stmt/PreparedDelete;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/j256/ormlite/dao/Dao;->delete(Lcom/j256/ormlite/stmt/PreparedDelete;)I

    move-result v1

    .line 54
    .local v1, "numDeleted":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

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
    .line 44
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/db/DeleteJoins$1;->call()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
