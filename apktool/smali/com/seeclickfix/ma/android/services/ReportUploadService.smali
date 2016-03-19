.class public Lcom/seeclickfix/ma/android/services/ReportUploadService;
.super Landroid/app/IntentService;
.source "ReportUploadService.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ReportUploadService"


# instance fields
.field private bus:Lcom/squareup/otto/Bus;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    const-string/jumbo v0, "reportUpload"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/services/ReportUploadService;Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/services/ReportUploadService;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->saveReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    return-void
.end method

.method private saveReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 2
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 95
    new-instance v0, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;-><init>(Lcom/seeclickfix/ma/android/objects/report/Report;Landroid/content/Context;)V

    .line 97
    .local v0, "reportSaveCommand":Lcom/seeclickfix/ma/android/db/ReportSaveCommand;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/ReportSaveCommand;->execute()V

    .line 98
    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/MyApplication;

    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->setBus(Lcom/squareup/otto/Bus;)V

    .line 58
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v2, "com.seeclickfix.actions.UPLOAD_REPORT"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 62
    const-string/jumbo v2, "report_bundle"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 64
    .local v1, "report":Lcom/seeclickfix/ma/android/objects/report/Report;
    sget-object v2, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->typedImageFile()Lretrofit/mime/TypedFile;

    move-result-object v3

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->toAPIv2Map()Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;

    move-result-object v4

    new-instance v5, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;

    invoke-direct {v5, p0, v1}, Lcom/seeclickfix/ma/android/services/ReportUploadService$1;-><init>(Lcom/seeclickfix/ma/android/services/ReportUploadService;Lcom/seeclickfix/ma/android/objects/report/Report;)V

    invoke-interface {v2, v3, v4, v5}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->createIssue(Lretrofit/mime/TypedFile;Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;Lretrofit/Callback;)V

    .line 91
    .end local v1    # "report":Lcom/seeclickfix/ma/android/objects/report/Report;
    :cond_0
    return-void
.end method

.method public postEvent(Ljava/lang/Object;)V
    .locals 1
    .param p1, "event"    # Ljava/lang/Object;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService;->bus:Lcom/squareup/otto/Bus;

    invoke-virtual {v0, p1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 52
    return-void
.end method

.method public setBus(Lcom/squareup/otto/Bus;)V
    .locals 0
    .param p1, "bus"    # Lcom/squareup/otto/Bus;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/seeclickfix/ma/android/services/ReportUploadService;->bus:Lcom/squareup/otto/Bus;

    .line 48
    return-void
.end method

.method protected showSuccessNotification(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 18
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p2, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 105
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 107
    .local v8, "res":Landroid/content/res/Resources;
    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v1, v13}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 109
    .local v1, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const/4 v13, 0x1

    invoke-virtual {v1, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 110
    const v13, 0x7f0c00cd

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-virtual {v8, v13, v14}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 111
    const v13, 0x7f0c0014

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 112
    const v13, 0x7f020131

    invoke-virtual {v1, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 114
    const v13, 0x7f0c00cd

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-virtual {v8, v13, v14}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 116
    invoke-virtual/range {p2 .. p2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLocalImagePath()Ljava/lang/String;

    move-result-object v4

    .line 119
    .local v4, "localImagePath":Ljava/lang/String;
    const v13, 0x7f09001f

    invoke-virtual {v8, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 120
    .local v12, "w":I
    const v13, 0x7f09001e

    invoke-virtual {v8, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 122
    .local v2, "h":I
    const/4 v13, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setFollowing(Z)V

    .line 124
    if-eqz v4, :cond_0

    .line 125
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->setLocalImagePath(Ljava/lang/String;)V

    .line 126
    invoke-virtual/range {p2 .. p2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLocalImagePath()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    invoke-static {v13, v12, v2, v14}, Lcom/seeclickfix/ma/android/media/ImageResizer;->decodeSampledBitmapFromFile(Ljava/lang/String;IILcom/seeclickfix/ma/android/media/ImageCache;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 127
    .local v3, "largeIcon":Landroid/graphics/Bitmap;
    invoke-virtual {v1, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 128
    new-instance v13, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v13}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getDescription()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v13

    const v14, 0x7f0c00cd

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v8, v14, v15}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v13

    const v14, 0x7f0c0014

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v13

    invoke-virtual {v1, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 139
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    .line 140
    .local v7, "packageName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    invoke-virtual {v13, v7}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v9

    .line 142
    .local v9, "resultIntent":Landroid/content/Intent;
    const-string/jumbo v13, "com.seeclickfix.actions.ISSUE_DETAIL_NOTIF"

    invoke-virtual {v9, v13}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    const-string/jumbo v13, "issue_bundle"

    move-object/from16 v0, p1

    invoke-virtual {v9, v13, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 145
    invoke-static/range {p0 .. p0}, Landroid/support/v4/app/TaskStackBuilder;->create(Landroid/content/Context;)Landroid/support/v4/app/TaskStackBuilder;

    move-result-object v11

    .line 147
    .local v11, "stackBuilder":Landroid/support/v4/app/TaskStackBuilder;
    invoke-virtual {v9}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v13

    invoke-virtual {v11, v13}, Landroid/support/v4/app/TaskStackBuilder;->addParentStack(Landroid/content/ComponentName;)Landroid/support/v4/app/TaskStackBuilder;

    .line 149
    invoke-virtual {v11, v9}, Landroid/support/v4/app/TaskStackBuilder;->addNextIntent(Landroid/content/Intent;)Landroid/support/v4/app/TaskStackBuilder;

    .line 150
    const/4 v13, 0x0

    const/high16 v14, 0x8000000

    invoke-virtual {v11, v13, v14}, Landroid/support/v4/app/TaskStackBuilder;->getPendingIntent(II)Landroid/app/PendingIntent;

    move-result-object v10

    .line 156
    .local v10, "resultPendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {v1, v10}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 158
    invoke-virtual {v1}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v6

    .line 159
    .local v6, "notification":Landroid/app/Notification;
    const-string/jumbo v13, "notification"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/seeclickfix/ma/android/services/ReportUploadService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/NotificationManager;

    .line 161
    .local v5, "mNotificationManager":Landroid/app/NotificationManager;
    const v13, -0x52521703

    invoke-virtual {v5, v13, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 163
    return-void

    .line 135
    .end local v3    # "largeIcon":Landroid/graphics/Bitmap;
    .end local v5    # "mNotificationManager":Landroid/app/NotificationManager;
    .end local v6    # "notification":Landroid/app/Notification;
    .end local v7    # "packageName":Ljava/lang/String;
    .end local v9    # "resultIntent":Landroid/content/Intent;
    .end local v10    # "resultPendingIntent":Landroid/app/PendingIntent;
    .end local v11    # "stackBuilder":Landroid/support/v4/app/TaskStackBuilder;
    :cond_0
    const v13, 0x7f020130

    const/4 v14, 0x0

    invoke-static {v8, v13, v12, v2, v14}, Lcom/seeclickfix/ma/android/media/ImageResizer;->decodeSampledBitmapFromResource(Landroid/content/res/Resources;IIILcom/seeclickfix/ma/android/media/ImageCache;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 136
    .restart local v3    # "largeIcon":Landroid/graphics/Bitmap;
    invoke-virtual {v1, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_0
.end method
