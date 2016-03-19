.class public Lcom/seeclickfix/ma/android/location/AddressLocalizer;
.super Ljava/lang/Object;
.source "AddressLocalizer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getAddressAdminString(Landroid/location/Address;)Ljava/lang/String;
    .locals 1
    .param p0, "address"    # Landroid/location/Address;

    .prologue
    .line 29
    invoke-virtual {p0}, Landroid/location/Address;->getAdminArea()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/location/Address;->getAdminArea()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static getAddressLine1String(Landroid/location/Address;)Ljava/lang/String;
    .locals 1
    .param p0, "address"    # Landroid/location/Address;

    .prologue
    .line 19
    invoke-virtual {p0}, Landroid/location/Address;->getMaxAddressLineIndex()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private static getAddressLocalityString(Landroid/location/Address;)Ljava/lang/String;
    .locals 1
    .param p0, "address"    # Landroid/location/Address;

    .prologue
    .line 24
    invoke-virtual {p0}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getAddressString(Landroid/location/Address;)Ljava/lang/String;
    .locals 5
    .param p0, "address"    # Landroid/location/Address;

    .prologue
    .line 7
    const-string/jumbo v1, "%s, %s, %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/seeclickfix/ma/android/location/AddressLocalizer;->getAddressLine1String(Landroid/location/Address;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p0}, Lcom/seeclickfix/ma/android/location/AddressLocalizer;->getAddressLocalityString(Landroid/location/Address;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p0}, Lcom/seeclickfix/ma/android/location/AddressLocalizer;->getAddressAdminString(Landroid/location/Address;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 15
    .local v0, "addressText":Ljava/lang/String;
    return-object v0
.end method
