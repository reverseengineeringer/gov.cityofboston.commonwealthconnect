.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


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
    .line 386
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 391
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 408
    :goto_0
    return-void

    .line 392
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 393
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->newCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v0

    .line 394
    .local v0, "cam":Lcom/google/android/gms/maps/model/CameraPosition;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    const/4 v2, 0x3

    # setter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->page:I
    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$102(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;I)I

    .line 395
    iget-object v12, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    new-instance v1, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/objects/loc/Place;

    move-result-object v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    iget-object v4, v4, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reloadListener:Lcom/android/volley/Response$Listener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    iget-object v5, v5, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    iget-object v6, v0, Lcom/google/android/gms/maps/model/CameraPosition;->target:Lcom/google/android/gms/maps/model/LatLng;

    iget-wide v6, v6, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    iget-object v8, v0, Lcom/google/android/gms/maps/model/CameraPosition;->target:Lcom/google/android/gms/maps/model/LatLng;

    iget-wide v8, v8, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    iget v10, v0, Lcom/google/android/gms/maps/model/CameraPosition;->zoom:F

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->page:I
    invoke-static {v11}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)I

    move-result v11

    invoke-direct/range {v1 .. v11}, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;DDFI)V

    # setter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask3:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    invoke-static {v12, v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$502(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    .line 406
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask3:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->execute()V

    goto :goto_0
.end method
