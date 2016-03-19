.class public Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;
.super Ljava/lang/Object;
.source "ReportDbLoader.java"


# annotations
.annotation runtime Ljavax/inject/Singleton;
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_ReportDbLoader"


# instance fields
.field c:Landroid/content/Context;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method private loadQuestions(Lcom/seeclickfix/ma/android/objects/report/Report;)Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 6
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 91
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestionsDb()Lcom/j256/ormlite/dao/ForeignCollection;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 95
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestionsDb()Lcom/j256/ormlite/dao/ForeignCollection;

    move-result-object v1

    .line 96
    .local v1, "dbQuestions":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    invoke-interface {v1}, Lcom/j256/ormlite/dao/ForeignCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 97
    .local v3, "qsFromDb":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .local v4, "questionsFromDb":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;->c:Landroid/content/Context;

    invoke-static {v5}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getAnswerDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 100
    .local v0, "answerDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 102
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 105
    .local v2, "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    :try_start_0
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v5

    invoke-interface {v0, v5}, Lcom/j256/ormlite/dao/Dao;->refresh(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :goto_1
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 113
    .end local v2    # "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    :cond_0
    invoke-virtual {p1, v4}, Lcom/seeclickfix/ma/android/objects/report/Report;->setQuestions(Ljava/util/List;)V

    .line 119
    .end local v0    # "answerDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    .end local v1    # "dbQuestions":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    .end local v3    # "qsFromDb":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    .end local v4    # "questionsFromDb":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    :cond_1
    return-object p1

    .line 106
    .restart local v0    # "answerDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    .restart local v1    # "dbQuestions":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    .restart local v2    # "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    .restart local v3    # "qsFromDb":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    .restart local v4    # "questionsFromDb":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method private loadZones(Lcom/seeclickfix/ma/android/objects/report/Report;)Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 7
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    const/4 v4, 0x1

    .line 124
    invoke-static {p1}, Lcom/seeclickfix/ma/android/db/WatchAreaHelper;->getLocalWatchAreas(Lcom/seeclickfix/ma/android/objects/report/Report;)Ljava/util/List;

    move-result-object v1

    .line 126
    .local v1, "cachedWatchAreas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    move v2, v4

    .line 130
    .local v2, "hasCachedWatchAreas":Z
    :goto_0
    if-eqz v2, :cond_2

    .line 132
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 134
    .local v0, "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v5

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSelectedWatchAreaApiId()I

    move-result v6

    if-ne v5, v6, :cond_0

    .line 138
    invoke-virtual {v0, v4}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setIsFromDraft(Z)V

    .line 139
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;->loadQuestions(Lcom/seeclickfix/ma/android/objects/report/Report;)Lcom/seeclickfix/ma/android/objects/report/Report;

    goto :goto_1

    .line 126
    .end local v0    # "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .end local v2    # "hasCachedWatchAreas":Z
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 144
    .restart local v2    # "hasCachedWatchAreas":Z
    :cond_2
    return-object p1
.end method


# virtual methods
.method public load(Lcom/seeclickfix/ma/android/objects/report/Report;)Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 7
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 53
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getReportDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 54
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Report;Ljava/lang/Integer;>;"
    if-eqz p1, :cond_0

    .line 55
    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setDao(Lcom/j256/ormlite/dao/Dao;)V

    .line 58
    :cond_0
    invoke-interface {v0}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v3

    .line 62
    .local v3, "qb":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<Lcom/seeclickfix/ma/android/objects/report/Report;Ljava/lang/Integer;>;"
    :try_start_0
    const-string/jumbo v4, "id"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/j256/ormlite/stmt/QueryBuilder;->orderBy(Ljava/lang/String;Z)Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v4

    const-string/jumbo v5, "report_state"

    const-string/jumbo v6, "ReportState:DRAFT"

    invoke-virtual {v4, v5, v6}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    move-result-object v4

    invoke-virtual {v4}, Lcom/j256/ormlite/stmt/Where;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v2

    .line 68
    .local v2, "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/report/Report;>;"
    invoke-interface {v0, v2}, Lcom/j256/ormlite/dao/Dao;->queryForFirst(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 71
    .local v1, "draftReport":Lcom/seeclickfix/ma/android/objects/report/Report;
    if-eqz v1, :cond_1

    .line 73
    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;->loadZones(Lcom/seeclickfix/ma/android/objects/report/Report;)Lcom/seeclickfix/ma/android/objects/report/Report;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    .line 82
    .end local v1    # "draftReport":Lcom/seeclickfix/ma/android/objects/report/Report;
    .end local v2    # "preparedQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/report/Report;>;"
    :cond_1
    :goto_0
    return-object p1

    .line 76
    :catch_0
    move-exception v4

    goto :goto_0
.end method
