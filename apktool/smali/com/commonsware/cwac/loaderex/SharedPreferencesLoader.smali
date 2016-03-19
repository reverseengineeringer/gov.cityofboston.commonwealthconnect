.class public Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;
.super Landroid/content/AsyncTaskLoader;
.source "SharedPreferencesLoader.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader",
        "<",
        "Landroid/content/SharedPreferences;",
        ">;",
        "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;"
    }
.end annotation


# instance fields
.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    .line 47
    return-void
.end method

.method public static persist(Landroid/content/SharedPreferences$Editor;)V
    .locals 2
    .param p0, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 33
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    .line 34
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 43
    :goto_0
    return-void

    .line 37
    :cond_0
    new-instance v0, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader$1;

    invoke-direct {v0, p0}, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader$1;-><init>(Landroid/content/SharedPreferences$Editor;)V

    invoke-virtual {v0}, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader$1;->start()V

    goto :goto_0
.end method


# virtual methods
.method public loadInBackground()Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    .line 55
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 57
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->loadInBackground()Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->onContentChanged()V

    .line 64
    return-void
.end method

.method protected onStartLoading()V
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    invoke-virtual {p0, v0}, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->deliverResult(Ljava/lang/Object;)V

    .line 81
    :cond_0
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->prefs:Landroid/content/SharedPreferences;

    if-nez v0, :cond_2

    .line 82
    :cond_1
    invoke-virtual {p0}, Lcom/commonsware/cwac/loaderex/SharedPreferencesLoader;->forceLoad()V

    .line 84
    :cond_2
    return-void
.end method
