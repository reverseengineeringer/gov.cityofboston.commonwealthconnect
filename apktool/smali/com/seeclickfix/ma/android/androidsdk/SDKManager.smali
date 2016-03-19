.class public Lcom/seeclickfix/ma/android/androidsdk/SDKManager;
.super Ljava/lang/Object;
.source "SDKManager.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_SDKManager"

.field private static froyoMethods:Lcom/seeclickfix/ma/android/androidsdk/FroyoMethodInterface;

.field private static hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

.field private static icsMethods:Lcom/seeclickfix/ma/android/androidsdk/ICSMethodInterface;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getReportedDensity(Landroid/app/Activity;)F
    .locals 2
    .param p0, "a"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 92
    .local v0, "display":Landroid/util/DisplayMetrics;
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    return v1
.end method

.method public static handleOptionsItemSelected(Landroid/view/MenuItem;Landroid/app/Activity;)Z
    .locals 1
    .param p0, "item"    # Landroid/view/MenuItem;
    .param p1, "a"    # Landroid/app/Activity;

    .prologue
    .line 184
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->instantiateHCMethodObj()V

    .line 186
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    if-eqz v0, :cond_0

    .line 187
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    invoke-interface {v0, p0, p1}, Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;->handleOptionClick(Landroid/view/MenuItem;Landroid/app/Activity;)Z

    move-result v0

    .line 189
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static hideActionBar(Landroid/app/Activity;)V
    .locals 1
    .param p0, "a"    # Landroid/app/Activity;

    .prologue
    .line 136
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->instantiateHCMethodObj()V

    .line 138
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    if-eqz v0, :cond_0

    .line 139
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    invoke-interface {v0, p0}, Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;->hideActionBar(Landroid/app/Activity;)V

    .line 141
    :cond_0
    return-void
.end method

.method public static instantiateFroyoMethodObj()V
    .locals 2

    .prologue
    .line 117
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    .line 118
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->froyoMethods:Lcom/seeclickfix/ma/android/androidsdk/FroyoMethodInterface;

    if-nez v0, :cond_0

    .line 119
    new-instance v0, Lcom/seeclickfix/ma/android/androidsdk/FroyoMethods;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/androidsdk/FroyoMethods;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->froyoMethods:Lcom/seeclickfix/ma/android/androidsdk/FroyoMethodInterface;

    .line 122
    :cond_0
    return-void
.end method

.method public static instantiateHCMethodObj()V
    .locals 2

    .prologue
    .line 97
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 98
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    if-nez v0, :cond_0

    .line 101
    new-instance v0, Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethods;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethods;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    .line 104
    :cond_0
    return-void
.end method

.method public static instantiateICSMethodObj()V
    .locals 2

    .prologue
    .line 107
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 108
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->icsMethods:Lcom/seeclickfix/ma/android/androidsdk/ICSMethodInterface;

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Lcom/seeclickfix/ma/android/androidsdk/ICSMethods;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/androidsdk/ICSMethods;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->icsMethods:Lcom/seeclickfix/ma/android/androidsdk/ICSMethodInterface;

    .line 114
    :cond_0
    return-void
.end method

.method public static isHoneycombOrAbove()Z
    .locals 2

    .prologue
    .line 68
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isHoneycombTablet(Landroid/app/Activity;)Z
    .locals 3
    .param p0, "a"    # Landroid/app/Activity;

    .prologue
    .line 38
    const/4 v0, 0x0

    .line 41
    .local v0, "isHCTablet":Z
    :try_start_0
    invoke-static {p0}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->isScreenSizeXlarge(Landroid/app/Activity;)Z

    move-result v1

    .line 46
    .local v1, "isXLargeSreen":Z
    if-eqz v1, :cond_0

    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->isHoneycombOrAbove()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    const/4 v0, 0x1

    .line 62
    .end local v1    # "isXLargeSreen":Z
    :goto_0
    return v0

    .line 49
    .restart local v1    # "isXLargeSreen":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 52
    .end local v1    # "isXLargeSreen":Z
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static isScreenSizeXlarge(Landroid/app/Activity;)Z
    .locals 12
    .param p0, "a"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 82
    .local v0, "display":Landroid/util/DisplayMetrics;
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    iget v8, v0, Landroid/util/DisplayMetrics;->xdpi:F

    div-float/2addr v1, v8

    float-to-double v6, v1

    .line 83
    .local v6, "widthInches":D
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    iget v8, v0, Landroid/util/DisplayMetrics;->ydpi:F

    div-float/2addr v1, v8

    float-to-double v2, v1

    .line 84
    .local v2, "heightInches":D
    mul-double v8, v6, v6

    mul-double v10, v2, v2

    add-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    .line 86
    .local v4, "screenSizeInches":D
    const-wide/high16 v8, 0x401a000000000000L    # 6.5

    cmpl-double v1, v4, v8

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static requestActionBar(Landroid/app/Activity;)V
    .locals 1
    .param p0, "a"    # Landroid/app/Activity;

    .prologue
    .line 126
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->instantiateHCMethodObj()V

    .line 128
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    if-eqz v0, :cond_0

    .line 129
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    invoke-interface {v0, p0}, Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;->requestActionBar(Landroid/app/Activity;)V

    .line 132
    :cond_0
    return-void
.end method

.method public static setupActionBar(Landroid/app/Activity;)V
    .locals 3
    .param p0, "a"    # Landroid/app/Activity;

    .prologue
    .line 145
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->instantiateHCMethodObj()V

    .line 147
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->instantiateICSMethodObj()V

    .line 149
    const/4 v0, 0x0

    .line 151
    .local v0, "actionBar":Ljava/lang/Object;
    sget-object v1, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    if-eqz v1, :cond_0

    .line 152
    sget-object v1, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    invoke-interface {v1, p0}, Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;->setupActionBar(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v0

    .line 156
    .end local v0    # "actionBar":Ljava/lang/Object;
    :cond_0
    sget-object v1, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->icsMethods:Lcom/seeclickfix/ma/android/androidsdk/ICSMethodInterface;

    if-eqz v1, :cond_1

    .line 157
    sget-object v1, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->icsMethods:Lcom/seeclickfix/ma/android/androidsdk/ICSMethodInterface;

    const/4 v2, 0x1

    invoke-interface {v1, v0, v2}, Lcom/seeclickfix/ma/android/androidsdk/ICSMethodInterface;->setHomeButtonEnabled(Ljava/lang/Object;Z)V

    .line 159
    :cond_1
    return-void
.end method

.method public static setupHoneycombSearch(Landroid/app/Activity;Landroid/view/Menu;)V
    .locals 1
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 162
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->instantiateHCMethodObj()V

    .line 164
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    if-eqz v0, :cond_0

    .line 165
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->hcMethods:Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;

    invoke-interface {v0, p0, p1}, Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;->setupHoneycombSearch(Landroid/app/Activity;Landroid/view/Menu;)V

    .line 167
    :cond_0
    return-void
.end method

.method public static smoothScrollToPosition(Landroid/widget/ListView;I)V
    .locals 1
    .param p0, "lv"    # Landroid/widget/ListView;
    .param p1, "position"    # I

    .prologue
    .line 170
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->instantiateFroyoMethodObj()V

    .line 172
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->froyoMethods:Lcom/seeclickfix/ma/android/androidsdk/FroyoMethodInterface;

    if-eqz v0, :cond_0

    .line 173
    sget-object v0, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->froyoMethods:Lcom/seeclickfix/ma/android/androidsdk/FroyoMethodInterface;

    invoke-interface {v0, p1, p0}, Lcom/seeclickfix/ma/android/androidsdk/FroyoMethodInterface;->smoothScrollToPosition(ILandroid/widget/ListView;)V

    .line 177
    :goto_0
    return-void

    .line 175
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/ListView;->setSelection(I)V

    goto :goto_0
.end method
