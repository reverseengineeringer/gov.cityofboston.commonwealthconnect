.class final Lcom/squareup/okhttp/OkHttpClient$1;
.super Lcom/squareup/okhttp/internal/Internal;
.source "OkHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/OkHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/Internal;-><init>()V

    return-void
.end method


# virtual methods
.method public addLine(Lcom/squareup/okhttp/Headers$Builder;Ljava/lang/String;)V
    .locals 0
    .param p1, "builder"    # Lcom/squareup/okhttp/Headers$Builder;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->addLine(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 106
    return-void
.end method

.method public clearOwner(Lcom/squareup/okhttp/Connection;)Z
    .locals 1
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 59
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->clearOwner()Z

    move-result v0

    return v0
.end method

.method public closeIfOwnedBy(Lcom/squareup/okhttp/Connection;Ljava/lang/Object;)V
    .locals 0
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "owner"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->closeIfOwnedBy(Ljava/lang/Object;)V

    .line 64
    return-void
.end method

.method public connect(Lcom/squareup/okhttp/Connection;IIILcom/squareup/okhttp/Request;)V
    .locals 0
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "connectTimeout"    # I
    .param p3, "readTimeout"    # I
    .param p4, "writeTimeout"    # I
    .param p5, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-virtual {p1, p2, p3, p4, p5}, Lcom/squareup/okhttp/Connection;->connect(IIILcom/squareup/okhttp/Request;)V

    .line 85
    return-void
.end method

.method public getOwner(Lcom/squareup/okhttp/Connection;)Ljava/lang/Object;
    .locals 1
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 71
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getOwner()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;
    .locals 1
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 113
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->internalCache()Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v0

    return-object v0
.end method

.method public isConnected(Lcom/squareup/okhttp/Connection;)Z
    .locals 1
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 88
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isConnected()Z

    move-result v0

    return v0
.end method

.method public isReadable(Lcom/squareup/okhttp/Connection;)Z
    .locals 1
    .param p1, "pooled"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 101
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isReadable()Z

    move-result v0

    return v0
.end method

.method public isSpdy(Lcom/squareup/okhttp/Connection;)Z
    .locals 1
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 92
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v0

    return v0
.end method

.method public newTransport(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;
    .locals 1
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->newTransport(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v0

    return-object v0
.end method

.method public recycle(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;)V
    .locals 0
    .param p1, "pool"    # Lcom/squareup/okhttp/ConnectionPool;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 117
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/ConnectionPool;->recycle(Lcom/squareup/okhttp/Connection;)V

    .line 118
    return-void
.end method

.method public recycleCount(Lcom/squareup/okhttp/Connection;)I
    .locals 1
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 67
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->recycleCount()I

    move-result v0

    return v0
.end method

.method public routeDatabase(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/RouteDatabase;
    .locals 1
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 125
    # getter for: Lcom/squareup/okhttp/OkHttpClient;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;
    invoke-static {p1}, Lcom/squareup/okhttp/OkHttpClient;->access$000(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public setCache(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/internal/InternalCache;)V
    .locals 0
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "internalCache"    # Lcom/squareup/okhttp/internal/InternalCache;

    .prologue
    .line 109
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/OkHttpClient;->setInternalCache(Lcom/squareup/okhttp/internal/InternalCache;)V

    .line 110
    return-void
.end method

.method public setOwner(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .locals 0
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;

    .prologue
    .line 79
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setOwner(Ljava/lang/Object;)V

    .line 80
    return-void
.end method

.method public setProtocol(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/Protocol;)V
    .locals 0
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "protocol"    # Lcom/squareup/okhttp/Protocol;

    .prologue
    .line 75
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setProtocol(Lcom/squareup/okhttp/Protocol;)V

    .line 76
    return-void
.end method

.method public setTimeouts(Lcom/squareup/okhttp/Connection;II)V
    .locals 0
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-virtual {p1, p2, p3}, Lcom/squareup/okhttp/Connection;->setTimeouts(II)V

    .line 98
    return-void
.end method

.method public share(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;)V
    .locals 0
    .param p1, "connectionPool"    # Lcom/squareup/okhttp/ConnectionPool;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 121
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/ConnectionPool;->share(Lcom/squareup/okhttp/Connection;)V

    .line 122
    return-void
.end method
