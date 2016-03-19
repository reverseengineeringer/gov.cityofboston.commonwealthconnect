.class public Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;
.super Ljava/lang/Object;
.source "ZoneWrapper.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/objects/types/FeedItem;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ZoneWrapper"


# instance fields
.field private apiPlace:Lcom/seeclickfix/ma/android/objects/loc/Place;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "place"
    .end annotation
.end field

.field private enhanced_watch_area_id:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enhanced_watch_area_id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private geocode:Lcom/seeclickfix/ma/android/objects/loc/Geocode;

.field private transient id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        allowGeneratedIdInsert = true
        generatedId = true
    .end annotation
.end field

.field private transient index:I

.field private watchAreas:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enhanced_watch_areas"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->watchAreas:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getApiPlace()Lcom/seeclickfix/ma/android/objects/loc/Place;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->apiPlace:Lcom/seeclickfix/ma/android/objects/loc/Place;

    return-object v0
.end method

.method public getGeocode()Lcom/seeclickfix/ma/android/objects/loc/Geocode;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->geocode:Lcom/seeclickfix/ma/android/objects/loc/Geocode;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->id:I

    return v0
.end method

.method public getWatchAreas()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->watchAreas:Ljava/util/List;

    return-object v0
.end method

.method public getZeroBasedIndex()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->index:I

    return v0
.end method

.method public setApiPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0
    .param p1, "apiPlace"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->apiPlace:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 99
    return-void
.end method

.method public setGeocode(Lcom/seeclickfix/ma/android/objects/loc/Geocode;)V
    .locals 0
    .param p1, "geocode"    # Lcom/seeclickfix/ma/android/objects/loc/Geocode;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->geocode:Lcom/seeclickfix/ma/android/objects/loc/Geocode;

    .line 53
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 90
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->id:I

    .line 91
    return-void
.end method

.method public setWatchAreas(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "watchAreas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->watchAreas:Ljava/util/List;

    .line 82
    return-void
.end method

.method public setZeroBasedIndex(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 70
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->index:I

    .line 71
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ZoneWrapper [watchAreas="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->watchAreas:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", enhanced_watch_area_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->enhanced_watch_area_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", apiPlace="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->apiPlace:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", geocode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;->geocode:Lcom/seeclickfix/ma/android/objects/loc/Geocode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
