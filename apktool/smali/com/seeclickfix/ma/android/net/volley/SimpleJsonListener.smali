.class public Lcom/seeclickfix/ma/android/net/volley/SimpleJsonListener;
.super Ljava/lang/Object;
.source "SimpleJsonListener.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONObject;",
        ">;",
        "Lcom/android/volley/Response$ErrorListener;"
    }
.end annotation


# instance fields
.field private listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/volley/Response$Listener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 14
    .local p1, "resultListener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/volley/SimpleJsonListener;->listener:Lcom/android/volley/Response$Listener;

    .line 16
    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/SimpleJsonListener;->listener:Lcom/android/volley/Response$Listener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    .line 26
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 9
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/net/volley/SimpleJsonListener;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/seeclickfix/ma/android/net/volley/SimpleJsonListener;->listener:Lcom/android/volley/Response$Listener;

    invoke-interface {v0, p1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    .line 21
    return-void
.end method
