.class public Lcom/seeclickfix/ma/android/adapters/MenuAdapter;
.super Landroid/widget/BaseAdapter;
.source "MenuAdapter.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "MenuAdapter"


# instance fields
.field private c:Landroid/content/Context;

.field private container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field private pageParamsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/PageParams;",
            ">;"
        }
    .end annotation
.end field

.field private user:Lcom/seeclickfix/ma/android/objects/user/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    .line 50
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    .line 52
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->getPageParams()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    .line 53
    return-void
.end method

.method private getPageParams()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/PageParams;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getMePageParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v2

    .line 89
    .local v2, "meFragParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getMyReportParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v4

    .line 91
    .local v4, "myReportParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getMyCommentsParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v3

    .line 93
    .local v3, "myCommentsParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getReportParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v7

    .line 95
    .local v7, "reportFragParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getFeedParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    .line 97
    .local v0, "feedFragParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    invoke-static {v8}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getPlacesParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 100
    .local v1, "locationFragParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v6, "paramsList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/PageParams;>;"
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->getPagesFromDb()Ljava/util/List;

    move-result-object v5

    .line 113
    .local v5, "pagesFromDb":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/PageParams;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_0

    .line 114
    invoke-interface {v6, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 120
    :cond_0
    return-object v6
.end method

.method private getPagesFromDb()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/PageParams;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 128
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->getPlaceDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 129
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    const/4 v6, 0x0

    .line 130
    .local v6, "selectedPlaces":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .local v3, "pageParamsDbList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/PageParams;>;"
    :try_start_0
    const-string/jumbo v7, "selected"

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-interface {v0, v7, v8}, Lcom/j256/ormlite/dao/Dao;->queryForEq(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 140
    :goto_0
    if-eqz v6, :cond_1

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_1

    .line 141
    const/4 v5, 0x3

    .line 143
    .local v5, "position":I
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 144
    .local v2, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getApiId()I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_0

    .line 148
    new-instance v4, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 150
    .local v4, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 151
    const-class v7, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v4, v7}, Lcom/seeclickfix/ma/android/objects/PageParams;->setFragClass(Ljava/lang/Class;)V

    .line 152
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "FragmentTags.ISUSE_LIST"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/seeclickfix/ma/android/objects/PageParams;->setTag(Ljava/lang/String;)V

    .line 156
    invoke-virtual {v4, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 157
    const-string/jumbo v7, "place_bundle"

    invoke-virtual {v4, v7}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcelName(Ljava/lang/String;)V

    .line 159
    add-int/lit8 v5, v5, 0x1

    .line 161
    invoke-virtual {v4, v5}, Lcom/seeclickfix/ma/android/objects/PageParams;->setPagePosition(I)V

    .line 163
    invoke-virtual {v4, v9}, Lcom/seeclickfix/ma/android/objects/PageParams;->setSubitem(Z)V

    .line 167
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 170
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    .end local v4    # "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    .end local v5    # "position":I
    :cond_1
    return-object v3

    .line 134
    :catch_0
    move-exception v7

    goto :goto_0
.end method

.method private getPlaceDao()Lcom/j256/ormlite/dao/Dao;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    const/4 v0, 0x0

    .line 72
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    const-class v3, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {v2, v3}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 75
    .local v1, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    :try_start_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getPlaceDao()Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 80
    :goto_0
    return-object v0

    .line 76
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private resetPositions()V
    .locals 3

    .prologue
    .line 223
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 224
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 225
    .local v1, "paramToReset":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->setPagePosition(I)V

    .line 223
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 227
    .end local v1    # "paramToReset":Lcom/seeclickfix/ma/android/objects/PageParams;
    :cond_0
    return-void
.end method


# virtual methods
.method public addItem(Lcom/seeclickfix/ma/android/objects/PageParams;)I
    .locals 2
    .param p1, "params"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 189
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 190
    .local v0, "positionToAddTo":I
    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->setPagePosition(I)V

    .line 192
    iget-object v1, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->notifyDataSetChanged()V

    .line 195
    return v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 293
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 232
    int-to-long v0, p1

    return-wide v0
.end method

.method public getPageParamsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/PageParams;",
            ">;"
        }
    .end annotation

    .prologue
    .line 185
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v8, 0x7f0a005b

    const v7, 0x7f0200f1

    const v6, 0x7f0a005c

    .line 239
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 242
    .local v1, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->isSubitem()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 243
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    const v5, 0x7f030025

    invoke-static {v4, v5, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 244
    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 245
    .local v3, "titleText":Landroid/widget/TextView;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 285
    :goto_0
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 287
    return-object p2

    .line 246
    .end local v3    # "titleText":Landroid/widget/TextView;
    :cond_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->isMe()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 250
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    const v5, 0x7f030024

    invoke-static {v4, v5, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 251
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 252
    .local v0, "icon":Landroid/widget/ImageView;
    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 253
    .restart local v3    # "titleText":Landroid/widget/TextView;
    const v4, 0x7f0a005e

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 255
    .local v2, "subText":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    if-eqz v4, :cond_1

    .line 257
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/user/User;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 258
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 259
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/user/User;->getWittyTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/user/User;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 263
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v4

    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    invoke-virtual {v4, v5, v0, v7}, Lcom/seeclickfix/ma/android/auth/ProfileController;->setUserAvatar(Landroid/content/Context;Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 266
    :cond_1
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 268
    const v4, 0x7f0c00bb

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 270
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getMePageParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 272
    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 276
    .end local v0    # "icon":Landroid/widget/ImageView;
    .end local v2    # "subText":Landroid/widget/TextView;
    .end local v3    # "titleText":Landroid/widget/TextView;
    :cond_2
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->c:Landroid/content/Context;

    const v5, 0x7f030023

    invoke-static {v4, v5, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 277
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 278
    .restart local v0    # "icon":Landroid/widget/ImageView;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getIconResId()I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 280
    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 281
    .restart local v3    # "titleText":Landroid/widget/TextView;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->getPageParams()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    .line 65
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 66
    return-void
.end method

.method public removeItem(Lcom/seeclickfix/ma/android/objects/PageParams;)Ljava/lang/Object;
    .locals 5
    .param p1, "params"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 200
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    .line 202
    .local v2, "nameToRemove":Ljava/lang/String;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 203
    .local v3, "p":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    .line 204
    .local v0, "currentName":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 205
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 206
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->resetPositions()V

    .line 207
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->notifyDataSetChanged()V

    .line 212
    .end local v0    # "currentName":Ljava/lang/String;
    .end local v3    # "p":Lcom/seeclickfix/ma/android/objects/PageParams;
    :goto_0
    return-object v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public setPageParamsList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/PageParams;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p1, "pageParamsList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/PageParams;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->pageParamsList:Ljava/util/List;

    .line 180
    return-void
.end method

.method public setUserProfile(Lcom/seeclickfix/ma/android/objects/user/User;)V
    .locals 0
    .param p1, "user"    # Lcom/seeclickfix/ma/android/objects/user/User;

    .prologue
    .line 298
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    .line 299
    return-void
.end method
