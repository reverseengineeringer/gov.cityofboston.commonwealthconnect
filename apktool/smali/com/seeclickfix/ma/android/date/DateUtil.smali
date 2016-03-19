.class public Lcom/seeclickfix/ma/android/date/DateUtil;
.super Ljava/lang/Object;
.source "DateUtil.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DateUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatDateString(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "stringToFormat"    # Ljava/lang/String;

    .prologue
    .line 46
    const/4 v4, 0x3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/text/SimpleDateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    .line 49
    .local v2, "df":Ljava/text/DateFormat;
    const-string/jumbo v3, ""

    .line 51
    .local v3, "shortDate":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Lcom/seeclickfix/ma/android/date/DateUtil;->toCalendar(Ljava/lang/String;)Ljava/util/Calendar;

    move-result-object v0

    .line 52
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 53
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 59
    .end local v0    # "calendar":Ljava/util/Calendar;
    .end local v1    # "date":Ljava/util/Date;
    :goto_0
    return-object v3

    .line 54
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public static formatMilliDateToISO(Ljava/lang/Long;)Ljava/lang/String;
    .locals 6
    .param p0, "milliseconds"    # Ljava/lang/Long;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation

    .prologue
    .line 65
    const-string/jumbo v1, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    .line 67
    .local v1, "isoFormat":Ljava/lang/String;
    new-instance v3, Ljava/text/SimpleDateFormat;

    invoke-direct {v3, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 69
    .local v3, "sdf":Ljava/text/SimpleDateFormat;
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 70
    .local v0, "dateToFormat":Ljava/util/Date;
    const-string/jumbo v2, ""

    .line 71
    .local v2, "isoFormattedString":Ljava/lang/String;
    invoke-virtual {v3, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 73
    return-object v2
.end method

.method public static getAPIFormattedDate(J)Ljava/lang/String;
    .locals 1
    .param p0, "dateMs"    # J

    .prologue
    .line 42
    const-string/jumbo v0, "TODO"

    return-object v0
.end method

.method public static getDateDisplayStringFromMSEpoch(J)Ljava/lang/String;
    .locals 6
    .param p0, "milliseconds"    # J

    .prologue
    .line 105
    const-wide/16 v4, 0x0

    cmp-long v3, p0, v4

    if-gtz v3, :cond_0

    .line 106
    const-string/jumbo v1, ""

    .line 115
    :goto_0
    return-object v1

    .line 109
    :cond_0
    const/4 v3, 0x3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/text/SimpleDateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    .line 111
    .local v2, "sdf":Ljava/text/DateFormat;
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 112
    .local v0, "dateToFormat":Ljava/util/Date;
    const-string/jumbo v1, ""

    .line 113
    .local v1, "formattedString":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 115
    goto :goto_0
.end method

.method public static getDateTimeDisplayStringFromMSEpoch(J)Ljava/lang/String;
    .locals 6
    .param p0, "milliseconds"    # J

    .prologue
    const/4 v4, 0x3

    .line 94
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-static {v4, v4, v3}, Ljava/text/SimpleDateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    .line 96
    .local v2, "sdf":Ljava/text/DateFormat;
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 97
    .local v0, "dateToFormat":Ljava/util/Date;
    const-string/jumbo v1, ""

    .line 98
    .local v1, "formattedString":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 100
    return-object v1
.end method

.method public static getTextFromMinsSince(I)Ljava/lang/String;
    .locals 10
    .param p0, "minsSince"    # I

    .prologue
    .line 25
    mul-int/lit16 v5, p0, 0x3e8

    int-to-long v6, v5

    .line 26
    .local v6, "millisecondsSince":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 27
    .local v8, "now":J
    sub-long v0, v8, v6

    .line 28
    .local v0, "actual":J
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 29
    .local v2, "d":Ljava/util/Date;
    const/4 v5, 0x1

    invoke-static {v5}, Ljava/text/SimpleDateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v4

    .line 30
    .local v4, "df":Ljava/text/DateFormat;
    invoke-virtual {v4, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 32
    .local v3, "dateString":Ljava/lang/String;
    return-object v3
.end method

.method public static toCalendar(Ljava/lang/String;)Ljava/util/Calendar;
    .locals 8
    .param p0, "iso8601string"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 80
    invoke-static {}, Ljava/util/GregorianCalendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 81
    .local v0, "calendar":Ljava/util/Calendar;
    const-string/jumbo v4, "Z"

    const-string/jumbo v5, "+00:00"

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 83
    .local v3, "s":Ljava/lang/String;
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    const/16 v6, 0x16

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x17

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 87
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string/jumbo v5, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 88
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 89
    return-object v0

    .line 84
    .end local v1    # "date":Ljava/util/Date;
    :catch_0
    move-exception v2

    .line 85
    .local v2, "e":Ljava/lang/IndexOutOfBoundsException;
    new-instance v4, Ljava/text/ParseException;

    const-string/jumbo v5, "Invalid length"

    invoke-direct {v4, v5, v7}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4
.end method
