.class public Lcom/seeclickfix/ma/android/config/DedicatedAppManager;
.super Ljava/lang/Object;
.source "DedicatedAppManager.java"


# static fields
.field private static dedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 56
    sget-object v1, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->dedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    if-nez v1, :cond_0

    .line 58
    :try_start_0
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->loadLocalAppConfig(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v1

    sput-object v1, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->dedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :cond_0
    sget-object v1, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->dedicatedApp:Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    return-object v1

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 61
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "App must have a config to function"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static isDedicatedApp(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-static {p0}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 50
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v1

    return v1
.end method

.method private static loadLocalAppConfig(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    const-string/jumbo v6, "json/config.json"

    invoke-virtual {v5, v6}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 22
    .local v3, "inputStream":Ljava/io/InputStream;
    const-string/jumbo v5, "UTF-8"

    invoke-static {v3, v5}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 24
    .local v4, "response":Ljava/lang/String;
    new-instance v2, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v2}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 26
    .local v2, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/DedicatedApp;>;"
    const-class v5, Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    invoke-virtual {v2, v4, v5}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v1

    .line 28
    .local v1, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/DedicatedApp;>;"
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    .line 30
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    return-object v0
.end method
