.class public Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;
.super Ljava/lang/Object;
.source "StatusSpinnerFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getSpinner(Lcom/seeclickfix/ma/android/objects/issue/Issue;Landroid/content/Context;)Landroid/widget/Spinner;
    .locals 3
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "activityContext"    # Landroid/content/Context;

    .prologue
    .line 35
    new-instance v0, Landroid/widget/Spinner;

    invoke-direct {v0, p2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 37
    .local v0, "statusSpinner":Landroid/widget/Spinner;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0062

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setPrompt(Ljava/lang/CharSequence;)V

    .line 38
    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    .line 39
    return-object v0
.end method

.method private getStatusSpinnerAdapter(Ljava/util/List;)Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "statusStateList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;-><init>()V

    .line 45
    .local v0, "spinnerAdapter":Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getDisplayForList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->setDisplayList(Ljava/util/List;)V

    .line 46
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->setKeyList(Ljava/util/List;)V

    .line 47
    return-object v0
.end method


# virtual methods
.method public buildSpinner(Lcom/seeclickfix/ma/android/objects/issue/Issue;ZLandroid/content/Context;)Landroid/widget/Spinner;
    .locals 5
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "closedIsFinal"    # Z
    .param p3, "activityContext"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->authenticatedUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v3

    invoke-static {p1, v3, p2}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->statusListForIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/objects/user/AuthUser;Z)Ljava/util/List;

    move-result-object v2

    .line 21
    .local v2, "statusStateList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x2

    if-ge v3, v4, :cond_0

    .line 22
    const/4 v1, 0x0

    .line 31
    :goto_0
    return-object v1

    .line 25
    :cond_0
    invoke-direct {p0, p1, p3}, Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;->getSpinner(Lcom/seeclickfix/ma/android/objects/issue/Issue;Landroid/content/Context;)Landroid/widget/Spinner;

    move-result-object v1

    .line 26
    .local v1, "statusSpinner":Landroid/widget/Spinner;
    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;->getStatusSpinnerAdapter(Ljava/util/List;)Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;

    move-result-object v0

    .line 28
    .local v0, "spinnerAdapter":Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;
    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 29
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/widget/Spinner;->setSelection(IZ)V

    goto :goto_0
.end method
