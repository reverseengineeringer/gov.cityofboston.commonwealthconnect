.class public Lcom/seeclickfix/ma/android/cache/GlobalReportCache;
.super Ljava/lang/Object;
.source "GlobalReportCache.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GlobalObjectCache"

.field private static currentReport:Lcom/seeclickfix/ma/android/objects/report/Report;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->currentReport:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearReport()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x0

    sput-object v0, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->currentReport:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 46
    return-void
.end method

.method public static getReport()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->currentReport:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-object v0
.end method

.method public static markReportForDelete()V
    .locals 2

    .prologue
    .line 39
    sget-object v0, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->currentReport:Lcom/seeclickfix/ma/android/objects/report/Report;

    if-eqz v0, :cond_0

    .line 40
    sget-object v0, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->currentReport:Lcom/seeclickfix/ma/android/objects/report/Report;

    const-string/jumbo v1, "ReportState:MARKED_FOR_DELETE"

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setState(Ljava/lang/String;)V

    .line 42
    :cond_0
    return-void
.end method

.method public static putReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0
    .param p0, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 28
    sput-object p0, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->currentReport:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 29
    return-void
.end method
