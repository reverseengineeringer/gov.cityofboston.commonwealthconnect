.class public Lcom/seeclickfix/ma/android/location/TestLocationList;
.super Ljava/lang/Object;
.source "TestLocationList.java"


# static fields
.field static getPlaceName:Lcom/google/common/base/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Function",
            "<",
            "Lcom/seeclickfix/ma/android/location/PresetLocation;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static presetLocations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/location/PresetLocation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/location/TestLocationList;->presetLocations:Ljava/util/List;

    .line 49
    new-instance v0, Lcom/seeclickfix/ma/android/location/TestLocationList$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/location/TestLocationList$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/location/TestLocationList;->getPlaceName:Lcom/google/common/base/Function;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPresetLocations(Landroid/content/Context;)Ljava/util/List;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/location/PresetLocation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    sget-object v5, Lcom/seeclickfix/ma/android/location/TestLocationList;->presetLocations:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lcom/seeclickfix/ma/android/location/TestLocationList;->presetLocations:Ljava/util/List;

    .line 45
    :goto_0
    return-object v5

    .line 32
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    const-string/jumbo v6, "json/test_locations.json"

    invoke-virtual {v5, v6}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 33
    .local v2, "inputStream":Ljava/io/InputStream;
    const-string/jumbo v5, "UTF-8"

    invoke-static {v2, v5}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 34
    .local v3, "response":Ljava/lang/String;
    new-instance v0, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 35
    .local v0, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/location/PresetLocation;>;"
    const-class v5, Lcom/seeclickfix/ma/android/location/PresetLocation;

    invoke-virtual {v0, v3, v5}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v4

    .line 36
    .local v4, "unOrderedLocations":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/location/PresetLocation;>;"
    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v5

    sget-object v6, Lcom/seeclickfix/ma/android/location/TestLocationList;->getPlaceName:Lcom/google/common/base/Function;

    invoke-virtual {v5, v6}, Lcom/google/common/collect/Ordering;->onResultOf(Lcom/google/common/base/Function;)Lcom/google/common/collect/Ordering;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/google/common/collect/Ordering;->sortedCopy(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v5

    sput-object v5, Lcom/seeclickfix/ma/android/location/TestLocationList;->presetLocations:Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .end local v0    # "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/location/PresetLocation;>;"
    .end local v2    # "inputStream":Ljava/io/InputStream;
    .end local v3    # "response":Ljava/lang/String;
    .end local v4    # "unOrderedLocations":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/location/PresetLocation;>;"
    :goto_1
    sget-object v5, Lcom/seeclickfix/ma/android/location/TestLocationList;->presetLocations:Ljava/util/List;

    goto :goto_0

    .line 41
    :catch_0
    move-exception v1

    .line 42
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method
