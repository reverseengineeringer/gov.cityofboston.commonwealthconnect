.class public Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;
.super Ljava/lang/Object;
.source "LocationUsingFragModule.java"


# annotations
.annotation runtime Ldagger/Module;
    complete = false
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/LocationAdapterModule;
    }
    injects = {
        Lcom/seeclickfix/ma/android/fragments/FeedFrag;,
        Lcom/seeclickfix/ma/android/fragments/PlacesFrag;,
        Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;,
        Lcom/seeclickfix/ma/android/fragments/ReportFragment;,
        Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;,
        Lcom/seeclickfix/ma/android/fragments/AboutFrag;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
