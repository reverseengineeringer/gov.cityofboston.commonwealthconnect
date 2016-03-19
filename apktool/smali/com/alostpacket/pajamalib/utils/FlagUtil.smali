.class public Lcom/alostpacket/pajamalib/utils/FlagUtil;
.super Ljava/lang/Object;
.source "FlagUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getProtectionLevelInt(I)I
    .locals 5
    .param p0, "flagsToCheck"    # I

    .prologue
    const/4 v2, 0x3

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 74
    invoke-static {p0, v1}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 100
    :goto_0
    return v0

    .line 78
    :cond_0
    const/16 v4, 0x20

    invoke-static {p0, v4}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 80
    const/4 v0, 0x6

    goto :goto_0

    .line 82
    :cond_1
    invoke-static {p0, v3}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v4

    if-eqz v4, :cond_2

    move v0, v1

    .line 84
    goto :goto_0

    .line 86
    :cond_2
    const/16 v1, 0x10

    invoke-static {p0, v1}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 88
    const/4 v0, 0x5

    goto :goto_0

    .line 90
    :cond_3
    invoke-static {p0, v0}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 92
    const/4 v0, 0x4

    goto :goto_0

    .line 94
    :cond_4
    invoke-static {p0, v2}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v0

    if-eqz v0, :cond_5

    move v0, v2

    .line 96
    goto :goto_0

    :cond_5
    move v0, v3

    .line 100
    goto :goto_0
.end method

.method public static getProtectionLevelString(I)Ljava/lang/String;
    .locals 1
    .param p0, "flagsToCheck"    # I

    .prologue
    .line 41
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 43
    const-string/jumbo v0, "DANGEROUS"

    .line 67
    :goto_0
    return-object v0

    .line 45
    :cond_0
    const/16 v0, 0x20

    invoke-static {p0, v0}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 47
    const-string/jumbo v0, "DEVELOPMENT"

    goto :goto_0

    .line 49
    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 51
    const-string/jumbo v0, "NORMAL"

    goto :goto_0

    .line 53
    :cond_2
    const/16 v0, 0x10

    invoke-static {p0, v0}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 55
    const-string/jumbo v0, "SYSTEM"

    goto :goto_0

    .line 57
    :cond_3
    const/4 v0, 0x2

    invoke-static {p0, v0}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 59
    const-string/jumbo v0, "SIGNATURE"

    goto :goto_0

    .line 61
    :cond_4
    const/4 v0, 0x3

    invoke-static {p0, v0}, Lcom/alostpacket/pajamalib/utils/FlagUtil;->matchFlag(II)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 63
    const-string/jumbo v0, "SIGNATURE OR SYSTEM"

    goto :goto_0

    .line 67
    :cond_5
    const-string/jumbo v0, "UNKNOWN"

    goto :goto_0
.end method

.method public static isSystemApp(I)Z
    .locals 1
    .param p0, "flags"    # I

    .prologue
    .line 16
    and-int/lit8 v0, p0, 0x1

    if-lez v0, :cond_0

    .line 18
    const/4 v0, 0x1

    .line 22
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static matchFlag(II)Z
    .locals 1
    .param p0, "flagsToCheck"    # I
    .param p1, "flagToMatchAgainst"    # I

    .prologue
    .line 29
    and-int v0, p0, p1

    if-lez v0, :cond_0

    .line 31
    const/4 v0, 0x1

    .line 35
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
