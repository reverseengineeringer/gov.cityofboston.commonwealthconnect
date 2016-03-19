.class public Lcom/seeclickfix/ma/android/media/PhotoTaker;
.super Ljava/lang/Object;
.source "PhotoTaker.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "PhotoTaker"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static launchCameraWithCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Lcom/seeclickfix/ma/android/fragments/interfaces/CameraLaunchingActivity;)Ljava/lang/String;
    .locals 12
    .param p0, "callback"    # Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;
    .param p1, "launchingActivity"    # Lcom/seeclickfix/ma/android/fragments/interfaces/CameraLaunchingActivity;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    move-object v10, p1

    check-cast v10, Landroid/app/Activity;

    invoke-virtual {v10}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 39
    .local v1, "c":Landroid/content/Context;
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 40
    .local v6, "res":Landroid/content/res/Resources;
    const v10, 0x7f0c012e

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "albumName":Ljava/lang/String;
    sget-object v10, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v10}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 42
    .local v5, "picturesDirectory":Ljava/io/File;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 43
    .local v7, "storageDir":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    .line 49
    new-instance v10, Ljava/text/SimpleDateFormat;

    const-string/jumbo v11, "yyyyMMdd_HHmmss"

    invoke-direct {v10, v11}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v11, Ljava/util/Date;

    invoke-direct {v11}, Ljava/util/Date;-><init>()V

    invoke-virtual {v10, v11}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v9

    .line 50
    .local v9, "timeStamp":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "SCF__"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "imageFileName":Ljava/lang/String;
    const-string/jumbo v10, ".jpg"

    invoke-static {v3, v10, v7}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    .line 52
    .local v2, "image":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 53
    .local v4, "photoPath":Ljava/lang/String;
    new-instance v8, Landroid/content/Intent;

    const-string/jumbo v10, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v8, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 55
    .local v8, "takePictureIntent":Landroid/content/Intent;
    const-string/jumbo v10, "output"

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 57
    invoke-interface {p1, p0, v8}, Lcom/seeclickfix/ma/android/fragments/interfaces/CameraLaunchingActivity;->launchCameraWithCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Landroid/content/Intent;)V

    .line 59
    return-object v4
.end method
