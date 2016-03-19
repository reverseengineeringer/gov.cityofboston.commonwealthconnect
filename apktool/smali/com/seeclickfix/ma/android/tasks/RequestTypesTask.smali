.class public Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;
.super Lcom/seeclickfix/ma/android/tasks/SafeTask;
.source "RequestTypesTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/tasks/SafeTask",
        "<",
        "Lcom/google/android/gms/maps/model/LatLng;",
        "Ljava/util/List",
        "<",
        "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p1, "listener":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;>;"
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/tasks/SafeTask;-><init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    .line 26
    return-void
.end method

.method private getByLatLng(Lcom/google/android/gms/maps/model/LatLng;Landroid/content/Context;)Ljava/util/List;
    .locals 8
    .param p1, "latLng"    # Lcom/google/android/gms/maps/model/LatLng;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/maps/model/LatLng;",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v4, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    invoke-direct {v4, p2}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;-><init>(Landroid/content/Context;)V

    .line 57
    .local v4, "reqBuilder":Lcom/seeclickfix/ma/android/net/NetRequest$Builder;
    invoke-static {p2}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getRequestTypesUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->url(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 59
    const-string/jumbo v6, "GET"

    invoke-virtual {v4, v6}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->method(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 60
    iget-wide v6, p1, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    invoke-virtual {v4, v6, v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lat(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 61
    iget-wide v6, p1, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    invoke-virtual {v4, v6, v7}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->lng(D)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 62
    const-string/jumbo v6, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    invoke-virtual {v4, v6}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->apiKey(Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 65
    invoke-static {p2}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v1

    .line 67
    .local v1, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 68
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getAllowedIdsString()Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "allowedZoneIds":Ljava/lang/String;
    const-string/jumbo v6, "ids"

    invoke-virtual {v4, v6, v0}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/seeclickfix/ma/android/net/NetRequest$Builder;

    .line 72
    .end local v0    # "allowedZoneIds":Ljava/lang/String;
    :cond_0
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/net/NetRequest$Builder;->create()Lcom/seeclickfix/ma/android/net/NetRequest;

    move-result-object v6

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/net/NetRequest;->executeRequest()Ljava/lang/String;

    move-result-object v5

    .line 74
    .local v5, "response":Ljava/lang/String;
    new-instance v3, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 76
    .local v3, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;>;"
    const-class v6, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;

    invoke-virtual {v3, v5, v6}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v2

    .line 78
    .local v2, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 79
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 81
    :goto_0
    return-object v6

    :cond_1
    const/4 v6, 0x0

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;->getRequestWatchAreas()Ljava/util/List;

    move-result-object v6

    goto :goto_0
.end method

.method public static launch(Lcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
    .locals 3
    .param p0, "latLng"    # Lcom/google/android/gms/maps/model/LatLng;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/maps/model/LatLng;",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "listener":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;

    invoke-direct {v0, p1}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;-><init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/google/android/gms/maps/model/LatLng;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 30
    return-void
.end method

.method public static launch(Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
    .locals 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "latLng"    # Lcom/google/android/gms/maps/model/LatLng;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/maps/model/LatLng;",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p2, "listener":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;>;"
    invoke-static {p0}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->cancel(Ljava/lang/String;)V

    .line 34
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;

    invoke-direct {v0, p2}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;-><init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    .line 35
    .local v0, "task":Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;
    invoke-static {p0, v0}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->register(Ljava/lang/String;Lcom/seeclickfix/ma/android/tasks/SimpleTask;)Lcom/seeclickfix/ma/android/tasks/SimpleTask;

    .line 36
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/google/android/gms/maps/model/LatLng;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 37
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 22
    check-cast p1, [Lcom/google/android/gms/maps/model/LatLng;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->doInBackground([Lcom/google/android/gms/maps/model/LatLng;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/google/android/gms/maps/model/LatLng;)Ljava/util/List;
    .locals 4
    .param p1, "params"    # [Lcom/google/android/gms/maps/model/LatLng;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/android/gms/maps/model/LatLng;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .local v1, "zones":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    const/4 v2, 0x0

    :try_start_0
    aget-object v2, p1, v2

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->getFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getAppContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->getByLatLng(Lcom/google/android/gms/maps/model/LatLng;Landroid/content/Context;)Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 50
    :goto_0
    return-object v1

    .line 45
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/io/IOException;
    sget-object v2, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->NETWORK_UNAVAILABLE:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->setErrorCode(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V

    goto :goto_0
.end method
