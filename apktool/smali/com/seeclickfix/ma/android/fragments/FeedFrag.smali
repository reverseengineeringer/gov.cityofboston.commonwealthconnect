.class public Lcom/seeclickfix/ma/android/fragments/FeedFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "FeedFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "HandlerLeak"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final LAST_SCROLL_POSITION:Ljava/lang/String; = "FeedFrag.LAST_SCROLL_POSITION"

.field private static final LAST_SCROLL_TOP:Ljava/lang/String; = "FeedFrag.LAST_SCROLL_TOP"

.field private static final TAG:Ljava/lang/String; = "FeedFrag"

.field private static mActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

.field callShowListView:Ljava/lang/Runnable;

.field private commentBtnClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;

.field private commentCardClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

.field commentsListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

.field private errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

.field errorListener:Lcom/android/volley/Response$ErrorListener;

.field private getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;

.field private getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

.field private getMoreIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

.field private handler:Landroid/os/Handler;

.field private index:I

.field private isLoading:Z

.field private issueClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

.field listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field loadMoreListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private loadedAllComments:Z

.field private loadedAllIssues:Z

.field locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mListView:Landroid/widget/ListView;

.field mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field onScrollListener:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

.field private page:I

.field private pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field private place:Lcom/seeclickfix/ma/android/objects/loc/Place;

.field resetScrollListener:Ljava/lang/Runnable;

.field singleZoneListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private starIssueListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

.field private transient timesShowListViewCalled:I

.field private top:I

.field private voteClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;

.field zoneErrorListener:Lcom/android/volley/Response$ErrorListener;

.field zoneListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private zoneReqTask:Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 109
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "com.seeclickfix.actions.VOTE"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "com.seeclickfix.actions.CHANGE_STATUS"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "com.seeclickfix.actions.ADD_WATCHER"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mActions:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 98
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 120
    const/4 v0, -0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    .line 121
    iput v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->top:I

    .line 126
    iput v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->timesShowListViewCalled:I

    .line 131
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z

    .line 139
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadedAllIssues:Z

    .line 140
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadedAllComments:Z

    .line 141
    const/4 v0, 0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    .line 500
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadMoreListener:Lcom/android/volley/Response$Listener;

    .line 530
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->resetScrollListener:Ljava/lang/Runnable;

    .line 540
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$4;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->listener:Lcom/android/volley/Response$Listener;

    .line 563
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$5;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$5;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->commentsListener:Lcom/android/volley/Response$Listener;

    .line 593
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$6;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 713
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$10;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$10;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->onScrollListener:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

    .line 732
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$11;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$11;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->commentCardClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

    .line 807
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$12;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$12;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->callShowListView:Ljava/lang/Runnable;

    .line 986
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$17;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->singleZoneListener:Lcom/android/volley/Response$Listener;

    .line 1009
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$18;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneListener:Lcom/android/volley/Response$Listener;

    .line 1040
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneErrorListener:Lcom/android/volley/Response$ErrorListener;

    return-void
.end method

.method static synthetic access$002(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;
    .param p1, "x1"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadedAllIssues:Z

    return p1
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadMore()V

    return-void
.end method

.method static synthetic access$102(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;
    .param p1, "x1"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showListView()V

    return-void
.end method

.method static synthetic access$1200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setScrollData()V

    return-void
.end method

.method static synthetic access$1400(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pushIssueToAdapter(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->runZoneRequest()V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handleListLoaded()V

    return-void
.end method

.method static synthetic access$502(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;
    .param p1, "x1"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadedAllComments:Z

    return p1
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    return-object v0
.end method

.method static synthetic access$700(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    return-object v0
.end method

.method static synthetic access$800(Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/Object;

    .prologue
    .line 98
    invoke-static {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->postEvent(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$900(Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/Object;

    .prologue
    .line 98
    invoke-static {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->postEvent(Ljava/lang/Object;)V

    return-void
.end method

.method private authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 1
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 1179
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1180
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->executeAction()V

    .line 1184
    :goto_0
    return-void

    .line 1182
    :cond_0
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->launchLoginFrag(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    goto :goto_0
.end method

.method private callAsyncShowListView()V
    .locals 4

    .prologue
    .line 792
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->timesShowListViewCalled:I

    const/16 v1, 0x64

    if-gt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_2

    .line 795
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->timesShowListViewCalled:I

    .line 797
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 798
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->killHandler()V

    .line 805
    :cond_1
    :goto_0
    return-void

    .line 801
    :cond_2
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->timesShowListViewCalled:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->timesShowListViewCalled:I

    .line 802
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->callShowListView:Ljava/lang/Runnable;

    const-wide/16 v2, 0x57

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private checkForCurrentPlace()Z
    .locals 8

    .prologue
    .line 392
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getAppContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getPlaceDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    .line 394
    .local v4, "placeDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .line 397
    .local v2, "existingPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :try_start_0
    invoke-interface {v4}, Lcom/j256/ormlite/dao/Dao;->queryBuilder()Lcom/j256/ormlite/stmt/QueryBuilder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/j256/ormlite/stmt/QueryBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v5

    const-string/jumbo v6, "api_id"

    const/4 v7, -0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    move-result-object v5

    invoke-virtual {v5}, Lcom/j256/ormlite/stmt/Where;->prepare()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v3

    .line 398
    .local v3, "existingPlaceQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-interface {v4, v3}, Lcom/j256/ormlite/dao/Dao;->queryForFirst(Lcom/j256/ormlite/stmt/PreparedQuery;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 403
    .end local v3    # "existingPlaceQuery":Lcom/j256/ormlite/stmt/PreparedQuery;, "Lcom/j256/ormlite/stmt/PreparedQuery<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    :goto_0
    if-nez v2, :cond_0

    .line 404
    const/4 v5, 0x0

    .line 407
    :goto_1
    return v5

    .line 399
    :catch_0
    move-exception v1

    .line 400
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 406
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 407
    const/4 v5, 0x1

    goto :goto_1
.end method

.method private getNoIssueNoticeItem()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 2

    .prologue
    .line 644
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->NO_ISSUES()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    .line 645
    .local v0, "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/FeedFrag$7;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$7;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->setListener(Landroid/view/View$OnClickListener;)V

    .line 652
    return-object v0
.end method

.method private handleArgs()V
    .locals 8

    .prologue
    .line 331
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    .line 333
    .local v2, "args":Landroid/os/Bundle;
    const-string/jumbo v4, "page_params"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/PageParams;

    iput-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 337
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v4

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 339
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v4

    const-string/jumbo v5, "action_bar_subtitle"

    const-string/jumbo v6, "id"

    const-string/jumbo v7, "android"

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 340
    .local v1, "actionBarTitleId":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 341
    .local v0, "actionBarSubTextView":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v4, v0, v5}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setActionBarSubBasic(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V

    .line 343
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getParcel()Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 345
    .local v3, "parcelPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    if-eqz v3, :cond_0

    .line 346
    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 349
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    if-eqz v4, :cond_0

    .line 355
    :cond_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDataParcel()Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    iput-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 362
    .end local v0    # "actionBarSubTextView":Landroid/widget/TextView;
    .end local v1    # "actionBarTitleId":I
    .end local v2    # "args":Landroid/os/Bundle;
    .end local v3    # "parcelPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :goto_0
    return-void

    .line 359
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private handleListLoaded()V
    .locals 1

    .prologue
    .line 703
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setAdapterAndListeners()V

    .line 705
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showListView()V

    .line 707
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showFooter()V

    .line 709
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setHasOptionsMenu(Z)V

    .line 710
    return-void
.end method

.method private isPlaceFeed()Z
    .locals 1

    .prologue
    .line 388
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private killHandler()V
    .locals 2

    .prologue
    .line 319
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 320
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 326
    :cond_0
    :goto_0
    return-void

    .line 322
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private launchLoginFrag(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 2
    .param p1, "pendingComment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 1100
    new-instance v0, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {p1, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueDetailsParams(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;-><init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->postEvent(Ljava/lang/Object;)V

    .line 1101
    return-void
.end method

.method private loadMore()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 485
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadedAllComments:Z

    if-nez v0, :cond_1

    .line 486
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z

    .line 487
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    .line 488
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 489
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadComments()V

    .line 497
    :cond_0
    :goto_0
    return-void

    .line 490
    :cond_1
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadedAllIssues:Z

    if-nez v0, :cond_0

    .line 491
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z

    .line 492
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    .line 493
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 494
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadMoreIssues()V

    goto :goto_0
.end method

.method private processLocation(Landroid/location/Location;)V
    .locals 4
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 951
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isPlaceFeed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 973
    :cond_0
    :goto_0
    return-void

    .line 956
    :cond_1
    if-eqz p1, :cond_0

    .line 958
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 959
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->checkForCurrentPlace()Z

    .line 961
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopActiveLocationUpdates()V

    .line 963
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    if-nez v0, :cond_2

    .line 964
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setupDefaultPlace(Landroid/location/Location;)V

    .line 967
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setPlaceLat(D)V

    .line 968
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setPlaceLng(D)V

    .line 969
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setShouldReload(Z)V

    .line 970
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->runZoneRequest()V

    goto :goto_0
.end method

.method private pushIssueToAdapter(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 1
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 1105
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 1106
    return-void
.end method

.method private runZoneRequest()V
    .locals 6

    .prologue
    .line 1083
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 1085
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyLocation()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getNumZones()I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, v2, :cond_0

    .line 1087
    new-instance v1, Lcom/seeclickfix/ma/android/tasks/GetSingleZoneTask;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->singleZoneListener:Lcom/android/volley/Response$Listener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneErrorListener:Lcom/android/volley/Response$ErrorListener;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/seeclickfix/ma/android/tasks/GetSingleZoneTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneReqTask:Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;

    .line 1093
    :goto_0
    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 1094
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneReqTask:Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->execute()V

    .line 1096
    return-void

    .line 1090
    :cond_0
    new-instance v1, Lcom/seeclickfix/ma/android/tasks/GetZonesTask;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneListener:Lcom/android/volley/Response$Listener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneErrorListener:Lcom/android/volley/Response$ErrorListener;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/seeclickfix/ma/android/tasks/GetZonesTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneReqTask:Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;

    goto :goto_0
.end method

.method private setAdapterAndListeners()V
    .locals 2

    .prologue
    .line 744
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->issueClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setIssueClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;)V

    .line 745
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->voteClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setVoteClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;)V

    .line 746
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->commentBtnClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setCommentClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;)V

    .line 747
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->commentCardClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setCommentCardClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;)V

    .line 748
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->starIssueListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setOnIssueStarClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;)V

    .line 750
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setOnStatusChangeListener(Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;)V

    .line 752
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->onScrollListener:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setOnScrollListener(Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;)V

    .line 754
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 755
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 757
    :cond_0
    return-void
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 412
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0077

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    .line 413
    return-void
.end method

.method private setScrollData()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 905
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 906
    .local v0, "v":Landroid/view/View;
    if-nez v0, :cond_0

    :goto_0
    iput v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->top:I

    .line 908
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    .line 909
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setScrollPosition(I)V

    .line 910
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->top:I

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setScrollOffset(I)V

    .line 911
    return-void

    .line 906
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v1

    goto :goto_0
.end method

.method private setupAdapterAndListView()V
    .locals 2

    .prologue
    .line 693
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    if-nez v0, :cond_0

    .line 694
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .line 697
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->setPermissionsManager(Lcom/seeclickfix/ma/android/auth/PermissionsManager;)V

    .line 698
    return-void
.end method

.method private setupDefaultPlace(Landroid/location/Location;)V
    .locals 4
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 977
    new-instance v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 978
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setMyLocation(Z)V

    .line 979
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setPlaceLat(D)V

    .line 980
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setPlaceLng(D)V

    .line 981
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setApiId(I)V

    .line 983
    return-void
.end method

.method private setupListeners()V
    .locals 1

    .prologue
    .line 844
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$13;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$13;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->issueClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

    .line 855
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$14;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$14;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->voteClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;

    .line 867
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$15;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$15;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->commentBtnClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;

    .line 878
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$16;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->starIssueListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

    .line 901
    return-void
.end method

.method private showActionResult(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V
    .locals 1
    .param p1, "notice"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .prologue
    .line 1126
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1127
    invoke-virtual {p1, p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->showToast(Landroid/support/v4/app/Fragment;)V

    .line 1131
    :goto_0
    return-void

    .line 1129
    :cond_0
    invoke-virtual {p1, p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->showDialog(Landroid/support/v4/app/Fragment;)V

    goto :goto_0
.end method

.method private showFooter()V
    .locals 0

    .prologue
    .line 819
    return-void
.end method

.method private showListView()V
    .locals 3

    .prologue
    .line 762
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_2

    .line 763
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->callAsyncShowListView()V

    .line 781
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    if-eqz v0, :cond_1

    .line 782
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 783
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 787
    :cond_1
    return-void

    .line 764
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 765
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 768
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/anim/Transitions;->fadeIn(Landroid/content/Context;)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 769
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 773
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    if-ltz v0, :cond_0

    .line 774
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->top:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setSelectionFromTop(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 776
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private startWork()V
    .locals 1

    .prologue
    .line 366
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handleArgs()V

    .line 368
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setReferences()V

    .line 369
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setupListeners()V

    .line 370
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setupAdapterAndListView()V

    .line 371
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->subscribeToEventBus()V

    .line 373
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isPlaceFeed()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 375
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 377
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z

    .line 378
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->startLoading()V

    .line 385
    :goto_0
    return-void

    .line 380
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->runZoneRequest()V

    goto :goto_0

    .line 383
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startHighAccuracyLocationUpdates()V

    goto :goto_0
.end method

.method private stopVolleyTasks()V
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneReqTask:Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;

    if-eqz v0, :cond_0

    .line 290
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->zoneReqTask:Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;->cancel()V

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;

    if-eqz v0, :cond_1

    .line 294
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->cancel()V

    .line 297
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    if-eqz v0, :cond_2

    .line 298
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->cancel()V

    .line 301
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getMoreIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    if-eqz v0, :cond_3

    .line 302
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getMoreIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->cancel()V

    .line 305
    :cond_3
    return-void
.end method


# virtual methods
.method protected addItemsToAdapter(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 621
    .local p1, "response":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->appendList(Ljava/util/List;)V

    .line 623
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->notifyDataSetChanged()V

    .line 625
    return-void
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 257
    const/4 v0, 0x0

    return-object v0
.end method

.method public loadComments()V
    .locals 6

    .prologue
    .line 480
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->commentsListener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget v5, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;I)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;

    .line 481
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetMyCommentsTask;->execute()V

    .line 482
    return-void
.end method

.method public loadIssues()V
    .locals 6

    .prologue
    .line 470
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->listener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget v5, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;I)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    .line 471
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->execute()V

    .line 472
    return-void
.end method

.method public loadMoreIssues()V
    .locals 6

    .prologue
    .line 475
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadMoreListener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget v5, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;I)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getMoreIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    .line 476
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getMoreIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->execute()V

    .line 477
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 215
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 219
    if-eqz p1, :cond_0

    .line 220
    const-string/jumbo v0, "FeedFrag.LAST_SCROLL_TOP"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->top:I

    .line 221
    const-string/jumbo v0, "FeedFrag.LAST_SCROLL_POSITION"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    .line 223
    :cond_0
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 840
    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 154
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreate(Landroid/os/Bundle;)V

    .line 158
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 8
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v7, 0x0

    .line 823
    invoke-super {p0, p1, p2, p3}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 825
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v6, 0x7f060000

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    .line 827
    .local v4, "sortOptions":[Ljava/lang/String;
    const v5, 0x7f0c007d

    invoke-virtual {p0, v5}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 829
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 830
    .local v3, "option":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v5

    invoke-interface {p1, v7, v5, v7, v3}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 832
    const/4 v5, 0x1

    invoke-interface {p1, v7, v5, v7}, Landroid/view/ContextMenu;->setGroupCheckable(IZZ)V

    .line 829
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 834
    .end local v3    # "option":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 227
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 230
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments()Z

    move-result v0

    if-nez v0, :cond_0

    .line 231
    const v0, 0x7f0e0003

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 236
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 238
    return-void

    .line 233
    :cond_0
    const v0, 0x7f0e0002

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 162
    if-nez p2, :cond_0

    .line 163
    const/4 v0, 0x0

    .line 172
    :goto_0
    return-object v0

    .line 165
    :cond_0
    const v0, 0x7f030028

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setRootFrag(Landroid/view/ViewGroup;)V

    .line 166
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    const v2, 0x7f0a0078

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    .line 168
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handler:Landroid/os/Handler;

    .line 170
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    goto :goto_0
.end method

.method public onIssueActionEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;)V
    .locals 3
    .param p1, "event"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 1111
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getIssueActionResult()Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->isAccepted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1112
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getIssueActionResult()Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showActionResult(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    .line 1120
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    if-eqz v0, :cond_1

    .line 1121
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pushIssueToAdapter(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 1123
    :cond_1
    return-void

    .line 1113
    :cond_2
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getIssueActionResult()Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1114
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getComment()Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->isAssociatedWith(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1115
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getComment()Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getIssueActionResult()Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getReceipt()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    invoke-virtual {v1, v2, v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    goto :goto_0

    .line 1118
    :cond_3
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getIssueActionResult()Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showActionResult(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    goto :goto_0
.end method

.method public onLocationConnectedEvent(Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;)V
    .locals 3
    .param p1, "connectedEvent"    # Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 925
    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->CLOSE_AND_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/location/LocationValidator;->isPrecise(Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;Landroid/location/Location;)Z

    move-result v0

    .line 927
    .local v0, "isPrecise":Z
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    if-nez v1, :cond_0

    .line 928
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->processLocation(Landroid/location/Location;)V

    .line 929
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->runZoneRequest()V

    .line 936
    :goto_0
    return-void

    .line 930
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    if-nez v1, :cond_1

    .line 931
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startHighAccuracyLocationUpdates()V

    goto :goto_0

    .line 933
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->runZoneRequest()V

    goto :goto_0
.end method

.method public onLocationTimeoutEvent(Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;)V
    .locals 1
    .param p1, "locationTimeoutEvent"    # Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 941
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;->getLocation()Landroid/location/Location;

    move-result-object v0

    .line 943
    .local v0, "timeoutLocation":Landroid/location/Location;
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->processLocation(Landroid/location/Location;)V

    .line 945
    return-void
.end method

.method public onLocationUpdate(Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;)V
    .locals 1
    .param p1, "locationEvent"    # Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 918
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;->getLocation()Landroid/location/Location;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->processLocation(Landroid/location/Location;)V

    .line 919
    return-void
.end method

.method public onLoginEvent(Lcom/seeclickfix/ma/android/events/LoginEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LoginEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 310
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LoginEvent;->getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDataParcel()Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 312
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LoginEvent;->getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->paramsToComment(Lcom/seeclickfix/ma/android/objects/PageParams;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->executeAction()V

    .line 313
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->clearAuthCompleteParams()V

    .line 314
    return-void
.end method

.method public onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Lcom/actionbarsherlock/view/MenuItem;

    .prologue
    .line 242
    invoke-interface {p1}, Lcom/actionbarsherlock/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a0185

    if-ne v1, v2, :cond_0

    .line 243
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setScrollData()V

    .line 245
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;

    .line 247
    .local v0, "btnInerface":Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
    const/4 v1, 0x5

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;->onClickButton(ILjava/lang/Object;)V

    .line 249
    const/4 v1, 0x1

    .line 252
    .end local v0    # "btnInerface":Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 262
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 265
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->startWork()V

    .line 266
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x0

    .line 177
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 180
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 181
    const-string/jumbo v2, "page_params"

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 188
    :goto_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    if-eqz v2, :cond_1

    .line 190
    :try_start_1
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    iput v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    .line 191
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 192
    .local v0, "v":Landroid/view/View;
    if-nez v0, :cond_0

    :goto_1
    iput v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->top:I

    .line 194
    const-string/jumbo v1, "FeedFrag.LAST_SCROLL_TOP"

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->top:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 195
    const-string/jumbo v1, "FeedFrag.LAST_SCROLL_POSITION"

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 210
    .end local v0    # "v":Landroid/view/View;
    :goto_2
    return-void

    .line 192
    .restart local v0    # "v":Landroid/view/View;
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getTop()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    goto :goto_1

    .line 206
    .end local v0    # "v":Landroid/view/View;
    :cond_1
    const-string/jumbo v1, "FeedFrag.LAST_SCROLL_TOP"

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->top:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 207
    const-string/jumbo v1, "FeedFrag.LAST_SCROLL_POSITION"

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->index:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_2

    .line 198
    :catch_0
    move-exception v1

    goto :goto_2

    .line 182
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 1190
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 420
    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    .line 421
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/volley/RequestQueue;->stop()V

    .line 430
    :goto_0
    return-void

    .line 423
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/volley/RequestQueue;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 425
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onStatusChange(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "newStatus"    # Ljava/lang/String;

    .prologue
    .line 1160
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->currentIssue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 1162
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$20;

    invoke-direct {v0, p0, p2}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$20;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;Ljava/lang/String;)V

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/FeedFrag$21;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$21;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    invoke-static {p0, v0, v1}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->statusChangeWarning(Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z

    .line 1175
    return-void
.end method

.method public onStop()V
    .locals 3

    .prologue
    .line 274
    :try_start_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getScrollY()I

    move-result v0

    .line 275
    .local v0, "scrollPosition":I
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->setScrollPosition(I)V

    .line 276
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    .end local v0    # "scrollPosition":I
    :goto_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->unSubscribeFromEventBus()V

    .line 282
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->stopVolleyTasks()V

    .line 283
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->killHandler()V

    .line 285
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 286
    return-void

    .line 277
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected postNoCommentsItem()V
    .locals 2

    .prologue
    .line 636
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->NO_COMMENTS()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    .line 638
    .local v0, "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->containsItem(Lcom/seeclickfix/ma/android/objects/types/FeedItem;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 639
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->appendFeedItem(Lcom/seeclickfix/ma/android/objects/types/FeedItem;)V

    .line 641
    :cond_0
    return-void
.end method

.method protected postNoIssueItem()V
    .locals 2

    .prologue
    .line 628
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getNoIssueNoticeItem()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    .line 630
    .local v0, "no_issue_notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->containsItem(Lcom/seeclickfix/ma/android/objects/types/FeedItem;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 631
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->appendFeedItem(Lcom/seeclickfix/ma/android/objects/types/FeedItem;)V

    .line 633
    :cond_0
    return-void
.end method

.method public recordVote(Lcom/seeclickfix/ma/android/objects/issue/Vote;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "vote"    # Lcom/seeclickfix/ma/android/objects/issue/Vote;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1139
    return-void
.end method

.method public revokeVote(Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "vote"    # Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1143
    return-void
.end method

.method protected showMustLogInForMyComment()V
    .locals 4

    .prologue
    .line 675
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getErrorView()Landroid/view/View;

    move-result-object v2

    .line 677
    .local v2, "errorView":Landroid/view/View;
    const v3, 0x7f0a0150

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 678
    .local v1, "errorTextView":Landroid/widget/TextView;
    const v3, 0x7f0a0151

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 679
    .local v0, "errorBtn":Landroid/widget/Button;
    const v3, 0x7f0c006f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 681
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/FeedFrag$9;

    invoke-direct {v3, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$9;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 689
    sget-object v3, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 690
    return-void
.end method

.method protected showMustLogInForMyReports()V
    .locals 4

    .prologue
    .line 656
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getErrorView()Landroid/view/View;

    move-result-object v2

    .line 658
    .local v2, "errorView":Landroid/view/View;
    const v3, 0x7f0a0150

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 659
    .local v1, "errorTextView":Landroid/widget/TextView;
    const v3, 0x7f0a0151

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 660
    .local v0, "errorBtn":Landroid/widget/Button;
    const v3, 0x7f0c0070

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 662
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/FeedFrag$8;

    invoke-direct {v3, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$8;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 670
    sget-object v3, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 671
    return-void
.end method

.method public startLoading()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 435
    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 437
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    if-eqz v1, :cond_3

    .line 440
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getIssueCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 441
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handleListLoaded()V

    .line 442
    const/4 v0, 0x1

    .line 449
    .local v0, "result":Z
    :goto_0
    if-eqz v0, :cond_3

    .line 467
    .end local v0    # "result":Z
    :cond_0
    :goto_1
    return-void

    .line 443
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getCommentCount()I

    move-result v1

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 444
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->handleListLoaded()V

    .line 445
    const/4 v0, 0x1

    .restart local v0    # "result":Z
    goto :goto_0

    .line 447
    .end local v0    # "result":Z
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "result":Z
    goto :goto_0

    .line 454
    .end local v0    # "result":Z
    :cond_3
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 455
    const/4 v1, 0x0

    iput v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    .line 458
    :cond_4
    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z

    if-nez v1, :cond_0

    .line 459
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->isLoading:Z

    .line 460
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyComments()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadedAllComments:Z

    if-nez v1, :cond_5

    .line 461
    iput v2, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->page:I

    .line 462
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadComments()V

    goto :goto_1

    .line 464
    :cond_5
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->loadIssues()V

    goto :goto_1
.end method

.method public updateComment(Lcom/seeclickfix/ma/android/objects/issue/Comment;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1135
    return-void
.end method

.method public updateFollow(Lcom/seeclickfix/ma/android/objects/issue/Follow;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "follow"    # Lcom/seeclickfix/ma/android/objects/issue/Follow;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1147
    return-void
.end method

.method public updateStatus(Lcom/seeclickfix/ma/android/objects/issue/Transition;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "transition"    # Lcom/seeclickfix/ma/android/objects/issue/Transition;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1151
    return-void
.end method
