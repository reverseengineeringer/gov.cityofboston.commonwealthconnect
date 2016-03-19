.class public Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
.super Landroid/widget/BaseAdapter;
.source "FeedAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;,
        Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;,
        Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;,
        Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;,
        Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;,
        Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;,
        Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ViewTypes;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final MAX_VIEW_TYPES:I = 0x5

.field private static final TAG:Ljava/lang/String; = "FeedAdapter"


# instance fields
.field private activity:Landroid/app/Activity;

.field private applicationContext:Landroid/content/Context;

.field commentBtnListener:Landroid/view/View$OnClickListener;

.field private commentCache:Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

.field private commentCardClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

.field commentCardListener:Landroid/view/View$OnClickListener;

.field private commentIdsMap:Ljava/util/Map;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private commentListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;

.field private feedItemsMap:Ljava/util/Map;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/seeclickfix/ma/android/objects/types/FeedItem;",
            ">;"
        }
    .end annotation
.end field

.field flagClickListener:Landroid/view/View$OnClickListener;

.field private handler:Landroid/os/Handler;

.field private isCommentList:Z

.field private issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

.field issueCardClickListener:Landroid/view/View$OnClickListener;

.field private issueClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

.field private issueIdsMap:Ljava/util/Map;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private issueStarListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

.field private onScrollListener:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

.field private spinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field starClickListener:Landroid/view/View$OnClickListener;

.field private statusListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;

.field private final statusSpinnerFactory:Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;

.field voteClickListener:Landroid/view/View$OnClickListener;

.field private voteListener:Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;

.field zoneBtnListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 123
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 82
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->statusSpinnerFactory:Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    .line 102
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueIdsMap:Ljava/util/Map;

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->isCommentList:Z

    .line 107
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentIdsMap:Ljava/util/Map;

    .line 1010
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->zoneBtnListener:Landroid/view/View$OnClickListener;

    .line 1095
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$3;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentBtnListener:Landroid/view/View$OnClickListener;

    .line 1105
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$4;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$4;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCardListener:Landroid/view/View$OnClickListener;

    .line 1115
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$5;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$5;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->starClickListener:Landroid/view/View$OnClickListener;

    .line 1131
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$6;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$6;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueCardClickListener:Landroid/view/View$OnClickListener;

    .line 1144
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$7;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$7;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->voteClickListener:Landroid/view/View$OnClickListener;

    .line 1156
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$8;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$8;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->flagClickListener:Landroid/view/View$OnClickListener;

    .line 1164
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->spinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 124
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->activity:Landroid/app/Activity;

    .line 126
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    .line 128
    const-string/jumbo v0, "ISSUES"

    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->getInstance(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    .line 129
    invoke-static {}, Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;->getInstance()Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCache:Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

    .line 131
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getImageLoader()Lcom/android/volley/toolbox/ImageLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 132
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;Ljava/lang/String;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Landroid/view/View;

    .prologue
    .line 75
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->dispatchReportUriEvent(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCardClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueStarListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

    return-object v0
.end method

.method static synthetic access$700(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->voteListener:Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;

    return-object v0
.end method

.method static synthetic access$800(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->statusListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;

    return-object v0
.end method

.method private bindViewByType(ILandroid/view/View;I)Landroid/view/View;
    .locals 1
    .param p1, "viewType"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "position"    # I

    .prologue
    .line 465
    packed-switch p1, :pswitch_data_0

    .line 487
    :goto_0
    return-object p2

    .line 467
    :pswitch_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, p2, v0, p3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindIssueView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object p2

    .line 468
    goto :goto_0

    .line 470
    :pswitch_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, p2, v0, p3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindSeparatorView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object p2

    .line 471
    goto :goto_0

    .line 473
    :pswitch_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, p2, v0, p3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindZoneView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object p2

    .line 474
    goto :goto_0

    .line 476
    :pswitch_3
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, p2, v0, p3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindCommentView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object p2

    .line 477
    goto :goto_0

    .line 479
    :pswitch_4
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, p2, v0, p3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindNoticeView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object p2

    .line 480
    goto :goto_0

    .line 465
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private dispatchReportUriEvent(Ljava/lang/String;Landroid/view/View;)V
    .locals 1
    .param p1, "uriString"    # Ljava/lang/String;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 1085
    const-string/jumbo v0, "scf://report"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1086
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$2;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 1093
    :cond_0
    return-void
.end method

.method private getErrorView(Landroid/view/View;Landroid/content/Context;)Landroid/view/View;
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 981
    const v2, 0x7f030055

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {p2, v2, v1}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 984
    .local v0, "errorView":Landroid/view/View;
    return-object v0
.end method

.method private getFeedItemCountOffset(I)I
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 212
    const/4 v2, 0x0

    .line 214
    .local v2, "offset":I
    iget-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 215
    iget-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 216
    .local v1, "key":I
    if-ge v1, p1, :cond_0

    .line 217
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 222
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "key":I
    :cond_1
    return v2
.end method

.method private getURLForIssueImage(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Ljava/lang/String;
    .locals 2
    .param p1, "dto"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 988
    const/4 v0, 0x0

    .line 990
    .local v0, "imgUrl":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoLargeUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 991
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoLargeUrl()Ljava/lang/String;

    move-result-object v0

    .line 1006
    :cond_0
    :goto_0
    return-object v0

    .line 992
    :cond_1
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 993
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 994
    :cond_2
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 995
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private newViewByType(ILandroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0
    .param p1, "viewType"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .param p4, "position"    # I

    .prologue
    .line 439
    packed-switch p1, :pswitch_data_0

    .line 460
    :goto_0
    return-object p2

    .line 441
    :pswitch_0
    invoke-virtual {p0, p3, p4}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->newIssueView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p2

    .line 442
    goto :goto_0

    .line 444
    :pswitch_1
    invoke-virtual {p0, p3, p4}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->newSeparatorView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p2

    .line 445
    goto :goto_0

    .line 447
    :pswitch_2
    invoke-virtual {p0, p3, p4}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->newZoneView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p2

    .line 448
    goto :goto_0

    .line 450
    :pswitch_3
    invoke-virtual {p0, p3, p4}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->newCommentView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p2

    .line 451
    goto :goto_0

    .line 453
    :pswitch_4
    invoke-virtual {p0, p3, p4}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->newNoticeView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p2

    .line 454
    goto :goto_0

    .line 439
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private renderCommentsButton(Landroid/widget/CheckBox;Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 4
    .param p1, "commentsBtn"    # Landroid/widget/CheckBox;
    .param p2, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 899
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCommentCountExcludingActivity()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 901
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    const-string/jumbo v3, "com.seeclickfix.actions.COMMENT"

    invoke-virtual {v2, v3, p2}, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->isActionableIssue(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z

    move-result v0

    .line 902
    .local v0, "actionable":Z
    if-eqz v0, :cond_0

    const v1, -0xbbbbbc

    .line 904
    .local v1, "textColor":I
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 905
    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 907
    invoke-virtual {p1}, Landroid/widget/CheckBox;->refreshDrawableState()V

    .line 908
    return-void

    .line 902
    .end local v1    # "textColor":I
    :cond_0
    const v1, -0x333334

    goto :goto_0
.end method

.method private renderVotesButton(Landroid/widget/CheckBox;Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 5
    .param p1, "votesBtn"    # Landroid/widget/CheckBox;
    .param p2, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 883
    iget-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    const-string/jumbo v4, "com.seeclickfix.actions.VOTE"

    invoke-virtual {v3, v4, p2}, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->isActionableIssue(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z

    move-result v0

    .line 884
    .local v0, "actionable":Z
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->isVotedBefore()Z

    move-result v2

    .line 885
    .local v2, "voted":Z
    if-eqz v0, :cond_0

    const v1, -0xbbbbbc

    .line 887
    .local v1, "textColor":I
    :goto_0
    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 888
    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 889
    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 891
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getRating()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 893
    invoke-virtual {p1}, Landroid/widget/CheckBox;->refreshDrawableState()V

    .line 895
    return-void

    .line 885
    .end local v1    # "textColor":I
    :cond_0
    const v1, -0x333334

    goto :goto_0
.end method

.method private showDisclaimer(Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;)V
    .locals 4
    .param p1, "zoneViewHolder"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;

    .prologue
    .line 727
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 728
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v2

    if-nez v2, :cond_1

    .line 737
    :cond_0
    :goto_0
    return-void

    .line 731
    :cond_1
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getDisclaimerText()Ljava/lang/String;

    move-result-object v1

    .line 732
    .local v1, "disclaimer":Ljava/lang/String;
    invoke-static {v1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 735
    iget-object v2, p1, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->disclaimerTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 736
    iget-object v2, p1, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->disclaimerTextView:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public addFeedItemAt(ILcom/seeclickfix/ma/android/objects/types/FeedItem;)V
    .locals 2
    .param p1, "zeroBasedIndex"    # I
    .param p2, "item"    # Lcom/seeclickfix/ma/android/objects/types/FeedItem;

    .prologue
    .line 186
    if-nez p2, :cond_0

    .line 197
    :goto_0
    return-void

    .line 194
    :cond_0
    invoke-interface {p2, p1}, Lcom/seeclickfix/ma/android/objects/types/FeedItem;->setZeroBasedIndex(I)V

    .line 195
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {p2}, Lcom/seeclickfix/ma/android/objects/types/FeedItem;->getZeroBasedIndex()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public appendCommentsToList(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Comment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1294
    .local p1, "response":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Comment;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 1313
    :cond_0
    return-void

    .line 1298
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getCommentCount()I

    move-result v2

    .line 1300
    .local v2, "start":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    add-int v0, v3, v2

    .line 1303
    .local v0, "end":I
    move v1, v2

    .local v1, "j":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 1305
    iget-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentIdsMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1306
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentIdsMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sub-int v3, v1, v2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getApiID()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1308
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCache:Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

    sub-int v3, v1, v2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getApiID()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sub-int v5, v1, v2

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1303
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public appendFeedItem(Lcom/seeclickfix/ma/android/objects/types/FeedItem;)V
    .locals 1
    .param p1, "item"    # Lcom/seeclickfix/ma/android/objects/types/FeedItem;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->addFeedItemAt(ILcom/seeclickfix/ma/android/objects/types/FeedItem;)V

    .line 182
    return-void
.end method

.method public appendList(Ljava/util/List;)V
    .locals 6
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
    .line 1273
    .local p1, "response":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getIssueCount()I

    move-result v2

    .line 1274
    .local v2, "start":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getIssueCount()I

    move-result v4

    add-int v0, v3, v4

    .line 1277
    .local v0, "end":I
    move v1, v2

    .local v1, "j":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1279
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueIdsMap:Ljava/util/Map;

    sub-int v3, v1, v2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1280
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueIdsMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sub-int v3, v1, v2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1282
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    sub-int v3, v1, v2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sub-int v5, v1, v2

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1277
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1287
    :cond_1
    return-void
.end method

.method public areAllItemsEnabled()Z
    .locals 1

    .prologue
    .line 141
    const/4 v0, 0x0

    return v0
.end method

.method public bindCommentView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;
    .locals 11
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "position"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 914
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;

    .line 915
    .local v3, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;
    invoke-virtual {p0, p3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .line 917
    .local v1, "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    if-nez v1, :cond_0

    .line 974
    :goto_0
    return-object p1

    .line 923
    :cond_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCommentType()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v7, v8}, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->getCommentStatus(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 925
    .local v5, "statusString":Ljava/lang/String;
    const-string/jumbo v7, "NOT_DISPLAYABLE"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 926
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->statusTextView:Landroid/widget/TextView;

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 933
    :goto_1
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->descriptionTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getComment()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 934
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->dateTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCreatedAtShort()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 936
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getName()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 937
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->usernameTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 938
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->usernameTextView:Landroid/widget/TextView;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 943
    :goto_2
    iput-object v1, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->itemObj:Ljava/lang/Object;

    .line 944
    iput p3, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->position:I

    .line 946
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getSquareCommentImagePath()Ljava/lang/String;

    move-result-object v4

    .line 948
    .local v4, "squareImageUrl":Ljava/lang/String;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 956
    :cond_1
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getUser()Lcom/seeclickfix/ma/android/objects/user/User;

    move-result-object v6

    .line 958
    .local v6, "user":Lcom/seeclickfix/ma/android/objects/user/User;
    if-eqz v6, :cond_2

    .line 959
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/user/User;->getAvatarSquareImage()Ljava/lang/String;

    move-result-object v0

    .line 961
    .local v0, "avatarUrl":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 962
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->userIcon:Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    invoke-static {v0, v7, v8}, Lcom/seeclickfix/ma/android/media/icons/IconLoadUtil;->loadIcon(Ljava/lang/String;Landroid/widget/ImageView;Lcom/android/volley/toolbox/ImageLoader;)V

    .line 967
    .end local v0    # "avatarUrl":Ljava/lang/String;
    :cond_2
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCommentType()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v7, v8}, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->getBackground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v2

    .line 968
    .local v2, "headerBgColor":I
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->headerBg:Landroid/view/View;

    invoke-virtual {v7, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 971
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->mainBtn:Landroid/view/ViewGroup;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCardListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 972
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->mainBtn:Landroid/view/ViewGroup;

    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 928
    .end local v2    # "headerBgColor":I
    .end local v4    # "squareImageUrl":Ljava/lang/String;
    .end local v6    # "user":Lcom/seeclickfix/ma/android/objects/user/User;
    :cond_3
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->statusTextView:Landroid/widget/TextView;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 929
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->statusTextView:Landroid/widget/TextView;

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 930
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->statusTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCommentType()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v8, v9}, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->getColorForCommentType(Ljava/lang/String;Landroid/content/Context;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setBackgroundColor(I)V

    goto/16 :goto_1

    .line 940
    :cond_4
    iget-object v7, v3, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->usernameTextView:Landroid/widget/TextView;

    const/4 v8, 0x4

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2
.end method

.method public bindIssueView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;
    .locals 15
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "position"    # I

    .prologue
    .line 748
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;

    .line 750
    .local v2, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;
    move/from16 v0, p3

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 752
    .local v4, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    if-nez v4, :cond_1

    .line 877
    :cond_0
    :goto_0
    return-object p1

    .line 759
    :cond_1
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStateDisplayStrings()Ljava/util/List;

    move-result-object v5

    .line 760
    .local v5, "statusDisplayList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStatusStateKeys()Ljava/util/List;

    move-result-object v8

    .line 763
    .local v8, "statusStateList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    .line 765
    .local v6, "statusPosition":I
    if-ltz v6, :cond_0

    .line 770
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 772
    .local v9, "statusString":Ljava/lang/String;
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 773
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->statusTextView:Landroid/widget/TextView;

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 774
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->statusTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v11

    iget-object v12, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v11, v12}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->getForeground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 775
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->descriptionTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getDescription()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 776
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->dateTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCreatedAtEpoch()J

    move-result-wide v12

    invoke-static {v12, v13}, Lcom/seeclickfix/ma/android/date/DateUtil;->getDateDisplayStringFromMSEpoch(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 777
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->locationTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getAddress()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 779
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getReporterDisplay()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_4

    .line 780
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->usernameTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getReporterDisplay()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 781
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->usernameTextView:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 786
    :goto_1
    iput-object v4, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->itemObj:Ljava/lang/Object;

    .line 787
    move/from16 v0, p3

    iput v0, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->position:I

    .line 789
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->statusContainer:Landroid/view/ViewGroup;

    invoke-virtual {v10}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 791
    iget-object v10, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->statusSpinnerFactory:Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    invoke-virtual {v11}, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->closedIsFinal()Z

    move-result v11

    iget-object v12, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->activity:Landroid/app/Activity;

    invoke-virtual {v10, v4, v11, v12}, Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;->buildSpinner(Lcom/seeclickfix/ma/android/objects/issue/Issue;ZLandroid/content/Context;)Landroid/widget/Spinner;

    move-result-object v7

    .line 792
    .local v7, "statusSpinner":Landroid/widget/Spinner;
    if-eqz v7, :cond_2

    .line 793
    iget-object v10, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->spinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v7, v10}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 794
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->statusContainer:Landroid/view/ViewGroup;

    invoke-virtual {v10, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 797
    :cond_2
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->voteBtn:Landroid/widget/CheckBox;

    invoke-direct {p0, v10, v4}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->renderVotesButton(Landroid/widget/CheckBox;Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 798
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->commentBtn:Landroid/widget/CheckBox;

    invoke-direct {p0, v10, v4}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->renderCommentsButton(Landroid/widget/CheckBox;Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 800
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->isFollowing()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 801
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 802
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 803
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 811
    :goto_2
    invoke-direct {p0, v4}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getURLForIssueImage(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Ljava/lang/String;

    move-result-object v3

    .line 814
    .local v3, "imgURL":Ljava/lang/String;
    if-eqz v3, :cond_6

    const-string/jumbo v10, "no-image"

    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 815
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v10, :cond_3

    .line 816
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v10}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 819
    :cond_3
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 820
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    const v11, 0x7f020150

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 821
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v11

    iget-object v12, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v11, v12}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->getBackground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 866
    :goto_3
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->commentBtn:Landroid/widget/CheckBox;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 867
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->voteBtn:Landroid/widget/CheckBox;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->voteClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 868
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->flagBtn:Landroid/widget/CheckBox;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->flagClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 869
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->starClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 870
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->voteBtn:Landroid/widget/CheckBox;

    invoke-virtual {v10, v4}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 871
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->flagBtn:Landroid/widget/CheckBox;

    invoke-virtual {v10, v4}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 872
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v10, v4}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 873
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->commentBtn:Landroid/widget/CheckBox;

    invoke-virtual {v10, v4}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 874
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->mainBtn:Landroid/view/ViewGroup;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueCardClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 875
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->mainBtn:Landroid/view/ViewGroup;

    invoke-virtual {v10, v4}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 783
    .end local v3    # "imgURL":Ljava/lang/String;
    .end local v7    # "statusSpinner":Landroid/widget/Spinner;
    :cond_4
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->usernameTextView:Landroid/widget/TextView;

    const/4 v11, 0x4

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1

    .line 805
    .restart local v7    # "statusSpinner":Landroid/widget/Spinner;
    :cond_5
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 806
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 807
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setEnabled(Z)V

    goto/16 :goto_2

    .line 822
    .restart local v3    # "imgURL":Ljava/lang/String;
    :cond_6
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_8

    .line 823
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v10, :cond_7

    .line 824
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v10}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 827
    :cond_7
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 828
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v11

    iget-object v12, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v11, v12}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->getBackground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 829
    iget-object v10, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v11

    iget-object v12, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    const v13, 0x7f020158

    const v14, 0x7f020158

    invoke-static {v12, v13, v14}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v12

    const/16 v13, 0x2a8

    const/16 v14, 0x12c

    invoke-virtual {v10, v11, v12, v13, v14}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v10

    iput-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto/16 :goto_3

    .line 839
    :cond_8
    if-eqz v3, :cond_a

    .line 840
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 841
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v11

    iget-object v12, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v11, v12}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->getBackground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 843
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v10, :cond_9

    .line 844
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v10}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 848
    :cond_9
    iget-object v10, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    iget-object v11, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    const v12, 0x7f020158

    const v13, 0x7f020158

    invoke-static {v11, v12, v13}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v11

    const/16 v12, 0x2a8

    const/16 v13, 0x12c

    invoke-virtual {v10, v3, v11, v12, v13}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v10

    iput-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto/16 :goto_3

    .line 861
    :cond_a
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 862
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 863
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    const v11, 0x7f020150

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 864
    iget-object v10, v2, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v11

    iget-object v12, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v11, v12}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->getBackground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    goto/16 :goto_3
.end method

.method public bindNoticeView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "position"    # I

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x0

    .line 579
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;

    .line 580
    .local v0, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 582
    .local v1, "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getTitle()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 583
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->bodyTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getBody()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 585
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getExtra()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 586
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->extraTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 592
    :goto_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getAction()I

    move-result v2

    if-eqz v2, :cond_1

    .line 593
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->actionTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getAction()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 594
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->actionTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getListener()Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 595
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->actionTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 596
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->dividerView:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 602
    :goto_1
    invoke-virtual {p1, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 603
    invoke-virtual {p1, v4}, Landroid/view/View;->setFocusable(Z)V

    .line 604
    invoke-virtual {p1, v4}, Landroid/view/View;->setClickable(Z)V

    .line 605
    return-object p1

    .line 588
    :cond_0
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->extraTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getExtra()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 589
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->extraTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 598
    :cond_1
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->actionTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 599
    iget-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->dividerView:Landroid/view/View;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method public bindSeparatorView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "position"    # I

    .prologue
    const/4 v4, 0x0

    .line 610
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;

    .line 611
    .local v1, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/Separator;

    .line 614
    .local v0, "dataObject":Lcom/seeclickfix/ma/android/objects/Separator;
    iget-object v2, v1, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/Separator;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 616
    iget-object v2, v1, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;->imgView:Landroid/widget/ImageView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 623
    invoke-virtual {p1, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 624
    invoke-virtual {p1, v4}, Landroid/view/View;->setFocusable(Z)V

    .line 625
    invoke-virtual {p1, v4}, Landroid/view/View;->setClickable(Z)V

    .line 626
    return-object p1
.end method

.method public bindZoneView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;
    .locals 11
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "position"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const v10, 0x7f020158

    const/16 v9, 0x8

    .line 633
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;

    .line 634
    .local v5, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    .line 635
    .local v0, "area":Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getLogoURL()Ljava/lang/String;

    move-result-object v6

    .line 636
    .local v6, "logoUrl":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getBackgroundColor()I

    move-result v1

    .line 638
    .local v1, "bgColor":I
    invoke-direct {p0, v5}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->showDisclaimer(Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;)V

    .line 640
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getMobileButtonsWithDefaults()Ljava/util/List;

    move-result-object v2

    .line 659
    .local v2, "btnList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->bgColorContainer:Landroid/view/ViewGroup;

    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    .line 664
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v7, :cond_0

    .line 665
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v7}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 668
    :cond_0
    if-eqz v6, :cond_3

    .line 675
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-nez v7, :cond_2

    .line 677
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    iget-object v8, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->icon:Landroid/widget/ImageView;

    invoke-static {v8, v10, v10}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v8

    invoke-virtual {v7, v6, v8}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v7

    iput-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 694
    :cond_1
    :goto_0
    :try_start_0
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-static {v2, v7}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnListFilter;->convert(Ljava/util/List;Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 696
    .local v3, "customBtnList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    if-eqz v3, :cond_4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_4

    .line 697
    new-instance v4, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-direct {v4, v7, v0, v3}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Ljava/util/List;)V

    .line 698
    .local v4, "gridAdapter":Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->zoneBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v7}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->setZoneButtonListener(Landroid/view/View$OnClickListener;)V

    .line 699
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->gridView:Lcom/seeclickfix/ma/android/views/ResizableGridView;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/seeclickfix/ma/android/views/ResizableGridView;->setVisibility(I)V

    .line 700
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->gridView:Lcom/seeclickfix/ma/android/views/ResizableGridView;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/seeclickfix/ma/android/views/ResizableGridView;->setExpanded(Z)V

    .line 701
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->gridView:Lcom/seeclickfix/ma/android/views/ResizableGridView;

    invoke-virtual {v7, v4}, Lcom/seeclickfix/ma/android/views/ResizableGridView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 715
    .end local v3    # "customBtnList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    .end local v4    # "gridAdapter":Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;
    :goto_1
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 716
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->invalidate()V

    .line 717
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->requestLayout()V

    .line 718
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->descriptionTextView:Landroid/widget/TextView;

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 719
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->descriptionTextView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->invalidate()V

    .line 720
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->descriptionTextView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->requestLayout()V

    .line 722
    return-object p1

    .line 682
    :cond_2
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v7}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v7

    if-eqz v7, :cond_1

    goto :goto_0

    .line 687
    :cond_3
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->icon:Landroid/widget/ImageView;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 688
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->icon:Landroid/widget/ImageView;

    const v8, 0x7f02014e

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 703
    .restart local v3    # "customBtnList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    :cond_4
    :try_start_1
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->gridView:Lcom/seeclickfix/ma/android/views/ResizableGridView;

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Lcom/seeclickfix/ma/android/views/ResizableGridView;->setVisibility(I)V

    .line 704
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->gridView:Lcom/seeclickfix/ma/android/views/ResizableGridView;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/views/ResizableGridView;->invalidate()V

    .line 705
    iget-object v7, v5, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->gridView:Lcom/seeclickfix/ma/android/views/ResizableGridView;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/views/ResizableGridView;->requestLayout()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 709
    .end local v3    # "customBtnList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    :catch_0
    move-exception v7

    goto :goto_1
.end method

.method public containsItem(Lcom/seeclickfix/ma/android/objects/types/FeedItem;)Z
    .locals 1
    .param p1, "item"    # Lcom/seeclickfix/ma/android/objects/types/FeedItem;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getCommentCount()I
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentIdsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getCount()I
    .locals 2

    .prologue
    .line 228
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->isCommentList:Z

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentIdsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 231
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueIdsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0
.end method

.method public getFeedItemCount()I
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getIssueCount()I
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueIdsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 7
    .param p1, "position"    # I

    .prologue
    .line 284
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->onScrollListener:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

    if-eqz v5, :cond_0

    .line 285
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->onScrollListener:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getCount()I

    move-result v6

    invoke-interface {v5, p1, v6}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;->onScrollToPosition(II)V

    .line 288
    :cond_0
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 289
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 317
    :cond_1
    :goto_0
    return-object v0

    .line 292
    :cond_2
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getFeedItemCountOffset(I)I

    move-result v5

    sub-int v4, p1, v5

    .line 294
    .local v4, "offsetPosition":I
    iget-boolean v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->isCommentList:Z

    if-eqz v5, :cond_3

    .line 295
    const/4 v0, 0x0

    .line 296
    .local v0, "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentIdsMap:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 298
    .local v1, "commentId":Ljava/lang/Integer;
    if-eqz v1, :cond_1

    .line 299
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCache:Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;

    invoke-virtual {v5, v1}, Lcom/seeclickfix/ma/android/cache/CommentLruObjectCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .restart local v0    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    goto :goto_0

    .line 303
    .end local v0    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .end local v1    # "commentId":Ljava/lang/Integer;
    :cond_3
    const/4 v3, 0x0

    .line 304
    .local v3, "issueObj":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueIdsMap:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 313
    .local v2, "issueId":Ljava/lang/Integer;
    if-eqz v2, :cond_4

    .line 314
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    invoke-virtual {v5, v2}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "issueObj":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .restart local v3    # "issueObj":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    :cond_4
    move-object v0, v3

    .line 317
    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 1323
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x3

    .line 254
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 255
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    if-eqz v1, :cond_1

    .line 256
    const/4 v0, 0x1

    .line 269
    :cond_0
    :goto_0
    return v0

    .line 257
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    if-eqz v1, :cond_2

    .line 258
    const/4 v0, 0x4

    goto :goto_0

    .line 259
    :cond_2
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/seeclickfix/ma/android/objects/Separator;

    if-eqz v1, :cond_3

    .line 260
    const/4 v0, 0x0

    goto :goto_0

    .line 261
    :cond_3
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    if-nez v1, :cond_0

    .line 264
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "item is of an invalid view type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 266
    :cond_4
    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->isCommentList:Z

    if-nez v1, :cond_0

    .line 269
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 426
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getItemViewType(I)I

    move-result v0

    .line 428
    .local v0, "viewType":I
    if-nez p2, :cond_0

    .line 429
    invoke-direct {p0, v0, p2, p3, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->newViewByType(ILandroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p2

    .line 434
    :goto_0
    return-object p2

    .line 431
    :cond_0
    invoke-direct {p0, v0, p2, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindViewByType(ILandroid/view/View;I)Landroid/view/View;

    move-result-object p2

    goto :goto_0
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 276
    const/4 v0, 0x5

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 136
    const/4 v0, 0x0

    return v0
.end method

.method public isEnabled(I)Z
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 146
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->getItemViewType(I)I

    move-result v1

    .line 148
    .local v1, "viewType":I
    const/4 v0, 0x0

    .line 150
    .local v0, "itemEnabled":Z
    packed-switch v1, :pswitch_data_0

    .line 168
    const/4 v0, 0x0

    .line 172
    :goto_0
    return v0

    .line 152
    :pswitch_0
    const/4 v0, 0x1

    .line 153
    goto :goto_0

    .line 155
    :pswitch_1
    const/4 v0, 0x1

    .line 156
    goto :goto_0

    .line 158
    :pswitch_2
    const/4 v0, 0x0

    .line 159
    goto :goto_0

    .line 161
    :pswitch_3
    const/4 v0, 0x0

    .line 162
    goto :goto_0

    .line 164
    :pswitch_4
    const/4 v0, 0x0

    .line 165
    goto :goto_0

    .line 150
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public newCommentView(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 516
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    const v3, 0x7f030054

    invoke-static {v2, v3, p1}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 517
    .local v1, "v":Landroid/view/View;
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;-><init>()V

    .line 519
    .local v0, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;
    const v2, 0x7f0a014f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->descriptionTextView:Landroid/widget/TextView;

    .line 520
    const v2, 0x7f0a014b

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->icon:Landroid/widget/ImageView;

    .line 521
    const v2, 0x7f0a014d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->userIcon:Landroid/widget/ImageView;

    .line 522
    const v2, 0x7f0a014c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->dateTextView:Landroid/widget/TextView;

    .line 523
    const v2, 0x7f0a014e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->usernameTextView:Landroid/widget/TextView;

    .line 524
    const v2, 0x7f0a0148

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->mainBtn:Landroid/view/ViewGroup;

    .line 525
    const v2, 0x7f0a014a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->statusTextView:Landroid/widget/TextView;

    .line 526
    const v2, 0x7f0a0149

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->headerBg:Landroid/view/View;

    .line 528
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 529
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, v1, v2, p2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindCommentView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object v1

    .line 530
    return-object v1
.end method

.method public newIssueView(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 492
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    const v3, 0x7f030056

    invoke-static {v2, v3, p1}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 493
    .local v1, "v":Landroid/view/View;
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;-><init>()V

    .line 495
    .local v0, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;
    const v2, 0x7f0a0158

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->titleTextView:Landroid/widget/TextView;

    .line 496
    const v2, 0x7f0a0156

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->statusTextView:Landroid/widget/TextView;

    .line 497
    const v2, 0x7f0a015a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->descriptionTextView:Landroid/widget/TextView;

    .line 498
    const v2, 0x7f0a0155

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->icon:Landroid/widget/ImageView;

    .line 500
    const v2, 0x7f0a0153

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->dateTextView:Landroid/widget/TextView;

    .line 501
    const v2, 0x7f0a0159

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->locationTextView:Landroid/widget/TextView;

    .line 502
    const v2, 0x7f0a015c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->commentBtn:Landroid/widget/CheckBox;

    .line 503
    const v2, 0x7f0a015f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->statusContainer:Landroid/view/ViewGroup;

    .line 504
    const v2, 0x7f0a015d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->voteBtn:Landroid/widget/CheckBox;

    .line 505
    const v2, 0x7f0a015e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->flagBtn:Landroid/widget/CheckBox;

    .line 506
    const v2, 0x7f0a0154

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->usernameTextView:Landroid/widget/TextView;

    .line 507
    const v2, 0x7f0a0157

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->starCheckbox:Landroid/widget/CheckBox;

    .line 508
    const v2, 0x7f0a0152

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->mainBtn:Landroid/view/ViewGroup;

    .line 510
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 511
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, v1, v2, p2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindIssueView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object v1

    .line 512
    return-object v1
.end method

.method public newNoticeView(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 564
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    const v3, 0x7f030058

    invoke-static {v2, v3, p1}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 565
    .local v1, "v":Landroid/view/View;
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;-><init>()V

    .line 567
    .local v0, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;
    const v2, 0x7f0a0163

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->titleTextView:Landroid/widget/TextView;

    .line 568
    const v2, 0x7f0a0164

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->bodyTextView:Landroid/widget/TextView;

    .line 569
    const v2, 0x7f0a0167

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->actionTextView:Landroid/widget/TextView;

    .line 570
    const v2, 0x7f0a0165

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->extraTextView:Landroid/widget/TextView;

    .line 571
    const v2, 0x7f0a0166

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->dividerView:Landroid/view/View;

    .line 573
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 574
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, v1, v2, p2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindNoticeView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object v1

    .line 575
    return-object v1
.end method

.method public newSeparatorView(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 535
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    const v3, 0x7f030061

    invoke-static {v2, v3, p1}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 536
    .local v1, "v":Landroid/view/View;
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;-><init>()V

    .line 538
    .local v0, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;
    const v2, 0x7f0a0172

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;->textView:Landroid/widget/TextView;

    .line 539
    const v2, 0x7f0a0171

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;->imgView:Landroid/widget/ImageView;

    .line 541
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 542
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, v1, v2, p2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindSeparatorView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object v1

    .line 543
    return-object v1
.end method

.method public newZoneView(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 548
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    const v3, 0x7f030067

    invoke-static {v2, v3, p1}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 549
    .local v1, "v":Landroid/view/View;
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;-><init>()V

    .line 551
    .local v0, "holder":Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;
    const v2, 0x7f0a0179

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->descriptionTextView:Landroid/widget/TextView;

    .line 552
    const v2, 0x7f0a017a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->disclaimerTextView:Landroid/widget/TextView;

    .line 553
    const v2, 0x7f0a0178

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->titleTextView:Landroid/widget/TextView;

    .line 554
    const v2, 0x7f0a0176

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->icon:Landroid/widget/ImageView;

    .line 555
    const v2, 0x7f0a0175

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->bgColorContainer:Landroid/view/ViewGroup;

    .line 556
    const v2, 0x7f0a017b

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/views/ResizableGridView;

    iput-object v2, v0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->gridView:Lcom/seeclickfix/ma/android/views/ResizableGridView;

    .line 558
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 559
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;

    invoke-virtual {p0, v1, v2, p2}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->bindZoneView(Landroid/view/View;Landroid/content/Context;I)Landroid/view/View;

    move-result-object v1

    .line 560
    return-object v1
.end method

.method public setCommentCardClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;)V
    .locals 0
    .param p1, "commentCardClickListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

    .prologue
    .line 1202
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentCardClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentCardClickListener;

    .line 1203
    return-void
.end method

.method public setCommentClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;)V
    .locals 0
    .param p1, "commentListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;

    .prologue
    .line 1216
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->commentListener:Lcom/seeclickfix/ma/android/fragments/interfaces/CommentBtnClickListener;

    .line 1217
    return-void
.end method

.method public setIsCommentList(Z)V
    .locals 0
    .param p1, "isCommentList"    # Z

    .prologue
    .line 1327
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->isCommentList:Z

    .line 1328
    return-void
.end method

.method public setIssueClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;)V
    .locals 0
    .param p1, "issueClickListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

    .prologue
    .line 1198
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueClickListener:Lcom/seeclickfix/ma/android/fragments/interfaces/IssueClickListener;

    .line 1199
    return-void
.end method

.method public setOnIssueStarClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;)V
    .locals 0
    .param p1, "issueStarListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

    .prologue
    .line 1224
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueStarListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnIssueStarClickListener;

    .line 1225
    return-void
.end method

.method public setOnScrollListener(Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;)V
    .locals 0
    .param p1, "onScrollListener"    # Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

    .prologue
    .line 1228
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->onScrollListener:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$OnScrollListener;

    .line 1229
    return-void
.end method

.method public setOnStatusChangeListener(Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;)V
    .locals 0
    .param p1, "statusListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;

    .prologue
    .line 1220
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->statusListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;

    .line 1221
    return-void
.end method

.method public setPermissionsManager(Lcom/seeclickfix/ma/android/auth/PermissionsManager;)V
    .locals 0
    .param p1, "permissionsManager"    # Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    .prologue
    .line 1332
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    .line 1333
    return-void
.end method

.method public setVoteClickListener(Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;)V
    .locals 0
    .param p1, "voteListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;

    .prologue
    .line 1206
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->voteListener:Lcom/seeclickfix/ma/android/fragments/interfaces/VoteClickListener;

    .line 1207
    return-void
.end method

.method public updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 2
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 1252
    const-string/jumbo v0, "ISSUES"

    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->getInstance(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    .line 1253
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1254
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->notifyDataSetChanged()V

    .line 1255
    return-void
.end method

.method public updateStatusByIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 5
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 1233
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    .line 1236
    .local v0, "hasIssue":Z
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 1237
    .local v1, "i":Ljava/lang/Integer;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->feedItemsMap:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/types/FeedItem;

    .line 1241
    .local v3, "item":Lcom/seeclickfix/ma/android/objects/types/FeedItem;
    instance-of v4, v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    if-eqz v4, :cond_0

    goto :goto_0

    .line 1248
    .end local v1    # "i":Ljava/lang/Integer;
    .end local v3    # "item":Lcom/seeclickfix/ma/android/objects/types/FeedItem;
    :cond_1
    return-void
.end method
