.class public Lcom/seeclickfix/ma/android/fragments/LoginFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "LoginFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnBackKeyListener;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "LoginFrag"


# instance fields
.field private c:Landroid/content/Context;

.field doneListener:Landroid/widget/TextView$OnEditorActionListener;

.field private forgotPwdBtn:Landroid/widget/TextView;

.field private loginBtn:Landroid/widget/Button;

.field mAccountManager:Landroid/accounts/AccountManager;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field skipButton:Landroid/widget/Button;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a00b1
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 250
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$6;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$6;-><init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->doneListener:Landroid/widget/TextView$OnEditorActionListener;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->doLogin()V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->doForgotPassword()V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    return-object v0
.end method

.method private doForgotPassword()V
    .locals 5

    .prologue
    .line 153
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a00aa

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    .line 154
    .local v0, "emailEditText":Landroid/widget/AutoCompleteTextView;
    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "emailString":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 157
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const v4, 0x7f0c00a7

    invoke-static {v3, v4}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;I)V

    .line 183
    :goto_0
    return-void

    .line 160
    :cond_0
    new-instance v2, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;

    invoke-direct {v2, p0, v1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$4;-><init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;Ljava/lang/String;)V

    .line 181
    .local v2, "forgotPasswordTask":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/String;Ljava/lang/Void;Ljava/lang/String;>;"
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method private doLogin()V
    .locals 11

    .prologue
    const/16 v10, 0x8

    const/4 v9, 0x0

    .line 206
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v8, 0x7f0a00ae

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    .line 208
    .local v3, "progressWheel":Landroid/widget/ProgressBar;
    invoke-virtual {v3, v9}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 209
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->loginBtn:Landroid/widget/Button;

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 211
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v8, 0x7f0a00aa

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    .line 212
    .local v0, "emailEditText":Landroid/widget/AutoCompleteTextView;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v8, 0x7f0a00ab

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 214
    .local v4, "pwdEditText":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 215
    .local v1, "emailString":Ljava/lang/String;
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 217
    .local v5, "pwdString":Ljava/lang/String;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v8, 0x7f0a00af

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 219
    .local v6, "resultTextView":Landroid/widget/TextView;
    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 221
    new-instance v2, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;

    invoke-direct {v2, p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$5;-><init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V

    .line 247
    .local v2, "loginTask":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/String;Ljava/lang/Void;Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    aput-object v1, v7, v9

    const/4 v8, 0x1

    aput-object v5, v7, v8

    invoke-virtual {v2, v7}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 248
    return-void
.end method

.method private mustHandleResume(Lcom/seeclickfix/ma/android/objects/PageParams;)Z
    .locals 2
    .param p1, "params"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 301
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v0

    .line 302
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v1, "com.seeclickfix.actions.STARTUP_LOGIN_PROMPT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "com.seeclickfix.actions.SHOW_ME_FRAG"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setupAutoComplete()V
    .locals 7

    .prologue
    .line 186
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v6, 0x7f0a00aa

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/AutoCompleteTextView;

    .line 188
    .local v1, "emailInput":Landroid/widget/AutoCompleteTextView;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->mAccountManager:Landroid/accounts/AccountManager;

    invoke-virtual {v5}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v4

    .line 189
    .local v4, "list":[Landroid/accounts/Account;
    array-length v5, v4

    new-array v2, v5, [Ljava/lang/String;

    .line 191
    .local v2, "emails":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v4

    if-ge v3, v5, :cond_0

    .line 192
    aget-object v5, v4, v3

    iget-object v5, v5, Landroid/accounts/Account;->name:Ljava/lang/String;

    aput-object v5, v2, v3

    .line 191
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 195
    :cond_0
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    const v6, 0x109000a

    invoke-direct {v0, v5, v6, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 200
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v1, v0}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 202
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    .line 203
    return-void
.end method


# virtual methods
.method protected fail(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 4
    .param p1, "userObj"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    const/4 v3, 0x0

    .line 264
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v2, 0x7f0a00af

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 266
    .local v0, "resultTextView":Landroid/widget/TextView;
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 268
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getResponse()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->loginBtn:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 271
    return-void
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 85
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 88
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->c:Landroid/content/Context;

    .line 90
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/dagger/GraphProvider;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/dagger/GraphProvider;->getObjectGraph()Ldagger/ObjectGraph;

    move-result-object v0

    invoke-virtual {v0, p0}, Ldagger/ObjectGraph;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    return-void
.end method

.method public onBackKey()Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1

    .prologue
    .line 313
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->resetLoginState()V

    .line 314
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 70
    if-nez p2, :cond_0

    .line 72
    const/4 v0, 0x0

    .line 79
    :goto_0
    return-object v0

    .line 74
    :cond_0
    const v0, 0x7f03002f

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 77
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Landroid/view/View;)V

    .line 79
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onResume()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 101
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 104
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "page_params"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 106
    .local v1, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a00b0

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 108
    .local v0, "createAccountBtn":Landroid/widget/Button;
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/LoginFrag$1;

    invoke-direct {v3, p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v3

    const v4, 0x7f0c00ab

    invoke-virtual {v3, v4}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(I)V

    .line 118
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a00ac

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->loginBtn:Landroid/widget/Button;

    .line 120
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->loginBtn:Landroid/widget/Button;

    new-instance v4, Lcom/seeclickfix/ma/android/fragments/LoginFrag$2;

    invoke-direct {v4, p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->loginBtn:Landroid/widget/Button;

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 130
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a00ad

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->forgotPwdBtn:Landroid/widget/TextView;

    .line 132
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->forgotPwdBtn:Landroid/widget/TextView;

    new-instance v4, Lcom/seeclickfix/ma/android/fragments/LoginFrag$3;

    invoke-direct {v4, p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a00ab

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 142
    .local v2, "pwdEditText":Landroid/widget/EditText;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->doneListener:Landroid/widget/TextView$OnEditorActionListener;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 144
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->setupAutoComplete()V

    .line 147
    const-string/jumbo v3, "com.seeclickfix.actions.STARTUP_LOGIN_PROMPT"

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 148
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->skipButton:Landroid/widget/Button;

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 150
    :cond_0
    return-void
.end method

.method protected resultForgotPassword(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "result"    # Ljava/lang/String;
    .param p2, "emailString"    # Ljava/lang/String;

    .prologue
    .line 289
    new-instance v2, Lcom/google/gson/JsonParser;

    invoke-direct {v2}, Lcom/google/gson/JsonParser;-><init>()V

    invoke-virtual {v2, p1}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 292
    .local v0, "resultJson":Lcom/google/gson/JsonObject;
    const-string/jumbo v2, "success"

    invoke-virtual {v0, v2}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsBoolean()Z

    move-result v1

    .line 293
    .local v1, "resultSuccess":Z
    if-eqz v1, :cond_0

    .line 294
    const v2, 0x7f0c00a8

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 296
    :goto_0
    return-object v2

    :cond_0
    const v2, 0x7f0c00a6

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method skipLogin()V
    .locals 1
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a00b1
        }
    .end annotation

    .prologue
    .line 307
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v0

    .line 308
    .local v0, "loginController":Lcom/seeclickfix/ma/android/auth/LoginStateController;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->dispatchLoginSkipEvent()V

    .line 309
    return-void
.end method

.method protected success(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 4
    .param p1, "userObj"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    .line 276
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const v3, 0x7f0c00ad

    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;I)V

    .line 278
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v0

    .line 279
    .local v0, "loginController":Lcom/seeclickfix/ma/android/auth/LoginStateController;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 281
    .local v1, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    if-eqz v1, :cond_0

    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->mustHandleResume(Lcom/seeclickfix/ma/android/objects/PageParams;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 282
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->popBackStack()V

    .line 285
    :cond_1
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->dispatchLoginEvent(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    .line 286
    return-void
.end method

.method public willHandleBackKey()Z
    .locals 1

    .prologue
    .line 318
    const/4 v0, 0x1

    return v0
.end method
