.class public Lcom/seeclickfix/ma/android/events/FlagContentEvent;
.super Ljava/lang/Object;
.source "FlagContentEvent.java"


# instance fields
.field public message:Ljava/lang/String;

.field public resourceId:I

.field public resourceType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p1, "resourceType"    # Ljava/lang/String;
    .param p2, "resourceId"    # I
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->resourceType:Ljava/lang/String;

    .line 30
    iput p2, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->resourceId:I

    .line 31
    iput-object p3, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->message:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public flagContent(Lretrofit/Callback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit/Callback",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "callback":Lretrofit/Callback;, "Lretrofit/Callback<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->getResourceType()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "comment"

    if-ne v0, v1, :cond_1

    .line 36
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    iget v1, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->resourceId:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->message:Ljava/lang/String;

    invoke-interface {v0, v1, v2, p1}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->flagComment(Ljava/lang/String;Ljava/lang/String;Lretrofit/Callback;)V

    .line 40
    :cond_0
    :goto_0
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->getResourceType()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "issue"

    if-ne v0, v1, :cond_0

    .line 38
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    iget v1, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->resourceId:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->message:Ljava/lang/String;

    invoke-interface {v0, v1, v2, p1}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->flagIssue(Ljava/lang/String;Ljava/lang/String;Lretrofit/Callback;)V

    goto :goto_0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getResourceId()I
    .locals 1

    .prologue
    .line 20
    iget v0, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->resourceId:I

    return v0
.end method

.method public getResourceType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/FlagContentEvent;->resourceType:Ljava/lang/String;

    return-object v0
.end method
