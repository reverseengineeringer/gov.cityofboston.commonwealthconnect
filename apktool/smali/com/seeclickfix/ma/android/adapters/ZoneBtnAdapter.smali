.class public Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;
.super Landroid/widget/BaseAdapter;
.source "ZoneBtnAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter$2;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ZoneBtnAdapter"


# instance fields
.field private area:Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

.field private btnsParamObjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;"
        }
    .end annotation
.end field

.field private c:Landroid/content/Context;

.field private iconBaseUrl:Ljava/lang/String;

.field localZoneBtnListener:Landroid/view/View$OnClickListener;

.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private zoneBtnListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Ljava/util/List;)V
    .locals 2
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "area"    # Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p3, "btnsParamObjects":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 168
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter$1;-><init>(Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->localZoneBtnListener:Landroid/view/View$OnClickListener;

    .line 46
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->c:Landroid/content/Context;

    .line 47
    iput-object p2, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->area:Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    .line 48
    iput-object p3, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->btnsParamObjects:Ljava/util/List;

    .line 51
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->getIconBaseUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->iconBaseUrl:Ljava/lang/String;

    .line 53
    invoke-static {p1}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getIconLoader()Lcom/android/volley/toolbox/ImageLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 55
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/volley/toolbox/ImageLoader;->setBatchedResponseDelay(I)V

    .line 56
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;)Landroid/view/View$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->zoneBtnListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method private getIconBaseUrl()Ljava/lang/String;
    .locals 4

    .prologue
    .line 62
    invoke-static {}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->getDensity()Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    move-result-object v1

    .line 64
    .local v1, "deviceDensity":Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;
    sget-object v2, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter$2;->$SwitchMap$com$seeclickfix$ma$android$util$DisplayUtil$DENSITY:[I

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 86
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/36/"

    .line 90
    .local v0, "baseUrl":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 66
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_0
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/96/"

    .line 67
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 70
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/72/"

    .line 71
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 74
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_2
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/48/"

    .line 75
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 78
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_3
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/36/"

    .line 79
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 82
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_4
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/28/"

    .line 83
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 64
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private isReportButton(Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;)Z
    .locals 2
    .param p1, "btn"    # Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;

    .prologue
    .line 160
    const-string/jumbo v0, "scf://report"

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->btnsParamObjects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 101
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->btnsParamObjects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 106
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v7, 0x7f080022

    const v6, 0x7f02011d

    .line 118
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->btnsParamObjects:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;

    .line 120
    .local v3, "paramObj":Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;
    if-nez p2, :cond_0

    .line 122
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->c:Landroid/content/Context;

    const v5, 0x7f030018

    invoke-static {v4, v5, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/views/NetworkButton;

    .line 123
    .local v0, "btn":Lcom/seeclickfix/ma/android/views/NetworkButton;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->area:Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->c:Landroid/content/Context;

    invoke-static {v4, v3, v0, v5}, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->create(Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Lcom/seeclickfix/ma/android/views/NetworkButton;Landroid/content/Context;)Lcom/seeclickfix/ma/android/views/NetworkButton;

    move-result-object v0

    .line 129
    .end local p2    # "convertView":Landroid/view/View;
    :goto_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->localZoneBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v4}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setTag(Ljava/lang/Object;)V

    .line 133
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getIcon()Ljava/lang/String;

    move-result-object v2

    .line 137
    .local v2, "iconFilename":Ljava/lang/String;
    new-instance v1, Landroid/graphics/LightingColorFilter;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->c:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    .line 141
    .local v1, "cf":Landroid/graphics/ColorFilter;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->c:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setTextColor(I)V

    .line 143
    invoke-direct {p0, v3}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->isReportButton(Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 144
    invoke-virtual {v0, v6}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setDefaultImageResId(I)V

    .line 145
    invoke-virtual {v0, v6}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setErrorImageResId(I)V

    .line 152
    :goto_1
    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setFilter(Landroid/graphics/ColorFilter;)V

    .line 154
    return-object v0

    .line 126
    .end local v0    # "btn":Lcom/seeclickfix/ma/android/views/NetworkButton;
    .end local v1    # "cf":Landroid/graphics/ColorFilter;
    .end local v2    # "iconFilename":Ljava/lang/String;
    .restart local p2    # "convertView":Landroid/view/View;
    :cond_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->area:Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    check-cast p2, Lcom/seeclickfix/ma/android/views/NetworkButton;

    .end local p2    # "convertView":Landroid/view/View;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->c:Landroid/content/Context;

    invoke-static {v4, v3, p2, v5}, Lcom/seeclickfix/ma/android/views/ZoneButtonFactory;->create(Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Lcom/seeclickfix/ma/android/views/NetworkButton;Landroid/content/Context;)Lcom/seeclickfix/ma/android/views/NetworkButton;

    move-result-object v0

    .restart local v0    # "btn":Lcom/seeclickfix/ma/android/views/NetworkButton;
    goto :goto_0

    .line 146
    .restart local v1    # "cf":Landroid/graphics/ColorFilter;
    .restart local v2    # "iconFilename":Ljava/lang/String;
    :cond_1
    if-eqz v2, :cond_2

    .line 147
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->iconBaseUrl:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    sget-object v6, Lcom/android/volley/Request$Priority;->IMMEDIATE:Lcom/android/volley/Request$Priority;

    invoke-virtual {v0, v4, v5, v6}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setImageUrl(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader;Lcom/android/volley/Request$Priority;)V

    goto :goto_1

    .line 149
    :cond_2
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    sget-object v6, Lcom/android/volley/Request$Priority;->LOW:Lcom/android/volley/Request$Priority;

    invoke-virtual {v0, v4, v5, v6}, Lcom/seeclickfix/ma/android/views/NetworkButton;->setImageUrl(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader;Lcom/android/volley/Request$Priority;)V

    goto :goto_1
.end method

.method public setZoneButtonListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "zoneBtnListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->zoneBtnListener:Landroid/view/View$OnClickListener;

    .line 166
    return-void
.end method
