.class Lnet/simonvt/timepicker/TimePicker$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "TimePicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/simonvt/timepicker/TimePicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lnet/simonvt/timepicker/TimePicker$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mHour:I

.field private final mMinute:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 345
    new-instance v0, Lnet/simonvt/timepicker/TimePicker$SavedState$1;

    invoke-direct {v0}, Lnet/simonvt/timepicker/TimePicker$SavedState$1;-><init>()V

    sput-object v0, Lnet/simonvt/timepicker/TimePicker$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 324
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 325
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lnet/simonvt/timepicker/TimePicker$SavedState;->mHour:I

    .line 326
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lnet/simonvt/timepicker/TimePicker$SavedState;->mMinute:I

    .line 327
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lnet/simonvt/timepicker/TimePicker$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lnet/simonvt/timepicker/TimePicker$1;

    .prologue
    .line 311
    invoke-direct {p0, p1}, Lnet/simonvt/timepicker/TimePicker$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcelable;II)V
    .locals 0
    .param p1, "superState"    # Landroid/os/Parcelable;
    .param p2, "hour"    # I
    .param p3, "minute"    # I

    .prologue
    .line 318
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 319
    iput p2, p0, Lnet/simonvt/timepicker/TimePicker$SavedState;->mHour:I

    .line 320
    iput p3, p0, Lnet/simonvt/timepicker/TimePicker$SavedState;->mMinute:I

    .line 321
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcelable;IILnet/simonvt/timepicker/TimePicker$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcelable;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Lnet/simonvt/timepicker/TimePicker$1;

    .prologue
    .line 311
    invoke-direct {p0, p1, p2, p3}, Lnet/simonvt/timepicker/TimePicker$SavedState;-><init>(Landroid/os/Parcelable;II)V

    return-void
.end method


# virtual methods
.method public getHour()I
    .locals 1

    .prologue
    .line 330
    iget v0, p0, Lnet/simonvt/timepicker/TimePicker$SavedState;->mHour:I

    return v0
.end method

.method public getMinute()I
    .locals 1

    .prologue
    .line 334
    iget v0, p0, Lnet/simonvt/timepicker/TimePicker$SavedState;->mMinute:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 339
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 340
    iget v0, p0, Lnet/simonvt/timepicker/TimePicker$SavedState;->mHour:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 341
    iget v0, p0, Lnet/simonvt/timepicker/TimePicker$SavedState;->mMinute:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 342
    return-void
.end method