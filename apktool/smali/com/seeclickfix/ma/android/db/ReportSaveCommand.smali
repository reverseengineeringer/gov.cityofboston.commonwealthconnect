.class public Lcom/seeclickfix/ma/android/db/ReportSaveCommand;
.super Ljava/lang/Object;
.source "ReportSaveCommand.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ReportSaveCommand"


# instance fields
.field private c:Landroid/content/Context;

.field private dao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private helper:Lcom/seeclickfix/ma/android/db/OrmDbHelper;

.field private report:Lcom/seeclickfix/ma/android/objects/report/Report;

.field private watchAreaDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/report/Report;Landroid/content/Context;)V
    .locals 0
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 36
    iput-object p2, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->c:Landroid/content/Context;

    .line 37
    return-void
.end method

.method private createQuestionsAndAnswers()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 75
    const-string/jumbo v6, "ReportSaveCommand"

    const-string/jumbo v7, "createQuestionsAndAnswers()"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->helper:Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getQuestionDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    .line 78
    .local v4, "questionDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Question;Ljava/lang/Integer;>;"
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->helper:Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getAnswerDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    .line 80
    .local v1, "answerDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v5

    .line 82
    .local v5, "questions":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    invoke-static {v5}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->isNotNullOrEmpty(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 83
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 84
    .local v3, "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v0

    .line 86
    .local v0, "a":Lcom/seeclickfix/ma/android/objects/report/Answer;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v3, v6}, Lcom/seeclickfix/ma/android/objects/report/Question;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 88
    if-eqz v0, :cond_0

    .line 89
    iget-object v6, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v0, v6}, Lcom/seeclickfix/ma/android/objects/report/Answer;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 90
    invoke-interface {v1, v0}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;

    .line 93
    :cond_0
    invoke-interface {v4, v3}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;

    goto :goto_0

    .line 96
    .end local v0    # "a":Lcom/seeclickfix/ma/android/objects/report/Answer;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    :cond_1
    return-void
.end method

.method private createRequestTypes(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V
    .locals 5
    .param p1, "requestWatchArea"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v4, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->helper:Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getRequestTypeDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    .line 121
    .local v2, "reqTypeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/RequestType;Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getRequestTypes()Ljava/util/List;

    move-result-object v3

    .line 123
    .local v3, "reqTypesList":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    invoke-static {v3}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->isNotNullOrEmpty(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 125
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 127
    .local v1, "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setWatchArea(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    .line 128
    iget-object v4, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 129
    invoke-interface {v2, v1}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;

    goto :goto_0

    .line 134
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    :cond_0
    return-void
.end method

.method private createWatchAreas()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v3, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->helper:Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWatchAreaDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v3

    iput-object v3, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->watchAreaDao:Lcom/j256/ormlite/dao/Dao;

    .line 103
    iget-object v3, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->getWatchAreas()Ljava/util/List;

    move-result-object v2

    .line 105
    .local v2, "reqWatchAreaList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-static {v2}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->isNotNullOrEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 106
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 108
    .local v1, "reqWatchArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 109
    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->createRequestTypes(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    .line 110
    iget-object v3, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->watchAreaDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v3, v1}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;

    goto :goto_0

    .line 114
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "reqWatchArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    :cond_0
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 4

    .prologue
    .line 42
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->c:Landroid/content/Context;

    const-class v3, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {v2, v3}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    iput-object v2, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->helper:Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 45
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->helper:Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getReportDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->dao:Lcom/j256/ormlite/dao/Dao;

    .line 46
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setDao(Lcom/j256/ormlite/dao/Dao;)V

    .line 48
    new-instance v1, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->c:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;-><init>(Landroid/content/Context;)V

    .line 49
    .local v1, "deleteReportHelper":Lcom/seeclickfix/ma/android/db/DeleteReportHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->deleteAllDrafts()V

    .line 51
    iget-object v2, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->dao:Lcom/j256/ormlite/dao/Dao;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-interface {v2, v3}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;

    move-result-object v0

    .line 53
    .local v0, "dbQueryStatus2":Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->createQuestionsAndAnswers()V

    .line 54
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->createWatchAreas()V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .end local v0    # "dbQueryStatus2":Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;
    .end local v1    # "deleteReportHelper":Lcom/seeclickfix/ma/android/db/DeleteReportHelper;
    :goto_0
    return-void

    .line 58
    :catch_0
    move-exception v2

    goto :goto_0
.end method
