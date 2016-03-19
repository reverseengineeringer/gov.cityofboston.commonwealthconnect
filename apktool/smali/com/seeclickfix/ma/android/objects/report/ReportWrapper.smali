.class public Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;
.super Ljava/lang/Object;
.source "ReportWrapper.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private apiKey:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "api_key"
    .end annotation
.end field

.field private authToken:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "authenticity_token"
    .end annotation
.end field

.field private report:Lcom/seeclickfix/ma/android/objects/report/Report;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "issue"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 96
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const-string/jumbo v0, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->apiKey:Ljava/lang/String;

    .line 76
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const-string/jumbo v0, "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->apiKey:Ljava/lang/String;

    .line 86
    const-class v0, Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Report;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->authToken:Ljava/lang/String;

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->apiKey:Ljava/lang/String;

    .line 89
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/report/ReportWrapper$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/report/ReportWrapper$1;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x0

    return v0
.end method

.method public getApiKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->apiKey:Ljava/lang/String;

    return-object v0
.end method

.method public getReport()Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-object v0
.end method

.method public setApiKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->apiKey:Ljava/lang/String;

    .line 137
    return-void
.end method

.method public setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V
    .locals 0
    .param p1, "report"    # Lcom/seeclickfix/ma/android/objects/report/Report;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 121
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ReportWrapper [report="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", authToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->authToken:Ljava/lang/String;

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
    .line 108
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 109
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->authToken:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 110
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/report/ReportWrapper;->apiKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 111
    return-void
.end method
