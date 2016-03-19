.class Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;
.super Ljava/lang/Object;
.source "ByteStreams.java"

# interfaces
.implements Lcom/google/common/io/ByteArrayDataInput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/ByteStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArrayDataInputStream"
.end annotation


# instance fields
.field final input:Ljava/io/DataInput;


# direct methods
.method constructor <init>(Ljava/io/ByteArrayInputStream;)V
    .locals 1
    .param p1, "byteArrayInputStream"    # Ljava/io/ByteArrayInputStream;

    .prologue
    .line 327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    .line 329
    return-void
.end method


# virtual methods
.method public readBoolean()Z
    .locals 2

    .prologue
    .line 357
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readBoolean()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 358
    :catch_0
    move-exception v0

    .line 359
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readByte()B
    .locals 3

    .prologue
    .line 365
    :try_start_0
    iget-object v2, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readByte()B
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    return v2

    .line 366
    :catch_0
    move-exception v0

    .line 367
    .local v0, "e":Ljava/io/EOFException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 368
    .end local v0    # "e":Ljava/io/EOFException;
    :catch_1
    move-exception v1

    .line 369
    .local v1, "impossible":Ljava/io/IOException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public readChar()C
    .locals 2

    .prologue
    .line 399
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readChar()C
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 400
    :catch_0
    move-exception v0

    .line 401
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readDouble()D
    .locals 4

    .prologue
    .line 431
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readDouble()D
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    return-wide v2

    .line 432
    :catch_0
    move-exception v0

    .line 433
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readFloat()F
    .locals 2

    .prologue
    .line 423
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readFloat()F
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 424
    :catch_0
    move-exception v0

    .line 425
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readFully([B)V
    .locals 2
    .param p1, "b"    # [B

    .prologue
    .line 333
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1, p1}, Ljava/io/DataInput;->readFully([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    return-void

    .line 334
    :catch_0
    move-exception v0

    .line 335
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readFully([BII)V
    .locals 2
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 341
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1, p1, p2, p3}, Ljava/io/DataInput;->readFully([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 345
    return-void

    .line 342
    :catch_0
    move-exception v0

    .line 343
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readInt()I
    .locals 2

    .prologue
    .line 407
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readInt()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 408
    :catch_0
    move-exception v0

    .line 409
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readLine()Ljava/lang/String;
    .locals 2

    .prologue
    .line 439
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 440
    :catch_0
    move-exception v0

    .line 441
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readLong()J
    .locals 4

    .prologue
    .line 415
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readLong()J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    return-wide v2

    .line 416
    :catch_0
    move-exception v0

    .line 417
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readShort()S
    .locals 2

    .prologue
    .line 383
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readShort()S
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 384
    :catch_0
    move-exception v0

    .line 385
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readUTF()Ljava/lang/String;
    .locals 2

    .prologue
    .line 447
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 448
    :catch_0
    move-exception v0

    .line 449
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readUnsignedByte()I
    .locals 2

    .prologue
    .line 375
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 376
    :catch_0
    move-exception v0

    .line 377
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readUnsignedShort()I
    .locals 2

    .prologue
    .line 391
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedShort()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 392
    :catch_0
    move-exception v0

    .line 393
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public skipBytes(I)I
    .locals 2
    .param p1, "n"    # I

    .prologue
    .line 349
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1, p1}, Ljava/io/DataInput;->skipBytes(I)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 350
    :catch_0
    move-exception v0

    .line 351
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
