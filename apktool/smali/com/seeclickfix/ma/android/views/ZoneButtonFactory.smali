.class public Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;
.super Ljava/lang/Object;
.source "ZoneButtonFactory.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ZoneButtonFactory"

.field private static iconMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Lcom/seeclickfix/ma/android/views/NetworkButton;Landroid/content/Context;)Lcom/seeclickfix/ma/android/views/NetworkButton;
    .locals 8
    .param p0, "area"    # Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;
    .param p1, "buttonParamsObject"    # Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;
    .param p2, "inflatedBtn"    # Lcom/seeclickfix/ma/android/views/NetworkButton;
    .param p3, "c"    # Landroid/content/Context;

    .prologue
    .line 73
    move-object v1, p2

    .line 74
    .local v1, "btn":Lcom/seeclickfix/ma/android/views/NetworkButton;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getLabel()Ljava/lang/String;

    move-result-object v5

    .line 75
    .local v5, "label":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getIcon()Ljava/lang/String;

    move-result-object v4

    .line 76
    .local v4, "iconName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getUri()Ljava/lang/String;

    move-result-object v7

    .line 79
    .local v7, "uri":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getStartGradientButtonColor()I

    move-result v2

    .line 80
    .local v2, "btnColor1":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getButtonColor()I

    move-result v3

    .line 81
    .local v3, "btnColor2":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getTextColor()I

    move-result v6

    .line 110
    .local v6, "textColor":I
    invoke-virtual {v1, v5}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setText(Ljava/lang/CharSequence;)V

    .line 115
    return-object v1
.end method

.method public static createOld(Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Landroid/content/Context;)Lcom/seeclickfix/ma/android/views/NetworkButton;
    .locals 9
    .param p0, "area"    # Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;
    .param p1, "buttonParamsObject"    # Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;
    .param p2, "c"    # Landroid/content/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 27
    new-instance v1, Lcom/seeclickfix/ma/android/views/NetworkButton;

    invoke-direct {v1, p2}, Lcom/seeclickfix/ma/android/views/NetworkButton;-><init>(Landroid/content/Context;)V

    .line 28
    .local v1, "btn":Lcom/seeclickfix/ma/android/views/NetworkButton;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getLabel()Ljava/lang/String;

    move-result-object v5

    .line 29
    .local v5, "label":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getIcon()Ljava/lang/String;

    move-result-object v4

    .line 30
    .local v4, "iconName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 31
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getUri()Ljava/lang/String;

    move-result-object v7

    .line 33
    .local v7, "uri":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getStartGradientButtonColor()I

    move-result v2

    .line 34
    .local v2, "btnColor1":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getButtonColor()I

    move-result v3

    .line 35
    .local v3, "btnColor2":I
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getTextColor()I

    move-result v6

    .line 63
    .local v6, "textColor":I
    const v8, 0x7f020098

    invoke-virtual {v1, v8}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setBackgroundResource(I)V

    .line 65
    invoke-virtual {v1, v5}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setText(Ljava/lang/CharSequence;)V

    .line 68
    return-object v1
.end method

.method private static getIconForButton(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 126
    invoke-static {p1}, Lcom/seeclickfix/ma/android/util/StringUtil;->removeExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 127
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 128
    .local v1, "res":Landroid/content/res/Resources;
    const-string/jumbo v2, "drawable"

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 129
    .local v0, "nameResourceID":I
    if-nez v0, :cond_0

    .line 136
    const/4 v2, 0x0

    .line 138
    :goto_0
    return-object v2

    :cond_0
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_0
.end method

.method private static getIconForButtonLive(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 6
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 151
    invoke-static {}, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->getIconMap()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 153
    .local v0, "localName":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 166
    :cond_0
    :goto_0
    return-object v3

    .line 157
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 158
    .local v2, "res":Landroid/content/res/Resources;
    const-string/jumbo v4, "drawable"

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v0, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 159
    .local v1, "nameResourceID":I
    if-eqz v1, :cond_0

    .line 166
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_0
.end method

.method private static getIconMap()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 176
    sget-object v0, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->iconMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 177
    sget-object v0, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->iconMap:Ljava/util/Map;

    .line 186
    :goto_0
    return-object v0

    .line 179
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->iconMap:Ljava/util/Map;

    .line 181
    sget-object v0, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->iconMap:Ljava/util/Map;

    const-string/jumbo v1, "83-calendar.png"

    const-string/jumbo v2, "ic_calendar_custom"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->iconMap:Ljava/util/Map;

    const-string/jumbo v1, "75-phone.png"

    const-string/jumbo v2, "ic_phone_white"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->iconMap:Ljava/util/Map;

    goto :goto_0
.end method
