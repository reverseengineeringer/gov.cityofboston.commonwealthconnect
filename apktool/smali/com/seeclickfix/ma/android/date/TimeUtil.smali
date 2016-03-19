.class public Lcom/seeclickfix/ma/android/date/TimeUtil;
.super Ljava/lang/Object;
.source "TimeUtil.java"


# static fields
.field public static final AM:Ljava/lang/String; = "AM"

.field public static final PM:Ljava/lang/String; = "PM"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMeridian(I)Ljava/lang/String;
    .locals 3
    .param p0, "hourOfDay"    # I

    .prologue
    .line 61
    if-ltz p0, :cond_0

    const/16 v1, 0x17

    if-le p0, v1, :cond_1

    .line 62
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "hourOfDay was not in range 0-23"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    :cond_1
    const/4 v0, 0x0

    .line 67
    .local v0, "meridian":Ljava/lang/String;
    const/16 v1, 0xb

    if-ge p0, v1, :cond_2

    .line 69
    const-string/jumbo v0, "AM"

    .line 74
    :goto_0
    return-object v0

    .line 71
    :cond_2
    const-string/jumbo v0, "PM"

    goto :goto_0
.end method

.method public static getTwelveHour(I)Ljava/lang/String;
    .locals 3
    .param p0, "hourOfDay"    # I

    .prologue
    const/16 v1, 0xc

    .line 34
    if-ltz p0, :cond_0

    const/16 v2, 0x17

    if-le p0, v2, :cond_1

    .line 35
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "hourOfDay was not in range 0-23"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 38
    :cond_1
    const/4 v0, 0x0

    .line 40
    .local v0, "hourFormatted":Ljava/lang/String;
    const/16 v2, 0xb

    if-ge p0, v2, :cond_3

    .line 43
    if-nez p0, :cond_2

    move p0, v1

    .end local p0    # "hourOfDay":I
    :cond_2
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 49
    :goto_0
    return-object v0

    .line 46
    .restart local p0    # "hourOfDay":I
    :cond_3
    add-int/lit8 v2, p0, -0xb

    if-nez v2, :cond_4

    :goto_1
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_4
    add-int/lit8 v1, p0, -0xb

    goto :goto_1
.end method

.method public static padZeroIfSingleDigit(I)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # I

    .prologue
    .line 18
    const/16 v0, 0xa

    if-lt p0, v0, :cond_0

    .line 19
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 21
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
