.class public Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
.super Ljava/lang/Object;
.source "DialogOptions.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/dialogs/DialogOptions;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public fragmentTag:Ljava/lang/String;

.field public iconResId:I

.field public msgTextId:I

.field public negativeButtonTextId:I

.field public positiveButtonTextId:I

.field public retainInstance:Z

.field public titleTextId:I

.field public type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 85
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/DialogOptions$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->titleTextId:I

    .line 23
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->msgTextId:I

    .line 28
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->positiveButtonTextId:I

    .line 33
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->negativeButtonTextId:I

    .line 50
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->retainInstance:Z

    .line 55
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->iconResId:I

    .line 13
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->titleTextId:I

    .line 23
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->msgTextId:I

    .line 28
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->positiveButtonTextId:I

    .line 33
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->negativeButtonTextId:I

    .line 50
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->retainInstance:Z

    .line 55
    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->iconResId:I

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->titleTextId:I

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->msgTextId:I

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->positiveButtonTextId:I

    .line 78
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->negativeButtonTextId:I

    .line 79
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->fragmentTag:Ljava/lang/String;

    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->type:Ljava/lang/String;

    .line 81
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->retainInstance:Z

    .line 82
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->iconResId:I

    .line 83
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/dialogs/DialogOptions$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/dialogs/DialogOptions$1;

    .prologue
    .line 9
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 64
    iget v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->titleTextId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 65
    iget v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->msgTextId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 66
    iget v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->positiveButtonTextId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 67
    iget v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->negativeButtonTextId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 68
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->fragmentTag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 69
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 70
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->retainInstance:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 71
    iget v0, p0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->iconResId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 72
    return-void

    .line 70
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
