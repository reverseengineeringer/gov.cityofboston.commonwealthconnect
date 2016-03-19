.class public Lcom/alostpacket/pajamalib/utils/ErrorLog;
.super Ljava/lang/Object;
.source "ErrorLog.java"


# static fields
.field private static final D:Z = true

.field private static final GLOBAL_DEBUG:Z = true

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "pjLIB_ErrorLog"

.field private static logFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    sput-object v0, Lcom/alostpacket/pajamalib/utils/ErrorLog;->logFile:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized write(Ljava/lang/String;Landroid/content/Context;)V
    .locals 6
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "appContext"    # Landroid/content/Context;

    .prologue
    .line 40
    const-class v3, Lcom/alostpacket/pajamalib/utils/ErrorLog;

    monitor-enter v3

    :try_start_0
    sget-object v2, Lcom/alostpacket/pajamalib/utils/ErrorLog;->logFile:Ljava/io/File;

    if-nez v2, :cond_0

    .line 42
    new-instance v2, Ljava/io/File;

    invoke-static {p1}, Lcom/alostpacket/pajamalib/utils/FolderUtil;->getAppFolder(Landroid/content/Context;)Ljava/io/File;

    move-result-object v4

    const-string/jumbo v5, "error_log.txt"

    invoke-direct {v2, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v2, Lcom/alostpacket/pajamalib/utils/ErrorLog;->logFile:Ljava/io/File;

    .line 45
    :cond_0
    sget-object v2, Lcom/alostpacket/pajamalib/utils/ErrorLog;->logFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_1

    .line 49
    :try_start_1
    sget-object v2, Lcom/alostpacket/pajamalib/utils/ErrorLog;->logFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    :cond_1
    :goto_0
    :try_start_2
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/FileWriter;

    sget-object v4, Lcom/alostpacket/pajamalib/utils/ErrorLog;->logFile:Ljava/io/File;

    const/4 v5, 0x1

    invoke-direct {v2, v4, v5}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v0, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 62
    .local v0, "buf":Ljava/io/BufferedWriter;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 63
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->newLine()V

    .line 64
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 70
    .end local v0    # "buf":Ljava/io/BufferedWriter;
    :goto_1
    monitor-exit v3

    return-void

    .line 51
    :catch_0
    move-exception v1

    .line 53
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 40
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .line 66
    :catch_1
    move-exception v1

    .line 68
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method
