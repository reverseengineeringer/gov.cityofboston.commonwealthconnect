.class public Lcom/seeclickfix/ma/android/file/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field public static final ILLEGAL_FILENAME_CHARS:[Ljava/lang/String;

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "FileUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 31
    const/16 v0, 0x11

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "\""

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "/"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "\\"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "|"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "$"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "@"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "!"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "~"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "^"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "\'"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "*"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "."

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "<"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, ">"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string/jumbo v2, "["

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string/jumbo v2, "]"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string/jumbo v2, "+"

    aput-object v2, v0, v1

    sput-object v0, Lcom/seeclickfix/ma/android/file/FileUtil;->ILLEGAL_FILENAME_CHARS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copy(Ljava/io/File;Ljava/io/File;)V
    .locals 5
    .param p0, "src"    # Ljava/io/File;
    .param p1, "dst"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 181
    .local v1, "in":Ljava/io/InputStream;
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 184
    .local v3, "out":Ljava/io/OutputStream;
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 186
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    if-lez v2, :cond_0

    .line 187
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 189
    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 190
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 191
    return-void
.end method

.method public static isStorageWritable()Z
    .locals 3

    .prologue
    .line 43
    const/4 v1, 0x0

    .line 44
    .local v1, "storageWriteable":Z
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "state":Ljava/lang/String;
    const-string/jumbo v2, "mounted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    const/4 v1, 0x1

    .line 52
    :goto_0
    return v1

    .line 49
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static removeIllegalCharacters(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 64
    sget-object v2, Lcom/seeclickfix/ma/android/file/FileUtil;->ILLEGAL_FILENAME_CHARS:[Ljava/lang/String;

    .line 66
    .local v2, "illegalChars":[Ljava/lang/String;
    if-eqz p0, :cond_2

    .line 68
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 71
    .local v4, "returnString":Ljava/lang/String;
    :try_start_0
    array-length v3, v2

    .line 73
    .local v3, "numIllegalChars":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 74
    if-eqz v4, :cond_0

    .line 75
    aget-object v5, v2, v1

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 76
    aget-object v5, v2, v1

    const-string/jumbo v6, "_"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 73
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 80
    .end local v1    # "i":I
    .end local v3    # "numIllegalChars":I
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 89
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v4    # "returnString":Ljava/lang/String;
    :cond_1
    :goto_1
    return-object v4

    :cond_2
    move-object v4, p0

    goto :goto_1
.end method

.method public static writeNoMediaFile(Ljava/io/File;Landroid/os/Handler;)Z
    .locals 7
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 105
    if-nez p0, :cond_0

    .line 107
    const-string/jumbo v5, "writeNoMediaFile() the directory was null"

    invoke-static {p1, v5}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V

    .line 168
    :goto_0
    return v4

    .line 111
    :cond_0
    invoke-static {}, Lcom/seeclickfix/ma/android/file/FileUtil;->isStorageWritable()Z

    move-result v6

    if-nez v6, :cond_1

    .line 112
    const-string/jumbo v5, "writeNoMediaFile() Storage is not available. Please be sure your device is not in USB storage mode."

    invoke-static {p1, v5}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V

    goto :goto_0

    .line 120
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2

    .line 121
    const-string/jumbo v5, "writeNoMediaFile() the directory does not exist"

    invoke-static {p1, v5}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 157
    :catch_0
    move-exception v0

    .line 160
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v5, "writeNoMediaFile() Unknown error, unable to write the .nomedia file"

    invoke-static {p1, v5}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V

    goto :goto_0

    .line 125
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v6

    if-nez v6, :cond_3

    .line 127
    :try_start_2
    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 135
    :cond_3
    :try_start_3
    new-instance v2, Ljava/io/File;

    const-string/jumbo v6, ".nomedia"

    invoke-direct {v2, p0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 137
    .local v2, "noMedia":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_4

    move v4, v5

    .line 140
    goto :goto_0

    .line 128
    .end local v2    # "noMedia":Ljava/io/File;
    :catch_1
    move-exception v0

    .line 130
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string/jumbo v5, "writeNoMediaFile() file was not a directory, unable to convert"

    invoke-static {p1, v5}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V

    goto :goto_0

    .line 142
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "noMedia":Ljava/io/File;
    :cond_4
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    move-result v1

    .line 146
    .local v1, "fileCreated":Z
    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 147
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 149
    .local v3, "noMediaOutStream":Ljava/io/FileOutputStream;
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/io/FileOutputStream;->write(I)V

    .line 150
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    move v4, v5

    .line 168
    goto :goto_0

    .line 153
    .end local v3    # "noMediaOutStream":Ljava/io/FileOutputStream;
    :cond_5
    const-string/jumbo v5, "writeNoMediaFile()  noMedia.canWrite() is false"

    invoke-static {p1, v5}, Lcom/seeclickfix/ma/android/util/HandlerUtils;->showError(Landroid/os/Handler;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0
.end method
