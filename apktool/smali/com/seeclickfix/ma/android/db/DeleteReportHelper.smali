.class public Lcom/seeclickfix/ma/android/db/DeleteReportHelper;
.super Ljava/lang/Object;
.source "DeleteReportHelper.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DeleteReportHelper"


# instance fields
.field private ctx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->ctx:Landroid/content/Context;

    .line 37
    return-void
.end method


# virtual methods
.method public deleteAllDrafts()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 99
    iget-object v5, p0, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->ctx:Landroid/content/Context;

    invoke-static {v5}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getReportDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    .line 101
    .local v4, "reportDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Report;Ljava/lang/Integer;>;"
    invoke-interface {v4}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v3

    .line 103
    .local v3, "queryBuilder":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/report/Report;Ljava/lang/Integer;>;"
    invoke-virtual {v3}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v5

    const-string/jumbo v6, "report_state"

    const-string/jumbo v7, "ReportState:DRAFT"

    invoke-virtual {v5, v6, v7}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 105
    invoke-virtual {v3}, Lcom/j256/ormlite/stmt/QueryBuilder;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/j256/ormlite/dao/Dao;->query(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/util/List;

    move-result-object v1

    .line 107
    .local v1, "draftReportsList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Report;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 108
    .local v0, "draftReport":Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->deleteByReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    goto :goto_0

    .line 110
    .end local v0    # "draftReport":Lcom/seeclickfix/ma/android/objects/report/Report;
    :cond_0
    return-void
.end method

.method public deleteById(I)V
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 47
    iget-object v1, p0, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getReportDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 49
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Report;Ljava/lang/Integer;>;"
    if-ltz p1, :cond_0

    .line 51
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->deleteReportChildren(I)V

    .line 52
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/j256/ormlite/dao/Dao;->deleteById(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :cond_0
    :goto_0
    return-void

    .line 53
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public deleteByReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 1
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 66
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getDbId()I

    move-result v0

    .line 68
    .local v0, "reportId":I
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->deleteById(I)V

    .line 69
    return-void
.end method

.method public deleteReportChildren(I)V
    .locals 11
    .param p1, "reportId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v8, p0, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->ctx:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getWatchAreaDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v6

    .line 75
    .local v6, "watchAreaDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/Integer;>;"
    iget-object v8, p0, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->ctx:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getQuestionDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    .line 76
    .local v2, "questionDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Question;Ljava/lang/Integer;>;"
    iget-object v8, p0, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->ctx:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getAnswerDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 77
    .local v0, "answerDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    iget-object v8, p0, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->ctx:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getRequestTypeDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    .line 79
    .local v4, "reqTypeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/RequestType;Ljava/lang/Integer;>;"
    invoke-interface {v6}, Lcom/j256/ormlite/dao/Dao;->deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;

    move-result-object v7

    .line 80
    .local v7, "watchAreaDeleter":Lcom/j256/ormlite/stmt/DeleteBuilder;, "Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/Integer;>;"
    invoke-virtual {v7}, Lcom/j256/ormlite/stmt/DeleteBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v8

    const-string/jumbo v9, "report_id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 81
    invoke-virtual {v7}, Lcom/j256/ormlite/stmt/DeleteBuilder;->delete()I

    .line 83
    invoke-interface {v4}, Lcom/j256/ormlite/dao/Dao;->deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;

    move-result-object v5

    .line 84
    .local v5, "reqTypeDeleter":Lcom/j256/ormlite/stmt/DeleteBuilder;, "Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/seeclickfix/ma/android/objects/report/RequestType;Ljava/lang/Integer;>;"
    invoke-virtual {v5}, Lcom/j256/ormlite/stmt/DeleteBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v8

    const-string/jumbo v9, "report_id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 85
    invoke-virtual {v5}, Lcom/j256/ormlite/stmt/DeleteBuilder;->delete()I

    .line 87
    invoke-interface {v2}, Lcom/j256/ormlite/dao/Dao;->deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;

    move-result-object v3

    .line 88
    .local v3, "questionDeleter":Lcom/j256/ormlite/stmt/DeleteBuilder;, "Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/seeclickfix/ma/android/objects/report/Question;Ljava/lang/Integer;>;"
    invoke-virtual {v3}, Lcom/j256/ormlite/stmt/DeleteBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v8

    const-string/jumbo v9, "report_id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 89
    invoke-virtual {v3}, Lcom/j256/ormlite/stmt/DeleteBuilder;->delete()I

    .line 91
    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;

    move-result-object v1

    .line 92
    .local v1, "answerDeleter":Lcom/j256/ormlite/stmt/DeleteBuilder;, "Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    invoke-virtual {v1}, Lcom/j256/ormlite/stmt/DeleteBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v8

    const-string/jumbo v9, "report_id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 93
    invoke-virtual {v1}, Lcom/j256/ormlite/stmt/DeleteBuilder;->delete()I

    .line 94
    return-void
.end method
