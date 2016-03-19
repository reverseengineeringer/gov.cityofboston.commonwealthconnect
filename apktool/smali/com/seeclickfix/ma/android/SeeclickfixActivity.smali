.class public Lcom/seeclickfix/ma/android/SeeclickfixActivity;
.super Lcom/actionbarsherlock/app/SherlockFragmentActivity;
.source "SeeclickfixActivity.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/IssueListFragInterface;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/CameraLaunchingActivity;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/GalleryLauncher;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/ReportMapLaunchActivity;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/PlaceMapLauncher;
.implements Landroid/support/v4/app/FragmentManager$OnBackStackChangedListener;
.implements Lcom/seeclickfix/ma/android/dagger/GraphProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SeeclickfixActivity"


# instance fields
.field activityGraph:Ldagger/ObjectGraph;

.field private commentUploadListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnCommentUploadListener;

.field private dbUpgradeListener:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;

.field protected fm:Landroid/support/v4/app/FragmentManager;

.field mDrawerContainer:Landroid/widget/RelativeLayout;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0040
    .end annotation
.end field

.field private mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

.field private mDrawerList:Landroid/widget/ListView;

.field mDrawerToggle:Lcom/actionbarsherlock/app/ActionBarDrawerToggle;

.field private mIsBound:Z

.field mLocationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field mLoginOnStartupFlag:Lcom/seeclickfix/ma/android/auth/LoginOnStartupFlag;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

.field mNavBtnAbout:Landroid/widget/Button;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0043
    .end annotation
.end field

.field mNavBtnHelp:Landroid/widget/Button;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0042
    .end annotation
.end field

.field mainPagerBackListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnBackKeyListener;

.field private mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

.field protected myFrag:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

.field private onCaptureCallback:Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;

.field private onReportLocationListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;

.field private paused:Z

.field private placeAddedListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;

.field private placeMapListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;

.field private shouldInit:Z

.field private upgradeHelper:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

.field protected useMultiplePanes:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 139
    invoke-direct {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;-><init>()V

    .line 160
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->fm:Landroid/support/v4/app/FragmentManager;

    .line 165
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->shouldInit:Z

    .line 198
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->paused:Z

    .line 408
    new-instance v0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$2;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->dbUpgradeListener:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;

    .line 1320
    new-instance v0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$5;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$5;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mainPagerBackListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnBackKeyListener;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->clearBackKeyRefs()V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Class;
    .param p3, "x3"    # Landroid/os/Bundle;

    .prologue
    .line 139
    invoke-direct {p0, p1, p2, p3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->isTabletLayout()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->closeDrawer()V

    return-void
.end method

.method static synthetic access$402(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;)Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->upgradeHelper:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    return-object p1
.end method

.method static synthetic access$500(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->start()V

    return-void
.end method

.method static synthetic access$700(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->exitActivity()V

    return-void
.end method

.method private checkIfDeepLinkIntent()Z
    .locals 2

    .prologue
    .line 565
    const/4 v0, 0x0

    .line 567
    .local v0, "isActionIntent":Z
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->isNotificationIntent()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 568
    const/4 v0, 0x1

    .line 573
    :cond_0
    :goto_0
    return v0

    .line 569
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->checkIfShareIntent()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 570
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private checkIfShareIntent()Z
    .locals 14

    .prologue
    .line 606
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 608
    .local v3, "intent":Landroid/content/Intent;
    if-nez v3, :cond_0

    .line 609
    const/4 v11, 0x0

    .line 686
    :goto_0
    return v11

    .line 612
    :cond_0
    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 613
    .local v2, "extras":Landroid/os/Bundle;
    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 617
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v11, "android.intent.action.SEND"

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 620
    const-string/jumbo v11, "android.intent.extra.STREAM"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 624
    :try_start_0
    const-string/jumbo v11, "android.intent.extra.STREAM"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v9

    check-cast v9, Landroid/net/Uri;

    .line 627
    .local v9, "uri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v11

    iput-object v11, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->fm:Landroid/support/v4/app/FragmentManager;

    .line 629
    const/4 v7, 0x0

    .line 631
    .local v7, "rf":Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    iget-object v11, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->fm:Landroid/support/v4/app/FragmentManager;

    const-string/jumbo v12, "FragmentTags.REPORT"

    invoke-virtual {v11, v12}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v7

    .end local v7    # "rf":Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    check-cast v7, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .line 633
    .restart local v7    # "rf":Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8}, Landroid/content/Intent;-><init>()V

    .line 635
    .local v8, "shareIntent":Landroid/content/Intent;
    invoke-virtual {v8, v9}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 637
    if-nez v7, :cond_1

    .line 638
    const-string/jumbo v11, "FragmentTags.REPORT"

    const-class v12, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    const-string/jumbo v13, "shared_img_uri"

    invoke-direct {p0, v13, v9}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->toBundle(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;

    move-result-object v13

    invoke-direct {p0, v11, v12, v13}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v7

    .end local v7    # "rf":Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    check-cast v7, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .line 641
    .restart local v7    # "rf":Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    :cond_1
    invoke-virtual {v7, v8}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->onImageCallback(Landroid/content/Intent;)V

    .line 643
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setIntent(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 645
    const/4 v11, 0x1

    goto :goto_0

    .line 651
    .end local v7    # "rf":Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    .end local v8    # "shareIntent":Landroid/content/Intent;
    .end local v9    # "uri":Landroid/net/Uri;
    :cond_2
    const-string/jumbo v11, "android.intent.extra.TEXT"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 652
    const/4 v11, 0x0

    goto :goto_0

    .line 658
    :cond_3
    :try_start_1
    invoke-virtual {v3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v10

    .line 662
    .local v10, "url":Ljava/lang/String;
    new-instance v5, Lcom/seeclickfix/ma/android/util/IssueUri;

    invoke-direct {v5}, Lcom/seeclickfix/ma/android/util/IssueUri;-><init>()V

    .line 663
    .local v5, "issueUriParser":Lcom/seeclickfix/ma/android/util/IssueUri;
    invoke-virtual {v5, v10}, Lcom/seeclickfix/ma/android/util/IssueUri;->getId(Ljava/lang/String;)I

    move-result v4

    .line 667
    .local v4, "issueId":I
    if-lez v4, :cond_4

    .line 668
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 669
    .local v1, "b":Landroid/os/Bundle;
    const-string/jumbo v11, "issue_id"

    invoke-virtual {v1, v11, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 670
    invoke-virtual {v5, v10}, Lcom/seeclickfix/ma/android/util/IssueUri;->getUrlParams(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v6

    .line 671
    .local v6, "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v11, "url_params_map"

    invoke-virtual {v1, v11, v6}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 673
    const-string/jumbo v11, "FragmentTags.ISSUE_DETAIL"

    const-class v12, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0, v11, v12, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 675
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setIntent(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 677
    const/4 v11, 0x1

    goto/16 :goto_0

    .line 680
    .end local v1    # "b":Landroid/os/Bundle;
    .end local v4    # "issueId":I
    .end local v5    # "issueUriParser":Lcom/seeclickfix/ma/android/util/IssueUri;
    .end local v6    # "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "url":Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 686
    :cond_4
    :goto_1
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 647
    :catch_1
    move-exception v11

    goto :goto_1
.end method

.method private clearBackKeyRefs()V
    .locals 1

    .prologue
    .line 1303
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    .line 1304
    return-void
.end method

.method private closeDrawer()V
    .locals 2

    .prologue
    .line 973
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->isTabletLayout()Z

    move-result v0

    if-nez v0, :cond_0

    .line 974
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(Landroid/view/View;)V

    .line 976
    :cond_0
    return-void
.end method

.method private exitActivity()V
    .locals 0

    .prologue
    .line 1349
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->finish()V

    .line 1350
    return-void
.end method

.method private getActiveFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
    .locals 4

    .prologue
    .line 1336
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v2

    if-nez v2, :cond_0

    .line 1337
    const/4 v0, 0x0

    .line 1344
    :goto_0
    return-object v0

    .line 1339
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryAt(I)Landroid/support/v4/app/FragmentManager$BackStackEntry;

    move-result-object v2

    invoke-interface {v2}, Landroid/support/v4/app/FragmentManager$BackStackEntry;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1342
    .local v1, "tag":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    .line 1344
    .local v0, "f":Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
    goto :goto_0
.end method

.method private handleIssueDetailClick(Ljava/lang/Object;)V
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1074
    instance-of v1, p1, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    if-eqz v1, :cond_1

    .line 1075
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1076
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v1, "issue_bundle"

    check-cast p1, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1077
    const-string/jumbo v1, "FragmentTags.ISSUE_DETAIL"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0, v1, v2, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1087
    .end local v0    # "b":Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    .line 1078
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v1, p1, Ljava/lang/Integer;

    if-eqz v1, :cond_0

    .line 1079
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1080
    .restart local v0    # "b":Landroid/os/Bundle;
    const-string/jumbo v1, "issue_id"

    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1081
    const-string/jumbo v1, "FragmentTags.ISSUE_DETAIL"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0, v1, v2, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    goto :goto_0
.end method

.method private initFrags()V
    .locals 6

    .prologue
    .line 692
    const-string/jumbo v3, "Pref:HAS_UNBOXED"

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getBoolean(Ljava/lang/String;ZLandroid/content/Context;)Z

    move-result v1

    .line 693
    .local v1, "hasUnboxed":Z
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->isDedicatedApp(Landroid/content/Context;)Z

    move-result v2

    .line 694
    .local v2, "isDedicated":Z
    if-nez v1, :cond_0

    if-nez v2, :cond_0

    .line 695
    const/4 v3, 0x0

    const-class v4, Lcom/seeclickfix/ma/android/fragments/UnboxingPagerFrag;

    invoke-direct {p0, v3, v4}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    .line 696
    const-string/jumbo v3, "Pref:HAS_UNBOXED"

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putBoolean(Ljava/lang/String;ZLandroid/content/Context;)V

    .line 707
    :goto_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 708
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0, p0}, Landroid/support/v4/app/FragmentManager;->addOnBackStackChangedListener(Landroid/support/v4/app/FragmentManager$OnBackStackChangedListener;)V

    .line 709
    return-void

    .line 697
    .end local v0    # "fm":Landroid/support/v4/app/FragmentManager;
    :cond_0
    if-eqz v2, :cond_1

    .line 699
    const-string/jumbo v3, "FragmentTags:SPLASH"

    const-class v4, Lcom/seeclickfix/ma/android/fragments/SplashFrag;

    invoke-direct {p0, v3, v4}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFragAndForget(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    goto :goto_0

    .line 703
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showDefaultFragNoHistory()V

    goto :goto_0
.end method

.method private instantiateNewFrag(Ljava/lang/Class;)Lcom/actionbarsherlock/app/SherlockFragment;
    .locals 3
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 900
    const/4 v1, 0x0

    .line 903
    .local v1, "f":Lcom/actionbarsherlock/app/SherlockFragment;
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/actionbarsherlock/app/SherlockFragment;

    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 909
    :goto_0
    return-object v1

    .line 906
    :catch_0
    move-exception v2

    goto :goto_0

    .line 904
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method private isNotificationIntent()Z
    .locals 7

    .prologue
    .line 578
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 580
    .local v3, "intent":Landroid/content/Intent;
    if-eqz v3, :cond_0

    .line 581
    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 582
    .local v2, "extras":Landroid/os/Bundle;
    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 584
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v5, "com.seeclickfix.actions.ISSUE_DETAIL_NOTIF"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 587
    const-string/jumbo v5, "issue_bundle"

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 588
    .local v4, "notifIssue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 589
    .local v1, "b":Landroid/os/Bundle;
    const-string/jumbo v5, "issue_bundle"

    invoke-virtual {v1, v5, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 590
    const-string/jumbo v5, "action_extra"

    const-string/jumbo v6, "com.seeclickfix.actions.ISSUE_DETAIL_NOTIF"

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    const-string/jumbo v5, "FragmentTags.ISSUE_DETAIL"

    const-class v6, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0, v5, v6, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 593
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "android.intent.action.VIEW"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 595
    const/4 v5, 0x1

    .line 599
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "b":Landroid/os/Bundle;
    .end local v2    # "extras":Landroid/os/Bundle;
    .end local v4    # "notifIssue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    :goto_0
    return v5

    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private isTabletLayout()Z
    .locals 2

    .prologue
    .line 521
    const v1, 0x7f0a003e

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 523
    .local v0, "layout":Landroid/view/View;
    instance-of v1, v0, Landroid/support/v4/widget/DrawerLayout;

    if-eqz v1, :cond_0

    .line 526
    const/4 v1, 0x0

    .line 529
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private loadCityData()V
    .locals 3

    .prologue
    .line 467
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 468
    .local v0, "startCityLoadIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/seeclickfix/ma/android/services/CityLoadingService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 470
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 472
    return-void
.end method

.method private registerOnEventBus()V
    .locals 1

    .prologue
    .line 455
    :try_start_0
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/squareup/otto/Bus;->register(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 462
    :goto_0
    return-void

    .line 456
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private setImageOnCallbackFrag(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1189
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->shouldInit:Z

    .line 1194
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onCaptureCallback:Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;

    invoke-interface {v0, p3}, Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;->onImageCallback(Landroid/content/Intent;)V

    .line 1196
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onCaptureCallback:Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1203
    :goto_0
    return-void

    .line 1197
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private setupActionBar()V
    .locals 9

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 537
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v4

    .line 538
    .local v4, "sherlockbBar":Lcom/actionbarsherlock/app/ActionBar;
    invoke-virtual {v4, v6}, Lcom/actionbarsherlock/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 539
    invoke-virtual {v4, v5}, Lcom/actionbarsherlock/app/ActionBar;->setDisplayUseLogoEnabled(Z)V

    .line 541
    const v5, 0x7f0200f2

    invoke-virtual {v4, v5}, Lcom/actionbarsherlock/app/ActionBar;->setIcon(I)V

    .line 542
    invoke-virtual {v4, v6}, Lcom/actionbarsherlock/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 544
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020070

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 545
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v4, v0}, Lcom/actionbarsherlock/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 549
    :try_start_0
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v5

    const-string/jumbo v6, "home"

    const-string/jumbo v7, "id"

    const-string/jumbo v8, "android"

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 550
    .local v3, "logoId":I
    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 551
    .local v1, "icon":Landroid/widget/ImageView;
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 552
    .local v2, "iconLp":Landroid/widget/FrameLayout$LayoutParams;
    const/4 v5, 0x0

    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 553
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 561
    .end local v1    # "icon":Landroid/widget/ImageView;
    .end local v2    # "iconLp":Landroid/widget/FrameLayout$LayoutParams;
    .end local v3    # "logoId":I
    :goto_0
    return-void

    .line 554
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method private setupSideDrawer()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    const v2, 0x7f0a0044

    .line 478
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v3

    .line 480
    .local v3, "sherlockbBar":Lcom/actionbarsherlock/app/ActionBar;
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->isTabletLayout()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 481
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 482
    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerList:Landroid/widget/ListView;

    .line 484
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    .line 485
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 486
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerList:Landroid/widget/ListView;

    new-instance v1, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;

    invoke-direct {v1, p0, v4}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 517
    :goto_0
    return-void

    .line 488
    :cond_0
    const v0, 0x7f0a003e

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 489
    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerList:Landroid/widget/ListView;

    .line 491
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    .line 492
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 495
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerList:Landroid/widget/ListView;

    new-instance v1, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;

    invoke-direct {v1, p0, v4}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 497
    new-instance v0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$3;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v5, 0x7f020105

    const v6, 0x7f0c0052

    const v7, 0x7f0c0051

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$3;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Landroid/app/Activity;Lcom/actionbarsherlock/app/ActionBar;Landroid/support/v4/widget/DrawerLayout;III)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerToggle:Lcom/actionbarsherlock/app/ActionBarDrawerToggle;

    .line 514
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerToggle:Lcom/actionbarsherlock/app/ActionBarDrawerToggle;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    goto :goto_0
.end method

.method private showAccountFrag()V
    .locals 4

    .prologue
    .line 1141
    invoke-static {p0}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getMePageParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 1142
    .local v1, "meFragParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1143
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "page_params"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1144
    const-string/jumbo v2, "FragmentTags.ME"

    const-class v3, Lcom/seeclickfix/ma/android/fragments/MeFrag;

    invoke-direct {p0, v2, v3, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1145
    return-void
.end method

.method private showDefaultFrag()V
    .locals 1

    .prologue
    .line 740
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showDefaultFrag(Ljava/lang/Boolean;)V

    .line 741
    return-void
.end method

.method private showDefaultFrag(Ljava/lang/Boolean;)V
    .locals 5
    .param p1, "rememberTransition"    # Ljava/lang/Boolean;

    .prologue
    .line 718
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getFeedParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 720
    .local v1, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 722
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mLoginOnStartupFlag:Lcom/seeclickfix/ma/android/auth/LoginOnStartupFlag;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/auth/LoginOnStartupFlag;->shouldPromptForLogin(Lcom/seeclickfix/ma/android/objects/DedicatedApp;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 723
    const-string/jumbo v2, "com.seeclickfix.actions.STARTUP_LOGIN_PROMPT"

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 724
    new-instance v2, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;

    invoke-direct {v2, v1}, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;-><init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->postEvent(Ljava/lang/Object;)V

    .line 729
    :goto_0
    return-void

    .line 726
    :cond_0
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->clearAuthCompleteParams()V

    .line 727
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getTag()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    const-string/jumbo v4, "page_params"

    invoke-direct {p0, v4, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->toBundle(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;

    move-result-object v4

    invoke-direct {p0, v2, v3, v4, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/Boolean;)Landroid/support/v4/app/Fragment;

    goto :goto_0
.end method

.method private showDefaultFragNoHistory()V
    .locals 1

    .prologue
    .line 736
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showDefaultFrag(Ljava/lang/Boolean;)V

    .line 737
    return-void
.end method

.method private showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/actionbarsherlock/app/SherlockFragment;",
            ">;)",
            "Landroid/support/v4/app/Fragment;"
        }
    .end annotation

    .prologue
    .line 894
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/actionbarsherlock/app/SherlockFragment;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/Boolean;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method private showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;
    .param p3, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/actionbarsherlock/app/SherlockFragment;",
            ">;",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/app/Fragment;"
        }
    .end annotation

    .prologue
    .line 869
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/actionbarsherlock/app/SherlockFragment;>;"
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/Boolean;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method private showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/Boolean;)Landroid/support/v4/app/Fragment;
    .locals 3
    .param p1, "tag"    # Ljava/lang/String;
    .param p3, "bundle"    # Landroid/os/Bundle;
    .param p4, "rememberTransition"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/actionbarsherlock/app/SherlockFragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Ljava/lang/Boolean;",
            ")",
            "Landroid/support/v4/app/Fragment;"
        }
    .end annotation

    .prologue
    .line 831
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/actionbarsherlock/app/SherlockFragment;>;"
    if-nez p3, :cond_0

    new-instance p3, Landroid/os/Bundle;

    .end local p3    # "bundle":Landroid/os/Bundle;
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 833
    .restart local p3    # "bundle":Landroid/os/Bundle;
    :cond_0
    invoke-direct {p0, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->instantiateNewFrag(Ljava/lang/Class;)Lcom/actionbarsherlock/app/SherlockFragment;

    move-result-object v0

    .line 834
    .local v0, "f":Lcom/actionbarsherlock/app/SherlockFragment;
    invoke-virtual {v0, p3}, Lcom/actionbarsherlock/app/SherlockFragment;->setArguments(Landroid/os/Bundle;)V

    .line 836
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->fm:Landroid/support/v4/app/FragmentManager;

    .line 838
    invoke-virtual {v0}, Lcom/actionbarsherlock/app/SherlockFragment;->isVisible()Z

    move-result v2

    if-nez v2, :cond_2

    .line 839
    iget-object v2, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->fm:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 840
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/anim/Transitions;->setFragTransAnim(Landroid/support/v4/app/FragmentTransaction;)V

    .line 842
    if-nez p1, :cond_3

    .line 843
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->disallowAddToBackStack()Landroid/support/v4/app/FragmentTransaction;

    .line 850
    :cond_1
    :goto_0
    const v2, 0x7f0a003f

    invoke-virtual {v1, v2, v0, p1}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 851
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 855
    .end local v1    # "ft":Landroid/support/v4/app/FragmentTransaction;
    :cond_2
    return-object v0

    .line 845
    .restart local v1    # "ft":Landroid/support/v4/app/FragmentTransaction;
    :cond_3
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->isAddToBackStackAllowed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 846
    invoke-virtual {v1, p1}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_0
.end method

.method private showFragAndForget(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/actionbarsherlock/app/SherlockFragment;",
            ">;)",
            "Landroid/support/v4/app/Fragment;"
        }
    .end annotation

    .prologue
    .line 882
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/actionbarsherlock/app/SherlockFragment;>;"
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/Boolean;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method private showImageViewer(Lcom/seeclickfix/ma/android/objects/media/ImageParcel;)V
    .locals 3
    .param p1, "parcel"    # Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    .prologue
    .line 1159
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1160
    .local v0, "imgViewerBundle":Landroid/os/Bundle;
    const-string/jumbo v1, "IMAGE_PARCEL"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1161
    const-string/jumbo v1, "FragmentTags:IMAGE_VIEWER"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/ImageViewerFrag;

    invoke-direct {p0, v1, v2, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1162
    return-void
.end method

.method private showIssueDetailFrag(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V
    .locals 3
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "action"    # Ljava/lang/String;

    .prologue
    .line 1126
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1127
    .local v0, "issueBundle":Landroid/os/Bundle;
    const-string/jumbo v1, "issue_bundle"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1128
    const-string/jumbo v1, "action_extra"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1130
    const-string/jumbo v1, "FragmentTags.ISSUE_DETAIL"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0, v1, v2, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1131
    return-void
.end method

.method private showIssueDetailsMap(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 3
    .param p1, "parcel"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 1135
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1136
    .local v0, "issueParcel":Landroid/os/Bundle;
    const-string/jumbo v1, "issue_bundle"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1137
    const-string/jumbo v1, "FragmentTags:ISSUE_DETAILS_MAP"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;

    invoke-direct {p0, v1, v2, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1138
    return-void
.end method

.method private showIssuesMapFrag(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 3
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1119
    const-string/jumbo v1, "place_bundle"

    invoke-static {v1, p1}, Lcom/seeclickfix/ma/android/objects/BundleFactory;->createFromParcel(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;

    move-result-object v0

    .line 1121
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "FragmentTags.MAP"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0, v1, v2, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1122
    return-void
.end method

.method private showLocationFrag()V
    .locals 2

    .prologue
    .line 1149
    const-string/jumbo v0, "FragmentTags.PLACES"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0, v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    .line 1150
    return-void
.end method

.method private showPlaceChooserMapFrag()V
    .locals 2

    .prologue
    .line 1154
    const-string/jumbo v0, "FragmentTags.PLACES_MAP"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    invoke-direct {p0, v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    .line 1155
    return-void
.end method

.method private showReportFrag()V
    .locals 4

    .prologue
    .line 1166
    invoke-static {p0}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getReportParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 1168
    .local v1, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1169
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "page_params"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1171
    const-string/jumbo v2, "FragmentTags.REPORT"

    const-class v3, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0, v2, v3, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1172
    return-void
.end method

.method private showReportFragBlank()V
    .locals 4

    .prologue
    .line 1175
    invoke-static {p0}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getReportParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 1176
    .local v1, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    const-string/jumbo v2, "com.seeclickfix.actions.NEW_REPORT"

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 1178
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1179
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "page_params"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1181
    const-string/jumbo v2, "FragmentTags.REPORT"

    const-class v3, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0, v2, v3, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1182
    return-void
.end method

.method private start()V
    .locals 3

    .prologue
    .line 422
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->paused:Z

    if-eqz v0, :cond_1

    .line 451
    :cond_0
    :goto_0
    return-void

    .line 427
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setupSideDrawer()V

    .line 428
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->loadCityData()V

    .line 431
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->isTabletLayout()Z

    move-result v0

    if-nez v0, :cond_2

    .line 432
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerToggle:Lcom/actionbarsherlock/app/ActionBarDrawerToggle;

    invoke-virtual {v0}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->syncState()V

    .line 435
    :cond_2
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->registerOnEventBus()V

    .line 437
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->checkIfDeepLinkIntent()Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->shouldInit:Z

    if-eqz v0, :cond_3

    .line 438
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->initFrags()V

    .line 444
    :goto_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mLocationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startUpdates()V

    .line 446
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 447
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v0

    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/auth/ProfileController;->loadUserProfile(Lcom/seeclickfix/ma/android/objects/user/AuthUser;Landroid/content/Context;)V

    goto :goto_0

    .line 440
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->shouldInit:Z

    goto :goto_1
.end method

.method private toBundle(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;
    .locals 1
    .param p1, "parcelKey"    # Ljava/lang/String;
    .param p2, "parcel"    # Landroid/os/Parcelable;

    .prologue
    .line 814
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 815
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 816
    return-object v0
.end method


# virtual methods
.method public getActivityModules()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 202
    .local v0, "modules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/ContextModule;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/seeclickfix/ma/android/objects/modules/ContextModule;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v1, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    return-object v0
.end method

.method public getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;
    .locals 1

    .prologue
    .line 748
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;

    move-result-object v0

    return-object v0
.end method

.method public getObjectGraph()Ldagger/ObjectGraph;
    .locals 2

    .prologue
    .line 1421
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getObjectGraph()Ldagger/ObjectGraph;

    move-result-object v0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getActivityModules()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ldagger/ObjectGraph;->plus([Ljava/lang/Object;)Ldagger/ObjectGraph;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->activityGraph:Ldagger/ObjectGraph;

    .line 1423
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->activityGraph:Ldagger/ObjectGraph;

    return-object v0
.end method

.method public getPlaceAddedListener()Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;
    .locals 1

    .prologue
    .line 1268
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->placeAddedListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;

    return-object v0
.end method

.method public getReportModel()Lcom/seeclickfix/ma/android/ReportModel;
    .locals 1

    .prologue
    .line 744
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getReportModel()Lcom/seeclickfix/ma/android/ReportModel;

    move-result-object v0

    return-object v0
.end method

.method public launchCameraWithCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Landroid/content/Intent;)V
    .locals 1
    .param p1, "callback"    # Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;
    .param p2, "takePictureIntent"    # Landroid/content/Intent;

    .prologue
    .line 1309
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onCaptureCallback:Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;

    .line 1310
    const/16 v0, 0x6c1

    invoke-virtual {p0, p2, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1311
    return-void
.end method

.method public launchGalleryForCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Landroid/content/Intent;)V
    .locals 1
    .param p1, "onCaptureCallback"    # Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;
    .param p2, "i"    # Landroid/content/Intent;

    .prologue
    .line 1230
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onCaptureCallback:Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;

    .line 1232
    const/16 v0, 0x708

    invoke-virtual {p0, p2, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1233
    return-void
.end method

.method public launchPlacesMap(Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 4
    .param p1, "placeMapListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;
    .param p2, "pageParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 1247
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->placeMapListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;

    .line 1250
    const-string/jumbo v1, "FragmentTags.PLACES_MAP"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    const-string/jumbo v3, "page_params"

    invoke-direct {p0, v3, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->toBundle(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1251
    .local v0, "placeMapFrag":Landroid/support/v4/app/Fragment;
    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    .end local v0    # "placeMapFrag":Landroid/support/v4/app/Fragment;
    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    .line 1252
    return-void
.end method

.method public launchReportMap(Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 4
    .param p1, "onReportLocationListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;
    .param p2, "pageParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 1238
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onReportLocationListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;

    .line 1241
    const-string/jumbo v1, "FragmentTags.REPORT_MAP"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    const-string/jumbo v3, "page_params"

    invoke-direct {p0, v3, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->toBundle(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1242
    .local v0, "mapFrag":Landroid/support/v4/app/Fragment;
    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    .end local v0    # "mapFrag":Landroid/support/v4/app/Fragment;
    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    .line 1243
    return-void
.end method

.method public notifyUser(I)V
    .locals 0
    .param p1, "message"    # I

    .prologue
    .line 1070
    invoke-static {p0, p1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredLong(Landroid/content/Context;I)V

    .line 1071
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v1, -0x1

    .line 1097
    const/16 v0, 0x6c1

    if-ne p1, v0, :cond_1

    if-ne p2, v1, :cond_1

    .line 1099
    invoke-direct {p0, p1, p2, p3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setImageOnCallbackFrag(IILandroid/content/Intent;)V

    .line 1104
    :cond_0
    :goto_0
    return-void

    .line 1100
    :cond_1
    const/16 v0, 0x708

    if-ne p1, v0, :cond_0

    if-ne p2, v1, :cond_0

    .line 1102
    invoke-direct {p0, p1, p2, p3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setImageOnCallbackFrag(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onAuthRequiredEvent(Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;)V
    .locals 4
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 1382
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;->getParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 1384
    .local v1, "onReturnParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1386
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "page_params"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1388
    const-string/jumbo v2, "FragmentTags.LOGIN"

    const-class v3, Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-direct {p0, v2, v3, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 1390
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    .line 1433
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "FragmentTags.LOGIN"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/OnBackKeyListener;

    .line 1435
    .local v0, "fragment":Lcom/seeclickfix/ma/android/fragments/interfaces/OnBackKeyListener;
    if-eqz v0, :cond_0

    move-object v1, v0

    check-cast v1, Landroid/support/v4/app/Fragment;

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnBackKeyListener;->willHandleBackKey()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1436
    invoke-interface {v0}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnBackKeyListener;->onBackKey()Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 1438
    :cond_0
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onBackPressed()V

    .line 1439
    return-void
.end method

.method public onBackStackChanged()V
    .locals 1

    .prologue
    .line 1316
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getActiveFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    move-result-object v0

    .line 1318
    .local v0, "f":Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
    return-void
.end method

.method public onClickButton(ILjava/lang/Object;)V
    .locals 2
    .param p1, "which"    # I
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1005
    packed-switch p1, :pswitch_data_0

    .line 1046
    .end local p2    # "obj":Ljava/lang/Object;
    :goto_0
    :pswitch_0
    return-void

    .line 1007
    .restart local p2    # "obj":Ljava/lang/Object;
    :pswitch_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->initFrags()V

    goto :goto_0

    .line 1010
    :pswitch_2
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showReportFrag()V

    goto :goto_0

    .line 1013
    :pswitch_3
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showReportFragBlank()V

    goto :goto_0

    .line 1016
    :pswitch_4
    check-cast p2, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .end local p2    # "obj":Ljava/lang/Object;
    invoke-direct {p0, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showIssuesMapFrag(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    goto :goto_0

    .line 1019
    .restart local p2    # "obj":Ljava/lang/Object;
    :pswitch_5
    const-string/jumbo v0, "FragmentTags.LOGIN"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-direct {p0, v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    goto :goto_0

    .line 1022
    :pswitch_6
    const-string/jumbo v0, "FragmentTags.REGISTER"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-direct {p0, v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    goto :goto_0

    .line 1025
    :pswitch_7
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showLocationFrag()V

    goto :goto_0

    .line 1028
    :pswitch_8
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showPlaceChooserMapFrag()V

    goto :goto_0

    .line 1031
    :pswitch_9
    check-cast p2, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    .end local p2    # "obj":Ljava/lang/Object;
    invoke-direct {p0, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showImageViewer(Lcom/seeclickfix/ma/android/objects/media/ImageParcel;)V

    goto :goto_0

    .line 1034
    .restart local p2    # "obj":Ljava/lang/Object;
    :pswitch_a
    check-cast p2, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .end local p2    # "obj":Ljava/lang/Object;
    invoke-direct {p0, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showIssueDetailsMap(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    goto :goto_0

    .line 1037
    .restart local p2    # "obj":Ljava/lang/Object;
    :pswitch_b
    invoke-direct {p0, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->handleIssueDetailClick(Ljava/lang/Object;)V

    goto :goto_0

    .line 1005
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_2
        :pswitch_0
        :pswitch_b
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    const v4, 0x7f030015

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 210
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 212
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getObjectGraph()Ldagger/ObjectGraph;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->activityGraph:Ldagger/ObjectGraph;

    .line 213
    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->activityGraph:Ldagger/ObjectGraph;

    invoke-virtual {v1, p0}, Ldagger/ObjectGraph;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    invoke-static {p0}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->getDisplayMetrics(Landroid/app/Activity;)Landroid/util/DisplayMetrics;

    .line 216
    invoke-static {p0}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->logDisplayMetrics(Landroid/app/Activity;)V

    .line 218
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->requestWindowFeature(I)Z

    .line 219
    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 220
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v0

    .line 222
    .local v0, "sherlockbBar":Lcom/actionbarsherlock/app/ActionBar;
    const v1, 0x7f0200f2

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setIcon(I)V

    .line 223
    invoke-virtual {v0, v2}, Lcom/actionbarsherlock/app/ActionBar;->setDisplayUseLogoEnabled(Z)V

    .line 224
    invoke-virtual {v0, v3}, Lcom/actionbarsherlock/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 225
    invoke-virtual {v0, v3}, Lcom/actionbarsherlock/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 226
    invoke-virtual {v0, v3}, Lcom/actionbarsherlock/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 228
    if-eqz p1, :cond_0

    .line 229
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->shouldInit:Z

    .line 230
    invoke-virtual {p0, v4}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setContentView(I)V

    .line 235
    :goto_0
    invoke-virtual {v0}, Lcom/actionbarsherlock/app/ActionBar;->hide()V

    .line 237
    invoke-static {p0}, Lbutterknife/ButterKnife;->inject(Landroid/app/Activity;)V

    .line 239
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mNavBtnHelp:Landroid/widget/Button;

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->hideHelpButtonFromView(Landroid/content/Context;Landroid/widget/Button;)V

    .line 242
    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/maps/MapsInitializer;->initialize(Landroid/content/Context;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 249
    :goto_1
    return-void

    .line 232
    :cond_0
    invoke-virtual {p0, v4}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setContentView(I)V

    goto :goto_0

    .line 243
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;

    .prologue
    .line 932
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 934
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z

    .line 936
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportMenuInflater()Lcom/actionbarsherlock/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0e0000

    invoke-virtual {v0, v1, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 938
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 350
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onDestroy()V

    .line 351
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mLocationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopUpdates()V

    .line 352
    return-void
.end method

.method public onFlagContentEvent(Lcom/seeclickfix/ma/android/events/FlagContentEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/FlagContentEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 1055
    new-instance v0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$4;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$4;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->flagContent(Lretrofit/Callback;)V

    .line 1067
    return-void
.end method

.method public onGooglePlayErrorEvent(Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 1407
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/launchers/GooglePlayErrorDialogLauncher;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/launchers/GooglePlayErrorDialogLauncher;-><init>()V

    .line 1409
    .local v0, "gpErrorDialog":Lcom/seeclickfix/ma/android/dialogs/launchers/GooglePlayErrorDialogLauncher;
    invoke-virtual {v0, p1, p0}, Lcom/seeclickfix/ma/android/dialogs/launchers/GooglePlayErrorDialogLauncher;->showDialog(Lcom/seeclickfix/ma/android/events/Event;Landroid/support/v4/app/FragmentActivity;)V

    .line 1410
    return-void
.end method

.method public onIssueCreatedEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;)V
    .locals 5
    .param p1, "event"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 754
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getNoticeItem()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    .line 756
    .local v1, "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getResponse()Lretrofit/client/Response;

    move-result-object v2

    invoke-virtual {v2}, Lretrofit/client/Response;->getStatus()I

    move-result v2

    const/16 v3, 0xc9

    if-ne v2, v3, :cond_0

    .line 757
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 758
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "issue_bundle"

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getIssue()Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 759
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/seeclickfix/ma/android/IssueModel;->setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    .line 760
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;

    move-result-object v2

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getIssue()Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/IssueModel;->setNoticeIssue(I)V

    .line 761
    const-string/jumbo v2, "FragmentTags.ISSUE_DETAIL"

    const-class v3, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    invoke-direct {p0, v2, v3, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 765
    .end local v0    # "b":Landroid/os/Bundle;
    :goto_0
    return-void

    .line 763
    :cond_0
    const-string/jumbo v2, "FragmentTags.REPORT"

    const-class v3, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    const/4 v4, 0x0

    invoke-direct {p0, v2, v3, v4}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    goto :goto_0
.end method

.method public onIssueFailureEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;)V
    .locals 4
    .param p1, "event"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 770
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getReportModel()Lcom/seeclickfix/ma/android/ReportModel;

    move-result-object v0

    invoke-virtual {p1, p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;->getNoticeItem(Landroid/content/Context;)Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/ReportModel;->setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    .line 771
    const-string/jumbo v0, "FragmentTags.REPORT"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/Boolean;)Landroid/support/v4/app/Fragment;

    .line 772
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 915
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 916
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    if-eqz v0, :cond_0

    .line 917
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;->onBackKey()V

    .line 918
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    .line 919
    const/4 v0, 0x1

    .line 923
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onLocationNotEnabledEvent(Lcom/seeclickfix/ma/android/events/LocationNotEnabledEvent;)V
    .locals 3
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LocationNotEnabledEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 1397
    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->activityGraph:Ldagger/ObjectGraph;

    const-class v2, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;

    invoke-virtual {v1, v2}, Ldagger/ObjectGraph;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;

    .line 1399
    .local v0, "locDialog":Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;
    invoke-virtual {v0, p1, p0}, Lcom/seeclickfix/ma/android/dialogs/launchers/LocationDisableDialogLauncher;->showDialog(Lcom/seeclickfix/ma/android/events/Event;Landroid/support/v4/app/FragmentActivity;)V

    .line 1400
    return-void
.end method

.method public onLoginEvent(Lcom/seeclickfix/ma/android/events/LoginEvent;)V
    .locals 5
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LoginEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 777
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LoginEvent;->getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    .line 778
    .local v0, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    if-eqz v0, :cond_0

    .line 779
    const-string/jumbo v1, "com.seeclickfix.actions.STARTUP_LOGIN_PROMPT"

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 780
    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 781
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->clearAuthCompleteParams()V

    .line 782
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Landroid/support/v4/app/FragmentManager;->popBackStackImmediate(Ljava/lang/String;I)Z

    .line 783
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showDefaultFrag()V

    .line 791
    :cond_0
    :goto_0
    return-void

    .line 784
    :cond_1
    const-string/jumbo v1, "com.seeclickfix.actions.SHOW_ME_FRAG"

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 785
    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 786
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->clearAuthCompleteParams()V

    .line 787
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Landroid/support/v4/app/FragmentManager;->popBackStackImmediate(Ljava/lang/String;I)Z

    .line 788
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showAccountFrag()V

    goto :goto_0
.end method

.method public onLoginSkipEvent(Lcom/seeclickfix/ma/android/events/LoginSkipEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LoginSkipEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 795
    const-string/jumbo v0, "PrefNames:SKIPPED_LOGIN"

    const/4 v1, 0x1

    invoke-static {v0, v1, p0}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putBoolean(Ljava/lang/String;ZLandroid/content/Context;)V

    .line 796
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->clearAuthCompleteParams()V

    .line 797
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showDefaultFrag()V

    .line 798
    return-void
.end method

.method public onLogoutEvent(Lcom/seeclickfix/ma/android/events/LogoutEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LogoutEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 1372
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    if-eqz v0, :cond_0

    .line 1373
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->setUserProfile(Lcom/seeclickfix/ma/android/objects/user/User;)V

    .line 1374
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->notifyDataSetChanged()V

    .line 1378
    :cond_0
    return-void
.end method

.method public onMapPlaceCancel()V
    .locals 1

    .prologue
    .line 1299
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    .line 1300
    return-void
.end method

.method public onMapPlaceSaved(Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 3
    .param p1, "pageParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 1285
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mapBackKey:Lcom/seeclickfix/ma/android/fragments/interfaces/OnMapBackKeyListener;

    .line 1287
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->placeMapListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;

    if-eqz v0, :cond_0

    .line 1288
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->placeMapListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;

    invoke-interface {v0, p1}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;->onMapPlaceSaved(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    .line 1292
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string/jumbo v1, "FragmentTags.PLACES_MAP"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/FragmentManager;->popBackStack(Ljava/lang/String;I)V

    .line 1294
    return-void
.end method

.method public onMenuItemSelected(ILcom/actionbarsherlock/view/MenuItem;)Z
    .locals 3
    .param p1, "featureId"    # I
    .param p2, "item"    # Lcom/actionbarsherlock/view/MenuItem;

    .prologue
    .line 943
    invoke-interface {p2}, Lcom/actionbarsherlock/view/MenuItem;->getItemId()I

    move-result v0

    .line 945
    .local v0, "id":I
    const v1, 0x7f0a0184

    if-ne v0, v1, :cond_0

    .line 946
    const-string/jumbo v1, "FragmentTags.REPORT"

    const-class v2, Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0, v1, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    .line 947
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->closeDrawer()V

    .line 949
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onMenuItemSelected(ILcom/actionbarsherlock/view/MenuItem;)Z

    move-result v1

    return v1
.end method

.method public onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Lcom/actionbarsherlock/view/MenuItem;

    .prologue
    .line 983
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->isTabletLayout()Z

    move-result v0

    if-nez v0, :cond_0

    .line 984
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mDrawerToggle:Lcom/actionbarsherlock/app/ActionBarDrawerToggle;

    invoke-virtual {v0, p1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 985
    const/4 v0, 0x1

    .line 990
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 324
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->paused:Z

    .line 327
    :try_start_0
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/squareup/otto/Bus;->unregister(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 336
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->shouldInit:Z

    .line 337
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onPause()V

    .line 338
    return-void

    .line 328
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onPlaceAdded(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 1
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1258
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->notifyDataSetChanged()V

    .line 1259
    return-void
.end method

.method public onPlaceRemoved(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 1
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1263
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->notifyDataSetChanged()V

    .line 1264
    return-void
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 253
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onPostCreate(Landroid/os/Bundle;)V

    .line 255
    return-void
.end method

.method public onReportLocationSet(Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 3
    .param p1, "pageParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 1216
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onReportLocationListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;

    if-eqz v0, :cond_0

    .line 1217
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onReportLocationListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;

    invoke-interface {v0, p1}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;->onReportLocationSet(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    .line 1218
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onReportLocationListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;

    .line 1221
    :cond_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->clearBackKeyRefs()V

    .line 1223
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string/jumbo v1, "FragmentTags.REPORT_MAP"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/FragmentManager;->popBackStack(Ljava/lang/String;I)V

    .line 1225
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "inState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 377
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 379
    const-string/jumbo v3, "focusID"

    const/4 v4, -0x1

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 381
    .local v1, "focusID":I
    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 382
    .local v2, "focusedChild":Landroid/view/View;
    if-eqz v2, :cond_0

    .line 384
    instance-of v3, v2, Landroid/widget/EditText;

    if-eqz v3, :cond_0

    .line 385
    invoke-virtual {v2, v5}, Landroid/view/View;->setFocusable(Z)V

    .line 386
    invoke-virtual {v2, v5}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 387
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    .line 389
    const-string/jumbo v3, "cursorLoc"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .local v0, "cursorLoc":I
    move-object v3, v2

    .line 390
    check-cast v3, Landroid/widget/EditText;

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 395
    new-instance v3, Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;

    invoke-direct {v3, p0, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Landroid/view/View;)V

    const-wide/16 v4, 0x1f4

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 405
    .end local v0    # "cursorLoc":I
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 310
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onResume()V

    .line 313
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setupActionBar()V

    .line 315
    new-instance v0, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;-><init>(Landroid/support/v4/app/FragmentActivity;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->upgradeHelper:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    .line 316
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->upgradeHelper:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->dbUpgradeListener:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->setOnDbReadyListner(Lcom/seeclickfix/ma/android/db/DbUpgradeHelper$OnDbReadyListener;)V

    .line 317
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->upgradeHelper:Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/DbUpgradeHelper;->start()V

    .line 319
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->paused:Z

    .line 320
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 357
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 359
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    .line 361
    .local v2, "focusedChild":Landroid/view/View;
    if-eqz v2, :cond_1

    .line 362
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v1

    .line 363
    .local v1, "focusID":I
    const/4 v0, 0x0

    .line 365
    .local v0, "cursorLoc":I
    instance-of v3, v2, Landroid/widget/EditText;

    if-eqz v3, :cond_0

    .line 366
    check-cast v2, Landroid/widget/EditText;

    .end local v2    # "focusedChild":Landroid/view/View;
    invoke-virtual {v2}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    .line 369
    :cond_0
    const-string/jumbo v3, "focusID"

    invoke-virtual {p1, v3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 370
    const-string/jumbo v3, "cursorLoc"

    invoke-virtual {p1, v3, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 372
    .end local v0    # "cursorLoc":I
    .end local v1    # "focusID":I
    :cond_1
    return-void
.end method

.method public onSelectIssueListItem(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V
    .locals 0
    .param p1, "issueObj"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "action"    # Ljava/lang/String;

    .prologue
    .line 1208
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showIssueDetailFrag(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 1209
    return-void
.end method

.method public onShowReportEvent(Lcom/seeclickfix/ma/android/events/ShowReportEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/ShowReportEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 1416
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showReportFrag()V

    .line 1417
    return-void
.end method

.method public onSplashContinueEvent(Lcom/seeclickfix/ma/android/events/SplashContinueEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/SplashContinueEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 802
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showDefaultFragNoHistory()V

    .line 803
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 299
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onStart()V

    .line 302
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 342
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onStop()V

    .line 344
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mLocationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopUpdates()V

    .line 345
    return-void
.end method

.method public onUnboxingContinueEvent(Lcom/seeclickfix/ma/android/events/UnboxingContinueEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/UnboxingContinueEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 807
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showDefaultFrag()V

    .line 808
    return-void
.end method

.method public onUserProfileEvent(Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 1358
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    if-eqz v0, :cond_0

    .line 1359
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;->getUser()Lcom/seeclickfix/ma/android/objects/user/User;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->setUserProfile(Lcom/seeclickfix/ma/android/objects/user/User;)V

    .line 1360
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->mMenuAdapter:Lcom/seeclickfix/ma/android/adapters/MenuAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/adapters/MenuAdapter;->notifyDataSetChanged()V

    .line 1364
    :cond_0
    return-void
.end method

.method protected postEvent(Ljava/lang/Object;)V
    .locals 1
    .param p1, "event"    # Ljava/lang/Object;

    .prologue
    .line 732
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 733
    return-void
.end method

.method public setPlaceAddedListener(Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;)V
    .locals 0
    .param p1, "placeAddedListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;

    .prologue
    .line 1273
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->placeAddedListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;

    .line 1274
    return-void
.end method

.method public setPlaceMapListener(Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;)V
    .locals 0
    .param p1, "placeMapListener"    # Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;

    .prologue
    .line 1277
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->placeMapListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;

    .line 1278
    return-void
.end method

.method showAbout()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a0043
        }
    .end annotation

    .prologue
    .line 955
    const-string/jumbo v0, "FragmentTags.ABOUT"

    const-class v1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-direct {p0, v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    .line 956
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->closeDrawer()V

    .line 957
    return-void
.end method

.method public showFlagDialog(Ljava/lang/String;I)V
    .locals 3
    .param p1, "resourceType"    # Ljava/lang/String;
    .param p2, "resourceId"    # I

    .prologue
    .line 1049
    invoke-static {p1, p2}, Lcom/seeclickfix/ma/android/dialogs/FlagDialog;->newInstance(Ljava/lang/String;I)Lcom/seeclickfix/ma/android/dialogs/FlagDialog;

    move-result-object v0

    .line 1050
    .local v0, "flagDialog":Landroid/support/v4/app/DialogFragment;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 1051
    return-void
.end method

.method showHelp()V
    .locals 4
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a0042
        }
    .end annotation

    .prologue
    .line 961
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/seeclickfix/ma/android/sidenav/SideNavHelper;->getHelpUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 962
    .local v1, "url":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 963
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 964
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 965
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->startActivity(Landroid/content/Intent;)V

    .line 969
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->closeDrawer()V

    .line 970
    return-void

    .line 967
    :cond_0
    const-string/jumbo v2, "FragmentTags.HELP"

    const-class v3, Lcom/seeclickfix/ma/android/fragments/HelpFrag;

    invoke-direct {p0, v2, v3}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    goto :goto_0
.end method

.method public showTerms(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1110
    const-string/jumbo v1, "http://seeclickfix.com/legal/terms-of-use"

    .line 1111
    .local v1, "url":Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1112
    .local v0, "i":Landroid/content/Intent;
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1113
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->startActivity(Landroid/content/Intent;)V

    .line 1114
    return-void
.end method
