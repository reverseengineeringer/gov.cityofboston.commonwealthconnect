.class final Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest$1;
.super Ljava/lang/Object;
.source "GoogleGeocodeRequest.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest;->geocode(Ljava/lang/String;Landroid/location/Location;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest$1;->val$listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 46
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest$1;->val$listener:Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;

    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest$1;->parseResponse(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->onSuccess(Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method parseResponse(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 5
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/location/SimpleLocation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .local v2, "locations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/seeclickfix/ma/android/location/SimpleLocation;>;"
    if-eqz p1, :cond_0

    .line 57
    :try_start_0
    const-string/jumbo v4, "results"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 59
    .local v3, "results":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 60
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-static {v4}, Lcom/seeclickfix/ma/android/location/SimpleLocation;->fromJson(Lorg/json/JSONObject;)Lcom/seeclickfix/ma/android/location/SimpleLocation;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 62
    .end local v1    # "i":I
    .end local v3    # "results":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 63
    .local v0, "error":Lorg/json/JSONException;
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "locations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/seeclickfix/ma/android/location/SimpleLocation;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .end local v0    # "error":Lorg/json/JSONException;
    .restart local v2    # "locations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/seeclickfix/ma/android/location/SimpleLocation;>;"
    :cond_0
    return-object v2
.end method
