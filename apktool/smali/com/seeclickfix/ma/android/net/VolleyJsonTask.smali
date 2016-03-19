.class public Lcom/seeclickfix/ma/android/net/VolleyJsonTask;
.super Ljava/lang/Object;
.source "VolleyJsonTask.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static enqueueJsonGet(Ljava/lang/String;Lcom/android/volley/Response$Listener;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "onSuccess":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/net/volley/SimpleJsonListener;

    invoke-direct {v0, p1}, Lcom/seeclickfix/ma/android/net/volley/SimpleJsonListener;-><init>(Lcom/android/volley/Response$Listener;)V

    invoke-static {p0, p1, v0}, Lcom/seeclickfix/ma/android/net/VolleyJsonTask;->enqueueJsonGet(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 17
    return-void
.end method

.method public static enqueueJsonGet(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 2
    .param p0, "url"    # Ljava/lang/String;
    .param p2, "onFailure"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 20
    .local p1, "onSuccess":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    new-instance v0, Lcom/android/volley/toolbox/JsonObjectRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 21
    .local v0, "jsonObjectRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    invoke-static {}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance()Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->add(Lcom/android/volley/Request;)V

    .line 22
    return-void
.end method
