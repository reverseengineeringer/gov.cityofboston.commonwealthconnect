.class public Lcom/seeclickfix/ma/android/media/icons/IconHelper;
.super Ljava/lang/Object;
.source "IconHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/media/icons/IconHelper$1;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method public static getCategoryIconBaseUrl()Ljava/lang/String;
    .locals 4

    .prologue
    .line 48
    invoke-static {}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->getDensity()Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    move-result-object v1

    .line 50
    .local v1, "deviceDensity":Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;
    sget-object v2, Lcom/seeclickfix/ma/android/media/icons/IconHelper$1;->$SwitchMap$com$seeclickfix$ma$android$util$DisplayUtil$DENSITY:[I

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 72
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/category_icons/36/"

    .line 76
    .local v0, "baseUrl":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 52
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_0
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/category_icons/256/"

    .line 53
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 56
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/category_icons/128/"

    .line 57
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 60
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_2
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/category_icons/96/"

    .line 61
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 64
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_3
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/category_icons/48/"

    .line 65
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 68
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_4
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/category_icons/28/"

    .line 69
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 50
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

.method public static getZoneIconBaseUrl()Ljava/lang/String;
    .locals 4

    .prologue
    .line 13
    invoke-static {}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->getDensity()Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    move-result-object v1

    .line 15
    .local v1, "deviceDensity":Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;
    sget-object v2, Lcom/seeclickfix/ma/android/media/icons/IconHelper$1;->$SwitchMap$com$seeclickfix$ma$android$util$DisplayUtil$DENSITY:[I

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 37
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/36/"

    .line 41
    .local v0, "baseUrl":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 17
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_0
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/96/"

    .line 18
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 21
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/72/"

    .line 22
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 25
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_2
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/48/"

    .line 26
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 29
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_3
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/36/"

    .line 30
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 33
    .end local v0    # "baseUrl":Ljava/lang/String;
    :pswitch_4
    const-string/jumbo v0, "http://cdn.seeclickfix.com/images/custom_buttons/28/"

    .line 34
    .restart local v0    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 15
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
