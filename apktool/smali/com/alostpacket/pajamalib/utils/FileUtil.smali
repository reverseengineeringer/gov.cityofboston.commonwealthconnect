.class public Lcom/alostpacket/pajamalib/utils/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# static fields
.field private static final D:Z = true

.field private static final GLOBAL_DEBUG:Z = true

.field public static final ILLEGAL_FILENAME_CHARS:[Ljava/lang/String;

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "FileUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 47
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

    .line 48
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

    .line 49
    const-string/jumbo v2, "]"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string/jumbo v2, "+"

    aput-object v2, v0, v1

    .line 47
    sput-object v0, Lcom/alostpacket/pajamalib/utils/FileUtil;->ILLEGAL_FILENAME_CHARS:[Ljava/lang/String;

    .line 49
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
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
    .line 234
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 235
    .local v1, "in":Ljava/io/InputStream;
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 238
    .local v3, "out":Ljava/io/OutputStream;
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 240
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    if-gtz v2, :cond_0

    .line 243
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 244
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 245
    return-void

    .line 241
    :cond_0
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static isStorageWritable()Z
    .locals 3

    .prologue
    .line 62
    const/4 v1, 0x0

    .line 63
    .local v1, "storageWriteable":Z
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "state":Ljava/lang/String;
    const-string/jumbo v2, "mounted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 67
    const/4 v1, 0x1

    .line 74
    :goto_0
    return v1

    .line 71
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static removeIllegalCharacters(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 88
    sget-object v2, Lcom/alostpacket/pajamalib/utils/FileUtil;->ILLEGAL_FILENAME_CHARS:[Ljava/lang/String;

    .line 90
    .local v2, "illegalChars":[Ljava/lang/String;
    if-eqz p0, :cond_2

    .line 93
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 97
    .local v4, "returnString":Ljava/lang/String;
    :try_start_0
    array-length v3, v2

    .line 99
    .local v3, "numIllegalChars":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v3, :cond_0

    .line 121
    .end local v1    # "i":I
    .end local v3    # "numIllegalChars":I
    .end local v4    # "returnString":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 101
    .restart local v1    # "i":I
    .restart local v3    # "numIllegalChars":I
    .restart local v4    # "returnString":Ljava/lang/String;
    :cond_0
    if-eqz v4, :cond_1

    .line 103
    aget-object v5, v2, v1

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 105
    aget-object v5, v2, v1

    const-string/jumbo v6, "_"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 99
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 110
    .end local v1    # "i":I
    .end local v3    # "numIllegalChars":I
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 113
    const-string/jumbo v5, "FileUtil"

    const-string/jumbo v6, "error removing filename characters"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 120
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v4    # "returnString":Ljava/lang/String;
    :cond_2
    const-string/jumbo v5, "FileUtil"

    const-string/jumbo v6, "WARNING! FileUtil.removeIllegalCharacters() encountered an error and is returning the unmodified string"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, p0

    .line 121
    goto :goto_1
.end method

.method public static writeNoMediaFile(Ljava/io/File;Landroid/os/Handler;)Z
    .locals 9
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 141
    if-nez p0, :cond_1

    .line 143
    const-string/jumbo v5, "FileUtil"

    const-string/jumbo v6, "writeNoMediaFile() you must supply a directory File"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    :cond_0
    :goto_0
    return v4

    .line 149
    :cond_1
    invoke-static {}, Lcom/alostpacket/pajamalib/utils/FileUtil;->isStorageWritable()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 160
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 166
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v6

    if-nez v6, :cond_2

    .line 170
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 180
    :cond_2
    :try_start_2
    new-instance v2, Ljava/io/File;

    const-string/jumbo v6, ".nomedia"

    invoke-direct {v2, p0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 182
    .local v2, "noMedia":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 184
    const-string/jumbo v6, "FileUtil"

    const-string/jumbo v7, ".nomedia appears to exist already, returning without writing a new file"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v4, v5

    .line 185
    goto :goto_0

    .line 172
    .end local v2    # "noMedia":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 209
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 211
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string/jumbo v5, "FileUtil"

    const-string/jumbo v6, "error writing .nomedia-- Unknown exception?"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 189
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "noMedia":Ljava/io/File;
    :cond_3
    :try_start_3
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    move-result v1

    .line 191
    .local v1, "fileCreated":Z
    const-string/jumbo v6, "FileUtil"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "writeNoMediaFile() fileCreated = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 195
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 197
    .local v3, "noMediaOutStream":Ljava/io/FileOutputStream;
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/io/FileOutputStream;->write(I)V

    .line 198
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    move v4, v5

    .line 220
    goto :goto_0

    .line 202
    .end local v3    # "noMediaOutStream":Ljava/io/FileOutputStream;
    :cond_4
    const-string/jumbo v5, "FileUtil"

    const-string/jumbo v6, "error writing .nomedia"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method
