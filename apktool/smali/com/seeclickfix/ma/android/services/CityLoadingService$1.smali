.class Lcom/seeclickfix/ma/android/services/CityLoadingService$1;
.super Ljava/lang/Object;
.source "CityLoadingService.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/services/CityLoadingService;->getCallableForChunk(Ljava/util/List;)Ljava/util/concurrent/Callable;
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
.field final synthetic this$0:Lcom/seeclickfix/ma/android/services/CityLoadingService;

.field final synthetic val$chunkList:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/services/CityLoadingService;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 172
    iput-object p1, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$1;->this$0:Lcom/seeclickfix/ma/android/services/CityLoadingService;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$1;->val$chunkList:Ljava/util/List;

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
    .line 172
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/services/CityLoadingService$1;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 176
    const/4 v1, 0x0

    .line 178
    .local v1, "numInserted":I
    iget-object v3, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$1;->val$chunkList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 179
    .local v2, "sql":Ljava/lang/String;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$1;->this$0:Lcom/seeclickfix/ma/android/services/CityLoadingService;

    # getter for: Lcom/seeclickfix/ma/android/services/CityLoadingService;->dao:Lcom/j256/ormlite/dao/Dao;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->access$200(Lcom/seeclickfix/ma/android/services/CityLoadingService;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v3

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v3, v2, v4}, Lcom/j256/ormlite/dao/Dao;->executeRaw(Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    add-int/2addr v1, v3

    .line 180
    goto :goto_0

    .line 181
    .end local v2    # "sql":Ljava/lang/String;
    :cond_0
    const-string/jumbo v3, "numInserted "

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    const/4 v3, 0x0

    return-object v3
.end method
