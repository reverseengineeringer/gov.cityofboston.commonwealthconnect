.class public Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;
.super Landroid/widget/BaseAdapter;
.source "IssueListMapAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter$IssueViewHolder;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "IssueListMapAdapter"


# instance fields
.field private c:Landroid/content/Context;

.field private issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

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

.field private issueSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueIdsMap:Ljava/util/Map;

    .line 42
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueSet:Ljava/util/Set;

    .line 46
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->c:Landroid/content/Context;

    .line 47
    const-string/jumbo v0, "ISSUES"

    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->getInstance(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    .line 48
    return-void
.end method


# virtual methods
.method public appendList(Ljava/util/List;)V
    .locals 3
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
    .line 97
    .local p1, "response":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 98
    .local v0, "i":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueSet:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 101
    .end local v0    # "i":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    :cond_0
    return-void
.end method

.method public getAllAsList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueSet:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueIdsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getIssueCount()I
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueIdsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 56
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueIdsMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 130
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "v"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 116
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->c:Landroid/content/Context;

    const v2, 0x7f030056

    invoke-static {v1, v2, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 117
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter$IssueViewHolder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter$IssueViewHolder;-><init>()V

    .line 119
    .local v0, "holder":Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter$IssueViewHolder;
    const v1, 0x7f0a0158

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter$IssueViewHolder;->titleTextView:Landroid/widget/TextView;

    .line 120
    const v1, 0x7f0a015a

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter$IssueViewHolder;->descriptionTextView:Landroid/widget/TextView;

    .line 122
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 124
    return-object p2
.end method

.method public pruneByBounds(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 10
    .param p1, "bounds"    # Lcom/google/android/gms/maps/model/LatLngBounds;

    .prologue
    .line 70
    const/4 v2, 0x0

    .line 72
    .local v2, "issuesRemove":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v4, "pruneList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueSet:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 76
    .local v0, "i":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    new-instance v5, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLat()D

    move-result-wide v6

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLng()D

    move-result-wide v8

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {p1, v5}, Lcom/google/android/gms/maps/model/LatLngBounds;->contains(Lcom/google/android/gms/maps/model/LatLng;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 77
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    add-int/lit8 v2, v2, 0x1

    .line 79
    goto :goto_0

    .line 85
    .end local v0    # "i":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 86
    .local v3, "key":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->issueSet:Ljava/util/Set;

    invoke-interface {v5, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 91
    .end local v3    # "key":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    :cond_2
    return-void
.end method
