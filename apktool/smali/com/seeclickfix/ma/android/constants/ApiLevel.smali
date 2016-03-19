.class public Lcom/seeclickfix/ma/android/constants/ApiLevel;
.super Ljava/lang/Object;
.source "ApiLevel.java"


# static fields
.field public static SUPPORTS_ECLAIR:Z

.field public static SUPPORTS_FROYO:Z

.field public static SUPPORTS_GINGERBREAD:Z

.field public static SUPPORTS_HONEYCOMB:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x9

    if-lt v0, v3, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/seeclickfix/ma/android/constants/ApiLevel;->SUPPORTS_GINGERBREAD:Z

    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v0, v3, :cond_1

    move v0, v1

    :goto_1
    sput-boolean v0, Lcom/seeclickfix/ma/android/constants/ApiLevel;->SUPPORTS_HONEYCOMB:Z

    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x8

    if-lt v0, v3, :cond_2

    move v0, v1

    :goto_2
    sput-boolean v0, Lcom/seeclickfix/ma/android/constants/ApiLevel;->SUPPORTS_FROYO:Z

    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v3, 0x5

    if-lt v0, v3, :cond_3

    :goto_3
    sput-boolean v1, Lcom/seeclickfix/ma/android/constants/ApiLevel;->SUPPORTS_ECLAIR:Z

    return-void

    :cond_0
    move v0, v2

    .line 4
    goto :goto_0

    :cond_1
    move v0, v2

    .line 5
    goto :goto_1

    :cond_2
    move v0, v2

    .line 6
    goto :goto_2

    :cond_3
    move v1, v2

    .line 7
    goto :goto_3
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
