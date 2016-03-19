.class public Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;
.super Ljava/lang/Object;
.source "RequestWatchAreaWrapper.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private requestWatchAreas:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enhanced_watch_areas"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;->requestWatchAreas:Ljava/util/List;

    .line 60
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;->requestWatchAreas:Ljava/util/List;

    sget-object v1, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 61
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper$1;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public getRequestWatchAreas()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;"
        }
    .end annotation

    .prologue
    .line 24
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;->requestWatchAreas:Ljava/util/List;

    return-object v0
.end method

.method public setRequestWatchAreas(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "requestWatchAreas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;->requestWatchAreas:Ljava/util/List;

    .line 29
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "RequestWatchAreaWrapper [requestWatchAreas="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;->requestWatchAreas:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 56
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/RequestWatchAreaWrapper;->requestWatchAreas:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 57
    return-void
.end method
