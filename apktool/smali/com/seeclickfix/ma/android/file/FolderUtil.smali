.class public Lcom/seeclickfix/ma/android/file/FolderUtil;
.super Ljava/lang/Object;
.source "FolderUtil.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "FolderUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCacheFolder(Landroid/content/Context;Landroid/os/Handler;)Ljava/io/File;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "errorHandler"    # Landroid/os/Handler;

    .prologue
    .line 80
    invoke-static {p0, p1}, Lcom/seeclickfix/ma/android/file/FolderUtil;->getRemovablePublicAppFolder(Landroid/content/Context;Landroid/os/Handler;)Ljava/io/File;

    move-result-object v1

    .line 81
    .local v1, "parentDir":Ljava/io/File;
    const v2, 0x7f0c0134

    invoke-static {v1, p0, p1, v2}, Lcom/seeclickfix/ma/android/file/FolderUtil;->getFolder(Ljava/io/File;Landroid/content/Context;Landroid/os/Handler;I)Ljava/io/File;

    move-result-object v0

    .line 83
    .local v0, "directory":Ljava/io/File;
    return-object v0
.end method

.method public static getCacheFolderFullPath(Landroid/content/Context;Landroid/os/Handler;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "errorHandler"    # Landroid/os/Handler;

    .prologue
    .line 66
    invoke-static {p0, p1}, Lcom/seeclickfix/ma/android/file/FolderUtil;->getCacheFolder(Landroid/content/Context;Landroid/os/Handler;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "directory":Ljava/lang/String;
    return-object v0
.end method

.method private static getFolder(Ljava/io/File;Landroid/content/Context;Landroid/os/Handler;I)Ljava/io/File;
    .locals 3
    .param p0, "parentDir"    # Ljava/io/File;
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "errorHandler"    # Landroid/os/Handler;
    .param p3, "resID"    # I

    .prologue
    .line 103
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 104
    .local v2, "res":Landroid/content/res/Resources;
    invoke-virtual {v2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, "name":Ljava/lang/String;
    invoke-static {p0, v1, p2}, Lcom/seeclickfix/ma/android/file/FolderUtil;->getOrCreateFolder(Ljava/io/File;Ljava/lang/String;Landroid/os/Handler;)Ljava/io/File;

    move-result-object v0

    .line 108
    .local v0, "folder":Ljava/io/File;
    return-object v0
.end method

.method private static getOrCreateFolder(Ljava/io/File;Ljava/lang/String;Landroid/os/Handler;)Ljava/io/File;
    .locals 5
    .param p0, "parentDir"    # Ljava/io/File;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "errorHandler"    # Landroid/os/Handler;

    .prologue
    .line 124
    const/4 v0, 0x0

    .line 126
    .local v0, "childFolder":Ljava/io/File;
    invoke-static {}, Lcom/seeclickfix/ma/android/file/FileUtil;->isStorageWritable()Z

    move-result v4

    if-nez v4, :cond_0

    .line 129
    const-string/jumbo v4, "getMusicFolder() Storage is not available. Please be sure your device is not in USB storage mode."

    invoke-static {p2, v4}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V

    move-object v1, v0

    .line 170
    .end local v0    # "childFolder":Ljava/io/File;
    .local v1, "childFolder":Ljava/io/File;
    :goto_0
    return-object v1

    .line 133
    .end local v1    # "childFolder":Ljava/io/File;
    .restart local v0    # "childFolder":Ljava/io/File;
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 136
    :cond_1
    const-string/jumbo v4, "getOrCreateFolder(): parentDir=null or name=null"

    invoke-static {p2, v4}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V

    move-object v1, v0

    .line 137
    .end local v0    # "childFolder":Ljava/io/File;
    .restart local v1    # "childFolder":Ljava/io/File;
    goto :goto_0

    .line 142
    .end local v1    # "childFolder":Ljava/io/File;
    .restart local v0    # "childFolder":Ljava/io/File;
    :cond_2
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    .end local v0    # "childFolder":Ljava/io/File;
    .restart local v1    # "childFolder":Ljava/io/File;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_3

    .line 146
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    move-result v3

    .line 148
    .local v3, "madeDir":Z
    if-nez v3, :cond_3

    .line 150
    const-string/jumbo v4, "getOrCreateFolder():mkdir() failed "

    invoke-static {p2, v4}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .end local v3    # "madeDir":Z
    :cond_3
    move-object v0, v1

    .end local v1    # "childFolder":Ljava/io/File;
    .restart local v0    # "childFolder":Ljava/io/File;
    :goto_1
    move-object v1, v0

    .line 170
    .end local v0    # "childFolder":Ljava/io/File;
    .restart local v1    # "childFolder":Ljava/io/File;
    goto :goto_0

    .line 155
    .end local v1    # "childFolder":Ljava/io/File;
    .restart local v0    # "childFolder":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 156
    .local v2, "e":Ljava/lang/Exception;
    :goto_2
    const-string/jumbo v4, "getOrCreateFolder(): unknown exception "

    invoke-static {p2, v4}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V

    goto :goto_1

    .line 155
    .end local v0    # "childFolder":Ljava/io/File;
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "childFolder":Ljava/io/File;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "childFolder":Ljava/io/File;
    .restart local v0    # "childFolder":Ljava/io/File;
    goto :goto_2
.end method

.method public static getRemovablePublicAppFolder(Landroid/content/Context;Landroid/os/Handler;)Ljava/io/File;
    .locals 1
    .param p0, "appContext"    # Landroid/content/Context;
    .param p1, "errorHandler"    # Landroid/os/Handler;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method
