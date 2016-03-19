.class public Lcom/seeclickfix/ma/android/util/DisplayUtil;
.super Ljava/lang/Object;
.source "DisplayUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DisplayUtil"

.field private static metrics:Landroid/util/DisplayMetrics;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    return-void
.end method

.method public static getDensity()Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    if-nez v0, :cond_0

    .line 77
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->UNKNOWN:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    .line 104
    :goto_0
    return-object v0

    .line 81
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    sparse-switch v0, :sswitch_data_0

    .line 104
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->UNKNOWN:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    goto :goto_0

    .line 84
    :sswitch_0
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->HIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    goto :goto_0

    .line 88
    :sswitch_1
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->LOW:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    goto :goto_0

    .line 92
    :sswitch_2
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->MEDIUM:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    goto :goto_0

    .line 96
    :sswitch_3
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->XHIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    goto :goto_0

    .line 100
    :sswitch_4
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->XXHIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    goto :goto_0

    .line 81
    :sswitch_data_0
    .sparse-switch
        0x78 -> :sswitch_1
        0xa0 -> :sswitch_2
        0xf0 -> :sswitch_0
        0x140 -> :sswitch_3
        0x1e0 -> :sswitch_4
    .end sparse-switch
.end method

.method public static getDisplayMetrics(Landroid/app/Activity;)Landroid/util/DisplayMetrics;
    .locals 2
    .param p0, "a"    # Landroid/app/Activity;

    .prologue
    .line 55
    :try_start_0
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    if-nez v0, :cond_0

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    :goto_0
    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    .line 57
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    sget-object v1, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :goto_1
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    return-object v0

    .line 55
    :cond_0
    :try_start_1
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public static getPixelsForDp(I)I
    .locals 4
    .param p0, "dp"    # I

    .prologue
    .line 126
    sget-object v2, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    iget v1, v2, Landroid/util/DisplayMetrics;->density:F

    .line 127
    .local v1, "scale":F
    int-to-float v2, p0

    mul-float/2addr v2, v1

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v2, v3

    float-to-int v0, v2

    .line 128
    .local v0, "px":I
    return v0
.end method

.method public static logDisplayMetrics(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 19
    :try_start_0
    invoke-static {p0}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->getDisplayMetrics(Landroid/app/Activity;)Landroid/util/DisplayMetrics;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    .line 21
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil;->metrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    sparse-switch v0, :sswitch_data_0

    .line 51
    :goto_0
    :sswitch_0
    return-void

    .line 46
    :catch_0
    move-exception v0

    goto :goto_0

    .line 21
    :sswitch_data_0
    .sparse-switch
        0x78 -> :sswitch_0
        0xa0 -> :sswitch_0
        0xf0 -> :sswitch_0
        0x140 -> :sswitch_0
        0x1e0 -> :sswitch_0
    .end sparse-switch
.end method
