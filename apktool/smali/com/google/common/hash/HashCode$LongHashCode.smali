.class final Lcom/google/common/hash/HashCode$LongHashCode;
.super Lcom/google/common/hash/HashCode;
.source "HashCode.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/HashCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LongHashCode"
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field final hash:J


# direct methods
.method constructor <init>(J)V
    .locals 1
    .param p1, "hash"    # J

    .prologue
    .line 176
    invoke-direct {p0}, Lcom/google/common/hash/HashCode;-><init>()V

    .line 177
    iput-wide p1, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    .line 178
    return-void
.end method


# virtual methods
.method public asBytes()[B
    .locals 5

    .prologue
    const/16 v4, 0x8

    .line 187
    new-array v0, v4, [B

    const/4 v1, 0x0

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x2

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x10

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x3

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x18

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x4

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x20

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x5

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x28

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x6

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x30

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x7

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x38

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    return-object v0
.end method

.method public asInt()I
    .locals 2

    .prologue
    .line 200
    iget-wide v0, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    long-to-int v0, v0

    return v0
.end method

.method public asLong()J
    .locals 2

    .prologue
    .line 205
    iget-wide v0, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    return-wide v0
.end method

.method public bits()I
    .locals 1

    .prologue
    .line 182
    const/16 v0, 0x40

    return v0
.end method

.method public padToLong()J
    .locals 2

    .prologue
    .line 210
    iget-wide v0, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    return-wide v0
.end method

.method writeBytesToImpl([BII)V
    .locals 5
    .param p1, "dest"    # [B
    .param p2, "offset"    # I
    .param p3, "maxLength"    # I

    .prologue
    .line 215
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 216
    add-int v1, p2, v0

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    mul-int/lit8 v4, v0, 0x8

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p1, v1

    .line 215
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 218
    :cond_0
    return-void
.end method
