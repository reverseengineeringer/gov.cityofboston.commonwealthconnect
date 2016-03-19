.class public Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;
.super Ljava/lang/Object;
.source "VolleyRetryPolicy.java"

# interfaces
.implements Lcom/android/volley/RetryPolicy;


# static fields
.field public static final DEFAULT_BACKOFF_MULT:F = 2.0f

.field public static final DEFAULT_MAX_RETRIES:I = 0x3

.field public static final DEFAULT_TIMEOUT_MS:I = 0x1388


# instance fields
.field private final mBackoffMultiplier:F

.field private mCurrentRetryCount:I

.field private mCurrentTimeoutMs:I

.field private final mMaxNumRetries:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 46
    const/16 v0, 0x1388

    const/4 v1, 0x3

    const/high16 v2, 0x40000000    # 2.0f

    invoke-direct {p0, v0, v1, v2}, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;-><init>(IIF)V

    .line 47
    return-void
.end method

.method public constructor <init>(IIF)V
    .locals 0
    .param p1, "initialTimeoutMs"    # I
    .param p2, "maxNumRetries"    # I
    .param p3, "backoffMultiplier"    # F

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput p1, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentTimeoutMs:I

    .line 58
    iput p2, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mMaxNumRetries:I

    .line 59
    iput p3, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mBackoffMultiplier:F

    .line 60
    return-void
.end method


# virtual methods
.method public getCurrentRetryCount()I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentRetryCount:I

    return v0
.end method

.method public getCurrentTimeout()I
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentTimeoutMs:I

    return v0
.end method

.method protected hasAttemptRemaining()Z
    .locals 2

    .prologue
    .line 96
    iget v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentRetryCount:I

    iget v1, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mMaxNumRetries:I

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public retry(Lcom/android/volley/VolleyError;)V
    .locals 3
    .param p1, "error"    # Lcom/android/volley/VolleyError;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .prologue
    .line 85
    iget v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentRetryCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentRetryCount:I

    .line 86
    iget v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentTimeoutMs:I

    int-to-float v0, v0

    iget v1, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentTimeoutMs:I

    int-to-float v1, v1

    iget v2, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mBackoffMultiplier:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->mCurrentTimeoutMs:I

    .line 87
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRetryPolicy;->hasAttemptRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    throw p1

    .line 90
    :cond_0
    return-void
.end method
