.class public Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;
.super Ljava/lang/Object;
.source "GooglePlayErrorEvent.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/events/Event;


# instance fields
.field private connectionResult:Lcom/google/android/gms/common/ConnectionResult;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0
    .param p1, "connectionResult"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;->connectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 12
    return-void
.end method


# virtual methods
.method public getConnectionResult()Lcom/google/android/gms/common/ConnectionResult;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;->connectionResult:Lcom/google/android/gms/common/ConnectionResult;

    return-object v0
.end method
