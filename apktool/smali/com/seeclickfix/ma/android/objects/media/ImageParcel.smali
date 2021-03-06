.class public Lcom/seeclickfix/ma/android/objects/media/ImageParcel;
.super Ljava/lang/Object;
.source "ImageParcel.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/media/ImageParcel;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private avatarUri:Ljava/lang/String;

.field private smallImageUri:Ljava/lang/String;

.field private subtitle:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private uriPath:Ljava/lang/String;

.field private username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    new-instance v0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->type:Ljava/lang/String;

    .line 38
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->uriPath:Ljava/lang/String;

    .line 39
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->title:Ljava/lang/String;

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->subtitle:Ljava/lang/String;

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->username:Ljava/lang/String;

    .line 42
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->avatarUri:Ljava/lang/String;

    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->smallImageUri:Ljava/lang/String;

    .line 44
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/media/ImageParcel$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/media/ImageParcel$1;

    .prologue
    .line 6
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    return v0
.end method

.method public getAvatarUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->avatarUri:Ljava/lang/String;

    return-object v0
.end method

.method public getSmallImageUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->smallImageUri:Ljava/lang/String;

    return-object v0
.end method

.method public getSubtitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->subtitle:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUriPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->uriPath:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->username:Ljava/lang/String;

    return-object v0
.end method

.method public setAvatarUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "avatarUri"    # Ljava/lang/String;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->avatarUri:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public setSmallImageUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "smallImageUri"    # Ljava/lang/String;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->smallImageUri:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public setSubtitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "subtitle"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->subtitle:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->title:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->type:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setUriPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "uriPath"    # Ljava/lang/String;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->uriPath:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->username:Ljava/lang/String;

    .line 109
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ImageParcel [type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", uriPath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->uriPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

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
    .line 27
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 28
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->uriPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 29
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 30
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->subtitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 31
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->username:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 32
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->avatarUri:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 33
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->smallImageUri:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 34
    return-void
.end method
