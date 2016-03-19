.class public Lcom/seeclickfix/ma/android/services/DraftSaveService;
.super Landroid/app/IntentService;
.source "DraftSaveService.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DraftSaveService"


# instance fields
.field private report:Lcom/seeclickfix/ma/android/objects/report/Report;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    const-string/jumbo v0, "DraftSaveService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 22
    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 31
    const-string/jumbo v1, "report_bundle"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/Report;

    iput-object v1, p0, Lcom/seeclickfix/ma/android/services/DraftSaveService;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 38
    new-instance v0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/services/DraftSaveService;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/services/DraftSaveService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;-><init>(Lcom/seeclickfix/ma/android/objects/report/Report;Landroid/content/Context;)V

    .line 40
    .local v0, "reportSaveCommand":Lcom/seeclickfix/ma/android/db/ReportSaveCommand;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->execute()V

    .line 41
    return-void
.end method
