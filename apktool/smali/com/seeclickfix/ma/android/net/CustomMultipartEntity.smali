.class public Lcom/seeclickfix/ma/android/net/CustomMultipartEntity;
.super Lorg/apache/http/entity/mime/MultipartEntity;
.source "CustomMultipartEntity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;,
        Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;
    }
.end annotation


# instance fields
.field private final listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity;->listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    .line 23
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/entity/mime/HttpMultipartMode;Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;)V
    .locals 0
    .param p1, "mode"    # Lorg/apache/http/entity/mime/HttpMultipartMode;
    .param p2, "listener"    # Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>(Lorg/apache/http/entity/mime/HttpMultipartMode;)V

    .line 27
    iput-object p2, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity;->listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/entity/mime/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;)V
    .locals 0
    .param p1, "mode"    # Lorg/apache/http/entity/mime/HttpMultipartMode;
    .param p2, "boundary"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .param p4, "listener"    # Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>(Lorg/apache/http/entity/mime/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 32
    iput-object p4, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity;->listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    .line 33
    return-void
.end method


# virtual methods
.method public writeTo(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    new-instance v0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity;->listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    invoke-direct {v0, p1, v1}, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;-><init>(Ljava/io/OutputStream;Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;)V

    invoke-super {p0, v0}, Lorg/apache/http/entity/mime/MultipartEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 38
    return-void
.end method
