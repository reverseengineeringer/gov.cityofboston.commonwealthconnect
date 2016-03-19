.class public Lcom/seeclickfix/ma/android/objects/ErrorResponse;
.super Ljava/lang/Object;
.source "ErrorResponse.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/ErrorResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private code:Ljava/lang/String;

.field private field:Ljava/lang/String;

.field private message:Ljava/lang/String;

.field private request:Ljava/lang/String;

.field private resource:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 90
    new-instance v0, Lcom/seeclickfix/ma/android/objects/ErrorResponse$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/ErrorResponse$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->message:Ljava/lang/String;

    .line 71
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->resource:Ljava/lang/String;

    .line 72
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->field:Ljava/lang/String;

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->code:Ljava/lang/String;

    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->request:Ljava/lang/String;

    .line 75
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x0

    return v0
.end method

.method public getCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->code:Ljava/lang/String;

    return-object v0
.end method

.method public getField()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->field:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getRequest()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->request:Ljava/lang/String;

    return-object v0
.end method

.method public getResource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->resource:Ljava/lang/String;

    return-object v0
.end method

.method public setCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->code:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setField(Ljava/lang/String;)V
    .locals 0
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->field:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->message:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setRequest(Ljava/lang/String;)V
    .locals 0
    .param p1, "request"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->request:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 0
    .param p1, "resource"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->resource:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 82
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->message:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 83
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->resource:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 84
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->field:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 85
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->code:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/ErrorResponse;->request:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 87
    return-void
.end method
