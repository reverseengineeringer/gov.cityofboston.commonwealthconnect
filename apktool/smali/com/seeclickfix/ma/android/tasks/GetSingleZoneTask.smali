.class public Lcom/seeclickfix/ma/android/tasks/GetSingleZoneTask;
.super Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;
.source "GetSingleZoneTask.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GetZonesTask"


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 43
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/seeclickfix/ma/android/tasks/ZoneTaskAbstract;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 44
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 9

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/GetSingleZoneTask;->buildParams()Ljava/util/Map;

    move-result-object v2

    .line 53
    .local v2, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleZoneTask;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 57
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleZoneTask;->c:Landroid/content/Context;

    invoke-static {v5}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getZoneSingleUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getDefaultZoneId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 63
    .local v3, "url":Ljava/lang/String;
    invoke-static {v3, v2}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->constructUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    .line 65
    iget-object v4, p0, Lcom/seeclickfix/ma/android/tasks/GetSingleZoneTask;->c:Landroid/content/Context;

    invoke-static {v4}, Lcom/seeclickfix/ma/android/net/util/RequestFactory;->getStandardHeaders(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    .line 67
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, v3, v1}, Lcom/seeclickfix/ma/android/tasks/GetSingleZoneTask;->performRequest(Ljava/lang/String;Ljava/util/Map;)V

    .line 68
    return-void
.end method
