.class public Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;
.super Ljava/lang/Object;
.source "ReportProvider.java"


# annotations
.annotation runtime Ljavax/inject/Singleton;
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_ReportProvider"


# instance fields
.field mReportDbLoader:Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private loadFromCache()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 5

    .prologue
    .line 47
    const/4 v1, 0x0

    .line 48
    .local v1, "returnReport":Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-static {}, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->getReport()Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v0

    .line 50
    .local v0, "globalReport":Lcom/seeclickfix/ma/android/objects/report/Report;
    if-eqz v0, :cond_1

    .line 52
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getState()Ljava/lang/String;

    move-result-object v3

    const/4 v2, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 63
    :cond_1
    :goto_1
    return-object v1

    .line 52
    :sswitch_0
    const-string/jumbo v4, "ReportState:DRAFT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v4, "ReportState:NONE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .line 55
    :pswitch_0
    move-object v1, v0

    .line 57
    goto :goto_1

    .line 52
    nop

    :sswitch_data_0
    .sparse-switch
        0x3c04ecf5 -> :sswitch_1
        0x440cf364 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public load()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 2

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;->loadFromCache()Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v0

    .line 33
    .local v0, "report":Lcom/seeclickfix/ma/android/objects/report/Report;
    if-nez v0, :cond_0

    .line 34
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;->mReportDbLoader:Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoader;->load(Lcom/seeclickfix/ma/android/objects/report/Report;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v0

    .line 37
    :cond_0
    if-nez v0, :cond_1

    .line 38
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Report;

    .end local v0    # "report":Lcom/seeclickfix/ma/android/objects/report/Report;
    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/Report;-><init>()V

    .line 41
    .restart local v0    # "report":Lcom/seeclickfix/ma/android/objects/report/Report;
    :cond_1
    return-object v0
.end method
