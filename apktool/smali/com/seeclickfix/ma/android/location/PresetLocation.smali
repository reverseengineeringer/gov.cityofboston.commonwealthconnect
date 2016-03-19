.class public Lcom/seeclickfix/ma/android/location/PresetLocation;
.super Ljava/lang/Object;
.source "PresetLocation.java"


# instance fields
.field private mAccuracy:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "accuracy"
    .end annotation
.end field

.field private mLat:D
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "lat"
    .end annotation
.end field

.field private mLng:D
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "lng"
    .end annotation
.end field

.field private mName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private mProvider:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "provider"
    .end annotation
.end field

.field private mTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-string/jumbo v0, "(No name for this PresetLocation?)"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mName:Ljava/lang/String;

    .line 18
    const/high16 v0, 0x42c80000    # 100.0f

    iput v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mAccuracy:F

    .line 20
    const-string/jumbo v0, "fused"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mProvider:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public accuracy()F
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mAccuracy:F

    return v0
.end method

.method public accuracy(F)Lcom/seeclickfix/ma/android/location/PresetLocation;
    .locals 0
    .param p1, "accuracy"    # F

    .prologue
    .line 58
    iput p1, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mAccuracy:F

    .line 59
    return-object p0
.end method

.method public lat()D
    .locals 2

    .prologue
    .line 35
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mLat:D

    return-wide v0
.end method

.method public lat(D)Lcom/seeclickfix/ma/android/location/PresetLocation;
    .locals 1
    .param p1, "lat"    # D

    .prologue
    .line 39
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mLat:D

    .line 40
    return-object p0
.end method

.method public lng()D
    .locals 2

    .prologue
    .line 44
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mLng:D

    return-wide v0
.end method

.method public lng(D)Lcom/seeclickfix/ma/android/location/PresetLocation;
    .locals 1
    .param p1, "lng"    # D

    .prologue
    .line 48
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mLng:D

    .line 49
    return-object p0
.end method

.method public name(Ljava/lang/String;)Lcom/seeclickfix/ma/android/location/PresetLocation;
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mName:Ljava/lang/String;

    .line 31
    return-object p0
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public provider(Ljava/lang/String;)Lcom/seeclickfix/ma/android/location/PresetLocation;
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mProvider:Ljava/lang/String;

    .line 77
    return-object p0
.end method

.method public provider()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mProvider:Ljava/lang/String;

    return-object v0
.end method

.method public time()J
    .locals 2

    .prologue
    .line 63
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mTime:J

    return-wide v0
.end method

.method public time(J)Lcom/seeclickfix/ma/android/location/PresetLocation;
    .locals 1
    .param p1, "time"    # J

    .prologue
    .line 67
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mTime:J

    .line 68
    return-object p0
.end method

.method public toLog()Ljava/lang/String;
    .locals 4

    .prologue
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "PresetLocation{mName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mLat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mLat:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mLng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mLng:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mAccuracy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mAccuracy:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mTime:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/PresetLocation;->mName:Ljava/lang/String;

    return-object v0
.end method
