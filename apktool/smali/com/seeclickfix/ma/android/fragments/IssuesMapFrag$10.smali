.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;


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
    .line 561
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCameraChange(Lcom/google/android/gms/maps/model/CameraPosition;)V
    .locals 4
    .param p1, "camPosition"    # Lcom/google/android/gms/maps/model/CameraPosition;

    .prologue
    .line 565
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1100(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setOnCameraChangeListener(Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;)V

    .line 567
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "cam_position"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 568
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    const/4 v1, 0x1

    # setter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->isReloading:Z
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1302(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Z)Z

    .line 569
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->newCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;
    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$002(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/model/CameraPosition;

    .line 570
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1400(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reloadDelay:Ljava/lang/Runnable;

    const-wide/16 v2, 0x14

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 571
    return-void
.end method
