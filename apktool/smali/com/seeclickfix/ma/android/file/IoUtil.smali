.class public Lcom/seeclickfix/ma/android/file/IoUtil;
.super Ljava/lang/Object;
.source "IoUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 7
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 27
    new-instance v4, Ljava/io/StringWriter;

    invoke-direct {v4}, Ljava/io/StringWriter;-><init>()V

    .line 29
    .local v4, "writer":Ljava/io/Writer;
    const/16 v5, 0x800

    new-array v0, v5, [C

    .line 31
    .local v0, "buffer":[C
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v5, p0, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 33
    .local v2, "reader":Ljava/io/Reader;
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .local v1, "n":I
    const/4 v5, -0x1

    if-eq v1, v5, :cond_0

    .line 34
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v1}, Ljava/io/Writer;->write([CII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 37
    .end local v1    # "n":I
    .end local v2    # "reader":Ljava/io/Reader;
    :catchall_0
    move-exception v5

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v5

    .restart local v1    # "n":I
    .restart local v2    # "reader":Ljava/io/Reader;
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 39
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 40
    .local v3, "text":Ljava/lang/String;
    return-object v3
.end method
