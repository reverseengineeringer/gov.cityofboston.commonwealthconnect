.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$11;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V
    .locals 0

    .prologue
    .line 575
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$11;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMapClick(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 3
    .param p1, "ll"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 581
    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerSelected:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1500()Lcom/google/android/gms/maps/model/Marker;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 584
    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerSelected:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1500()Lcom/google/android/gms/maps/model/Marker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/Marker;->hideInfoWindow()V

    .line 586
    const/4 v0, 0x0

    # setter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerSelected:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1502(Lcom/google/android/gms/maps/model/Marker;)Lcom/google/android/gms/maps/model/Marker;

    .line 587
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$11;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "issue_id"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 590
    :cond_0
    return-void
.end method
