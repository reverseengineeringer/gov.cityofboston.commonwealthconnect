.class Lcom/seeclickfix/ma/android/db/InsertIssueList$1;
.super Ljava/lang/Object;
.source "InsertIssueList.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/db/InsertIssueList;->getCallable(Lcom/j256/ormlite/dao/Dao;Ljava/util/List;)Ljava/util/concurrent/Callable;
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


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/db/InsertIssueList;Ljava/util/List;Lcom/j256/ormlite/dao/Dao;)V
    .locals 0

    .prologue
    .line 54
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$1;->this$0:Lcom/seeclickfix/ma/android/db/InsertIssueList;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$1;->val$list:Ljava/util/List;

    iput-object p3, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$1;->val$dao:Lcom/j256/ormlite/dao/Dao;

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
    .line 54
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/db/InsertIssueList$1;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$1;->val$list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 58
    .local v1, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/InsertIssueList$1;->val$dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v2, v1}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;

    goto :goto_0

    .line 61
    .end local v1    # "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    :cond_0
    const/4 v2, 0x0

    return-object v2
.end method
