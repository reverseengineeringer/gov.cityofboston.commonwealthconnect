.class public Lcom/seeclickfix/ma/android/fragments/AboutFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "AboutFrag.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "AboutFrag"


# instance fields
.field aboutContent:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0061
    .end annotation
.end field

.field private c:Landroid/content/Context;

.field devConsoleViewGroup:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0067
    .end annotation
.end field

.field deviceTextView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0064
    .end annotation
.end field

.field envirnmentSpinner:Landroid/widget/Spinner;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a006d
    .end annotation
.end field

.field environmentTextView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0068
    .end annotation
.end field

.field handler:Landroid/os/Handler;

.field localeSpinner:Landroid/widget/Spinner;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a006c
    .end annotation
.end field

.field mLatEditText:Landroid/widget/EditText;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0071
    .end annotation
.end field

.field mLngEditText:Landroid/widget/EditText;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0072
    .end annotation
.end field

.field mLocationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field mPresetLocationSpinner:Landroid/widget/Spinner;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0070
    .end annotation
.end field

.field mServerEditText:Landroid/widget/EditText;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a006e
    .end annotation
.end field

.field openDatabaseRunnable:Ljava/lang/Runnable;

.field osTextView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0065
    .end annotation
.end field

.field presetLocListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field serverListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field versionCodeView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a006b
    .end annotation
.end field

.field versionStringView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a0063
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 217
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->serverListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 352
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$4;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$4;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->openDatabaseRunnable:Ljava/lang/Runnable;

    .line 365
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$5;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$5;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->handler:Landroid/os/Handler;

    .line 437
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$6;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$6;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->presetLocListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->setDevMode()V

    return-void
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->clearAllVolleyCache()V

    return-void
.end method

.method private clearAllVolleyCache()V
    .locals 1

    .prologue
    .line 537
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/volley/RequestQueue;->getCache()Lcom/android/volley/Cache;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/volley/Cache;->clear()V

    .line 542
    return-void
.end method

.method private getEnviromentText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 545
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/config/AppBuild;->getEnvironment(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 547
    .local v0, "env":Ljava/lang/String;
    const-string/jumbo v1, "ENVIRONMENT.PROD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "ENVIRONMENT.INT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "ENVIRONMENT.TEST"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 550
    .end local v0    # "env":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .restart local v0    # "env":Ljava/lang/String;
    :cond_1
    const-string/jumbo v0, "ENVIRONMENT.CUSTOM"

    goto :goto_0
.end method

.method private setContent()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 164
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->isDedicatedApp(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 165
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->aboutContent:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 168
    :cond_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->versionCodeView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/config/AppBuild;->getVersionCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->versionStringView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/config/AppBuild;->getVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 173
    .local v1, "deviceName":Ljava/lang/String;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 175
    .local v2, "osVersion":Ljava/lang/String;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->environmentTextView:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getEnviromentText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->deviceTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->osTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a0066

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 181
    .local v0, "devHiddenBtn":Landroid/view/View;
    const-string/jumbo v3, "dev_mode_enabled"

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v3, v5, v4}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getBoolean(Ljava/lang/String;ZLandroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 182
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->showDevModeIfEnabled()V

    .line 197
    :goto_0
    return-void

    .line 184
    :cond_1
    const-string/jumbo v3, "dev_mode_times_pressed"

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v3, v5, v4}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putInt(Ljava/lang/String;ILandroid/content/Context;)V

    .line 186
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/AboutFrag$2;

    invoke-direct {v3, p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method private setDevMode()V
    .locals 5

    .prologue
    const/16 v4, 0xa

    .line 201
    const-string/jumbo v1, "dev_mode_times_pressed"

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v1, v2, v3}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getInt(Ljava/lang/String;ILandroid/content/Context;)I

    move-result v0

    .line 203
    .local v0, "timesPressed":I
    add-int/lit8 v0, v0, 0x1

    .line 205
    const-string/jumbo v1, "dev_mode_times_pressed"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v1, v0, v2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putInt(Ljava/lang/String;ILandroid/content/Context;)V

    .line 207
    const/4 v1, 0x5

    if-le v0, v1, :cond_1

    if-ge v0, v4, :cond_1

    .line 208
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "press "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    rsub-int/lit8 v3, v0, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " more times to enable dev mode"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 215
    :cond_0
    :goto_0
    return-void

    .line 209
    :cond_1
    if-lt v0, v4, :cond_0

    .line 210
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-string/jumbo v2, "dev mode enabled"

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 211
    const-string/jumbo v1, "dev_mode_enabled"

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v1, v2, v3}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putBoolean(Ljava/lang/String;ZLandroid/content/Context;)V

    .line 212
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->showDevModeIfEnabled()V

    goto :goto_0
.end method

.method private showDevModeIfEnabled()V
    .locals 12

    .prologue
    const v11, 0x7f060003

    const v10, 0x7f060002

    const v9, 0x7f03006b

    const v8, 0x7f03006a

    const/4 v7, 0x0

    .line 242
    const-string/jumbo v5, "dev_mode_enabled"

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v5, v7, v6}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getBoolean(Ljava/lang/String;ZLandroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 244
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->devConsoleViewGroup:Landroid/view/ViewGroup;

    invoke-virtual {v5, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 246
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 247
    .local v2, "locales":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v5, v10, v9}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v0

    .line 248
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    invoke-virtual {v0, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 249
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->localeSpinner:Landroid/widget/Spinner;

    invoke-virtual {v5, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 250
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->localeSpinner:Landroid/widget/Spinner;

    invoke-virtual {v5, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 251
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->localeSpinner:Landroid/widget/Spinner;

    invoke-static {}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->getAppLanguage()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 253
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v5, v11, v9}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v4

    .line 254
    .local v4, "serverAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    invoke-virtual {v4, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 255
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->envirnmentSpinner:Landroid/widget/Spinner;

    invoke-virtual {v5, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 256
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->envirnmentSpinner:Landroid/widget/Spinner;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 258
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 260
    .local v1, "envDisplay":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5}, Lcom/seeclickfix/ma/android/config/AppBuild;->getEnvironment(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 262
    .local v3, "oldEnv":Ljava/lang/String;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->envirnmentSpinner:Landroid/widget/Spinner;

    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getPositionForEnvironment(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 264
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->envirnmentSpinner:Landroid/widget/Spinner;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->serverListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 266
    const-string/jumbo v5, "ENVIRONMENT.CUSTOM"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 267
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mServerEditText:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v6}, Lcom/seeclickfix/ma/android/config/AppBuild;->getHostname(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 271
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->loadPresetLocations()V

    .line 273
    .end local v0    # "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    .end local v1    # "envDisplay":[Ljava/lang/String;
    .end local v2    # "locales":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "oldEnv":Ljava/lang/String;
    .end local v4    # "serverAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    :cond_1
    return-void
.end method


# virtual methods
.method clearDatabase()V
    .locals 4
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a0075
        }
    .end annotation

    .prologue
    .line 338
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-class v3, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {v2, v3}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 339
    .local v0, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 340
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->close()V

    .line 342
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-string/jumbo v3, "scfcache.db"

    invoke-virtual {v2, v3}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 344
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-class v3, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {v2, v3}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 345
    .local v1, "helper2":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 349
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-string/jumbo v3, "Database reset. NOTE: App may crash on next db use.  This is expected, just start it again."

    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 350
    return-void
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 151
    const/4 v0, 0x0

    return-object v0
.end method

.method getPositionForEnvironment(Ljava/lang/String;)I
    .locals 2
    .param p1, "oldEnv"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 291
    const-string/jumbo v1, "ENVIRONMENT.TEST"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 307
    :cond_0
    :goto_0
    return v0

    .line 295
    :cond_1
    const-string/jumbo v1, "ENVIRONMENT.PROD"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 296
    const/4 v0, 0x1

    goto :goto_0

    .line 299
    :cond_2
    const-string/jumbo v1, "ENVIRONMENT.INT"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 300
    const/4 v0, 0x2

    goto :goto_0

    .line 303
    :cond_3
    const-string/jumbo v1, "ENVIRONMENT.CUSTOM"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 304
    const/4 v0, 0x3

    goto :goto_0
.end method

.method launchMockLocationActivity()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a0123
        }
    .end annotation

    .annotation build Lbutterknife/Optional;
    .end annotation

    .prologue
    .line 313
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.seeclickfix.actions.SHOW_MOCK_ACTIVITY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 316
    .local v0, "i":Landroid/content/Intent;
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/app/FragmentActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    :goto_0
    return-void

    .line 317
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method loadPresetLocations()V
    .locals 5

    .prologue
    .line 427
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v2}, Lcom/seeclickfix/ma/android/location/TestLocationList;->getPresetLocations(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 429
    .local v1, "presetLocationList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/location/PresetLocation;>;"
    new-instance v0, Landroid/widget/ArrayAdapter;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const v3, 0x7f03006b

    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 430
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    const v2, 0x7f03006a

    invoke-virtual {v0, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 431
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mPresetLocationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 432
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mPresetLocationSpinner:Landroid/widget/Spinner;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->presetLocListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 434
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 136
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 139
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    .line 141
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v0

    const v1, 0x7f0c00c2

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(I)V

    .line 143
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->setContent()V

    .line 145
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->setHasOptionsMenu(Z)V

    .line 147
    return-void
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 156
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 157
    const v0, 0x7f0e0002

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 158
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 159
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 110
    if-nez p2, :cond_0

    .line 112
    const/4 v1, 0x0

    .line 129
    :goto_0
    return-object v1

    .line 114
    :cond_0
    const v1, 0x7f030026

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 115
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->rootFrag:Landroid/view/ViewGroup;

    const v2, 0x7f0a0062

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 117
    .local v0, "button":Landroid/view/View;
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/AboutFrag$1;

    invoke-direct {v1, p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->rootFrag:Landroid/view/ViewGroup;

    invoke-static {p0, v1}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Landroid/view/View;)V

    .line 129
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p2, "view"    # Landroid/view/View;
    .param p3, "pos"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 231
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 233
    .local v0, "newLang":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->overrideLocale(Ljava/lang/String;Landroid/app/Application;)V

    .line 234
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 238
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method reloadCityData()V
    .locals 4
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a0076
        }
    .end annotation

    .prologue
    .line 325
    const-string/jumbo v1, "Pref:CITY_DATA_LOADED"

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-static {v1, v2, v3}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putBoolean(Ljava/lang/String;ZLandroid/content/Context;)V

    .line 327
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 328
    .local v0, "startCityLoadIntent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/seeclickfix/ma/android/services/CityLoadingService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 330
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 332
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-string/jumbo v2, "City data reloading..."

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 334
    return-void
.end method

.method setCustomServer()V
    .locals 5
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a006f
        }
    .end annotation

    .prologue
    .line 503
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mServerEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 505
    .local v1, "server":Ljava/lang/String;
    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 506
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-string/jumbo v3, "You must enter a server on format IP Address/Port"

    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 532
    :goto_0
    return-void

    .line 509
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/config/AppBuild;->setEnvironment(Ljava/lang/String;Landroid/content/Context;)V

    .line 511
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a0068

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 512
    .local v0, "environmentTextView":Landroid/widget/TextView;
    const/high16 v2, -0x10000

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 513
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getEnviromentText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 515
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/seeclickfix/ma/android/auth/AuthManager;->logout(Landroid/content/Context;)V

    .line 516
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getAppContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/MyApplication;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/MyApplication;->createV2Service()V

    .line 517
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->clearAllVolleyCache()V

    .line 519
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Environment set to: http://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "You have been logged out."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Profile picture and name may not display correctly"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Volley cache cleared."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 529
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->envirnmentSpinner:Landroid/widget/Spinner;

    const-string/jumbo v3, "ENVIRONMENT.CUSTOM"

    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getPositionForEnvironment(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setSelection(I)V

    .line 531
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->clearDraft()V

    goto/16 :goto_0
.end method

.method setCustonLocation()V
    .locals 8
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a0073
        }
    .end annotation

    .prologue
    .line 474
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLatEditText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLngEditText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 475
    :cond_0
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-string/jumbo v6, "You must enter a lat and a lng"

    invoke-static {v5, v6}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 499
    :cond_1
    :goto_0
    return-void

    .line 479
    :cond_2
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLatEditText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 480
    .local v0, "lat":D
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLngEditText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 482
    .local v2, "lng":D
    new-instance v5, Lcom/seeclickfix/ma/android/location/PresetLocation;

    invoke-direct {v5}, Lcom/seeclickfix/ma/android/location/PresetLocation;-><init>()V

    const-string/jumbo v6, "Custom"

    invoke-virtual {v5, v6}, Lcom/seeclickfix/ma/android/location/PresetLocation;->name(Ljava/lang/String;)Lcom/seeclickfix/ma/android/location/PresetLocation;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Lcom/seeclickfix/ma/android/location/PresetLocation;->lat(D)Lcom/seeclickfix/ma/android/location/PresetLocation;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Lcom/seeclickfix/ma/android/location/PresetLocation;->lng(D)Lcom/seeclickfix/ma/android/location/PresetLocation;

    move-result-object v5

    const/high16 v6, 0x42c80000    # 100.0f

    invoke-virtual {v5, v6}, Lcom/seeclickfix/ma/android/location/PresetLocation;->accuracy(F)Lcom/seeclickfix/ma/android/location/PresetLocation;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/seeclickfix/ma/android/location/PresetLocation;->time(J)Lcom/seeclickfix/ma/android/location/PresetLocation;

    move-result-object v4

    .line 489
    .local v4, "presetLocation":Lcom/seeclickfix/ma/android/location/PresetLocation;
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/location/PresetLocation;->name()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "(No location selected)"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 491
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLocationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v5, v4}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->forceMockLocation(Lcom/seeclickfix/ma/android/location/PresetLocation;)V

    .line 492
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->clearAllVolleyCache()V

    .line 493
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Location set to: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/location/PresetLocation;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "Volley cache cleared."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method setDevEnvironment(I)V
    .locals 7
    .param p1, "which"    # I

    .prologue
    .line 372
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060003

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 374
    .local v0, "envDisplay":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-static {v4}, Lcom/seeclickfix/ma/android/config/AppBuild;->getEnvironment(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 375
    .local v3, "oldEnv":Ljava/lang/String;
    sget-object v2, Lcom/seeclickfix/ma/android/config/AppBuild;->DEFAULT_ENVIRONMENT:Ljava/lang/String;

    .line 378
    .local v2, "newEnv":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 393
    sget-object v2, Lcom/seeclickfix/ma/android/config/AppBuild;->DEFAULT_ENVIRONMENT:Ljava/lang/String;

    .line 396
    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string/jumbo v4, "ENVIRONMENT.CUSTOM"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 398
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/seeclickfix/ma/android/config/AppBuild;->setEnvironment(Ljava/lang/String;Landroid/content/Context;)V

    .line 400
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mServerEditText:Landroid/widget/EditText;

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 402
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a0068

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 403
    .local v1, "environmentTextView":Landroid/widget/TextView;
    const/high16 v4, -0x10000

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 404
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getEnviromentText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 406
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/seeclickfix/ma/android/auth/AuthManager;->logout(Landroid/content/Context;)V

    .line 407
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getAppContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/MyApplication;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/MyApplication;->createV2Service()V

    .line 408
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->clearAllVolleyCache()V

    .line 410
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Environment set to: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "You have been logged out."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "Profile picture and name may not display correctly"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "Volley cache cleared."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 422
    .end local v1    # "environmentTextView":Landroid/widget/TextView;
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->clearDraft()V

    .line 423
    return-void

    .line 380
    :pswitch_0
    const-string/jumbo v2, "ENVIRONMENT.TEST"

    .line 381
    goto/16 :goto_0

    .line 383
    :pswitch_1
    const-string/jumbo v2, "ENVIRONMENT.PROD"

    .line 384
    goto/16 :goto_0

    .line 386
    :pswitch_2
    const-string/jumbo v2, "ENVIRONMENT.INT"

    .line 387
    goto/16 :goto_0

    .line 389
    :pswitch_3
    const-string/jumbo v2, "ENVIRONMENT.CUSTOM"

    .line 390
    goto/16 :goto_0

    .line 378
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method stopFakingLocation()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0a0074
        }
    .end annotation

    .prologue
    .line 463
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLocationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->releaseLocationFaking()V

    .line 464
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->clearAllVolleyCache()V

    .line 466
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;

    const-string/jumbo v1, "Location faking stopped, location set to null, cache cleared"

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 469
    return-void
.end method
