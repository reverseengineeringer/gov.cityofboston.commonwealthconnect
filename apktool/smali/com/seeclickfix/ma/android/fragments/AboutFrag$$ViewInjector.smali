.class public Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector;
.super Ljava/lang/Object;
.source "AboutFrag$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/seeclickfix/ma/android/fragments/AboutFrag;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/seeclickfix/ma/android/fragments/AboutFrag;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0a0061

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361889\' for field \'aboutContent\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->aboutContent:Landroid/widget/TextView;

    .line 15
    const v1, 0x7f0a006b

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 16
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_1

    .line 17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361899\' for field \'versionCodeView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->versionCodeView:Landroid/widget/TextView;

    .line 20
    const v1, 0x7f0a0063

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 21
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_2

    .line 22
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361891\' for field \'versionStringView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 24
    :cond_2
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->versionStringView:Landroid/widget/TextView;

    .line 25
    const v1, 0x7f0a0068

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 26
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_3

    .line 27
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361896\' for field \'environmentTextView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 29
    :cond_3
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->environmentTextView:Landroid/widget/TextView;

    .line 30
    const v1, 0x7f0a0064

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 31
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_4

    .line 32
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361892\' for field \'deviceTextView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_4
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->deviceTextView:Landroid/widget/TextView;

    .line 35
    const v1, 0x7f0a0065

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 36
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_5

    .line 37
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361893\' for field \'osTextView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_5
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->osTextView:Landroid/widget/TextView;

    .line 40
    const v1, 0x7f0a0067

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 41
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_6

    .line 42
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361895\' for field \'devConsoleViewGroup\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :cond_6
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->devConsoleViewGroup:Landroid/view/ViewGroup;

    .line 45
    const v1, 0x7f0a006c

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 46
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_7

    .line 47
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361900\' for field \'localeSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :cond_7
    check-cast v0, Landroid/widget/Spinner;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->localeSpinner:Landroid/widget/Spinner;

    .line 50
    const v1, 0x7f0a006d

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 51
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_8

    .line 52
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361901\' for field \'envirnmentSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_8
    check-cast v0, Landroid/widget/Spinner;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->envirnmentSpinner:Landroid/widget/Spinner;

    .line 55
    const v1, 0x7f0a006e

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 56
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_9

    .line 57
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361902\' for field \'mServerEditText\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 59
    :cond_9
    check-cast v0, Landroid/widget/EditText;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mServerEditText:Landroid/widget/EditText;

    .line 60
    const v1, 0x7f0a0070

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 61
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_a

    .line 62
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361904\' for field \'mPresetLocationSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 64
    :cond_a
    check-cast v0, Landroid/widget/Spinner;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mPresetLocationSpinner:Landroid/widget/Spinner;

    .line 65
    const v1, 0x7f0a0071

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 66
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_b

    .line 67
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361905\' for field \'mLatEditText\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 69
    :cond_b
    check-cast v0, Landroid/widget/EditText;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLatEditText:Landroid/widget/EditText;

    .line 70
    const v1, 0x7f0a0072

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 71
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_c

    .line 72
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361906\' for field \'mLngEditText\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 74
    :cond_c
    check-cast v0, Landroid/widget/EditText;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLngEditText:Landroid/widget/EditText;

    .line 75
    const v1, 0x7f0a0123

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 76
    .restart local v0    # "view":Landroid/view/View;
    if-eqz v0, :cond_d

    .line 77
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$1;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$1;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    :cond_d
    const v1, 0x7f0a0076

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 87
    if-nez v0, :cond_e

    .line 88
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361910\' for method \'reloadCityData\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 90
    :cond_e
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$2;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$2;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    const v1, 0x7f0a0075

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 99
    if-nez v0, :cond_f

    .line 100
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361909\' for method \'clearDatabase\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 102
    :cond_f
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$3;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$3;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    const v1, 0x7f0a0074

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 111
    if-nez v0, :cond_10

    .line 112
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361908\' for method \'stopFakingLocation\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 114
    :cond_10
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$4;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$4;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    const v1, 0x7f0a0073

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 123
    if-nez v0, :cond_11

    .line 124
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361907\' for method \'setCustonLocation\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 126
    :cond_11
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$5;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$5;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    const v1, 0x7f0a006f

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 135
    if-nez v0, :cond_12

    .line 136
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361903\' for method \'setCustomServer\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 138
    :cond_12
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$6;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$6;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    return-void
.end method

.method public static reset(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V
    .locals 1
    .param p0, "target"    # Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    .prologue
    const/4 v0, 0x0

    .line 149
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->aboutContent:Landroid/widget/TextView;

    .line 150
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->versionCodeView:Landroid/widget/TextView;

    .line 151
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->versionStringView:Landroid/widget/TextView;

    .line 152
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->environmentTextView:Landroid/widget/TextView;

    .line 153
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->deviceTextView:Landroid/widget/TextView;

    .line 154
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->osTextView:Landroid/widget/TextView;

    .line 155
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->devConsoleViewGroup:Landroid/view/ViewGroup;

    .line 156
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->localeSpinner:Landroid/widget/Spinner;

    .line 157
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->envirnmentSpinner:Landroid/widget/Spinner;

    .line 158
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mServerEditText:Landroid/widget/EditText;

    .line 159
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mPresetLocationSpinner:Landroid/widget/Spinner;

    .line 160
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLatEditText:Landroid/widget/EditText;

    .line 161
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLngEditText:Landroid/widget/EditText;

    .line 162
    return-void
.end method
