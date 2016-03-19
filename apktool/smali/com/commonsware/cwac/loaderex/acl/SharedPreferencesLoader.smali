.class public Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;
.super Landroid/support/v4/content/AsyncTaskLoader;
.source "SharedPreferencesLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/content/AsyncTaskLoader",
        "<",
        "Landroid/content/SharedPreferences;",
        ">;"
    }
.end annotation


# instance fields
.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    .line 46
    return-void
.end method

.method public static persist(Landroid/content/SharedPreferences$Editor;)V
    .locals 2
    .param p0, "editor"    # Landroid/content/SharedPreferences$Editor;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 32
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    .line 33
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 42
    :goto_0
    return-void

    .line 36
    :cond_0
    new-instance v0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader$1;

    invoke-direct {v0, p0}, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader$1;-><init>(Landroid/content/SharedPreferences$Editor;)V

    invoke-virtual {v0}, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader$1;->start()V

    goto :goto_0
.end method


# virtual methods
.method public loadInBackground()Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    .line 55
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->loadInBackground()Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method protected onStartLoading()V
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    invoke-virtual {p0, v0}, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->deliverResult(Ljava/lang/Object;)V

    .line 73
    :cond_0
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    if-nez v0, :cond_2

    .line 74
    :cond_1
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->forceLoad()V

    .line 76
    :cond_2
    return-void
.end method
