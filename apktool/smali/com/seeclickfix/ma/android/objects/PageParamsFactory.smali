.class public Lcom/seeclickfix/ma/android/objects/PageParamsFactory;
.super Ljava/lang/Object;
.source "PageParamsFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFeedParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 152
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 154
    .local v2, "res":Landroid/content/res/Resources;
    const v3, 0x7f0c0076

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "feedName":Ljava/lang/String;
    new-instance v1, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 156
    .local v1, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 157
    const-class v3, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setFragClass(Ljava/lang/Class;)V

    .line 158
    const-string/jumbo v3, "FragmentTags.FEED"

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setTag(Ljava/lang/String;)V

    .line 159
    const-string/jumbo v3, "place_bundle"

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcelName(Ljava/lang/String;)V

    .line 160
    const v3, 0x7f0200ee

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setIconResId(I)V

    .line 161
    return-object v1
.end method

.method public static getFeedParamsForList(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/String;I)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p2, "actionExtra"    # Ljava/lang/String;
    .param p3, "scrollPosition"    # I

    .prologue
    .line 166
    invoke-static {p0}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getFeedParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    .line 167
    .local v0, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v0, p2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 168
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 169
    invoke-virtual {v0, p3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setScrollPosition(I)V

    .line 172
    return-object v0
.end method

.method public static getMePageParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 121
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 123
    .local v2, "res":Landroid/content/res/Resources;
    const v3, 0x7f0c00bb

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "meName":Ljava/lang/String;
    new-instance v1, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 126
    .local v1, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 127
    const-class v3, Lcom/seeclickfix/ma/android/fragments/MeFrag;

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setFragClass(Ljava/lang/Class;)V

    .line 128
    const-string/jumbo v3, "FragmentTags.ME"

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setTag(Ljava/lang/String;)V

    .line 129
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setMe(Z)V

    .line 130
    const v3, 0x7f0200f1

    invoke-virtual {v1, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setIconResId(I)V

    .line 133
    return-object v1
.end method

.method public static getMyCommentsParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 6
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 84
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 86
    .local v3, "res":Landroid/content/res/Resources;
    const v4, 0x7f0c00d1

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 87
    .local v2, "reportName":Ljava/lang/String;
    new-instance v1, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 89
    .local v1, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 90
    const-class v4, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->setFragClass(Ljava/lang/Class;)V

    .line 91
    const-string/jumbo v4, "FragmentTags:MY_COMMENTS"

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->setTag(Ljava/lang/String;)V

    .line 92
    invoke-virtual {v1, v5}, Lcom/seeclickfix/ma/android/objects/PageParams;->setSubitem(Z)V

    .line 94
    new-instance v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;-><init>()V

    .line 96
    .local v0, "myCommentsPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    const/4 v4, -0x3

    invoke-virtual {v0, v4}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setApiId(I)V

    .line 97
    invoke-virtual {v0, v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setMyComments(Z)V

    .line 98
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 100
    return-object v1
.end method

.method public static getMyReportParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 6
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 60
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 62
    .local v3, "res":Landroid/content/res/Resources;
    const v4, 0x7f0c00d2

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 63
    .local v2, "reportName":Ljava/lang/String;
    new-instance v1, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 65
    .local v1, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 66
    const-class v4, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->setFragClass(Ljava/lang/Class;)V

    .line 67
    const-string/jumbo v4, "FragmentTags:MY_REPORTS"

    invoke-virtual {v1, v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->setTag(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v1, v5}, Lcom/seeclickfix/ma/android/objects/PageParams;->setSubitem(Z)V

    .line 70
    new-instance v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;-><init>()V

    .line 72
    .local v0, "myReportsPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    const/4 v4, -0x2

    invoke-virtual {v0, v4}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setApiId(I)V

    .line 73
    invoke-virtual {v0, v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setMyReports(Z)V

    .line 74
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 76
    return-object v1
.end method

.method public static getPlacesParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 137
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 139
    .local v2, "res":Landroid/content/res/Resources;
    const v3, 0x7f0c0091

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "placesName":Ljava/lang/String;
    new-instance v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 142
    .local v0, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 143
    const-class v3, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setFragClass(Ljava/lang/Class;)V

    .line 144
    const-string/jumbo v3, "FragmentTags.PLACES"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setTag(Ljava/lang/String;)V

    .line 146
    const v3, 0x7f02014b

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setIconResId(I)V

    .line 148
    return-object v0
.end method

.method public static getReportParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 42
    .local v2, "res":Landroid/content/res/Resources;
    const v3, 0x7f0c012a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "reportName":Ljava/lang/String;
    new-instance v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 45
    .local v0, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 46
    const-class v3, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setFragClass(Ljava/lang/Class;)V

    .line 47
    const-string/jumbo v3, "FragmentTags.REPORT"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setTag(Ljava/lang/String;)V

    .line 48
    const-string/jumbo v3, "report_bundle"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcelName(Ljava/lang/String;)V

    .line 50
    const v3, 0x7f02011f

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setIconResId(I)V

    .line 52
    return-object v0
.end method

.method public static getReportParamsWithAction(Landroid/content/Context;Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "actionExtra"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-static {p0}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getReportParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    .line 106
    .local v0, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 108
    return-object v0
.end method

.method public static getReportParamsWithParcel(Landroid/content/Context;Landroid/os/Parcelable;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "p"    # Landroid/os/Parcelable;

    .prologue
    .line 113
    invoke-static {p0}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getReportParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    .line 114
    .local v0, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 116
    return-object v0
.end method

.method public static getResetParams()Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 2

    .prologue
    .line 31
    new-instance v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>()V

    .line 32
    .local v0, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    const-string/jumbo v1, "com.seeclickfix.actions.RESET_PAGER"

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 33
    return-object v0
.end method
