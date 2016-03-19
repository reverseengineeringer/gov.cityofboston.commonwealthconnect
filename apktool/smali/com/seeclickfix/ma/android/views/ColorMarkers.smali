.class public Lcom/seeclickfix/ma/android/views/ColorMarkers;
.super Ljava/lang/Object;
.source "ColorMarkers.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ColorMarkers"

.field private static statusStates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDotByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;
    .locals 4
    .param p0, "statusState"    # Ljava/lang/String;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    const v3, 0x7f020145

    .line 62
    const/4 v0, 0x0

    .line 63
    .local v0, "iconDescriptor":Lcom/google/android/gms/maps/model/BitmapDescriptor;
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStatusStateKeys()Ljava/util/List;

    move-result-object v1

    sput-object v1, Lcom/seeclickfix/ma/android/views/ColorMarkers;->statusStates:Ljava/util/List;

    .line 65
    if-nez p0, :cond_0

    .line 66
    invoke-static {v3}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    .line 83
    :goto_0
    return-object v0

    .line 67
    :cond_0
    sget-object v1, Lcom/seeclickfix/ma/android/views/ColorMarkers;->statusStates:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 70
    const v1, 0x7f020149

    invoke-static {v1}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    goto :goto_0

    .line 71
    :cond_1
    sget-object v1, Lcom/seeclickfix/ma/android/views/ColorMarkers;->statusStates:Ljava/util/List;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 74
    const v1, 0x7f020147

    invoke-static {v1}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    goto :goto_0

    .line 75
    :cond_2
    sget-object v1, Lcom/seeclickfix/ma/android/views/ColorMarkers;->statusStates:Ljava/util/List;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 78
    const v1, 0x7f020143

    invoke-static {v1}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    goto :goto_0

    .line 80
    :cond_3
    invoke-static {v3}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    goto :goto_0
.end method

.method public static getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;
    .locals 4
    .param p0, "statusState"    # Ljava/lang/String;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    const v3, 0x7f020146

    .line 29
    const/4 v0, 0x0

    .line 30
    .local v0, "iconDescriptor":Lcom/google/android/gms/maps/model/BitmapDescriptor;
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStatusStateKeys()Ljava/util/List;

    move-result-object v1

    sput-object v1, Lcom/seeclickfix/ma/android/views/ColorMarkers;->statusStates:Ljava/util/List;

    .line 34
    if-nez p0, :cond_0

    .line 35
    invoke-static {v3}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    .line 52
    :goto_0
    return-object v0

    .line 36
    :cond_0
    sget-object v1, Lcom/seeclickfix/ma/android/views/ColorMarkers;->statusStates:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 39
    const v1, 0x7f02014a

    invoke-static {v1}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    goto :goto_0

    .line 40
    :cond_1
    sget-object v1, Lcom/seeclickfix/ma/android/views/ColorMarkers;->statusStates:Ljava/util/List;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 43
    const v1, 0x7f020148

    invoke-static {v1}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    goto :goto_0

    .line 44
    :cond_2
    sget-object v1, Lcom/seeclickfix/ma/android/views/ColorMarkers;->statusStates:Ljava/util/List;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 47
    const v1, 0x7f020144

    invoke-static {v1}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    goto :goto_0

    .line 49
    :cond_3
    invoke-static {v3}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    goto :goto_0
.end method
