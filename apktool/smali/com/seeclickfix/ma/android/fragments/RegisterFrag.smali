.class public Lcom/seeclickfix/ma/android/fragments/RegisterFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "RegisterFrag.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "RegisterFrag"


# instance fields
.field private c:Landroid/content/Context;

.field private checkbox:Landroid/widget/CheckBox;

.field doneListener:Landroid/widget/TextView$OnEditorActionListener;

.field private emailEditText:Landroid/widget/EditText;

.field private inputFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private nameEditText:Landroid/widget/EditText;

.field private pwd2EditText:Landroid/widget/EditText;

.field private pwdEditText:Landroid/widget/EditText;

.field private statusText:Landroid/widget/TextView;

.field private submitBtn:Landroid/widget/Button;

.field submitBtnListener:Landroid/view/View$OnClickListener;

.field private userRegInputObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 114
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->submitBtnListener:Landroid/view/View$OnClickListener;

    .line 262
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->doneListener:Landroid/widget/TextView$OnEditorActionListener;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->validate()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->sendRegistration()V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    return-object v0
.end method

.method private isValidEmail(Ljava/lang/String;)Z
    .locals 1
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 324
    sget-object v0, Landroid/util/Patterns;->EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method private sendRegistration()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 168
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->userRegInputObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->nameEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->setName(Ljava/lang/String;)V

    .line 169
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->userRegInputObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->emailEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->setEmail(Ljava/lang/String;)V

    .line 170
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->userRegInputObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwdEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->setPassword(Ljava/lang/String;)V

    .line 171
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->userRegInputObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwd2EditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->setPasswordConfirm(Ljava/lang/String;)V

    .line 172
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->userRegInputObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->checkbox:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/objects/user/UserReg;->setAcceptedTerms(Z)V

    .line 174
    new-instance v2, Lcom/seeclickfix/ma/android/objects/user/UserReg;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->userRegInputObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    invoke-direct {v2, v3}, Lcom/seeclickfix/ma/android/objects/user/UserReg;-><init>(Lcom/seeclickfix/ma/android/objects/user/UserReg;)V

    .line 176
    .local v2, "userRegCopy":Lcom/seeclickfix/ma/android/objects/user/UserReg;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a00e4

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    .line 178
    .local v1, "progressWheel":Landroid/widget/ProgressBar;
    invoke-virtual {v1, v5}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 179
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->submitBtn:Landroid/widget/Button;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 182
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)V

    .line 259
    .local v0, "loginTask":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Lcom/seeclickfix/ma/android/objects/user/UserReg;Ljava/lang/Void;Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    const/4 v3, 0x1

    new-array v3, v3, [Lcom/seeclickfix/ma/android/objects/user/UserReg;

    aput-object v2, v3, v5

    invoke-virtual {v0, v3}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 260
    return-void
.end method

.method private setListeners()V
    .locals 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->submitBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->submitBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwd2EditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->doneListener:Landroid/widget/TextView$OnEditorActionListener;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 111
    return-void
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00e1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->checkbox:Landroid/widget/CheckBox;

    .line 90
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00e5

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->submitBtn:Landroid/widget/Button;

    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00e0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwd2EditText:Landroid/widget/EditText;

    .line 92
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00df

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwdEditText:Landroid/widget/EditText;

    .line 93
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00de

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->emailEditText:Landroid/widget/EditText;

    .line 94
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00dd

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->nameEditText:Landroid/widget/EditText;

    .line 96
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00e3

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->inputFields:Ljava/util/List;

    .line 100
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->inputFields:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->emailEditText:Landroid/widget/EditText;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->inputFields:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwdEditText:Landroid/widget/EditText;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->inputFields:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwd2EditText:Landroid/widget/EditText;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->inputFields:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->nameEditText:Landroid/widget/EditText;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    return-void
.end method

.method private showIncompleteMessage(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 329
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 331
    const v1, 0x7f0c00e2

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 332
    .local v0, "status":Ljava/lang/String;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 333
    return-void
.end method

.method private validate()Z
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 127
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->inputFields:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 128
    .local v4, "tv":Landroid/widget/TextView;
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-nez v6, :cond_0

    .line 129
    :cond_1
    invoke-direct {p0, v4}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->showIncompleteMessage(Landroid/view/View;)V

    .line 163
    .end local v4    # "tv":Landroid/widget/TextView;
    :goto_0
    return v5

    .line 134
    :cond_2
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->emailEditText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, "email":Ljava/lang/String;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwdEditText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 136
    .local v2, "pwd1":Ljava/lang/String;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->pwd2EditText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 138
    .local v3, "pwd2":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x28

    if-gt v6, v7, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x4

    if-ge v6, v7, :cond_4

    .line 139
    :cond_3
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 140
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    const v7, 0x7f0c00df

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 144
    :cond_4
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 145
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 146
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    const v7, 0x7f0c00e0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 150
    :cond_5
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->checkbox:Landroid/widget/CheckBox;

    invoke-virtual {v6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    if-nez v6, :cond_6

    .line 151
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 152
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    const v7, 0x7f0c00e1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 156
    :cond_6
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->isValidEmail(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 157
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 158
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    const v7, 0x7f0c00de

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 162
    :cond_7
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 163
    const/4 v5, 0x1

    goto/16 :goto_0
.end method


# virtual methods
.method protected fail(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 3
    .param p1, "userObj"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    const/4 v2, 0x0

    .line 274
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getResponse()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->statusText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 276
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->submitBtn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 277
    return-void
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 337
    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 73
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 77
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->c:Landroid/content/Context;

    .line 79
    new-instance v0, Lcom/seeclickfix/ma/android/objects/user/UserReg;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/user/UserReg;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->userRegInputObj:Lcom/seeclickfix/ma/android/objects/user/UserReg;

    .line 81
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->setReferences()V

    .line 82
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->setListeners()V

    .line 84
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v0

    const v1, 0x7f0c00e3

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(I)V

    .line 85
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 60
    if-nez p2, :cond_0

    .line 62
    const/4 v0, 0x0

    .line 67
    :goto_0
    return-object v0

    .line 64
    :cond_0
    const v0, 0x7f030034

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method protected success(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V
    .locals 8
    .param p1, "userObj"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    .prologue
    .line 283
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v3

    .line 285
    .local v3, "loginController":Lcom/seeclickfix/ma/android/auth/LoginStateController;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v4

    .line 287
    .local v4, "params":Lcom/seeclickfix/ma/android/objects/PageParams;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    const-string/jumbo v5, "com.seeclickfix.actions.STARTUP_LOGIN_PROMPT"

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string/jumbo v5, "com.seeclickfix.actions.SHOW_ME_FRAG"

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 295
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v2

    .line 299
    .local v2, "count":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    add-int/lit8 v6, v2, -0x1

    invoke-virtual {v5, v6}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryAt(I)Landroid/support/v4/app/FragmentManager$BackStackEntry;

    move-result-object v0

    .line 303
    .local v0, "backStackEntry":Landroid/support/v4/app/FragmentManager$BackStackEntry;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    add-int/lit8 v6, v2, -0x2

    invoke-virtual {v5, v6}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryAt(I)Landroid/support/v4/app/FragmentManager$BackStackEntry;

    move-result-object v1

    .line 311
    .local v1, "backStackEntry2":Landroid/support/v4/app/FragmentManager$BackStackEntry;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    add-int/lit8 v6, v2, -0x2

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Landroid/support/v4/app/FragmentManager;->popBackStackImmediate(II)Z

    .line 319
    .end local v0    # "backStackEntry":Landroid/support/v4/app/FragmentManager$BackStackEntry;
    .end local v1    # "backStackEntry2":Landroid/support/v4/app/FragmentManager$BackStackEntry;
    .end local v2    # "count":I
    :cond_1
    invoke-virtual {v3, p1}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->dispatchLoginEvent(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    .line 320
    return-void
.end method
