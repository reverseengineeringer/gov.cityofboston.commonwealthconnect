.class public abstract Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.super Lcom/actionbarsherlock/app/SherlockFragment;
.source "BaseFrag.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;,
        Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;,
        Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "BaseFrag"


# instance fields
.field private final NOTICE_FORMAT:Ljava/lang/String;

.field protected actionBarItemsEnabled:Z

.field protected actionBarItemsVisible:Z

.field private applicationContext:Landroid/content/Context;

.field private args:Landroid/os/Bundle;

.field private fragState:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

.field private pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field protected rootFrag:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 40
    invoke-direct {p0}, Lcom/actionbarsherlock/app/SherlockFragment;-><init>()V

    .line 47
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsEnabled:Z

    .line 48
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsVisible:Z

    .line 55
    const-string/jumbo v0, "<html>\n<head>\n<link rel=\"stylesheet\" type=\"text/css\" href=\"main.css\" />\n</head>\n<body class=\"%1$s\">\n<h2>%2$s</h2>\n<p>%3$s</p>\n<p>%4$s</p>\n</body>\n</html>"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->NOTICE_FORMAT:Ljava/lang/String;

    .line 65
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->fragState:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    .line 401
    return-void
.end method

.method protected static postEvent(Ljava/lang/Object;)V
    .locals 1
    .param p0, "Event"    # Ljava/lang/Object;

    .prologue
    .line 382
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 383
    return-void
.end method

.method private setAppContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "appContext"    # Landroid/content/Context;

    .prologue
    .line 244
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->applicationContext:Landroid/content/Context;

    .line 245
    return-void
.end method

.method private setErrorVisibility(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 350
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getErrorView()Landroid/view/View;

    move-result-object v0

    .line 351
    .local v0, "errorView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 352
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 354
    :cond_0
    return-void
.end method

.method private setProgressVisibility(I)V
    .locals 2
    .param p1, "visibility"    # I

    .prologue
    .line 343
    const v1, 0x7f0a0079

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->loadingView(I)Landroid/view/View;

    move-result-object v0

    .line 344
    .local v0, "progressView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 345
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 347
    :cond_0
    return-void
.end method


# virtual methods
.method protected clearDraft()V
    .locals 3

    .prologue
    .line 390
    invoke-static {}, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->clearReport()V

    .line 392
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.seeclickfix.actions.DELETE_REPORT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 393
    .local v0, "deleteReportIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    const-class v2, Lcom/seeclickfix/ma/android/services/DeleteAllDraftsService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 394
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 395
    return-void
.end method

.method protected currentUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .locals 1

    .prologue
    .line 386
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v0

    return-object v0
.end method

.method public fillNoticeUI(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V
    .locals 12
    .param p1, "notice"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .prologue
    const/4 v4, 0x0

    const v11, 0x7f0a0166

    const/16 v10, 0x8

    const/4 v9, 0x0

    .line 89
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    const v3, 0x7f0a0168

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 91
    .local v0, "webview":Landroid/webkit/WebView;
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "<html>\n<head>\n<link rel=\"stylesheet\" type=\"text/css\" href=\"main.css\" />\n</head>\n<body class=\"%1$s\">\n<h2>%2$s</h2>\n<p>%3$s</p>\n<p>%4$s</p>\n</body>\n</html>"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getLevel()Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    move-result-object v7

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->webviewClass()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v9

    const/4 v7, 0x1

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getTitle()I

    move-result v8

    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    const/4 v7, 0x2

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getBody()I

    move-result v8

    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    const/4 v7, 0x3

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getExtra()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-static {v1, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 95
    .local v2, "noticeMessage":Ljava/lang/String;
    const-string/jumbo v1, "file:///android_asset/"

    const-string/jumbo v3, "text/html"

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    const v3, 0x7f0a0167

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 99
    .local v6, "actionView":Landroid/widget/TextView;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getAction()I

    move-result v1

    if-eqz v1, :cond_0

    .line 100
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v9}, Landroid/view/View;->setVisibility(I)V

    .line 101
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getAction()I

    move-result v1

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(I)V

    .line 102
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getListener()Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    :goto_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->showNoticeUI()V

    .line 108
    return-void

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/view/View;->setVisibility(I)V

    .line 105
    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method public getAppContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->applicationContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 238
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setAppContext(Landroid/content/Context;)V

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public getErrorView()Landroid/view/View;
    .locals 2

    .prologue
    .line 365
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0078

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected getEventReceivers()Ljava/util/List;
    .locals 1
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
    .line 161
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 162
    .local v0, "receivers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    return-object v0
.end method

.method public getFragState()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->fragState:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    return-object v0
.end method

.method public abstract getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
.end method

.method protected getRootFrag()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->rootFrag:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getShouldShowActionBar()Z
    .locals 1

    .prologue
    .line 233
    const/4 v0, 0x1

    return v0
.end method

.method public hideNoticeUI()V
    .locals 1

    .prologue
    .line 115
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setNoticeVisibility(I)V

    .line 116
    return-void
.end method

.method protected loadingView(I)Landroid/view/View;
    .locals 2
    .param p1, "baseViewId"    # I

    .prologue
    .line 369
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 370
    .local v0, "loadingView":Landroid/view/View;
    if-nez v0, :cond_0

    .line 371
    const/4 v0, 0x0

    .line 378
    .end local v0    # "loadingView":Landroid/view/View;
    :goto_0
    return-object v0

    .line 374
    .restart local v0    # "loadingView":Landroid/view/View;
    :cond_0
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$2;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "inState"    # Landroid/os/Bundle;

    .prologue
    .line 72
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 74
    if-eqz p1, :cond_0

    const-string/jumbo v0, "fragState"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    const-string/jumbo v0, "fragState"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 77
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 0
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 274
    invoke-super {p0, p1, p2}, Lcom/actionbarsherlock/app/SherlockFragment;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 276
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->restyleReportButton(Lcom/actionbarsherlock/view/Menu;)V

    .line 277
    return-void
.end method

.method public onDetach()V
    .locals 2

    .prologue
    .line 223
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragment;->onDetach()V

    .line 226
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_0
    return-void

    .line 227
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Lcom/actionbarsherlock/view/Menu;)V
    .locals 3
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;

    .prologue
    .line 169
    const v2, 0x7f0a0188

    invoke-interface {p1, v2}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v1

    .line 170
    .local v1, "saveBtn":Lcom/actionbarsherlock/view/MenuItem;
    if-eqz v1, :cond_0

    .line 171
    iget-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsEnabled:Z

    invoke-interface {v1, v2}, Lcom/actionbarsherlock/view/MenuItem;->setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 172
    iget-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsVisible:Z

    invoke-interface {v1, v2}, Lcom/actionbarsherlock/view/MenuItem;->setVisible(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 175
    :cond_0
    const v2, 0x7f0a0187

    invoke-interface {p1, v2}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v0

    .line 176
    .local v0, "resetBtn":Lcom/actionbarsherlock/view/MenuItem;
    if-eqz v0, :cond_1

    .line 177
    iget-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsEnabled:Z

    invoke-interface {v0, v2}, Lcom/actionbarsherlock/view/MenuItem;->setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 178
    iget-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsVisible:Z

    invoke-interface {v0, v2}, Lcom/actionbarsherlock/view/MenuItem;->setVisible(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 181
    :cond_1
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragment;->onPrepareOptionsMenu(Lcom/actionbarsherlock/view/Menu;)V

    .line 182
    return-void
.end method

.method public onResume()V
    .locals 6

    .prologue
    .line 186
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragment;->onResume()V

    .line 189
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->args:Landroid/os/Bundle;

    .line 191
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->args:Landroid/os/Bundle;

    const-string/jumbo v3, "page_params"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/PageParams;

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 194
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getShouldShowActionBar()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 195
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2}, Lcom/actionbarsherlock/app/ActionBar;->show()V

    .line 197
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 199
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const-string/jumbo v3, "action_bar_title"

    const-string/jumbo v4, "id"

    const-string/jumbo v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 200
    .local v1, "actionBarTitleId":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 201
    .local v0, "actionBarSubTextView":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v2, v0, v3}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setActionBarSubBasic(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    .end local v0    # "actionBarSubTextView":Landroid/widget/TextView;
    .end local v1    # "actionBarTitleId":I
    :goto_0
    return-void

    .line 202
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    const-string/jumbo v0, "fragState"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getFragState()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 69
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 211
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragment;->onStop()V

    .line 214
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    :goto_0
    return-void

    .line 215
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public processNotice()V
    .locals 1

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->hideNoticeUI()V

    .line 86
    :goto_0
    return-void

    .line 84
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->fillNoticeUI(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    goto :goto_0
.end method

.method protected restyleReportButton(Lcom/actionbarsherlock/view/Menu;)V
    .locals 6
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;

    .prologue
    const/16 v5, 0x38

    const/4 v4, -0x1

    .line 281
    if-nez p1, :cond_1

    .line 315
    :cond_0
    :goto_0
    return-void

    .line 285
    :cond_1
    const v3, 0x7f0a0184

    invoke-interface {p1, v3}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v2

    .line 287
    .local v2, "menuItem":Lcom/actionbarsherlock/view/MenuItem;
    if-eqz v2, :cond_0

    .line 291
    new-instance v0, Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 293
    .local v0, "btn":Landroid/widget/ImageButton;
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 296
    .local v1, "btnLP":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 298
    invoke-static {v5}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->getPixelsForDp(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setMinimumWidth(I)V

    .line 299
    invoke-static {v5}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->getPixelsForDp(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setMinimumHeight(I)V

    .line 301
    const v3, 0x7f02009d

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    .line 302
    const v3, 0x7f02011d

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 304
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$1;

    invoke-direct {v3, p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 313
    invoke-interface {v2, v0}, Lcom/actionbarsherlock/view/MenuItem;->setActionView(Landroid/view/View;)Lcom/actionbarsherlock/view/MenuItem;

    goto :goto_0
.end method

.method public setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V
    .locals 4
    .param p1, "state"    # Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x8

    .line 252
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->fragState:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    .line 253
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$FragState:[I

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 270
    :goto_0
    return-void

    .line 255
    :pswitch_0
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->updateActionBarButtonsState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;)V

    .line 256
    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setProgressVisibility(I)V

    .line 257
    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setErrorVisibility(I)V

    goto :goto_0

    .line 260
    :pswitch_1
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->INACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->updateActionBarButtonsState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;)V

    .line 261
    invoke-direct {p0, v3}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setProgressVisibility(I)V

    .line 262
    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setErrorVisibility(I)V

    goto :goto_0

    .line 265
    :pswitch_2
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->HIDDEN:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->updateActionBarButtonsState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;)V

    .line 266
    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setProgressVisibility(I)V

    .line 267
    invoke-direct {p0, v3}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setErrorVisibility(I)V

    goto :goto_0

    .line 253
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setNoticeVisibility(I)V
    .locals 2
    .param p1, "visibility"    # I

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0080

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 112
    return-void
.end method

.method public setRootFrag(Landroid/view/ViewGroup;)V
    .locals 0
    .param p1, "rootFrag"    # Landroid/view/ViewGroup;

    .prologue
    .line 357
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 358
    return-void
.end method

.method public showNoticeUI()V
    .locals 1

    .prologue
    .line 119
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setNoticeVisibility(I)V

    .line 120
    return-void
.end method

.method protected showReportFrag()V
    .locals 3

    .prologue
    .line 318
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;

    .line 320
    .local v0, "btnInterface":Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;->onClickButton(ILjava/lang/Object;)V

    .line 321
    return-void
.end method

.method protected subscribeToEventBus()V
    .locals 4

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getEventReceivers()Ljava/util/List;

    move-result-object v0

    .line 132
    .local v0, "eventReceivers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 134
    .local v2, "receiver":Ljava/lang/Object;
    :try_start_0
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/squareup/otto/Bus;->register(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v3

    goto :goto_0

    .line 139
    .end local v2    # "receiver":Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method protected unSubscribeFromEventBus()V
    .locals 4

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getEventReceivers()Ljava/util/List;

    move-result-object v0

    .line 149
    .local v0, "eventReceivers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 151
    .local v2, "receiver":Ljava/lang/Object;
    :try_start_0
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/squareup/otto/Bus;->unregister(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 152
    :catch_0
    move-exception v3

    goto :goto_0

    .line 157
    .end local v2    # "receiver":Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method protected updateActionBarButtonsState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;)V
    .locals 4
    .param p1, "state"    # Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 324
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$ActionBarState:[I

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 339
    :goto_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/app/ActivityCompat;->invalidateOptionsMenu(Landroid/app/Activity;)Z

    .line 340
    return-void

    .line 326
    :pswitch_0
    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsEnabled:Z

    .line 327
    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsVisible:Z

    goto :goto_0

    .line 330
    :pswitch_1
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsEnabled:Z

    .line 331
    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsVisible:Z

    goto :goto_0

    .line 334
    :pswitch_2
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsEnabled:Z

    .line 335
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->actionBarItemsVisible:Z

    goto :goto_0

    .line 324
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
