.class public Lcom/alostpacket/pajamalib/utils/FolderUtil;
.super Ljava/lang/Object;
.source "FolderUtil.java"


# static fields
.field private static final D:Z = true

.field private static final GLOBAL_DEBUG:Z = true

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "pjLIB_FileUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAppFolder(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .param p0, "appContext"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-static {p0}, Lcom/alostpacket/pajamalib/utils/AppUtil;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "name":Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    .line 51
    .local v2, "parentDir":Ljava/io/File;
    invoke-static {v2, v1}, Lcom/alostpacket/pajamalib/utils/FolderUtil;->getOrCreateFolder(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 54
    .local v0, "appFolder":Ljava/io/File;
    return-object v0
.end method

.method public static getFolder(Landroid/content/Context;I)Ljava/io/File;
    .locals 4
    .param p0, "appContext"    # Landroid/content/Context;
    .param p1, "resID"    # I

    .prologue
    .line 78
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 79
    .local v3, "res":Landroid/content/res/Resources;
    invoke-virtual {v3, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 80
    .local v1, "name":Ljava/lang/String;
    invoke-static {p0}, Lcom/alostpacket/pajamalib/utils/FolderUtil;->getAppFolder(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    .line 82
    .local v2, "parentDir":Ljava/io/File;
    invoke-static {v2, v1}, Lcom/alostpacket/pajamalib/utils/FolderUtil;->getOrCreateFolder(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 85
    .local v0, "folder":Ljava/io/File;
    return-object v0
.end method

.method private static getOrCreateFolder(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 7
    .param p0, "parentDir"    # Ljava/io/File;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 100
    invoke-static {}, Lcom/alostpacket/pajamalib/utils/FileUtil;->isStorageWritable()Z

    move-result v5

    if-nez v5, :cond_0

    move-object v1, v4

    .line 140
    :goto_0
    return-object v1

    .line 106
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 108
    :cond_1
    const-string/jumbo v5, "pjLIB_FileUtil"

    const-string/jumbo v6, "getOrCreateFolder() parentDir == null"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v4

    .line 109
    goto :goto_0

    .line 113
    :cond_2
    const/4 v0, 0x0

    .line 118
    .local v0, "childFolder":Ljava/io/File;
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .end local v0    # "childFolder":Ljava/io/File;
    .local v1, "childFolder":Ljava/io/File;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_3

    .line 122
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    move-result v3

    .line 124
    .local v3, "madeDir":Z
    if-nez v3, :cond_3

    .line 126
    const-string/jumbo v5, "pjLIB_FileUtil"

    const-string/jumbo v6, "Error: getOrCreateFolder(): mkdir() failed "

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 138
    .end local v3    # "madeDir":Z
    :cond_3
    const-string/jumbo v4, "pjLIB_FileUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "getOrCreateFolder() ::: childFolder.getAbsolutePath() :"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 131
    .end local v1    # "childFolder":Ljava/io/File;
    .restart local v0    # "childFolder":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 133
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    move-object v1, v4

    .line 134
    goto :goto_0

    .line 131
    .end local v0    # "childFolder":Ljava/io/File;
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "childFolder":Ljava/io/File;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "childFolder":Ljava/io/File;
    .restart local v0    # "childFolder":Ljava/io/File;
    goto :goto_1
.end method
