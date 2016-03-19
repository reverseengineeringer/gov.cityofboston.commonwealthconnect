.class public Lcom/seeclickfix/ma/android/fragments/MeFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "MeFrag.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "MeFrag"


# instance fields
.field private accountBtn:Landroid/widget/Button;

.field private accountBtnListener:Landroid/view/View$OnClickListener;

.field private args:Landroid/os/Bundle;

.field private avatar:Landroid/widget/ImageView;

.field private c:Landroid/content/Context;

.field private closedNumView:Landroid/widget/TextView;

.field private closedTextView:Landroid/widget/TextView;

.field private commentsNumView:Landroid/widget/TextView;

.field private commentsTextView:Landroid/widget/TextView;

.field private container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field private followsNumView:Landroid/widget/TextView;

.field private followsTextView:Landroid/widget/TextView;

.field private isLoggedIn:Z

.field private mUser:Lcom/seeclickfix/ma/android/objects/user/User;

.field private pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field private reportsNumView:Landroid/widget/TextView;

.field private reportsTextView:Landroid/widget/TextView;

.field private userNameTextView:Landroid/widget/TextView;

.field private votesNumView:Landroid/widget/TextView;

.field private votesTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/MeFrag;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/MeFrag;

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->isLoggedIn:Z

    return v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/MeFrag;)Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/MeFrag;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    return-object v0
.end method

.method static synthetic access$200(Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/Object;

    .prologue
    .line 34
    invoke-static {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->postEvent(Ljava/lang/Object;)V

    return-void
.end method

.method private attachListeners()V
    .locals 2

    .prologue
    .line 171
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->accountBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->accountBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    return-void
.end method

.method private handleArgs()V
    .locals 2

    .prologue
    .line 136
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->args:Landroid/os/Bundle;

    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "page_params"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 141
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :goto_0
    return-void

    .line 143
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private resetViews()V
    .locals 6

    .prologue
    .line 228
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a00b5

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 229
    .local v3, "userNameTextView":Landroid/widget/TextView;
    const v4, 0x7f0c00bb

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 230
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a00b6

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 231
    .local v1, "emailTextView":Landroid/widget/TextView;
    const-string/jumbo v4, " "

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a00c3

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 234
    .local v0, "bodyTextView":Landroid/widget/TextView;
    const v4, 0x7f0c00bc

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 236
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 238
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->accountBtn:Landroid/widget/Button;

    const v5, 0x7f0c00b5

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 240
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->avatar:Landroid/widget/ImageView;

    const v5, 0x7f020125

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 242
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a00b7

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 243
    .local v2, "statsContainer":Landroid/view/ViewGroup;
    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 245
    return-void
.end method

.method private setContent()V
    .locals 8

    .prologue
    .line 150
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v4

    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->isLoggedIn:Z

    .line 152
    iget-boolean v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->isLoggedIn:Z

    if-eqz v4, :cond_0

    .line 153
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->currentUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v3

    .line 155
    .local v3, "user":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->userNameTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a00b6

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 157
    .local v1, "emailTextView":Landroid/widget/TextView;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a00c3

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 160
    .local v0, "bodyTextView":Landroid/widget/TextView;
    const v4, 0x7f0c00b4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getEmail()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 161
    .local v2, "loggedInString":Ljava/lang/String;
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->accountBtn:Landroid/widget/Button;

    const v5, 0x7f0c00b6

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 165
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->setProfileContent()V

    .line 167
    .end local v0    # "bodyTextView":Landroid/widget/TextView;
    .end local v1    # "emailTextView":Landroid/widget/TextView;
    .end local v2    # "loggedInString":Ljava/lang/String;
    .end local v3    # "user":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    :cond_0
    return-void
.end method

.method private setProfileContent()V
    .locals 5

    .prologue
    .line 261
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    if-nez v1, :cond_0

    .line 262
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->c:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getUserIfAvail(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/user/User;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    .line 265
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    if-eqz v1, :cond_1

    .line 267
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->userNameTextView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/user/User;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 269
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v2, 0x7f0a00b7

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 270
    .local v0, "statsContainer":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 272
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->reportsNumView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/user/User;->getReportedIssueCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->closedNumView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/user/User;->getClosedIssueCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->commentsNumView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/user/User;->getCommentCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->votesNumView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/user/User;->getVotedIssueCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->followsNumView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/user/User;->getFollowedIssueCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->c:Landroid/content/Context;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->avatar:Landroid/widget/ImageView;

    const v4, 0x7f020125

    invoke-virtual {v1, v2, v3, v4}, Lcom/seeclickfix/ma/android/auth/ProfileController;->setUserAvatar(Landroid/content/Context;Landroid/widget/ImageView;I)V

    .line 280
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/user/User;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 282
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/user/User;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDisplayName(Ljava/lang/String;)V

    .line 286
    .end local v0    # "statsContainer":Landroid/view/ViewGroup;
    :cond_1
    return-void
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 175
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00c4

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->accountBtn:Landroid/widget/Button;

    .line 176
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00b4

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->avatar:Landroid/widget/ImageView;

    .line 177
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00b5

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->userNameTextView:Landroid/widget/TextView;

    .line 178
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00b9

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->reportsTextView:Landroid/widget/TextView;

    .line 179
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00bb

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->closedTextView:Landroid/widget/TextView;

    .line 180
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00bd

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->commentsTextView:Landroid/widget/TextView;

    .line 181
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00bf

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->votesTextView:Landroid/widget/TextView;

    .line 182
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00c1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->followsTextView:Landroid/widget/TextView;

    .line 183
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00b8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->reportsNumView:Landroid/widget/TextView;

    .line 184
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00ba

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->closedNumView:Landroid/widget/TextView;

    .line 185
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00bc

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->commentsNumView:Landroid/widget/TextView;

    .line 186
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00be

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->votesNumView:Landroid/widget/TextView;

    .line 187
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00c0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->followsNumView:Landroid/widget/TextView;

    .line 193
    return-void
.end method

.method private setupListeners()V
    .locals 1

    .prologue
    .line 198
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/MeFrag$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/MeFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->accountBtnListener:Landroid/view/View$OnClickListener;

    .line 212
    return-void
.end method


# virtual methods
.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 99
    const/4 v0, 0x0

    return-object v0
.end method

.method protected logout()V
    .locals 2

    .prologue
    .line 215
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/auth/AuthManager;->logout(Landroid/content/Context;)V

    .line 216
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->resetLoginState()V

    .line 218
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->isLoggedIn:Z

    .line 220
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->resetViews()V

    .line 221
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->resetAvatar()V

    .line 222
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v0

    const v1, 0x7f0c00bb

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(I)V

    .line 223
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 76
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 78
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->c:Landroid/content/Context;

    .line 80
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->handleArgs()V

    .line 82
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->setReferences()V

    .line 83
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->setupListeners()V

    .line 84
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->attachListeners()V

    .line 86
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->setHasOptionsMenu(Z)V

    .line 88
    return-void
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 92
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 93
    const v0, 0x7f0e0002

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 94
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 95
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 65
    if-nez p2, :cond_0

    .line 67
    const/4 v0, 0x0

    .line 70
    :goto_0
    return-object v0

    .line 69
    :cond_0
    const v0, 0x7f030030

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onLoginEvent(Lcom/seeclickfix/ma/android/events/LoginEvent;)V
    .locals 3
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LoginEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 116
    :try_start_0
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v0

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LoginEvent;->getUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/auth/ProfileController;->loadUserProfile(Lcom/seeclickfix/ma/android/objects/user/AuthUser;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    :goto_0
    return-void

    .line 117
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->unSubscribeFromEventBus()V

    .line 129
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onPause()V

    .line 130
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 104
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 105
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->subscribeToEventBus()V

    .line 106
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->setContent()V

    .line 108
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 109
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->currentUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->c:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/auth/ProfileController;->loadUserProfile(Lcom/seeclickfix/ma/android/objects/user/AuthUser;Landroid/content/Context;)V

    .line 111
    :cond_0
    return-void
.end method

.method public onUserProfileEvent(Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 252
    if-eqz p1, :cond_0

    .line 253
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->isLoggedIn:Z

    .line 254
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;->getUser()Lcom/seeclickfix/ma/android/objects/user/User;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    .line 255
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->setProfileContent()V

    .line 257
    :cond_0
    return-void
.end method
