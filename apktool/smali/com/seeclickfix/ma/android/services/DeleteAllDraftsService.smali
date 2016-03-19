.class public Lcom/seeclickfix/ma/android/services/DeleteAllDraftsService;
.super Landroid/app/IntentService;
.source "DeleteAllDraftsService.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DeleteAllDraftsService"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    const-string/jumbo v0, "DeleteAllDraftsService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 29
    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 41
    new-instance v0, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/services/DeleteAllDraftsService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;-><init>(Landroid/content/Context;)V

    .line 44
    .local v0, "deleter":Lcom/seeclickfix/ma/android/db/DeleteReportHelper;
    :try_start_0
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/DeleteReportHelper;->deleteAllDrafts()V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v1

    goto :goto_0
.end method
