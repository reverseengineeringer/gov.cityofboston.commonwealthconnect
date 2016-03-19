.class public Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;
.super Ljava/lang/Object;
.source "RemoteIntegration.java"


# instance fields
.field private remoteId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "remote_id"
    .end annotation
.end field

.field private status:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getRemoteId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;->remoteId:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;->status:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/RemoteIntegration;->title:Ljava/lang/String;

    return-object v0
.end method
