.class Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$5;
.super Ljava/lang/Object;
.source "PlacesMapFrag.java"

# interfaces
.implements Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setupMap()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V
    .locals 0

    .prologue
    .line 330
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCameraChange(Lcom/google/android/gms/maps/model/CameraPosition;)V
    .locals 1
    .param p1, "camPosition"    # Lcom/google/android/gms/maps/model/CameraPosition;

    .prologue
    .line 336
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->camPosition:Lcom/google/android/gms/maps/model/CameraPosition;
    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->access$202(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/model/CameraPosition;

    .line 337
    return-void
.end method
