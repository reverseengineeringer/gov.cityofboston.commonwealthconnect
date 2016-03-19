.class public Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;
.super Ljava/io/FilterOutputStream;
.source "CustomMultipartEntity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/net/CustomMultipartEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CountingOutputStream"
.end annotation


# instance fields
.field private final listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

.field private transferred:J


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "listener"    # Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 51
    iput-object p2, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    .line 52
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->transferred:J

    .line 53
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 4
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 63
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->transferred:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->transferred:J

    .line 64
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->transferred:J

    invoke-interface {v0, v2, v3}, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;->transferred(J)V

    .line 65
    return-void
.end method

.method public write([BII)V
    .locals 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 57
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->transferred:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->transferred:J

    .line 58
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->listener:Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$CountingOutputStream;->transferred:J

    invoke-interface {v0, v2, v3}, Lcom/seeclickfix/ma/android/net/CustomMultipartEntity$ProgressListener;->transferred(J)V

    .line 59
    return-void
.end method
