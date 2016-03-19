.class public Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;
.super Ljava/lang/Object;
.source "MapHelperModule.java"


# annotations
.annotation runtime Ldagger/Module;
    complete = false
    injects = {
        Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;,
        Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;,
        Lcom/seeclickfix/ma/android/fragments/ReportFragment;,
        Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;,
        Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;,
        Lcom/seeclickfix/ma/android/fragments/PlacesFrag;,
        Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
