.class final Lcom/seeclickfix/ma/android/location/TestLocationList$1;
.super Ljava/lang/Object;
.source "TestLocationList.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/location/TestLocationList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<",
        "Lcom/seeclickfix/ma/android/location/PresetLocation;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 49
    check-cast p1, Lcom/seeclickfix/ma/android/location/PresetLocation;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/location/TestLocationList$1;->apply(Lcom/seeclickfix/ma/android/location/PresetLocation;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public apply(Lcom/seeclickfix/ma/android/location/PresetLocation;)Ljava/lang/String;
    .locals 1
    .param p1, "item"    # Lcom/seeclickfix/ma/android/location/PresetLocation;

    .prologue
    .line 51
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/location/PresetLocation;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
