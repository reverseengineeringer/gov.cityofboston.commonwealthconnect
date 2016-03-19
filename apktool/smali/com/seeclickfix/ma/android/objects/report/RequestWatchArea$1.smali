.class final Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea$1;
.super Ljava/lang/Object;
.source "RequestWatchArea.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 120
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;-><init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 118
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea$1;->createFromParcel(Landroid/os/Parcel;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 124
    new-array v0, p1, [Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 118
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea$1;->newArray(I)[Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    move-result-object v0

    return-object v0
.end method
