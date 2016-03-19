.class public Lcom/seeclickfix/ma/android/net/DeserializeResponse;
.super Ljava/lang/Object;
.source "DeserializeResponse.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DeserializeResponse"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    .local p0, "this":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;
    .locals 8
    .param p1, "jsonString"    # Ljava/lang/String;
    .param p2, "gsonClazz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<TT;>;"
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 29
    .local v0, "gson":Lcom/google/gson/Gson;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .local v6, "objectArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    :try_start_0
    const-string/jumbo v7, "["

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 34
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 35
    .local v4, "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    .line 37
    .local v5, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v5, :cond_1

    .line 38
    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 39
    .local v3, "json":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7, p2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 41
    .local v2, "issue":Ljava/lang/Object;, "TT;"
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 44
    .end local v1    # "i":I
    .end local v2    # "issue":Ljava/lang/Object;, "TT;"
    .end local v3    # "json":Lorg/json/JSONObject;
    .end local v4    # "jsonArray":Lorg/json/JSONArray;
    .end local v5    # "length":I
    :cond_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 45
    .restart local v3    # "json":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7, p2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 47
    .restart local v2    # "issue":Ljava/lang/Object;, "TT;"
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .end local v2    # "issue":Ljava/lang/Object;, "TT;"
    .end local v3    # "json":Lorg/json/JSONObject;
    :cond_1
    :goto_1
    return-object v6

    .line 50
    :catch_0
    move-exception v7

    goto :goto_1
.end method
