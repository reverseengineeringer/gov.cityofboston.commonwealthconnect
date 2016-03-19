.class Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$7;
.super Ljava/lang/Object;
.source "ReportMapFrag.java"

# interfaces
.implements Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->setupMap()V
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
    .line 404
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCameraChange(Lcom/google/android/gms/maps/model/CameraPosition;)V
    .locals 1
    .param p1, "camPosition"    # Lcom/google/android/gms/maps/model/CameraPosition;

    .prologue
    .line 410
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;
    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->access$502(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/model/CameraPosition;

    .line 411
    return-void
.end method
