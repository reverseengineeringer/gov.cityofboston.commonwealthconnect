.class public final Lcom/seeclickfix/ma/android/objects/user/AuthUser;
.super Ljava/lang/Object;
.source "AuthUser.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/user/AuthUser;",
            ">;"
        }
    .end annotation
.end field

.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "AuthUser"


# instance fields
.field private canAcknowledge:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "can_ack"
    .end annotation
.end field

.field private displayName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private email:Ljava/lang/String;

.field private response:Ljava/lang/String;

.field private userID:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user_id"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 117
    new-instance v0, Lcom/seeclickfix/ma/android/objects/user/AuthUser$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/user/AuthUser$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->canAcknowledge:Z

    .line 108
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->canAcknowledge:Z

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->userID:I

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->email:Ljava/lang/String;

    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->displayName:Ljava/lang/String;

    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->response:Ljava/lang/String;

    .line 103
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->canAcknowledge:Z

    .line 104
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/user/AuthUser$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser$1;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->canAcknowledge:Z

    .line 113
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->setResponse(Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public static from_json(Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .locals 3
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    .line 137
    new-instance v0, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 138
    .local v0, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    const-class v2, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    invoke-virtual {v0, p0, v2}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v1

    .line 140
    .local v1, "userObjArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/AuthUser;>;"
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    return-object v2
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method public getCanAcknowledge()Z
    .locals 1

    .prologue
    .line 128
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->canAcknowledge:Z

    return v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->response:Ljava/lang/String;

    return-object v0
.end method

.method public getUserID()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->userID:I

    return v0
.end method

.method public isAuthenticated()Z
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->response:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->response:Ljava/lang/String;

    const-string/jumbo v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 79
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCanAcknowledge(Z)V
    .locals 0
    .param p1, "canAcknowledge"    # Z

    .prologue
    .line 133
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->canAcknowledge:Z

    .line 134
    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->displayName:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 0
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->email:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setResponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->response:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setUserID(I)V
    .locals 0
    .param p1, "userID"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->userID:I

    .line 64
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 90
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->userID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->email:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->displayName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 93
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->response:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 94
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->canAcknowledge:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 95
    return-void

    .line 94
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
