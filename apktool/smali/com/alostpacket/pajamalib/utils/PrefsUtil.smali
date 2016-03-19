.class public Lcom/alostpacket/pajamalib/utils/PrefsUtil;
.super Ljava/lang/Object;
.source "PrefsUtil.java"


# static fields
.field private static prefs:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearPrefs(Landroid/content/Context;)V
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 37
    sget-object v1, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/alostpacket/pajamalib/utils/AppUtil;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, ".prefs"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    :goto_0
    sput-object v1, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    .line 38
    sget-object v1, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 39
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 40
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 41
    return-void

    .line 37
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    sget-object v1, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    goto :goto_0
.end method

.method public static getBoolean(Ljava/lang/String;ZLandroid/content/Context;)Z
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Z
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 93
    invoke-static {p2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 94
    .local v0, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static getFloat(Ljava/lang/String;FLandroid/content/Context;)F
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # F
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 118
    invoke-static {p2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 119
    .local v0, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    return v1
.end method

.method public static getInt(Ljava/lang/String;ILandroid/content/Context;)I
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 100
    invoke-static {p2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 101
    .local v0, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public static getLong(Ljava/lang/String;JLandroid/content/Context;)J
    .locals 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # J
    .param p3, "c"    # Landroid/content/Context;

    .prologue
    .line 112
    invoke-static {p3}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 113
    .local v0, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v0, p0, p1, p2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    return-wide v2
.end method

.method private static getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 31
    sget-object v0, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/alostpacket/pajamalib/utils/AppUtil;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, ".prefs"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    :goto_0
    sput-object v0, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    .line 32
    sget-object v0, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    return-object v0

    .line 31
    :cond_0
    sget-object v0, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->prefs:Landroid/content/SharedPreferences;

    goto :goto_0
.end method

.method public static getString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/String;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 106
    invoke-static {p2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 107
    .local v0, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static putBoolean(Ljava/lang/String;ZLandroid/content/Context;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Z
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-static {p2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 49
    .local v1, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 50
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 51
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 52
    return-void
.end method

.method public static putFloat(Ljava/lang/String;FLandroid/content/Context;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # F
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 82
    invoke-static {p2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 83
    .local v1, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 84
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 85
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 86
    return-void
.end method

.method public static putInt(Ljava/lang/String;ILandroid/content/Context;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # I
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-static {p2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 58
    .local v1, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 59
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 60
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 61
    return-void
.end method

.method public static putLong(Ljava/lang/String;JLandroid/content/Context;)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # J
    .param p3, "c"    # Landroid/content/Context;

    .prologue
    .line 74
    invoke-static {p3}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 75
    .local v1, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 76
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 77
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 78
    return-void
.end method

.method public static putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-static {p2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 66
    .local v1, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 68
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 69
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 70
    return-void
.end method
