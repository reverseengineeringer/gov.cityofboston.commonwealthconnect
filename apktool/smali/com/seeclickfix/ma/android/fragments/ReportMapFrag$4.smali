.class Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$4;
.super Ljava/lang/Object;
.source "ReportMapFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handleClick(Lcom/google/android/gms/maps/model/LatLng;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)V
    .locals 0

    .prologue
    .line 256
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 259
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    const v2, 0x7f0c0104

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/Marker;->setTitle(Ljava/lang/String;)V

    .line 261
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->marker:Lcom/google/android/gms/maps/model/Marker;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/Marker;->showInfoWindow()V

    .line 263
    :cond_0
    return-void
.end method
