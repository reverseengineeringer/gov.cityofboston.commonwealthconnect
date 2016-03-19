.class public Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;
.super Ljava/lang/Object;
.source "ZoneViewParams.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private action:Ljava/lang/String;

.field private icon:Ljava/lang/String;

.field private label:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    new-instance v0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->action:Ljava/lang/String;

    .line 22
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->uri:Ljava/lang/String;

    .line 23
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->icon:Ljava/lang/String;

    .line 24
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->label:Ljava/lang/String;

    .line 25
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams$1;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public static getCreator()Landroid/os/Parcelable$Creator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;",
            ">;"
        }
    .end annotation

    .prologue
    .line 84
    sget-object v0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->CREATOR:Landroid/os/Parcelable$Creator;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    return v0
.end method

.method public getAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->action:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->icon:Ljava/lang/String;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->label:Ljava/lang/String;

    return-object v0
.end method

.method public getUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public setAction(Ljava/lang/String;)V
    .locals 0
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->action:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 0
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->icon:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->label:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->uri:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 44
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->action:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 45
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->uri:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->icon:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 47
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/ZoneViewParams;->label:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 49
    return-void
.end method
