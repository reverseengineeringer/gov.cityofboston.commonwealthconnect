.class public Lcom/seeclickfix/ma/android/config/locale/LocaleManager;
.super Ljava/lang/Object;
.source "LocaleManager.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field public static final SYSTEM_LOCALE:Ljava/lang/String; = "system"

.field private static final TAG:Ljava/lang/String; = "LocaleManager"

.field private static locale:Ljava/util/Locale;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x0

    sput-object v0, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAppLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    invoke-static {}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->isLocaleDefault()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    const-string/jumbo v0, "system"

    .line 64
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getCountry(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 82
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->getLocale(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getIsUS(Landroid/content/Context;)Z
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->getCountry(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "US"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static getLanguage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 69
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->getLocale(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLocale(Landroid/content/Context;)Ljava/util/Locale;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 78
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public static getLocaleString(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 74
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->getLocale(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "_"

    const-string/jumbo v2, "-"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isLocaleDefault()Z
    .locals 1

    .prologue
    .line 90
    sget-object v0, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static onConfigurationChange(Landroid/content/res/Configuration;)V
    .locals 2
    .param p0, "config"    # Landroid/content/res/Configuration;

    .prologue
    .line 33
    sget-object v0, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 34
    iget-object v0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->setAppLocale(Ljava/lang/String;)Ljava/util/Locale;

    .line 36
    :cond_0
    return-void
.end method

.method public static overrideLocale(Ljava/lang/String;Landroid/app/Application;)V
    .locals 3
    .param p0, "language"    # Ljava/lang/String;
    .param p1, "app"    # Landroid/app/Application;

    .prologue
    .line 39
    invoke-virtual {p1}, Landroid/app/Application;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 40
    .local v0, "config":Landroid/content/res/Configuration;
    const-string/jumbo v1, "system"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 41
    const-string/jumbo p0, ""

    .line 44
    :cond_0
    const-string/jumbo v1, "PrefNames:LOCALE_CUSTOM"

    invoke-virtual {p1}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, p0, v2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 46
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 52
    :cond_1
    :goto_0
    return-void

    .line 50
    :cond_2
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->setAppLocale(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v1

    iput-object v1, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 51
    invoke-virtual {p1}, Landroid/app/Application;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1}, Landroid/app/Application;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    goto :goto_0
.end method

.method public static setAppLocale(Ljava/lang/String;)Ljava/util/Locale;
    .locals 1
    .param p0, "language"    # Ljava/lang/String;

    .prologue
    .line 55
    new-instance v0, Ljava/util/Locale;

    invoke-direct {v0, p0}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    .line 56
    sget-object v0, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    invoke-static {v0}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 57
    sget-object v0, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public static updateLocale(Landroid/app/Application;)V
    .locals 4
    .param p0, "app"    # Landroid/app/Application;

    .prologue
    .line 28
    const-string/jumbo v1, "PrefNames:LOCALE_CUSTOM"

    const-string/jumbo v2, ""

    invoke-virtual {p0}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 29
    .local v0, "lang":Ljava/lang/String;
    invoke-static {v0, p0}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->overrideLocale(Ljava/lang/String;Landroid/app/Application;)V

    .line 30
    return-void
.end method
