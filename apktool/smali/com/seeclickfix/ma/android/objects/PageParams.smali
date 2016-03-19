.class public Lcom/seeclickfix/ma/android/objects/PageParams;
.super Ljava/lang/Object;
.source "PageParams.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/seeclickfix/ma/android/objects/PageParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private actionExtra:Ljava/lang/String;

.field private clazzName:Ljava/lang/String;

.field private dataParcel:Landroid/os/Parcelable;

.field private dataParcelName:Ljava/lang/String;

.field private displayName:Ljava/lang/String;

.field private fragClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;",
            ">;"
        }
    .end annotation
.end field

.field private fragIdPosition:I

.field private iconResId:I

.field private intent:Landroid/content/Intent;

.field private isMe:Z

.field private isSubitem:Z

.field private parcel:Landroid/os/Parcelable;

.field private parcelName:Ljava/lang/String;

.field private scrollOffset:I

.field private scrollPosition:I

.field private tag:Ljava/lang/String;

.field private transition:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 238
    new-instance v0, Lcom/seeclickfix/ma/android/objects/PageParams$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/PageParams$1;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/objects/PageParams;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->iconResId:I

    .line 50
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isMe:Z

    .line 56
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragIdPosition:I

    .line 58
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollPosition:I

    .line 60
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollOffset:I

    .line 68
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isSubitem:Z

    .line 77
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x0

    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->iconResId:I

    .line 50
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isMe:Z

    .line 56
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragIdPosition:I

    .line 58
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollPosition:I

    .line 60
    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollOffset:I

    .line 68
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isSubitem:Z

    .line 221
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->tag:Ljava/lang/String;

    .line 222
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcel:Landroid/os/Parcelable;

    .line 223
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcelName:Ljava/lang/String;

    .line 224
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcel:Landroid/os/Parcelable;

    .line 225
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcelName:Ljava/lang/String;

    .line 226
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragIdPosition:I

    .line 227
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollPosition:I

    .line 228
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollOffset:I

    .line 229
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->displayName:Ljava/lang/String;

    .line 230
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->actionExtra:Ljava/lang/String;

    .line 231
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->clazzName:Ljava/lang/String;

    .line 232
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->transition:Ljava/lang/String;

    .line 233
    sget-object v0, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->intent:Landroid/content/Intent;

    .line 235
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/seeclickfix/ma/android/objects/PageParams$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/objects/PageParams$1;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/objects/PageParams;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 197
    const/4 v0, 0x0

    return v0
.end method

.method public getActionExtra()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->actionExtra:Ljava/lang/String;

    return-object v0
.end method

.method public getDataParcel()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcel:Landroid/os/Parcelable;

    return-object v0
.end method

.method public getDataParcelName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 261
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcelName:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getFragClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getIconResId()I
    .locals 1

    .prologue
    .line 291
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->iconResId:I

    return v0
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 286
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->intent:Landroid/content/Intent;

    return-object v0
.end method

.method public getPagePosition()I
    .locals 1

    .prologue
    .line 122
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragIdPosition:I

    return v0
.end method

.method public getParcel()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcel:Landroid/os/Parcelable;

    return-object v0
.end method

.method public getParcelName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcelName:Ljava/lang/String;

    return-object v0
.end method

.method public getScrollOffset()I
    .locals 1

    .prologue
    .line 271
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollOffset:I

    return v0
.end method

.method public getScrollPosition()I
    .locals 1

    .prologue
    .line 134
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollPosition:I

    return v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public getTransition()Ljava/lang/String;
    .locals 1

    .prologue
    .line 311
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->transition:Ljava/lang/String;

    return-object v0
.end method

.method public isMe()Z
    .locals 1

    .prologue
    .line 330
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isMe:Z

    return v0
.end method

.method public isSubitem()Z
    .locals 1

    .prologue
    .line 301
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isSubitem:Z

    return v0
.end method

.method public setActionExtra(Ljava/lang/String;)V
    .locals 0
    .param p1, "actionExtra"    # Ljava/lang/String;

    .prologue
    .line 192
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->actionExtra:Ljava/lang/String;

    .line 193
    return-void
.end method

.method public setDataParcel(Landroid/os/Parcelable;)V
    .locals 0
    .param p1, "dataParcel"    # Landroid/os/Parcelable;

    .prologue
    .line 256
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcel:Landroid/os/Parcelable;

    .line 257
    return-void
.end method

.method public setDataParcelName(Ljava/lang/String;)V
    .locals 0
    .param p1, "dataParcelName"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcelName:Ljava/lang/String;

    .line 267
    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->displayName:Ljava/lang/String;

    .line 155
    return-void
.end method

.method public setFragClass(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "fragClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->clazzName:Ljava/lang/String;

    .line 86
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragClass:Ljava/lang/Class;

    .line 87
    return-void
.end method

.method public setIconResId(I)V
    .locals 0
    .param p1, "iconResId"    # I

    .prologue
    .line 296
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->iconResId:I

    .line 297
    return-void
.end method

.method public setIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->intent:Landroid/content/Intent;

    .line 282
    return-void
.end method

.method public setMe(Z)V
    .locals 0
    .param p1, "isMe"    # Z

    .prologue
    .line 335
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isMe:Z

    .line 336
    return-void
.end method

.method public setPagePosition(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 130
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragIdPosition:I

    .line 131
    return-void
.end method

.method public setParcel(Landroid/os/Parcelable;)V
    .locals 0
    .param p1, "parcel"    # Landroid/os/Parcelable;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcel:Landroid/os/Parcelable;

    .line 116
    return-void
.end method

.method public setParcelName(Ljava/lang/String;)V
    .locals 0
    .param p1, "bundleName"    # Ljava/lang/String;

    .prologue
    .line 163
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcelName:Ljava/lang/String;

    .line 164
    return-void
.end method

.method public setScrollOffset(I)V
    .locals 0
    .param p1, "scrollOffset"    # I

    .prologue
    .line 276
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollOffset:I

    .line 277
    return-void
.end method

.method public setScrollPosition(I)V
    .locals 0
    .param p1, "scrollPosition"    # I

    .prologue
    .line 139
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollPosition:I

    .line 140
    return-void
.end method

.method public setSubitem(Z)V
    .locals 0
    .param p1, "isSubitem"    # Z

    .prologue
    .line 306
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isSubitem:Z

    .line 307
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->tag:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public setTransition(Ljava/lang/String;)V
    .locals 0
    .param p1, "transition"    # Ljava/lang/String;

    .prologue
    .line 316
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->transition:Ljava/lang/String;

    .line 317
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "PageParams [fragClass="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragClass:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", tag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->tag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", iconResId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->iconResId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", parcel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcel:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", parcelName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcelName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", dataParcel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcel:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", dataParcelName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcelName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", fragIdPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragIdPosition:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", scrollPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollPosition:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", scrollOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollOffset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", displayName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", actionExtra="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->actionExtra:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", clazzName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->clazzName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isSubitem="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->isSubitem:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", transition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->transition:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", intent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->intent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x0

    .line 202
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->tag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 203
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcel:Landroid/os/Parcelable;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 204
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->parcelName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 205
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcel:Landroid/os/Parcelable;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 206
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->dataParcelName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 207
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->fragIdPosition:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 208
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollPosition:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 209
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->scrollOffset:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 210
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->displayName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 211
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->actionExtra:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 212
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->clazzName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 213
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->transition:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 214
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/PageParams;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 216
    return-void
.end method
